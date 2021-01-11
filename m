Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1D62F0CD7
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 07:25:07 +0100 (CET)
Received: from localhost ([::1]:46408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyqdX-0002pe-26
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 01:25:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyqbg-0002C7-QX
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 01:23:12 -0500
Received: from mail-oln040092253044.outbound.protection.outlook.com
 ([40.92.253.44]:23680 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyqbe-0007o6-Vv
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 01:23:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5B0SeMM1QEsvaKdHF8HRlAPEs7BEaodI6jLb9wcKqI44DMaA3w7dWh+iyhXDn69T5X4uS/O9S3f8El7tyY5PWBatxE67tW7Sqb9hqYDvxQd7iaps+QZO0b2c7GRbD5tEB8D27o+g3dus9/Vsss3n439FRlVOgr5UF+gq0NBDCe4yR5VhqIketMLpvljStDnXqk2V03kEdE3Vwl2OJtAdOtq6OtDsM1uzJO7qo5tFNeIism2dY7z+9x6vN3MIQNdjR2faYDid6IyRabXqcZyTlWT/GOoLNT2tOakmxX/S/RNPU4MrcUGZ0T5QSSfisyAAFqgg+KKxigbw2gdM/Nvcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fS0+t4hYQWLGjfoiqhvDFCY7YsB/eIXiuIW9ZbNHtdE=;
 b=MjQsSY1GmwxbGXnNo8+I40ifaEWlgIHip06fhr1OWWXscxRFGotdGCBbmrHRqFuK4/pl5h9eyLKnhmmhlk5sUgmH96aI3jUGSgMm6Ugrhu7342PeFiSt5GLdKz8P/WqhaY5tVWopTlbLakI3DZl8EjMdJXel2yVfE5qSI66Rvos4tAT9XYyHHC3g3dVdUjSmaxJBMuTNtUB27bN6SWVK3SiEt6vkPvKVDU9PpYuGL9tRmbwxLgj7fD7fTeHqmuPpvhcO+L1JeueKsvBEuNJZeSvkiEcw23JsaXoci3ueRng96e58M1L0bL0F6Ig6S7PK9o452kt9XjE8TPBur/dy0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fS0+t4hYQWLGjfoiqhvDFCY7YsB/eIXiuIW9ZbNHtdE=;
 b=nHwurNiljt2MwDkx0SKsHpbPZWmlWh1WNMuiL9I64q8jgewAh3PDiMtoFYy7Cw+lTNpX84dKKiRf62KCyc5TKuwss9+ZLfwlBXgxHRO8sJq+VIHsPdYPcHMDKiWtf2lMdh1jFiEw/3StV5MOWlg+b4yVXICJVU3jucNbv+k6zLjrPCocZMzB89zpj69136m4P7zimFww5Nj+fP21jhgZkUklzX8oOvzWpPkYaBICkUPMrz7yIGSQ2OLANbFz5E87K0KS+/l0FctWX0ZSq3ENFdkDtwe96+fa3BGUA8H/y4Zj6iO31Eu2w40/iUCE5zbk9rAMvF8JgflCoq8CscuCKQ==
Received: from HK2APC01FT115.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::50) by
 HK2APC01HT157.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::275)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 06:23:02 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebc::52) by HK2APC01FT115.mail.protection.outlook.com
 (2a01:111:e400:7ebc::194) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Mon, 11 Jan 2021 06:23:02 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:746784368A5719B3842499C7715DD86DDE6996F6E4667123CCCED8223A03AD1D;
 UpperCasedChecksum:A161244E2BA9FFE8E21EE5992DA389125444895D82C4010C7649D6A3C1400378;
 SizeAsReceived:7555; Count:47
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 06:23:02 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 7/7] fuzz: heuristic split write based on past IOs
Date: Mon, 11 Jan 2021 14:11:52 +0800
Message-ID: <SYCPR01MB3502480AD07811A6A49B8FEAFCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <SYCPR01MB3502FA4DB12C240DD3CFF1E0FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
References: <SYCPR01MB3502FA4DB12C240DD3CFF1E0FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [1dyxjmlIfW/5AuPD0ayFHc3jSCxCzDEB]
X-ClientProxiedBy: HK2PR02CA0137.apcprd02.prod.outlook.com
 (2603:1096:202:16::21) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <20210111061152.176206-7-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (111.176.239.56) by
 HK2PR02CA0137.apcprd02.prod.outlook.com (2603:1096:202:16::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 06:23:01 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: fe8980d1-f77a-4799-d007-08d8b5f95958
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiSygBPrM25OmKOGXZqaBnYpnMrFc+MNpCWxi0YKz8r682bVXN/OzS13PtpRzGvjQ3zYd0jwpK2z3DAI2zfVr+sYeVwPnYN7W8YcL9uwR36IXq/2CNQegByvGYQ0VzGu6utCPj24aoOjcaKqxt3z7Ja1oV0Z14OHM2mnnzSt2Wjor/xJWhIp2uGNp1N3Fsoq55kyVH4+83E5Y3Q1brfzwNTSAPBWMYDvpBQdl/dlydpBOlz/qhFfKxB4AlWGWKnHE7N+fqszw7AOfMtMvcACxkk2scn2t6c+A46F2d6uLAwghoI5u//ZD6lzx4Z+v2q3HPuQaTjZ8MzSNLc9ghHLnf1UTBi5YuZOVt/AjMChzHDHrSkv8fN21UdhaDmDFd/h+yOMrvgZlPqzO1DeLmeAMzpDilvmLnckpBqA0+8SToSnfLLVfmhvD0JSn1SyucgZGrNIzfksViORuMbP1uPJ+uLiV91ZGw1fQcaXvo/qH0s9899AgoMKtCZvEyzpnpDZArMgSgoTT5/WiAqRxJWe6I/eETMz8zSqeClgs8pd/dBXvPW9B+4hOBNzEXAUPGjFDPb+RIIdlVxeSQ4wS/QusDVt0HyrEgMEHvlpCI+fXxiCTQLurB+B3qRAGnjEbrn65OC5vZIKztdHHrtewtIvLH9r8yreOCGiSnmyoPeNSE4zZY25h2GLntD8iDAkCXehtf9sPNx8QpJsw9CHvrs1ZS758sQuqrfjpMAhVLby8GGkeY2fOXuGcwWbBXgqcyx7XNg=
X-MS-TrafficTypeDiagnostic: HK2APC01HT157:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZaLEkawtrfJZY2CgkF5EuSMLa/pIaQIEagW3Mfh5KZVKUSit8j5CSkyTyWHxQp/yaRqzma6dYEswf3gzW1JKi1ywoaGZm5SzkllLwaOVbA+2ZqnXF16attn4+O4H+DSTPaRM0DV6E1i6XIJIxvrX1OmUcOMvrk2uhmVvfjZQuyi9JLyHoHjhR09OGb60xbVTrGH0wIAEp0hzzb+Hf139wBcpKeqMrcvbYik1MBMzbaqcnYuYshf3YT1efeDkUr5I
X-MS-Exchange-AntiSpam-MessageData: 8yF2DiQmsVOMuDMZDExNeBH6GtCn4mMopxMt/kbsH1Y5CFczJ+cYtxWloAirdng+YL4Fz92bdACbS7ufYCiaCquUFybbp8ZLC2S0WwArQgigjNU9lwaPouYIMiLDl1uVrj8YBzlZXtspj84e9icKQg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 06:23:02.3012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8980d1-f77a-4799-d007-08d8b5f95958
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT115.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT157
Received-SPF: pass client-ip=40.92.253.44; envelope-from=Qiuhao.Li@outlook.com;
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
Cc: thuth@redhat.com, darren.kenny@oracle.com,
 Qiuhao Li <Qiuhao.Li@outlook.com>, alxndr@bu.edu, bsd@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
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
index 0e59bdbb01..4cba96dee2 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -88,6 +88,43 @@ def check_if_trace_crashes(trace, path):
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
@@ -151,6 +188,25 @@ def remove_lines(newtrace, outpath):
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


