Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6A02E3464
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 06:59:06 +0100 (CET)
Received: from localhost ([::1]:60330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktlYf-0003Wn-4n
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 00:59:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ktlXC-0002H8-6o
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 00:57:34 -0500
Received: from mail-oln040092255079.outbound.protection.outlook.com
 ([40.92.255.79]:28979 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ktlX7-0001W9-Ll
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 00:57:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QR84XY+0SALNsmyGeJfshESOMY2EzqgR/fvxh7wwMPtKh4a4CQs5eLGHIUDZlgzEeJF6+PzbpiS5Uu63uFn+K87zkT7wCxK7mJybEo1BOcrLzCf9HF4/qLISO8x20NNCoIguF/+QlkQelXHk7jRfXApRUPhjWiqsRIIj6nd0RuaJxD28Q51tfvvSLJ5uZnzc/Ya+Z2Z5dxFdy4g9GbLTJ0/sSCB81GEjhM4RuNccGW0nVAn78+GgnHkeAMetIX95+yRN07ESXdzZQwnmNIOetsSQYd5CoZAN/IPoTAiWX9/VabXpabD16ZzygmGL0ublIprUAUPW7gO5eXnuP/1Myw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pxro5XvdPsfLaUaHa9w2bHKjHPRinphAdRbR+YGu/4Q=;
 b=lfNhZ4ZF4pHoe2SvupRm4WW50KB6eKSLbZvllUO/o2aJvfSKNeI0fM/E1VOkWujfbvZ9h774vtIU3TUfsI268/FrKwFRRYSr8Uk/djATaXda3+Br66D1Kr36nE7wJMxWUm2/d6FxfqiDGb+ZEbSLFsOFsPJQ3zhLeHRcmjBRyFOdZzqw2+5wvS9eShRav/ZCyywBFYLWs8R43UsT2dsOTS2HYBwjAUyxPg1tmdk2R5LT/oErMY1zAq+6l46fFw6Qs83LkeCr/TX9EQBOgeN24w7PdmjxwjZTGGOZICedeFXi3Fo4etMSSDw7a1W2RXTMZcPbRiOkyOgkZLVW2oAMww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pxro5XvdPsfLaUaHa9w2bHKjHPRinphAdRbR+YGu/4Q=;
 b=oHj4PWb2i/agzFCsAjtuM3OPcHuYF0BIlUVgwM0ypkGQaPPj5cFX0qGfqTTmP5xXJDzpVh/+kJTZcd/aH/ALH+fLr6xgOf3t0S3Lq4dMP53j95cJ/x3ebDAhLPeHyIcxq121eMGJ1fWQCK9nYPbAR1J0XCTR5PVDa/l86Ux7vu6/t50Wgx9Ghlb2n0PSk7eZasFBjduSQhpNJvC1iw8ecClz0YPQr98oCwB87azXvT0AKILTCoyWuKL24faglgT7ZJxutXglakTWaqzDXoi3+u/91LNd5msWeSoghOUdo6zaRGGecy5w89DgfJcvq90/1CnGeevMejdcePK0psLzpA==
Received: from SG2APC01FT037.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::52) by
 SG2APC01HT230.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::328)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Mon, 28 Dec
 2020 05:57:19 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (2a01:111:e400:7ebd::48)
 by SG2APC01FT037.mail.protection.outlook.com
 (2a01:111:e400:7ebd::367) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Mon, 28 Dec 2020 05:57:18 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:5AE508EE6C84C53D67D8EECDF6D3D60C3373A13E8BA2625935103C984AA3E68F;
 UpperCasedChecksum:C53282881FED2784EA5FB3FF3E45228078B45C50EA8CC1188BA46F52D544C489;
 SizeAsReceived:7659; Count:47
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Mon, 28 Dec 2020
 05:57:18 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/7] fuzz: accelerate non-crash detection
