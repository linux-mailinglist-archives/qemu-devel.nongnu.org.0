Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B6821C9D0
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jul 2020 16:14:55 +0200 (CEST)
Received: from localhost ([::1]:37540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jucko-0002nZ-10
	for lists+qemu-devel@lfdr.de; Sun, 12 Jul 2020 10:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <github@the-jedi.co.uk>)
 id 1juaeU-00065d-Bt
 for qemu-devel@nongnu.org; Sun, 12 Jul 2020 08:00:15 -0400
Received: from vps.the-jedi.co.uk ([93.93.130.107]:33410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <github@the-jedi.co.uk>)
 id 1juaeS-0000k7-7Q
 for qemu-devel@nongnu.org; Sun, 12 Jul 2020 08:00:14 -0400
Received: by vps.the-jedi.co.uk (Postfix, from userid 111)
 id B1305429FD; Sun, 12 Jul 2020 13:00:09 +0100 (BST)
Received: from [192.168.0.5] (host86-179-4-163.range86-179.btcentralplus.com
 [86.179.4.163])
 by vps.the-jedi.co.uk (Postfix) with ESMTPSA id BA38D429F2;
 Sun, 12 Jul 2020 13:00:07 +0100 (BST)
To: qemu-devel@nongnu.org
From: Simon John <github@the-jedi.co.uk>
Subject: [PATCH] Allow acpi-tmr size=2
Message-ID: <5f12377f-b640-c4c5-1bcd-858c622c6c31@the-jedi.co.uk>
Date: Sun, 12 Jul 2020 13:00:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=93.93.130.107; envelope-from=github@the-jedi.co.uk;
 helo=vps.the-jedi.co.uk
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/12 08:00:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 12 Jul 2020 10:13:54 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: imammedo@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

macos guests no longer boot after commit 
5d971f9e672507210e77d020d89e0e89165c8fc9

acpi-tmr needs 2 byte memory accesses, so breaks as that commit only 
allows 4 bytes.

Fixes: 5d971f9e672507210e7 (memory: Revert "memory: accept mismatching 
sizes in memory_region_access_valid")
Buglink: https://bugs.launchpad.net/qemu/+bug/1886318

Signed-off-by: Simon John <git@the-jedi.co.uk>
---
  hw/acpi/core.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index f6d9ec4f13..05ff29b9d7 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -527,7 +527,7 @@ static void acpi_pm_tmr_write(void *opaque, hwaddr 
addr, uint64_t val,
  static const MemoryRegionOps acpi_pm_tmr_ops = {
      .read = acpi_pm_tmr_read,
      .write = acpi_pm_tmr_write,
-    .valid.min_access_size = 4,
+    .valid.min_access_size = 1,
      .valid.max_access_size = 4,
      .endianness = DEVICE_LITTLE_ENDIAN,
  };
-- 
2.27.0


