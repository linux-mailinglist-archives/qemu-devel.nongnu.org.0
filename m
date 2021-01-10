Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1132F0774
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 14:35:00 +0100 (CET)
Received: from localhost ([::1]:46516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyarz-0006Jq-6P
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 08:34:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyaeJ-0005O8-PV
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 08:21:02 -0500
Received: from mail-oln040092253049.outbound.protection.outlook.com
 ([40.92.253.49]:15814 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyaeF-00048B-Td
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 08:20:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8kfrg4Mlc5DvhaqepHNFZ8iG8cMF22LhuNCsdQBYDwOcT/ieaa/faBbp2xwtliu5RHEtlns/UGvDlPI1XtsUmQ7FbnU42RAuNx9ASoI861MSYK2IFOlrH7V/0ze/Di+6zL+RqJRLBKsYiQAjk2uJV/OvlSA9oz5wc36vjMhAWmcm8VxfP+5JW1hOuroJSRa8VGrNJY13KaeU+W+e4w7x1kViQuE1w7KwiUdp4Wyquu9VfAxwDWbqvEojsTsmh2ynpiB27wBX8/lmJXJ7nWmYhRpp+8J7gV4K2X2wnB7apakj6GB9YBT4e8MDEsjj+ikm4Dwe96mu5OAJQImM+2pBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ko3OOYXdR0q1ez34lhmiN3jtJwrvThhf5rdtEw2BaOU=;
 b=IRKcoF/hsqENwVLz4PmF0Y+rFXhWLTkbn2tV2v4lFs5FRAea7AHKrpBoZFybhm9ikn256wkr1sZ1dNu/5pkIK5ka1lEL5jUVkWUYvcndWzQesDiR8V80C3bfyhX446Wqwrs+jOXM15dDX1ywP0bDuGkODp5dFD8znxpfMeVWOL+BG6NGz/MiRb6ZFa+c8ImRp1mtPbgSW91dkxIXnhB06vMqmlK5sQ8Tuux4squFc1aVWNbjDFjA1TP9TQ1Re9cYFY+5gNkU3DowJT5TCHEnRO9aC9eUzJMsB/FbsmWuRJ3CcR/H2K3O+XSiPl2yG0pQK/jOFdnvVddEm7ZxKXKnwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ko3OOYXdR0q1ez34lhmiN3jtJwrvThhf5rdtEw2BaOU=;
 b=UxGVn+0hLgINEjHAi1/jBOt8sO8OBRWz0F86ODkl5H3wWozz1rXkrQ8m3znmkNlF9jhFKSr1aUgW+9NxPlCcurMgndwkQqgRe5XVANuYFfHsTpsJjX0DqC50Tn81/zXN3rkrOjTwfYvw95j5KN8fXEqdxlDoQbo46Vmjid05JXs8am1Th2pUYE2byNiM4I6otQHoOQKOJlE4iqwzv4Z03Ki2YKHRhLu162DCuxQl1W+vOogYJTg3B/y0txUgYsURKpPjhkUPZczbvkh94NRCJpxIFRGLqXCT8eVPiIZgyZyob7zOmPJ9OqY94Oy2cdMUeQo1RYhoelPatP7rC1tCYQ==
Received: from HK2APC01FT060.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::46) by
 HK2APC01HT092.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::382)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sun, 10 Jan
 2021 13:20:39 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebc::52) by HK2APC01FT060.mail.protection.outlook.com
 (2a01:111:e400:7ebc::416) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Sun, 10 Jan 2021 13:20:39 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:75BEB53D676062A04F1E72F7DB04FD822A07D465DFE1046D90ED17E7ABB60C4C;
 UpperCasedChecksum:F48CC350ACC4228C593DD1E7527303172A5DA1BD635BE59CD668E42AF3975A03;
 SizeAsReceived:7554; Count:47
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3742.011; Sun, 10 Jan 2021
 13:20:39 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v7 7/7] fuzz: heuristic split write based on past IOs
