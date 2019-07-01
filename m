Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD87F36095
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 17:55:25 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44889 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYYG4-0004bV-Id
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 11:55:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51159)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYYEt-000474-RG
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 11:54:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYYEs-0000Sw-Kr
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 11:54:11 -0400
Received: from relay.sw.ru ([185.231.240.75]:60414)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hYYEr-0000K3-OL; Wed, 05 Jun 2019 11:54:10 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hYYEn-0003Q6-H1; Wed, 05 Jun 2019 18:54:05 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Wed,  5 Jun 2019 18:54:05 +0300
Message-Id: <20190605155405.104384-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH] iotests: restrict 254 to support only qcow2
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test fails at least for qcow, because of different cluster sizes in
base and top (and therefore different granularities of bitmaps we are
trying to merge).

The test aim is to check block-dirty-bitmap-merge between different
nodes functionality, no needs to check all formats. So, let's just drop
support for anything except qcow2.

Reported-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/254 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qemu-iotests/254 b/tests/qemu-iotests/254
index 33cb80a512..8edba91c5d 100755
--- a/tests/qemu-iotests/254
+++ b/tests/qemu-iotests/254
@@ -21,6 +21,8 @@
 import iotests
 from iotests import qemu_img_create, file_path, log
 
+iotests.verify_image_format(supported_fmts=['qcow2'])
+
 disk, top = file_path('disk', 'top')
 size = 1024 * 1024
 
-- 
2.18.0


