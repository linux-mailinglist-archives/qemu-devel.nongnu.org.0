Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AA6334633
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 19:02:23 +0100 (CET)
Received: from localhost ([::1]:44400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK3A6-00024J-H7
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 13:02:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lK2fK-0006Cp-L1
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:30:34 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:51442
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lK2fB-0006Uc-E7
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:30:33 -0500
HMM_SOURCE_IP: 172.18.0.48:64581.1501305303
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.43.3?logid-0f9132e31a8249f5bd425f9e1b7fbe7b
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 323C628008E;
 Thu, 11 Mar 2021 01:30:12 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by App0024 with ESMTP id 0f9132e31a8249f5bd425f9e1b7fbe7b for
 qemu-devel@nongnu.org; Thu Mar 11 01:30:15 2021
X-Transaction-ID: 0f9132e31a8249f5bd425f9e1b7fbe7b
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH] tests/migration: fix unix socket batch migration
Date: Thu, 11 Mar 2021 01:29:55 +0800
Message-Id: <c3fc438993b87a6ab0bea3d07f6ca0260d29936e.1615397103.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hyman <huangy81@chinatelecom.cn>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman <huangy81@chinatelecom.cn>

when execute the following test command:
"guestperf-batch.py --dst-host localhost --transport unix ..."
test aborts and error message as the following be throwed:
"launching VM Failed: [Errno 98] Address already in use".

The reason is that batch script use the same monitor socket
in all test cases and do not remove the socket file. The second
migration test will launch vm use the same socket file as
the first, so we get the error message. To fix it, just remove
the socket file each time we have done the migration test.

Signed-off-by: Hyman <huangy81@chinatelecom.cn>
---
 tests/migration/guestperf/engine.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index 83bfc3b..5189cf9 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -407,6 +407,13 @@ def run(self, hardware, scenario, result_dir=os.getcwd()):
             vcpu_timings = ret[2]
             if uri[0:5] == "unix:":
                 os.remove(uri[5:])
+
+            if os.path.exists(srcmonaddr):
+                os.remove(srcmonaddr)
+
+            if self._dst_host == "localhost" and os.path.exists(dstmonaddr):
+                os.remove(dstmonaddr)
+
             if self._verbose:
                 print("Finished migration")
 
-- 
1.8.3.1


