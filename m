Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718FD2A4955
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 16:21:21 +0100 (CET)
Received: from localhost ([::1]:58306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZy7c-0000KT-GN
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 10:21:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kZxgh-0003gu-3h
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 09:53:31 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kZxgd-00048x-R1
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 09:53:30 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CQXpM4WNkzhbGt;
 Tue,  3 Nov 2020 22:53:15 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Tue, 3 Nov 2020 22:53:10 +0800
Message-ID: <5FA16ED5.4000203@huawei.com>
Date: Tue, 3 Nov 2020 22:53:09 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>, <bsd@redhat.com>,
 <stefanha@redhat.com>, <thuth@redhat.com>, <lvivier@redhat.com>
Subject: [PATCH] tests/qtest: Fix potential NULL pointer dereference in
 qos_build_main_args()
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=alex.chen@huawei.com;
 helo=szxga06-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 09:53:19
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In qos_build_main_args(), the pointer 'path' is dereferenced before
checking it is valid, which may lead to NULL pointer dereference.
So move the assignment to 'cmd_line' after checking 'path' is valid.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 tests/qtest/fuzz/qos_fuzz.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
index b943577b8c..cee1a2a60f 100644
--- a/tests/qtest/fuzz/qos_fuzz.c
+++ b/tests/qtest/fuzz/qos_fuzz.c
@@ -70,7 +70,7 @@ static GString *qos_build_main_args(void)
 {
     char **path = fuzz_path_vec;
     QOSGraphNode *test_node;
-    GString *cmd_line = g_string_new(path[0]);
+    GString *cmd_line;
     void *test_arg;

     if (!path) {
@@ -79,6 +79,7 @@ static GString *qos_build_main_args(void)
     }

     /* Before test */
+    cmd_line = g_string_new(path[0]);
     current_path = path;
     test_node = qos_graph_get_node(path[(g_strv_length(path) - 1)]);
     test_arg = test_node->u.test.arg;
-- 
2.19.1

