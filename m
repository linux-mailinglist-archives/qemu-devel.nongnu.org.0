Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5110117118F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 08:35:45 +0100 (CET)
Received: from localhost ([::1]:54826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7Dhv-0005ks-BQ
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 02:35:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42446)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1j7Dch-0000HM-Sl
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 02:30:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1j7DcW-0000Aw-Ij
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 02:30:18 -0500
Received: from relay.sw.ru ([185.231.240.75]:33954)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1j7DcU-00005X-Lc; Thu, 27 Feb 2020 02:30:07 -0500
Received: from dptest2.qa.sw.ru ([10.94.4.71])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1j7DcO-0003Tx-OT; Thu, 27 Feb 2020 10:30:00 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/8] iotests: filter out compression_type
Date: Thu, 27 Feb 2020 10:29:49 +0300
Message-Id: <20200227072953.25445-5-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20200227072953.25445-1-dplotnikov@virtuozzo.com>
References: <20200227072953.25445-1-dplotnikov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 den@vrtuozzo.com, armbru@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After adding compression type feature to qcow2 format, qemu framework
commands reporting the image settingd, e.g. "qemu-img create", started
reporting the compression type for the image which breaks the iotests
output matching.

To fix it, add compression_type=zlib to the list of filtered image parameters.

Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
---
 tests/qemu-iotests/common.filter | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
index 3f8ee3e5f7..c6962d199c 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -152,7 +152,8 @@ _filter_img_create()
         -e "s# refcount_bits=[0-9]\\+##g" \
         -e "s# key-secret=[a-zA-Z0-9]\\+##g" \
         -e "s# iter-time=[0-9]\\+##g" \
-        -e "s# force_size=\\(on\\|off\\)##g"
+        -e "s# force_size=\\(on\\|off\\)##g" \
+        -e "s# compression_type=zlib##g"
 }
 
 _filter_img_info()
-- 
2.17.0


