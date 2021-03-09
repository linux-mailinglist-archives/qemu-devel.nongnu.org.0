Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522EC332C23
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:32:39 +0100 (CET)
Received: from localhost ([::1]:50694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfHi-0000An-Aq
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:32:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lJeoA-0005jx-8X
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:02:06 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.220]:51939
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lJenz-0004iW-Bv
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:02:05 -0500
HMM_SOURCE_IP: 172.18.0.218:9800.470873947
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.43.3?logid-7e1d845f94314557add15ddf9f260b58
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 8515C280088;
 Wed, 10 Mar 2021 00:01:30 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by App0025 with ESMTP id 7e1d845f94314557add15ddf9f260b58 for
 qemu-devel@nongnu.org; Wed Mar 10 00:01:32 2021
X-Transaction-ID: 7e1d845f94314557add15ddf9f260b58
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH] tests/migration: fix unix socket migration
Date: Wed, 10 Mar 2021 00:00:59 +0800
Message-Id: <ea67ec8c4a46979af5515a794759efc00960ed7e.1615304914.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=42.123.76.220;
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
Cc: Hyman <huangy81@chinatelecom.cn>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman <huangy81@chinatelecom.cn>

The test aborts and error message as the following be throwed:
"No such file or directory: '/var/tmp/qemu-migrate-{pid}.migrate",
when the unix socket migration test nearly done. The reason is
qemu removes the unix socket file after migration before
guestperf.py script do it. So pre-check if the socket file exists
when removing it to prevent the guestperf program from aborting.

Signed-off-by: Hyman <huangy81@chinatelecom.cn>
---
 tests/migration/guestperf/engine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index 83bfc3b..86d4f21 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -405,7 +405,7 @@ def run(self, hardware, scenario, result_dir=os.getcwd()):
             progress_history = ret[0]
             qemu_timings = ret[1]
             vcpu_timings = ret[2]
-            if uri[0:5] == "unix:":
+            if uri[0:5] == "unix:" and os.path.exists(uri[5:]):
                 os.remove(uri[5:])
             if self._verbose:
                 print("Finished migration")
-- 
1.8.3.1


