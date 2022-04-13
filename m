Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB08500318
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 02:38:18 +0200 (CEST)
Received: from localhost ([::1]:55928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nenV3-00053P-Aa
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 20:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lk@c--e.de>) id 1nekr1-00086I-0A
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 17:48:47 -0400
Received: from cae.in-ulm.de ([217.10.14.231]:42878)
 by eggs.gnu.org with esmtp (Exim 4.90_1) (envelope-from <lk@c--e.de>)
 id 1nekqy-0002JE-QV
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 17:48:46 -0400
Received: by cae.in-ulm.de (Postfix, from userid 1000)
 id 7D1BA140113; Wed, 13 Apr 2022 23:48:33 +0200 (CEST)
Date: Wed, 13 Apr 2022 23:48:33 +0200
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: qemu-devel@nongnu.org
Subject: fwcfg: Wrong callback behaviour after fw_cfg_modify_bytes_read
Message-ID: <YldFMTbFLUcdFIfa@cae.in-ulm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: none client-ip=217.10.14.231; envelope-from=lk@c--e.de;
 helo=cae.in-ulm.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Apr 2022 20:35:12 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hi,

there's a long story behind this (see below). However, I'll start with
the result:

fw_cfg_modify_bytes_read() sets the callback data of an existing
fw_cfg file to NULL but leaves the actual callbacks in place.
Additioanlly, this function sets ->allow_write to false for no
good reason AFAICS.

For most callbacks, the callback will just crash on the NULL pointer
in ->callback_opaque if this path is ever hit. 

I think the following patch is required (I can properly format it
if you agree). I'm not 100% sure about the "allow_write" part, tough:

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index e5f3c98184..b8b6d8fe10 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -742,8 +742,6 @@ static void *fw_cfg_modify_bytes_read(FWCfgState *s, uint16_t key,
     ptr = s->entries[arch][key].data;
     s->entries[arch][key].data = data;
     s->entries[arch][key].len = len;
-    s->entries[arch][key].callback_opaque = NULL;
-    s->entries[arch][key].allow_write = false;
 
     return ptr;
 }

Oppinions?


For those interesed here's the somewhat longer story and the reason
why the diff actually matters:

We are running Windows in a Q35 based machine in UEFI mode with OVMF.
In some situations we saw that the Windows guest would hang in the
Windows boot loader after a guest initiated reboot of the virtual
machine. A hard "system_reset" would trigger the same bug.

The guest was hanging in a loop trying to read from unassigned
I/O port 0xb008. This is the default port used for the ACPI
PM timer on PIIX based machines (but remember that we use Q35 where
the PM timer lives at 0x608 instead).

It turned out that after the reboot OVMF would try to read the
ACPI tables from FWCFG but commands in the table-loader file
could not be executed correctly and OVMF falls back to some hard
coded PIIX based default.

ACPI tables and the table-loader data is initially generated
during setup but this data is re-generated via an FWCFG callback
(acpi_update_build) when the first of these files is accessed.
The tables generated at this later time differ slightly from those
generated during initial setup.

In our case these differences required a resize of the table-loader
romfile. This resize calls fw_cfg_modify_file() via the resize
hook of the memory region that contains the FWCFG file.
As described above this clears the ->callback_opaque data that
points to the build_state.

After a reboot rom_reset will restore the original contents of
the linker-loader file. In theory, this is only temporary. However,
due to the missing callback_opaque data the first call to
acpi_update_build() will do nothing. As a result the OVMF guest
reads an outdated version of the table-loader file. The actual
tables are properly re-generated on the next access to a different
FWCFG file that did not go through a resize. But at this point the
guest has already read the outdated table-loader data and trying to
apply this to the re-generated ACPI tables results in errors.

This results in broken ACPI tables as discussed above.

       regards    Christian


