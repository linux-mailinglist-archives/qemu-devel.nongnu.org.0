Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C631B14D2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 20:39:03 +0200 (CEST)
Received: from localhost ([::1]:40646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQbJt-0002p6-Uh
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 14:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44804 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1jQbI0-0000qJ-Hz
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 14:37:06 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1jQbHw-0003nM-Ey
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 14:37:04 -0400
Received: from relay.sw.ru ([185.231.240.75]:39794)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jQbHr-0003NF-7O; Mon, 20 Apr 2020 14:36:55 -0400
Received: from dhcp-172-16-25-136.sw.ru ([172.16.25.136] helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jQbHk-0001xO-6v; Mon, 20 Apr 2020 21:36:48 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 6/7] iotests: prepare 245 for using filter in block-stream
Date: Mon, 20 Apr 2020 21:36:45 +0300
Message-Id: <1587407806-109784-7-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1587407806-109784-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1587407806-109784-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay.sw.ru
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 14:36:51
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 mreitz@redhat.com, jsnow@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The preliminary patch modifies the test 245 to prepare the block-stream
job for using COR-filter. The filter breaks the backing chain being
connected to the underlying node by file child link.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/245 | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index 049ef6a..9baeb2b 100644
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -896,15 +896,19 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         # make hd1 read-only and block-stream requires it to be read-write
         # (Which error message appears depends on whether the stream job is
         # already done with copying at this point.)
-        self.reopen(opts, {},
+        opts = hd_opts(1)
+        opts['backing'] = hd_opts(2)
+        opts['backing']['backing'] = None
+        self.reopen(opts, {'read-only': True},
             ["Can't set node 'hd1' to r/o with copy-on-read enabled",
              "Cannot make block node read-only, there is a writer on it"])
 
         # We can't remove hd2 while the stream job is ongoing
-        opts['backing']['backing'] = None
-        self.reopen(opts, {'backing.read-only': False}, "Cannot change 'backing' link from 'hd1' to 'hd2'")
+        opts['backing'] = None
+        self.reopen(opts, {'read-only': False}, "Cannot change 'backing' link from 'hd1' to 'hd2'")
 
         # We can detach hd1 from hd0 because it doesn't affect the stream job
+        opts = hd_opts(0)
         opts['backing'] = None
         self.reopen(opts)
 
-- 
1.8.3.1


