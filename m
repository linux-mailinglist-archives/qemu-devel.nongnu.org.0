Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227892EED7E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 07:36:14 +0100 (CET)
Received: from localhost ([::1]:46716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxlNd-0006i7-7k
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 01:36:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxlLo-0006BG-Ti
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 01:34:20 -0500
Received: from mail-oln040092254029.outbound.protection.outlook.com
 ([40.92.254.29]:18800 helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxlLm-0005SU-CO
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 01:34:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMkioUo+I6MI05yAFK4YOUWB0iCxzpw5tWoSmAGkyNdjac9FgW48Mo1eiwWS9uhDYUeQjmK838N9FYEjjSsHGu2lRw3/oZbIyb95oYJh5uhvPZV39O/xsa3QMK0me4oyKx4UElwBJj2U+b1WyVNrrFsXqa+DjEHP4sjKK6XOx8Wb4ji2jRfw12jcmfs+UfioYDpWA77LGdhdAegZHCOmk+d+UJaZfmI7olGhZcY5yJswYVli4WHloah5ZzufO6EtCqISNVlu7ZdBg4lSisCCC+9pe+a+ZsW4QU65R+n5rEVf2lYffhDMGg7dFuOGZ28Mdi9Izf2rVXmkC14ncx8nTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qiPAZ9CORD4oLw653rBSpBVet7nGQNDeZShwqkDbOY=;
 b=WQcGO/UiEiwuzJCJmdTFAiE4JU/7Pbul93HzOMB0fHI5GT9WI9kHJNdq8tDQLKyXTo/ITQCwYiM+mV+emJasYuHc+sDfdb8v31vdiAbhrlxyGO965ZqIrsepMtSj5twtYQU49kT49vFu0EaT8dlWvm+8iErK+JnttNwZxFauAtk621Dzf+H6AKO5uEPla/IjenPa8CvhbwaEuDhkcy2FQAIkipYZ1zRDX21SCKDYEmDjgTF+Yu5cyUT6oHXFvuzAcVMaQsbONrLVP7e3SS5rwFVjs7OIcFUttOyhADROi0uVeBsKPqKhF7iCNYufMxtZBynVt+JT6HugE5gjXaPNkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qiPAZ9CORD4oLw653rBSpBVet7nGQNDeZShwqkDbOY=;
 b=dXfQtVQz843pYiA9AWrYUfl+/dOHSZJ2ckoNqAyBYVOfqIS7+UK4FqVJrtR+Qn6CKchWT05XUSANhLgAos2XFbYqbXEYAr7EYh4FpxUD9616wabG8M9YFYVKWfpk3ox6PlUvrYHtmyVo8ovK92N9obdhMj6tTIyOWCNWu9wbMEDNKkTRlfI37S65I6eEZhKiL0RbaVlxJmK1gxbZjlYq60a8+LZczb4ywstSc758i5nRTTC4Way3ZCnzrvI2gvHh6WQhH53uSVB9PJKPHedV9QzrmGGM3IoS/PDtsbe3qXnbRcClzOpfzpu8YWt8Xv1bIk2jUym8O4IAGs7lKJO5qQ==
Received: from HK2APC01FT027.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::42) by
 HK2APC01HT042.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::333)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 06:34:09 +0000
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebc::46) by HK2APC01FT027.mail.protection.outlook.com
 (2a01:111:e400:7ebc::179) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24 via Frontend
 Transport; Fri, 8 Jan 2021 06:34:08 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:39192C99DE1B0DDD3839667EBD306141D4ADF6AEC7A3981FE773A46820634E38;
 UpperCasedChecksum:13BE469C9C578617935D70E7C047AD916750E8E63ECDB52B9773EBFD306F9993;
 SizeAsReceived:7645; Count:47
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50]) by MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 06:34:08 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v6 1/7] fuzz: accelerate non-crash detection
Date: Fri,  8 Jan 2021 14:33:25 +0800
Message-ID: <MEAPR01MB3494E675E2B9033B1AA5B2C1FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <MEAPR01MB349467055C8DBCB7743E4283FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
References: <MEAPR01MB349467055C8DBCB7743E4283FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [LgYcgw4UOrt/exH5LtGFiKtoz8dH+3DLJ6eQeAfjFzB5+kykDCAr74+1R+MiHni1]
X-ClientProxiedBy: TYAPR01CA0006.jpnprd01.prod.outlook.com (2603:1096:404::18)
 To MEAPR01MB3494.ausprd01.prod.outlook.com
 (2603:10c6:201:39::11)
