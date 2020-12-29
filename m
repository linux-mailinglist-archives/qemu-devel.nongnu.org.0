Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C642E6D2C
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 03:10:48 +0100 (CET)
Received: from localhost ([::1]:33382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ku4TH-0006WS-CO
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 21:10:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku4QR-0005fc-3Q
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 21:07:51 -0500
Received: from mail-oln040092255100.outbound.protection.outlook.com
 ([40.92.255.100]:5939 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku4QN-0004cK-Qm
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 21:07:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipk+mhzgEoglQFcVUkm6q3M0f+YFbQm8jqIwBF6aPWgXyNDy4Hp8A90V/6d19l2Skw4yv/zISBgy/JQEdKC88Qjlm0I9olcHKYndJA7QHIBj7kNbo0caP1YeLjbdL7GhZp5/oA3uvP++W7Dc3EkZY5queAOTr4Sg74+FsoTKBgT4kacBsTBzCHOtI/aXA1M3ddVoUgwytzx3U1/ZSXe6GRhrMHDHzFfvUH/AHpbEkrWP0rV0EWex8HTq9BctVs2baTvIu3bHlotKZHt/cUZF01/yKbWD41EEg4Xaay50jXvqCeH1FV/d2cW8vEOV1Rw34nU4eSXqWE3hg3+n8mP0lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asFEf41E7C/LI6HYvtDP5NrBaUVrKW4QghpxAocWPww=;
 b=mK8ZOhut8JQ2KkXJxOrop8Dwf/vVBfF5tuw8Ugwggji33bZMc6zywhe/fz9nmgFpIeGJtem3Dt54WI6mooIhDT5AujO4OgO30vRZktVb3Rm5gdRQNqfrIc0j69JEFf8qcM1lT5wjiJi3eZJ1oSBKCAsUzFUAjVUkEEDagokx4ZsIP96zAOP/V7Fp6D98qn3UZMHPEl2Y9xo5sSc2W9g2M/CzuTBLwY9EonjLp4YA4NB+Xhe2HTvEX39fYQWsHvPBlalVbu7Hil824TyU2CajkeOcRt1/yD7bTPK1vpSKJEnLBTxaXe4gLsa2xlFulMkfQFvxmM8+0TF2vxls54RCJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asFEf41E7C/LI6HYvtDP5NrBaUVrKW4QghpxAocWPww=;
 b=Zb50ncy87ygLAGLK8Mt4xwIuNXrUvMdcUC9DMdBmU+5ma/1QsQTofJz/O2lsyBydk0be0xwoVY04Snl/T4ZIwUe1oD/BzErZWCWKPFLcL1RhWo66mCzGCGoc3xIJ647055l07VdLbOVmHaV+TGBZJCzdl7smq6c11bTdZZUIkhbK7todKltWGhef+aC/OdWeEMggzDnBTyatBrlzGulEP+MhKActwHcfnoLNJQiYEivC/tHg/GCFLlSvsOaAYgUJQT0RnL3XsYcJdg9idEdWxErgDDDwDBguB7jnr3EELsLOom+7debDDe4esh31YMdRu3tXhGqRMqusnNr82SQkig==
Received: from PU1APC01FT004.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::4c) by
 PU1APC01HT148.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::171)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 02:07:37 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (10.152.252.60) by
 PU1APC01FT004.mail.protection.outlook.com (10.152.252.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 02:07:37 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:E6E9C9FE6858FFCD45D2D5ADB134A8A582A5A86FC0F89E69778F0FDFD454E6FF;
 UpperCasedChecksum:2B6D662502226FCC3F13D230A097A7E6837C333D9A2CAA15A04401F77DAA865A;
 SizeAsReceived:7668; Count:47
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 02:07:37 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v3 1/7] fuzz: accelerate non-crash detection
Date: Tue, 29 Dec 2020 10:07:07 +0800
Message-ID: <ME3P282MB17453AF24C92563FD4F42DC4FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ME3P282MB17451412C0E506C9D5108B35FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB17451412C0E506C9D5108B35FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [YJs0aFfvHzzsQ+Jii3xTna340M4jD2cdFkslo47R8kgLxfmA1nhnbK9+5+/oLkEf]
X-ClientProxiedBy: TY2PR06CA0037.apcprd06.prod.outlook.com
 (2603:1096:404:2e::25) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201229020713.3699486-1-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:6d26:2348:77a5:f7ed) by
 TY2PR06CA0037.apcprd06.prod.outlook.com (2603:1096:404:2e::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 02:07:36 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: da759392-c39c-4594-be48-08d8ab9e83a5
X-MS-Exchange-SLBlob-MailProps: /mB5ds43bCHTCek9FSeFV8P55JSj5WM9C54spWRYGwDGRZK9bCH5+MGHuB2NOSncrUalXyvtcjydsPBtpoMv4mJ+qArIWeWnvTw1MSdrwnfQzECkHfcJNOsVgO3fEa7109w55oh6jyq9FITiEINGot3/6kCcgmX7qcKNSk6G47kMuF4oiD4IBEUU63euVFhz+gt6ce9Z8HJwetIZdUNFC0lcH98BlTelkf5l/KndO9tl7WzY90O0w6bO2tZyTvzR+fL8tY2TGOMyvuBp+qU6JhDjbICX8QYvk1h1ap4kCG2M+BIILstY9/mXvFgm2wzyuIvYkD8SZHFfAnx0f0m6LZjMrO9xmIgMYbxmXciF7BxUmhbKmtQVZLBCBqWdHyKLIxm+c6maPvYWwSuIUq4SG1Ijtm2Wc1FlRMWd54vOJjTsmz9jXH3n18llb43A/7JP73sO/XvQb3OaydKvvT7pyLOSO9gsaiUMjNTkSWFAzyapKv/q0MODOFe3OELS4gwaDbT2faEFTVQ21mj0MblgSdJxdkZ6hTr7xrEbnCalBQbzp4+dRvEdDwNr4/2RhIulfA2hUn1RUp9n0757zYeR1xYHH4laFtZoVtat7U4DcwmsatElcpPpdD51ZXLmxSVDtwUTys7cWOAD8Ov4K/2ENxkSy9E6BsMXIKR2z+PKBIKaNKbrZ5AoM0pC8E04LZHQmB5/FjSIuoocZm3grogffRZkpcwI9KTX3n7PQiX/qp2TxnawQase3Ueu/5N5KonvogikzJzIH6IspKwt5dGMdJok6g1sX/kS/3l0ljxhdDx62Q77BQjmV+p339I0qm5eyW+An+XapZeP/XZseC6zFlQdB6tYgDdme1GfLoiBMgzSw9I5CgDItKAhaFKsJr9Yt/CT82wK+q02NiHynVjdLlhvhK7Yt9d2tC+nryrVQJQ=
X-MS-TrafficTypeDiagnostic: PU1APC01HT148:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8SpjLVy9IxxZLRoKXPTWJTFEAsnQAYZbB+t6ZgI0KFek8/n4Myjnr0a+EHnVfAoJlLKNT3ZTws/AhNxGxwk4IHiOFT+NjFALpMOzG03QW0qdwv2pr74zOR2yohF/QVo8659IPsi1b4uMoPEoJi7gNjZ3L3cRnt5F+bIlj34y5X9bBjySnIdslVuZHiUqOcKuFSY+yiuOohlQNXDRuvDdC2Ez7mpW6PMn/NPhZcs4YXxPTMW505J842HRYlwNtHNt2K3x3+gY5TimIpGzQw0NKj3mH+7K9VJFVsgGu+G/GOA=
X-MS-Exchange-AntiSpam-MessageData: mxgQJkkIx+ApGl/t+Tmv50WRXQOICVpwo0pIDECJPYK1lUCTok3svKhh3UafWP/3WlM0mEBBuJjhuvDtcmJIYnowCCsPi9NQ4ML1LkD9ruDL7FuQ/CyuCUNcCeAJHGyuVT2j3R5dt+psSDW+3tAnUCSQatz4Ont0NTsx8hUcmylr3ECz4jtWBHD7ju6U5q62azk7945CG2iJxbUXC5wxtQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 02:07:37.3918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: da759392-c39c-4594-be48-08d8ab9e83a5
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT004.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT148
Received-SPF: pass client-ip=40.92.255.100; envelope-from=Qiuhao.Li@outlook.com;
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
index 5e405a0d5f..aa69c7963e 100755
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


