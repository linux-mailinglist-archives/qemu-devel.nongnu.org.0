Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF0D6D19D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 18:14:49 +0200 (CEST)
Received: from localhost ([::1]:39710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ho93Q-0004uO-1j
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 12:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34269)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <wrfsh@yandex-team.ru>) id 1ho93D-0004Ov-1s
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 12:14:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wrfsh@yandex-team.ru>) id 1ho93C-0005Zy-3H
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 12:14:35 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:45452)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wrfsh@yandex-team.ru>)
 id 1ho93B-0005Wb-80
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 12:14:34 -0400
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::119])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id F15552E12D9;
 Thu, 18 Jul 2019 19:14:29 +0300 (MSK)
Received: from smtpcorp1j.mail.yandex.net (smtpcorp1j.mail.yandex.net
 [2a02:6b8:0:1619::137])
 by mxbackcorp2j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 5aqpcZaL7r-ETN4iVAE; Thu, 18 Jul 2019 19:14:29 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1563466469; bh=540vauPLRiqeMKVLkpDt9peBsJjLZhYuvtsNh1hHpm4=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=eXkevOobhE6rkL4jwE6AdheQyOJZSqM8a2ZePV7YJ6oVG3Sr4pQdpL1+yLe140U3o
 hsxxO76N3+GCuBS2GajXeCFWjsGvQM+RadopAEwicrqUEx/HdKOmYeeJR3cLx8RyXA
 NSc1m9c0yzSmjBwNazsTA6iMGgtMFZ4xnW/D0Jf8=
Authentication-Results: mxbackcorp2j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red.dhcp.yndx.net (dynamic-red.dhcp.yndx.net
 [2a02:6b8:0:40c:f68c:50ff:fee9:44bd])
 by smtpcorp1j.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
 zJMnpJKOU5-ETA0VicD; Thu, 18 Jul 2019 19:14:29 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (Client certificate not present)
From: Evgeny Yakovlev <wrfsh@yandex-team.ru>
To: qemu-devel@nongnu.org,
	mst@redhat.com
Date: Thu, 18 Jul 2019 19:14:23 +0300
Message-Id: <1563466463-26012-1-git-send-email-wrfsh@yandex-team.ru>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 77.88.29.217
Subject: [Qemu-devel] [PATCH v2] i386/acpi: fix gint overflow in
 crs_range_compare
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When very large regions (32GB sized in our case, PCI pass-through of GPUs)
are compared substraction result does not fit into gint.

As a result crs_replace_with_free_ranges does not get sorted ranges and
incorrectly computes PCI64 free space regions. Which then makes linux
guest complain about device and PCI64 hole intersection and device
becomes unusable.

Fix that by returning exactly fitting ranges.

Also fix indentation of an entire crs_replace_with_free_ranges to make
checkpatch happy.

Signed-off-by: Evgeny Yakovlev <wrfsh@yandex-team.ru>
---
v2:
entire crs_replace_with_free_ranges was indented with 5 spaces, including my change.
fix that as well

 hw/i386/acpi-build.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d281ffa..e7b756b 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -755,10 +755,16 @@ static void crs_range_set_free(CrsRangeSet *range_set)
 
 static gint crs_range_compare(gconstpointer a, gconstpointer b)
 {
-     CrsRangeEntry *entry_a = *(CrsRangeEntry **)a;
-     CrsRangeEntry *entry_b = *(CrsRangeEntry **)b;
+    CrsRangeEntry *entry_a = *(CrsRangeEntry **)a;
+    CrsRangeEntry *entry_b = *(CrsRangeEntry **)b;
 
-     return (int64_t)entry_a->base - (int64_t)entry_b->base;
+    if (entry_a->base < entry_b->base) {
+        return -1;
+    } else if (entry_a->base > entry_b->base) {
+        return 1;
+    } else {
+        return 0;
+    }
 }
 
 /*
-- 
2.7.4