X-Microsoft-Original-Message-ID: <20210108063331.17035-1-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (2001:250:fe01:130:10c6:c22f:85d6:f9d) by
 TYAPR01CA0006.jpnprd01.prod.outlook.com (2603:1096:404::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 06:34:07 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: b2d34e1c-8a4b-46cc-0faf-08d8b39f670b
X-MS-Exchange-SLBlob-MailProps: /mB5ds43bCGRxLkGNTQf9G/trs864FmU4v/K1KMoKMcnQa+HdGLmNPDaKCS82w1sL0BnD31XDW4vtPk1b1UFcE2LiB20h81aNP7j6Ibt07nfyLznDMTFEC9p9fS+KrvIVeSH6vPCmNrGxjfqCnYslAxQqMf93+2fNZut6bg4USYaTmwkjqJDMTVybxXOnp/fxL2Lp3U0v17FZqkQpg+Jc72OlC1dDqvENYioTm9L/od0KPNyFzm5HkXzn04TKGK2GHLuVWfM8rKQcshZgMH1ePmtkeDRBexG4kiyWVvVQcOaBEkOiYUfhUFs5e4I8Lb2/bgbnT/eRCjPgAgdSRcYYuCM7OF4Ryde4LRAct/Dh8cXCLNntqmI/mQlghnrs4FceF0PKl9R0RT4sNVcaS7NcCEag1B6CvUL0hxVyIKcoimG/+P4zPxggh764HAM4Fkfa65asuD08Lx1QzOOGOFFnyh1LSNSXaQErt1MVWgXFKLM14lFJp/Rv/X/vygANu1o8IqzITuy5PgkMYGPTRRMLkv/72fRVCHB7UGcDS4P+WxpTyyzo4OodBv5r59kc7C5iP5MN80pnepti7xk3mKZ9I/tFyDPHkuiWJPmYDECqnocNQstfaJp670+ToCuSQ4vdZADcG6oLQkxmFKY/akAMmocqLR3nxv/4eER8gDJHmXBzyPaRt0pVthbFnbVNA1uk78eipfOrO8e1scts+GUJUn5pAKGG+rUmL/A+9um//JFxeVhxjJEhchI3qdRHE3s459Q9Tk5K0nYdoRldaU74WnTPwaQ6lOtgpyAFsmc7loVjLudygQh+5jzrfX7vKh87CiWQrgoCwAr0/ri1s6B4/MazqRDPEl0pR6jvT11FddxkOOUn22dhm/pmfmSM9DA5DwErivwmISz7M2IHwya3kmIoMPq5qvwA+5hztvvPpU=
X-MS-TrafficTypeDiagnostic: HK2APC01HT042:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dkGgTyVtTSElvLqss/YvE8ck8nnoxcphTm7FGTxA0qdm9NtGH/wo76u4vcoVYcE/QvxjETmdQVKZ4HOmsPdgqI1awRftpNrzh4y70A1A+NJjskpRbSE6+LQuA7BjG61qqACcdOresQPTqFwSobR9XbTvZPAoyyVyE/7s5/IBrtAUCvv2UskrYAY117eFCmiSrQ1j2rArrQQIUbyltrojNaTxNOIKsfO7ZVWYiZGzWzsfrKdvsRsuRvIQ8lSzeXWIi7ckm8s4V90caE6VENfArjxT+Z5DfN6Aoq7nIDq3K/I=
X-MS-Exchange-AntiSpam-MessageData: d8MOvTWlxeBVa9t9LC3GNmiA1nwLuProw+ffFRiIfQU6zWPhVX3LouyG9W/ZR3SePT6A5i2V1Y7vc1go+129h5IEsjV8F7CSeJ5vBdoPkYvKXPErtZi1r56OARSN30WZnEei/awD7cUc4hAh/UcJleTnNHRfo/3cWOHYZDUHKuaXJiM7BFs+cUMw91X6VsQ2NIa+ApXHSQVP6woAYmdlKA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 06:34:08.2075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d34e1c-8a4b-46cc-0faf-08d8b39f670b
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT027.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT042
Received-SPF: pass client-ip=40.92.254.29; envelope-from=Qiuhao.Li@outlook.com;
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
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 39 ++++++++++++++++--------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 5e405a0d5f..57dcaaeba3 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -29,8 +29,14 @@ whether the crash occred. Optionally, manually set a string that idenitifes the
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
 
@@ -41,18 +47,28 @@ def check_if_trace_crashes(trace, path):
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
+            outs, _ = rc.communicate(timeout=5)
+            CRASH_TOKEN = outs.splitlines()[-2]
+        except subprocess.TimeoutExpired:
+            print("subprocess.TimeoutExpired")
+            return False
+        print("Identifying Crashes by this string: {}".format(CRASH_TOKEN))
+        global deduplication_note
+        print(deduplication_note)
+        return True
 
-    return CRASH_TOKEN in output
+    for line in iter(rc.stdout.readline, b''):
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


