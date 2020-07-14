Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0D521ED62
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 11:56:52 +0200 (CEST)
Received: from localhost ([::1]:39814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvHgB-0001e2-Is
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 05:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1jvHex-0008Mw-7i
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 05:55:35 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1jvHet-0004A4-T3
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 05:55:34 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id EF4CF40482;
 Tue, 14 Jul 2020 12:55:20 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with SMTP id 0BB97B3;
 Tue, 14 Jul 2020 12:55:21 +0300 (MSK)
Received: (nullmailer pid 16287 invoked by uid 1000);
 Tue, 14 Jul 2020 09:55:20 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.1] acpi-pm-tmr: allow 2-byte reads
Date: Tue, 14 Jul 2020 12:55:18 +0300
Message-Id: <20200714095518.16241-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/14 05:55:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Simon John <git@the-jedi.co.uk>, Michael Tokarev <mjt@tls.msk.ru>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As found in LP#964247, MacOS Catalina performs 2-byte reads
on the acpi timer address space while the spec says it should
be 4-byte. Allow 2-byte reads.

Reported-By: Simon John <git@the-jedi.co.uk>
Signed-Off-By: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/acpi/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

I'm applying this to debian qemu package, need the fix
faster in order to release security updates for other
branches.

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 45cbed49ab..9be38aa2ac 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -530,7 +530,9 @@ static void acpi_pm_tmr_write(void *opaque, hwaddr addr, uint64_t val,
 static const MemoryRegionOps acpi_pm_tmr_ops = {
     .read = acpi_pm_tmr_read,
     .write = acpi_pm_tmr_write,
-    .valid.min_access_size = 4,
+    .impl.min_access_size = 4,
+     /* at least MacOS Catalina reads 2 bytes and fails if it doesn't work */
+    .valid.min_access_size = 2,
     .valid.max_access_size = 4,
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
-- 
2.20.1


