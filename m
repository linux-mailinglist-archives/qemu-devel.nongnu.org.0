Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E363D4FC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 20:05:58 +0200 (CEST)
Received: from localhost ([::1]:33550 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hal9h-00084E-6j
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 14:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42281)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hal6K-00067p-Ln
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 14:02:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hal6G-0005QA-Ih
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 14:02:26 -0400
Received: from relay.sw.ru ([185.231.240.75]:34302)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hal6C-0005It-BV; Tue, 11 Jun 2019 14:02:20 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hal65-0002AB-Qs; Tue, 11 Jun 2019 21:02:14 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Tue, 11 Jun 2019 21:02:07 +0300
Message-Id: <1560276131-683243-4-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1560276131-683243-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1560276131-683243-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 3/7] iotests: Valgrind fails to work with
 nonexistent directory
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 mreitz@redhat.com, rkagan@virtuozzo.com, andrey.shinkevich@virtuozzo.com,
 den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Valgrind uses the exported variable TMPDIR and fails if the
directory does not exist. Let us exclude such a test case from
being run under the Valgrind.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/051 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
index 200660f..ccc5bc2 100755
--- a/tests/qemu-iotests/051
+++ b/tests/qemu-iotests/051
@@ -377,6 +377,7 @@ printf %b "qemu-io $device_id \"write -P 0x33 0 4k\"\ncommit $device_id\n" |
 $QEMU_IO -c "read -P 0x33 0 4k" "$TEST_IMG" | _filter_qemu_io
 
 # Using snapshot=on with a non-existent TMPDIR
+VALGRIND_QEMU="" \
 TMPDIR=/nonexistent run_qemu -drive driver=null-co,snapshot=on
 
 # Using snapshot=on together with read-only=on
-- 
1.8.3.1


