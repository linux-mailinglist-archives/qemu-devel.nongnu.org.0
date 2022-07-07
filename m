Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E612856ACE1
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 22:43:13 +0200 (CEST)
Received: from localhost ([::1]:51990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9YL6-0001jH-Rp
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 16:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o9YJE-0000iN-Nr; Thu, 07 Jul 2022 16:41:12 -0400
Received: from mout-u-204.mailbox.org ([80.241.59.204]:55584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o9YJC-0003pT-3W; Thu, 07 Jul 2022 16:41:12 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-204.mailbox.org (Postfix) with ESMTPS id 4Lf7bQ2Zx1z9sQZ;
 Thu,  7 Jul 2022 22:40:50 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Lev Kujawski <lkujaw@member.fsf.org>
Subject: [PATCH] hw/block/hd-geometry: Do not override specified bios-chs-trans
Date: Thu,  7 Jul 2022 20:40:45 +0000
Message-Id: <20220707204045.999544-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=80.241.59.204; envelope-from=lkujaw@member.fsf.org;
 helo=mout-u-204.mailbox.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

For small disk images (<4 GiB), QEMU and SeaBIOS default to the
LARGE/ECHS disk translation method, but it is not uncommon for other
BIOS software to use LBA in these cases as well.  Some operating
system boot loaders (e.g., NT 4) do not handle LARGE translations
outside of fixed configurations.  See, e.g., Q154052:

"When starting an x86 based computer, Ntdetect.com retrieves and
stores Interrupt 13 information. . . If the disk controller is using a
32 sector/64 head translation scheme, this boundary will be 1 GB. If
the controller uses 63 sector/255 head translation [AUTHOR: i.e.,
LBA], the limit will be 4 GB."

To accommodate these situations, hd_geometry_guess() now follows the
disk translation specified by the user even when the ATA disk geometry
is guessed.

hd_geometry_guess():
* Only set the disk translation when translation is AUTO.
* Show the soon-to-be active translation (*ptrans) in the trace rather
  than what was guessed.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/56
Buglink: https://bugs.launchpad.net/qemu/+bug/1745312

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
---
 hw/block/hd-geometry.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/block/hd-geometry.c b/hw/block/hd-geometry.c
index dcbccee294..67462f1752 100644
--- a/hw/block/hd-geometry.c
+++ b/hw/block/hd-geometry.c
@@ -150,7 +150,12 @@ void hd_geometry_guess(BlockBackend *blk,
         translation = BIOS_ATA_TRANSLATION_NONE;
     }
     if (ptrans) {
-        *ptrans = translation;
+        if (*ptrans == BIOS_ATA_TRANSLATION_AUTO) {
+            *ptrans = translation;
+        } else {
+            /* Defer to the translation specified by the user.  */
+            translation = *ptrans;
+        }
     }
     trace_hd_geometry_guess(blk, *pcyls, *pheads, *psecs, translation);
 }
-- 
2.34.1


