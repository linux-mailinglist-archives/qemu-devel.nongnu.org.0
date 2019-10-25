Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 029C4E4FC0
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 17:03:14 +0200 (CEST)
Received: from localhost ([::1]:33422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iO17Q-0004Ir-S9
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 11:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50109)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iO0v9-00023E-Fa
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 10:50:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iO0v8-00070q-Br
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 10:50:31 -0400
Received: from relay.sw.ru ([185.231.240.75]:60790)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iO0v5-0006uk-C1; Fri, 25 Oct 2019 10:50:27 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iO0v2-0000F1-6C; Fri, 25 Oct 2019 17:50:24 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH] qemu-iotests: restrict 264 to qcow2 only
Date: Fri, 25 Oct 2019 17:50:22 +0300
Message-Id: <20191025145023.6182-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: vsementsov@virtuozzo.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

264 is unprepared to run with different formats, for example luks needs
handling keys, cloop doesn't support image creation, vpc creates image
larger than requested (which breaks "Backup completed: 5242880" in test
output).

The test is here to check nbd-reconnect feature and we actually don't
need it for all formats. Let's restrict it to qcow2 only.

Reported-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/264 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qemu-iotests/264 b/tests/qemu-iotests/264
index c8cd97ae2b..131366422b 100755
--- a/tests/qemu-iotests/264
+++ b/tests/qemu-iotests/264
@@ -24,6 +24,8 @@ import iotests
 from iotests import qemu_img_create, qemu_io_silent_check, file_path, \
         qemu_nbd_popen, log
 
+iotests.verify_image_format(supported_fmts=['qcow2'])
+
 disk_a, disk_b, nbd_sock = file_path('disk_a', 'disk_b', 'nbd-sock')
 nbd_uri = 'nbd+unix:///?socket=' + nbd_sock
 size = 5 * 1024 * 1024
-- 
2.21.0


