Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B50A62E6D30
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 03:14:53 +0100 (CET)
Received: from localhost ([::1]:43430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ku4XE-0002UO-RW
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 21:14:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku4SR-000706-7i
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 21:09:55 -0500
Received: from mail-oln040092254038.outbound.protection.outlook.com
 ([40.92.254.38]:10669 helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku4SM-00058H-Sf
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 21:09:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKrT85BHNZZLe+zEHU+AvF0UFfosRhgemHpuTCZ/AJqYbdZuDS533yGEScv8mW3JjNQdwLor+iDefWsIywNwd3GuTLb5DdHZFVRnMiLJIZ4/W6wxW43sNNxrW0b3pzFs/AzWCDedzF70fSemUV+BcVXUl4AVBl0zsYNf6Rjxc5NUahBbnxMvZ1j/CL+yCHf/ltIdq75OFaHjZ2PrPTUiWvRQgK1cCQ/9frt5i5I4879JHXwxBbKrwmkTE0JRfqHEKs1Uq5Y20mxMRQ4sh17cQtNeWt+DnJOvfAscLossGQadzC7/CS/jUTxERh6eKKi0OtMRCgxIYLgghKplIfDdYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDD/ChELnjvko4IXE87JkZYGo9rI0aFKHSF1aoVO+w4=;
 b=kiY4RpaSDFuCLBjseDEmHvUelhLnoGh1RfTxvqHEpOc3TYrvQBtBvly2m8+h7Lo5RyKSt3pVh1SLNKSrykiCPMhTksgyNYUj5114vemSfPEIWT8Hp7VOxEwrAe3AuywL7f3D+RtvrISwvmWePOtsFS+YKqjDyYyeNRxtsL9CKb9fz/j7FzwKflmVAdVvSbZG0TBr8nAmDMhOJNaGGrkDmdM43kZ+9KmuRS38arseGFpsy8S0NdDQyT3+5k1HwKshbEBmM1mJPHcR8N+pbaCftG6bh9U5RdCbDLtGNVg0lxVX5VqBNf3Sy9zughbuAxZrYKuCN0JKVlEC2OV59vNmwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDD/ChELnjvko4IXE87JkZYGo9rI0aFKHSF1aoVO+w4=;
 b=Cp6TgMDXfLWH79r5rPVb5j4mXOg3/QjS4Oeqo/wLrzyXRALO2EWD0NKgeRPorKemI0zkhIMw38MbfsnaURigwRGhHSyXcmL1ab4AbVVa0sOfHuUQAT6LQ5ft2Yqg8B6qQBkUmaVw3jYNlCD+RWZ+L5TAA0pIQUplIqPJ7+ESaSbVeFevZ+c6Ch9epWei5z/oaWyRioQ1h87vuuPALXrIH1/1cwN7YbL1uI3haz7KrhrqEDfujTidVkzXIlTTpSoQi+g6Ix8/n2+OoTGnw8j3kCN7Zgm91ZdcybCEC+M7f1ynZtiRmu/KGiyVbRVTE4CS3bieOJHnOlQro1XDtM1ArA==
Received: from SG2APC01FT031.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::4c) by
 SG2APC01HT121.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::462)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 02:09:40 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (10.152.250.54) by
 SG2APC01FT031.mail.protection.outlook.com (10.152.250.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 02:09:40 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:69C97A00BC3E69A7E6BC541DFF5EB763A785FC087B36580C4332DFCA2CD2CCF4;
 UpperCasedChecksum:DC04DD1EFA4E6BF27601E86C393A92A241BA7B60D753A5BAE8924737348617BA;
 SizeAsReceived:7679; Count:47
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 02:09:40 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v3 4/7] fuzz: loop the remove minimizer and refactoring
Date: Tue, 29 Dec 2020 10:07:10 +0800
Message-ID: <ME3P282MB1745E3A30986891C935465F3FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB17451412C0E506C9D5108B35FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB17451412C0E506C9D5108B35FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [S1irWGbN/a8PeBfd44xcjmtTrHwk82bpMosOPpDczMO93S2ufpgM4wnECs1uwW1k]
X-ClientProxiedBy: TYAPR01CA0154.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::22) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201229020713.3699486-4-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:6d26:2348:77a5:f7ed) by
 TYAPR01CA0154.jpnprd01.prod.outlook.com (2603:1096:404:7e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 02:09:39 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: c228ca49-0868-4fca-6885-08d8ab9eccd6
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiRaJ+ox6yOiFxhBa7ZFYMmiF1Yyh28+MKsrj98hRx6boQ9+6tvhCh+vkL+7D7u+8xSNToZcgEruP6l4r4EUBMeF0zZs12oeFhAASohxL17ReYn3S+bytNU5prXiQHBPjXXjQFBPp1/485xSD0QIMHXMM3ymnga/m5UlQ1r7ZST5tHVxFzNFaAmAjUQ39NUi64rDemm2pVUI2HBzcgH0iu0OjoS+aGPCQUmVJrgzRMyXwA/A85TF5SPcDfpaRoX3QCYoyIsflLhq0wH/NgXPY5eNslIs7gcY4oZsMt0TL1Vc/+t1f8avr3ZpS5jg5qDbsdjvwtZxbcU8rbMhLbURRUl849chn3ZQXp6EXX2OJYoBTeEraTWbnl1bS3/DmLty7Nhf80e9xOCeT2a0EnHp0fEZ2H1Hj5sjprwWbWfbUTTh4TyLobB6AustZ3TBmkfuLxeRMikVLtg1lHwMLdZROnZor3R7OJuKtiBR2PYsMsTg4l0dx7dN94Z52OfPjJa+twHIAshFRFmcnCYxvK9AGgZ788NxN71HK7DeeFgEXKdEtoUZCpO7RTWpGww045GVzP9OHlmDorIVT71mD0ANFpqM/Le+tJ8HERzVoF7IklBq2bI5pFu0cSAjL5CwkCq54Ehc+cYl63wVsIQyLx9ozw5ovQdsAlY4j/GoXDhXjmdKfl3KHtCzqcTzSfQTkBxBOg9C2x+jh94dy2cm3cHVDBov534mFm9iABj7VQFiaSRjrvzvLUqY6aJJ/Xb6czrLVlQ=
X-MS-TrafficTypeDiagnostic: SG2APC01HT121:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G4ZTWAMGq81SXq3bX6BzyTLWaJpT5m8NoZdkE/k0slAuNPpxp6npkiBcjiPpMTM8PJ4OB5owdL3mxNq8H7P3g/KK8FPw+KkESIt++1j+lRA+DnpTli2XvUhT2ZprVP5eXgSBEbimJ5hYHE3M9zSipsT5DSJKVV5FdiAnxYmFS79cwkdjdk4BkDe7dDov+jIk5TwGKQz+eIKUrpcLQdCDakFArZiZFdi01ufI1v+gyDsIWHpFtKwfoKO1Hzu9Zpyq
X-MS-Exchange-AntiSpam-MessageData: I0Q9sA97wwzG82HCv36mEUZ3oZ9mg92VG4M6pYvAXm79m0jbZ+iok71hazB427F6vVkve7f+98HkeZk/QkX/gZz17GyyrOW2zw4ZL64J2uc5p60PUq/K6Dg0ONznilTaXF9punZXs0MZo2Pp6J6dxXB4eXHH9DZkcUFIPrKcQhYsQ2BLDHeHLg4HTWXrR1UrfdPSWcp1lvznEIy/RkronA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 02:09:40.1506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: c228ca49-0868-4fca-6885-08d8ab9eccd6
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT031.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT121
Received-SPF: pass client-ip=40.92.254.38; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-PU1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: thuth@redhat.com, Qiuhao Li <Qiuhao.Li@outlook.com>,
 darren.kenny@oracle.com, bsd@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now we use a one-time scan and remove strategy in the remval minimizer,
which is not suitable for timing dependent instructions.

For example, instruction A will indicate an address where the config
chunk locates, and instruction B will make the configuration active. If
we have the following instruction sequence:

...
A1
B1
A2
B2
...

A2 and B2 are the actual instructions that trigger the bug.

If we scan from top to bottom, after we remove A1, the behavior of B1
might be unknowable, including not to crash the program. But we will
successfully remove B1 later cause A2 and B2 will crash the process
anyway:

...
A1
A2
B2
...

Now one more trimming will remove A1.

In the perfect case, we would need to be able to remove A and B (or C!) at
the same time. But for now, let's just add a loop around the minimizer.

Since we only remove instructions, this iterative algorithm is converging.

Tested with Bug 1908062.

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 80 +++++++++++++++++++-----
 1 file changed, 65 insertions(+), 15 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 1a26bf5b93..70ac0c5366 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -71,21 +71,9 @@ def check_if_trace_crashes(trace, path):
     return False
 
 
-def minimize_trace(inpath, outpath):
-    global TIMEOUT
-    with open(inpath) as f:
-        trace = f.readlines()
-    start = time.time()
-    if not check_if_trace_crashes(trace, outpath):
-        sys.exit("The input qtest trace didn't cause a crash...")
-    end = time.time()
-    print("Crashed in {} seconds".format(end-start))
-    TIMEOUT = (end-start)*5
-    print("Setting the timeout for {} seconds".format(TIMEOUT))
-
-    i = 0
-    newtrace = trace[:]
+def remove_minimizer(newtrace, outpath):
     remove_step = 1
+    i = 0
     while i < len(newtrace):
         # 1.) Try to remove lines completely and reproduce the crash.
         # If it works, we're done.
@@ -174,7 +162,69 @@ def minimize_trace(inpath, outpath):
                     newtrace[i] = prior[0]
                     del newtrace[i+1]
         i += 1
-    check_if_trace_crashes(newtrace, outpath)
+
+
+def set_zero_minimizer(newtrace, outpath):
+    # try setting bits in operands of out/write to zero
+    i = 0
+    while i < len(newtrace):
+        if (not newtrace[i].startswith("write ") and not
+           newtrace[i].startswith("out")):
+           i += 1
+           continue
+        # write ADDR SIZE DATA
+        # outx ADDR VALUE
+        print("\nzero setting bits: {}".format(newtrace[i]))
+
+        prefix = " ".join(newtrace[i].split()[:-1])
+        data = newtrace[i].split()[-1]
+        data_bin = bin(int(data, 16))
+        data_bin_list = list(data_bin)
+
+        for j in range(2, len(data_bin_list)):
+            prior = newtrace[i]
+            if (data_bin_list[j] == '1'):
+                data_bin_list[j] = '0'
+                data_try = hex(int("".join(data_bin_list), 2))
+                # It seems qtest only accepts padded hex-values.
+                if len(data_try) % 2 == 1:
+                    data_try = data_try[:2] + "0" + data_try[2:-1]
+
+                newtrace[i] = "{prefix} {data_try}\n".format(
+                        prefix=prefix,
+                        data_try=data_try)
+
+                if not check_if_trace_crashes(newtrace, outpath):
+                    data_bin_list[j] = '1'
+                    newtrace[i] = prior
+        i += 1
+
+
+def minimize_trace(inpath, outpath):
+    global TIMEOUT
+    with open(inpath) as f:
+        trace = f.readlines()
+    start = time.time()
+    if not check_if_trace_crashes(trace, outpath):
+        sys.exit("The input qtest trace didn't cause a crash...")
+    end = time.time()
+    print("Crashed in {} seconds".format(end-start))
+    TIMEOUT = (end-start)*5
+    print("Setting the timeout for {} seconds".format(TIMEOUT))
+
+    newtrace = trace[:]
+
+    # remove minimizer
+    old_len = len(newtrace) + 1
+    while(old_len > len(newtrace)):
+        old_len = len(newtrace)
+        remove_minimizer(newtrace, outpath)
+        newtrace = list(filter(lambda s: s != "", newtrace))
+    assert(check_if_trace_crashes(newtrace, outpath))
+
+    # set zero minimizer
+    set_zero_minimizer(newtrace, outpath)
+    assert(check_if_trace_crashes(newtrace, outpath))
 
 
 if __name__ == '__main__':
-- 
2.25.1