Date: Sun, 10 Jan 2021 21:19:37 +0800
Message-ID: <SYCPR01MB3502215943A3C559BA26459CFCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <SYCPR01MB3502023A4AFC1E75DC3747ACFCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
References: <SYCPR01MB3502023A4AFC1E75DC3747ACFCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [QsgUByfeEz9J0za6ez7JDfZFHBkeLQ45]
X-ClientProxiedBy: HK2PR04CA0055.apcprd04.prod.outlook.com
 (2603:1096:202:14::23) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <20210110131937.98351-7-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (111.176.239.56) by
 HK2PR04CA0055.apcprd04.prod.outlook.com (2603:1096:202:14::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sun, 10 Jan 2021 13:20:38 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 8d8d44df-e17f-4e38-1e56-08d8b56a8607
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiSygBPrM25OmO0bBkd81GAbiDFWcOT4TYWp6QkpEOC3DhVK6t1rLMOLsJIAc8HyCBE7irpBY17c00Pn3WTOwVqs1/1Ivem6XBGOUuY/mrnyqdsdw1XVRFMia1Q4khfKhhFZ2F2/GBYdaoSGEmXZ2G1pKqEKPS0hhBf897MX613THhwZq0Wy1ufdJTy3iS7Y/woeXwXtB6THhA3gmvfzO3b1v5GEPKqBBkLV325zwpcNiAm6p5K/F8mZHgSG96M8vbqmmkZ7RsFOMRt+rxX1pH6GkKBrdRtsUui2IWFAvJAms4fbExGHBhFHqCyI2AYODX+cyKOIxZOkXjUCKftevOnlSepPdFGLLtGXVUHHO2HpmHFzc3cIP0+/ffF1bRDxMa0ZnXfpU/ie0LX7SWy8u23PEzjNMx2SROo0C3MUPp/PPc+c3+6S8KRTGO2+qC7l4xFVHncYLuMsSr8fkDNjfMk4hqVXF0y8kCsgdB5pAgvGS7yzNlceeN382fUAPKBhM90imsqnFqqQUWtlWQkoRpWxncSWJ8BA52rr91HWgtSmZhfkwaBfkA87g/AShrRZ1TKt/hEH3iitwwfCPu80vW5jtrFQLZ9ETpilu1IR6GMoCbTm1Zhr7V0Tjij/7AJIT5kzZ/5IG3XnEgkRDHihQC1p4z+9rN2GUaaKB0i8WuF5152WSKBTt2bzUhF7PRMMjccGxX0Bc8t/B+pu8kZ5C/U2ttU75GlYpCHVNFYJBXZwY7jGSXEBbcFr4pEO7FmPTd4=
X-MS-TrafficTypeDiagnostic: HK2APC01HT092:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vGA9QlpjwAhmlGHL/BJh7CNkiJjjN2wgiMCjxyf6uKCNCbG4bQ8M6+PzaCTQsXn7nTdeN4BjgwJt0CZe/k8Ymqwm7iGnT2ZWv/XWU2Jk70vXMWngO2yK0Y71Ui+NL2wUao6P0thL73b0tdBYp2Ny6qDL1dFmKAQFk5fHgDsQz4fBCVvHRXGEgC1T7J1BU7ol4ndWLHnh0yH8Ud627V2820Zb0mu+bRd+JIGsVsV1lOtAJJf/lcGlI99Ypp8S9cZG
X-MS-Exchange-AntiSpam-MessageData: 5ulqqtJqYDrnh9B+T46L8aNE4qv+yHkkohC21QtsVk8ROyN4Ig+FCrGQNEyNFga2eC1Av4mP4p4PlC93AqMqOVxzgKJwACuOg4QscXD2YrrdlOspcu8rfHyPVBTcVHEoowCZmu56VPm82pgfnQ/wsw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2021 13:20:39.2359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8d44df-e17f-4e38-1e56-08d8b56a8607
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT060.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT092
Received-SPF: pass client-ip=40.92.253.49; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
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

If previous write commands write the same length of data with the same step,
we view it as a hint.

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 56 ++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index d2e3f67b66..831e1f107f 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -89,6 +89,43 @@ def check_if_trace_crashes(trace, path):
     return False
 
 
+# If previous write commands write the same length of data at the same
+# interval, we view it as a hint.
+def split_write_hint(newtrace, i):
+    HINT_LEN = 3 # > 2
+    if i <=(HINT_LEN-1):
+        return None
+
+    #find previous continuous write traces
+    k = 0
+    l = i-1
+    writes = []
+    while (k != HINT_LEN and l >= 0):
+        if newtrace[l].startswith("write "):
+            writes.append(newtrace[l])
+            k += 1
+            l -= 1
+        elif newtrace[l] == "":
+            l -= 1
+        else:
+            return None
+    if k != HINT_LEN:
+        return None
+
+    length = int(writes[0].split()[2], 16)
+    for j in range(1, HINT_LEN):
+        if length != int(writes[j].split()[2], 16):
+            return None
+
+    step = int(writes[0].split()[1], 16) - int(writes[1].split()[1], 16)
+    for j in range(1, HINT_LEN-1):
+        if step != int(writes[j].split()[1], 16) - \
+            int(writes[j+1].split()[1], 16):
+            return None
+
+    return (int(writes[0].split()[1], 16)+step, length)
+
+
 def remove_lines(newtrace, outpath):
     remove_step = 1
     i = 0
@@ -152,6 +189,25 @@ def remove_lines(newtrace, outpath):
             length = int(newtrace[i].split()[2], 16)
             data = newtrace[i].split()[3][2:]
             if length > 1:
+
+                # Can we get a hint from previous writes?
+                hint = split_write_hint(newtrace, i)
+                if hint is not None:
+                    hint_addr = hint[0]
+                    hint_len = hint[1]
+                    if hint_addr >= addr and hint_addr+hint_len <= addr+length:
+                        newtrace[i] = "write {addr} {size} 0x{data}\n".format(
+                            addr=hex(hint_addr),
+                            size=hex(hint_len),
+                            data=data[(hint_addr-addr)*2:\
+                                (hint_addr-addr)*2+hint_len*2])
+                        if check_if_trace_crashes(newtrace, outpath):
+                            # next round
+                            i += 1
+                            continue
+                        newtrace[i] = prior[0]
+
+                # Try splitting it using a binary approach
                 leftlength = int(length/2)
                 rightlength = length - leftlength
                 newtrace.insert(i+1, "")
-- 
2.25.1


