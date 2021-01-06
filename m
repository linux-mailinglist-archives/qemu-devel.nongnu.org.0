Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653CA2EC524
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 21:38:41 +0100 (CET)
Received: from localhost ([::1]:60148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxFZo-00019Q-Gi
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 15:38:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kxFYN-0007iL-PY
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 15:37:11 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:42850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kxFYM-0000ZU-5m
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 15:37:11 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106KZ20o037934;
 Wed, 6 Jan 2021 20:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=J39U91hwUcfjz6AYWlnaWvznYzeNFQTfjjlfc4yEwTc=;
 b=KCUxNKGIzpK73oRldmgkgoSJ8SCdqJCun3HSEYVjbhmCZNHJVs8eOOY2kgTWRpdkUwAP
 ieQnmsAuP8N4m4GwhI4gxna05NdxUqZH+5M0dxf6UIl90+XHBpq7brQpYRmchRR0xTPt
 +0DIIA9Ckx75ZLjmQau/ZLxRhlaigwU4f35AxGI8ibHOl2BuvPanZeLMqoNj1s0WIogE
 aFcmwU4lh4SEHBjvhXxtG8HPM2ZOY5nKDrXcAjt6ZFuTUjdewfZCEKnh0FHsi9mbUUNQ
 oaOtu7jRwswWT2PTWtaXtd3477WtLqd6z39+NsgL7eCT44sxARe3EiI51kt2J1j5wZ8j qA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 35wcuxt517-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 06 Jan 2021 20:37:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106KaQqv034448;
 Wed, 6 Jan 2021 20:37:07 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 35w3qsh6wf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jan 2021 20:37:07 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 106Kb6s4018455;
 Wed, 6 Jan 2021 20:37:06 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 06 Jan 2021 12:37:06 -0800
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V1] gdbstub: suspended state support
Date: Wed,  6 Jan 2021 12:10:15 -0800
Message-Id: <1609963815-417989-1-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9856
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9856
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101060117
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=steven.sistare@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Steve Sistare <steven.sistare@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Modify the gdb server so a continue command appears to resume execution
when in RUN_STATE_SUSPENDED.  Do not print the next gdb prompt, but do not
actually resume instruction fetch.  While in this "fake" running mode, a
ctrl-C returns the user to the gdb prompt.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 gdbstub.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index f3a318c..2f0d9ff 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -461,7 +461,9 @@ static inline void gdb_continue(void)
 #else
     if (!runstate_needs_reset()) {
         trace_gdbstub_op_continue();
-        vm_start();
+        if (!runstate_check(RUN_STATE_SUSPENDED)) {
+            vm_start();
+        }
     }
 #endif
 }
@@ -490,7 +492,7 @@ static int gdb_continue_partial(char *newstates)
     int flag = 0;
 
     if (!runstate_needs_reset()) {
-        if (vm_prepare_start()) {
+        if (!runstate_check(RUN_STATE_SUSPENDED) && vm_prepare_start()) {
             return 0;
         }
 
@@ -2835,6 +2837,9 @@ static void gdb_read_byte(uint8_t ch)
         /* when the CPU is running, we cannot do anything except stop
            it when receiving a char */
         vm_stop(RUN_STATE_PAUSED);
+    } else if (runstate_check(RUN_STATE_SUSPENDED) && ch == 3) {
+        /* Received ctrl-c from gdb */
+        gdb_vm_state_change(0, 0, RUN_STATE_PAUSED);
     } else
 #endif
     {
@@ -3282,6 +3287,8 @@ static void gdb_sigterm_handler(int signal)
 {
     if (runstate_is_running()) {
         vm_stop(RUN_STATE_PAUSED);
+    } else if (runstate_check(RUN_STATE_SUSPENDED)) {
+        gdb_vm_state_change(0, 0, RUN_STATE_PAUSED);
     }
 }
 #endif
-- 
1.8.3.1


