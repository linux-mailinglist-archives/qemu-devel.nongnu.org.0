Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD7821EE58
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 12:52:33 +0200 (CEST)
Received: from localhost ([::1]:37374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvIY4-0002QS-Ba
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 06:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1jvIXO-0001yH-BN
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 06:51:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1jvIXM-0003dq-7g
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 06:51:50 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 0E699404A2;
 Tue, 14 Jul 2020 13:51:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with SMTP id 28FFEB3;
 Tue, 14 Jul 2020 13:51:45 +0300 (MSK)
Received: (nullmailer pid 32654 invoked by uid 1000);
 Tue, 14 Jul 2020 10:51:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 for-5.1] acpi-pm-tmr: allow any small-size reads
Date: Tue, 14 Jul 2020 13:51:13 +0300
Message-Id: <20200714105113.32603-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.20.1
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

As found in LP#1886318, MacOS Catalina performs 2-byte reads
on the acpi timer address space while the spec says it should
be 4-byte. Allow any small reads.

Reported-By: Simon John <git@the-jedi.co.uk>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/acpi/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

v2: fixed bug#, use the right form of S-o-b, and allow up to 1 byte reads.

I'm applying this to debian qemu package, need the fix
faster in order to release security updates for other
branches.

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -530,7 +530,10 @@ static void acpi_pm_tmr_write(void *opaque, hwaddr addr, uint64_t val,
 static const MemoryRegionOps acpi_pm_tmr_ops = {
     .read = acpi_pm_tmr_read,
     .write = acpi_pm_tmr_write,
-    .valid.min_access_size = 4,
+    .impl.min_access_size = 4,
+     /* at least MacOS Catalina reads 2 bytes and fails if it doesn't work */
+     /* allow 1-byte reads too */
+    .valid.min_access_size = 1,
     .valid.max_access_size = 4,
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
-- 
2.20.1