Date: Mon, 28 Dec 2020 13:56:40 +0800
Message-ID: <ME3P282MB174578479310F8F30A49FD67FCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB17458B2705C43E860A26171DFCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB17458B2705C43E860A26171DFCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [NfOH+B/ZL4Tn/5EEdEdn65F7RmBSsQUMrYYiocS3OYYhUBYWpB9YdYgPNO9Xt02L]
X-ClientProxiedBy: HKAPR04CA0014.apcprd04.prod.outlook.com
 (2603:1096:203:d0::24) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201228055645.3666065-1-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:2110:d78f:cec3:aac7) by
 HKAPR04CA0014.apcprd04.prod.outlook.com (2603:1096:203:d0::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Mon, 28 Dec 2020 05:57:17 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: bcde2738-963e-460d-0bc3-08d8aaf56f7a
X-MS-Exchange-SLBlob-MailProps: pt8ZUcDWjMXJ9A9ttpcs4oXvu424G+c8sYaOH5CNGRsZD1OYbIL/DxGGUGWbSW9UUMvGnyq2koyQX+iBh6MO8oy2KuP9Ymi1O9AhiiXR7QhsC2plWsuafNUqviDr97cPiaaPPJj/dW/VasD/dJrlxNziAP/gRaMXLxVw4LgB5BWCNQWaWeBSWm4pT94PqVI2bDWw2xV54H/gCE0KrP8oZ1YF+8UQvdEHNHxK5+VuVoovb8n8qQR0073KFQ/6AdnL7gxzJm4pKDJoMTC7UZ2p3RAmpntwp5MmTs0b3rjnaxHfBnSmAo3tyJie6jaL3+R+eGRh4YloOwXDnqJvUPTokLdtzeMEr6t0J2xrg99GNxJBVgMPGEyOFyjY17ENCgqlXpyiUVdDF/rmkHTcmaLyz0sfWaKa5W9N4PnW5mGOpbiyIwfzomB+Fucx9/zcB7LKCqD/hN6l8rw24fi8MO4pq5PoEdLYYbriOmQXKR7g27Ijkc2KOUx35x5D+E3D3FW0J4vfi3pcAtJYLrhCDzcEN0YdRwUP4X/AgAw5mGaYasdPZJb2zEh+Rf+Iq9CgrXwHr+azTbQw9x1DCtIkBqtNU2aKCd9KTh9pdDNWdAtS/Q1AtKeXy8JyuQeQzZzZzG0RM9S6WDrYRxF9xuwVvqfBRO1wJuuG6HJ5c6nzFRV5/a0IUsElCkbeiTO+DLVa303EzLtMNMY/yfrV1djuKcAcBbF2fERGRc12jplNwmX4z/BD4Kgg1qARN72L5ftEOmnPFEYaqSqs18qQt78+G7MUDTyFoPjTqmXhgUlhIVsUr9wxeVCUwa/vjlKjhUeFsRi0Z5Uy7tBM/IxY8WAgr+Vv56S5wRClDubQRu0NLtjQDaehnoItb5i9mMMmU145Bv9J6ZibeBVDv4L/ePE5fpIigN2wMwplcYE2Vy0PEjh6oci6Xrd1A7pH4BSFPyvt+6Qb
X-MS-TrafficTypeDiagnostic: SG2APC01HT230:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sSaOvQHGSDGI8k1J7oSZx9LKBmrQoOyVRTDSzKgqQPEOaZYWbsiPanGDuPHiHzqqSD++ngJw1+n6qED0oO5/Hp/FCOJYBTBCf9oCb8fYIOv9K8NRYAIqEh6t31K86gRgvJag6ZqfSS0bCHCJrx9yIGguGI4zuaSjxZr5+NnBl4+c1odywJY+boe2i4Fojx6XYMmpUS8HIo/aLzmYtOcfXg9OBk6CFi9t/ZwcorDM0BC2XL1NqRE7AjpCS6Kk7WADg0zbBd3JOcu2KklSk5id8pmSIqa+WDAEWim2x0eB8X8=
X-MS-Exchange-AntiSpam-MessageData: iKTbBr50knvtcbD6lFuy8QoPAuHKUGAmHE+jBUX+C5eo6CtObfwSnSX3uwbqWBLqwLkCtK4KwrMg7A3ClzM5U/ij0fZtJbkaJ3hETo6+Hfdwk8UH3FjA/nECwpHMF8v6zRW8fIiYEdfm9S+zQtoKSdAVz3SnPoev2cQxa2WrwUgWFKWVWuiTtZ7ywQ9e+LOK536MDVuABz/W4UbF5kLrYw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 05:57:18.6555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: bcde2738-963e-460d-0bc3-08d8aaf56f7a
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT037.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT230
Received-SPF: pass client-ip=40.92.255.79; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-HK2-obe.outbound.protection.outlook.com
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

We spend much time waiting for the timeout program during the minimization
process until it passes a time limit. This patch hacks the CLOSED (indicates
the redirection file closed) notification in QTest's output if it doesn't
crash.

Test with quadrupled trace input at:
  https://bugs.launchpad.net/qemu/+bug/1890333/comments/1

Original version:
  real	1m37.246s
  user	0m13.069s
  sys	0m8.399s

Refined version:
  real	0m45.904s
  user	0m16.874s
  sys	0m10.042s

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 41 ++++++++++++++++--------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 5e405a0d5f..a290dc0579 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -29,30 +29,46 @@ whether the crash occred. Optionally, manually set a string that idenitifes the
 crash by setting CRASH_TOKEN=
 """.format((sys.argv[0])))
 
+deduplication_note = """\n\
+Note: While trimming the input, sometimes the mutated trace triggers a different
+crash output but indicates the same bug. Under this situation, our minimizer is 
+incapable of recognizing and stopped from removing it. In the future, we may 
+use a more sophisticated crash case deduplication method.
+\n"""
+
 def check_if_trace_crashes(trace, path):
-    global CRASH_TOKEN
     with open(path, "w") as tracefile:
         tracefile.write("".join(trace))
 
-    rc = subprocess.Popen("timeout -s 9 {timeout}s {qemu_path} {qemu_args} 2>&1\
+    proc = subprocess.Popen("timeout {timeout}s {qemu_path} {qemu_args} 2>&1\
     < {trace_path}".format(timeout=TIMEOUT,
                            qemu_path=QEMU_PATH,
                            qemu_args=QEMU_ARGS,
                            trace_path=path),
                           shell=True,
                           stdin=subprocess.PIPE,
-                          stdout=subprocess.PIPE)
-    stdo = rc.communicate()[0]
-    output = stdo.decode('unicode_escape')
-    if rc.returncode == 137:    # Timed Out
-        return False
-    if len(output.splitlines()) < 2:
-        return False
-
+                          stdout=subprocess.PIPE,
+                          encoding="utf-8")
+    global CRASH_TOKEN
     if CRASH_TOKEN is None:
-        CRASH_TOKEN = output.splitlines()[-2]
+        try:
+            outs, _ = proc.communicate(timeout=5)
+            CRASH_TOKEN = outs.splitlines()[-2]
+        except subprocess.TimeoutExpired:
+            print("subprocess.TimeoutExpired")
+            return False
+        print("Identifying Crashes by this string: {}".format(CRASH_TOKEN))
+        global deduplication_note
+        print(deduplication_note)
+        return True
 
-    return CRASH_TOKEN in output
+    for line in iter(proc.stdout.readline, b''):
+        if "CLOSED" in line:
+            return False
+        if CRASH_TOKEN in line:
+            return True
+
+    return False
 
 
 def minimize_trace(inpath, outpath):
@@ -66,7 +82,6 @@ def minimize_trace(inpath, outpath):
     print("Crashed in {} seconds".format(end-start))
     TIMEOUT = (end-start)*5
     print("Setting the timeout for {} seconds".format(TIMEOUT))
-    print("Identifying Crashes by this string: {}".format(CRASH_TOKEN))
 
     i = 0
     newtrace = trace[:]
-- 
2.25.1


