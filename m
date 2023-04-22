Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5D86EB683
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 02:59:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pq1a7-0006tN-Qh; Fri, 21 Apr 2023 20:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pq1a3-0006qm-9k; Fri, 21 Apr 2023 20:58:23 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pq1a1-0003Sn-4v; Fri, 21 Apr 2023 20:58:22 -0400
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33M0Bhqx031091; Sat, 22 Apr 2023 00:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cEESlChjvEWAucaoZNX+UJXbOCp247z6Xa9Z2wCP3SE=;
 b=Rcpi9Yu3j9XWXitqs3XkiJJFYxdnLcdAA5JoNOEpLRPDbOEnSb5lpUvX/6zhdQy1hiav
 /4xQlLE6h9JqxOuvNAxypEWSFmGmtVBRETwfEEX30ZH2zQs/PbeagCNxrbSxkBqnSNMS
 Bm+hZAMlmbkgnbJsGHQUm+zNipjKK3WPNhe3JsPUrfhR0BgtUrgHK1pzMNhVld/bClJS
 Sd+e0oy3rXIdrwQs72Kym7PT5hDLgrWPIi5mxGIpWUIHN/znpjKf8gMb/6oKtJIjOuZV
 T+5YtfAbPN34oe7wlkNViyrSoXdkUL0+LURq+lPfIO7QeokCe6c+sl9ki5tPCce0UOsz Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q3xp3vus3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 22 Apr 2023 00:58:18 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33M0wHVw030047;
 Sat, 22 Apr 2023 00:58:17 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q3xp3vurj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 22 Apr 2023 00:58:17 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33LNw7BG013858;
 Sat, 22 Apr 2023 00:58:15 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3pykj6bkk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 22 Apr 2023 00:58:14 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33M0wC0q58720616
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 22 Apr 2023 00:58:12 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A38C2004B;
 Sat, 22 Apr 2023 00:58:12 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1785320043;
 Sat, 22 Apr 2023 00:58:12 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.0.177])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Sat, 22 Apr 2023 00:58:12 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 1/2] tests/tcg/multiarch: Make the system memory test work on
 big-endian
Date: Sat, 22 Apr 2023 02:58:07 +0200
Message-Id: <20230422005808.1773015-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230422005808.1773015-1-iii@linux.ibm.com>
References: <20230422005808.1773015-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: N0T4QcoRLDBotvNElRmWdJSy2qdV8FpL
X-Proofpoint-ORIG-GUID: yQ4av4wwTf6jutUeDLTrT3IjrP-Qcfbw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_08,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304220003
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Make sure values are stored in memory as little-endian regardless of
the host endianness.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/multiarch/system/memory.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/tcg/multiarch/system/memory.c b/tests/tcg/multiarch/system/memory.c
index 214f7d4f54b..8ef6666b440 100644
--- a/tests/tcg/multiarch/system/memory.c
+++ b/tests/tcg/multiarch/system/memory.c
@@ -121,6 +121,9 @@ static void init_test_data_u16(int offset)
     for (i = 0; i < max; i++) {
         uint8_t low = count++, high = count++;
         word = BYTE_SHIFT(high, 1) | BYTE_SHIFT(low, 0);
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+        word = __builtin_bswap16(word);
+#endif
         *ptr++ = word;
         pdot(i);
     }
@@ -142,6 +145,9 @@ static void init_test_data_u32(int offset)
         uint8_t b4 = count++, b3 = count++;
         uint8_t b2 = count++, b1 = count++;
         word = BYTE_SHIFT(b1, 3) | BYTE_SHIFT(b2, 2) | BYTE_SHIFT(b3, 1) | b4;
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+        word = __builtin_bswap32(word);
+#endif
         *ptr++ = word;
         pdot(i);
     }
@@ -167,6 +173,9 @@ static void init_test_data_u64(int offset)
         word = BYTE_SHIFT(b1, 7) | BYTE_SHIFT(b2, 6) | BYTE_SHIFT(b3, 5) |
                BYTE_SHIFT(b4, 4) | BYTE_SHIFT(b5, 3) | BYTE_SHIFT(b6, 2) |
                BYTE_SHIFT(b7, 1) | b8;
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+        word = __builtin_bswap64(word);
+#endif
         *ptr++ = word;
         pdot(i);
     }
@@ -184,6 +193,9 @@ static bool read_test_data_u16(int offset)
     for (i = 0; i < max; i++) {
         uint8_t high, low;
         word = *ptr++;
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+        word = __builtin_bswap16(word);
+#endif
         high = (word >> 8) & 0xff;
         low = word & 0xff;
         if (high < low && high != 0) {
@@ -210,6 +222,9 @@ static bool read_test_data_u32(int offset)
         uint8_t b1, b2, b3, b4;
         int zeros = 0;
         word = *ptr++;
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+        word = __builtin_bswap32(word);
+#endif
 
         b1 = word >> 24 & 0xff;
         b2 = word >> 16 & 0xff;
@@ -251,6 +266,9 @@ static bool read_test_data_u64(int offset)
         uint8_t b1, b2, b3, b4, b5, b6, b7, b8;
         int zeros = 0;
         word = *ptr++;
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+        word = __builtin_bswap64(word);
+#endif
 
         b1 = ((uint64_t) (word >> 56)) & 0xff;
         b2 = ((uint64_t) (word >> 48)) & 0xff;
@@ -376,6 +394,9 @@ static bool read_test_data_s16(int offset, bool neg_first)
 
     for (i = 0; i < max; i++) {
         int32_t data = *ptr++;
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+        data = __builtin_bswap16(data);
+#endif
 
         if (neg_first && data < 0) {
             pdot(i);
@@ -401,6 +422,9 @@ static bool read_test_data_s32(int offset, bool neg_first)
 
     for (i = 0; i < max; i++) {
         int64_t data = *ptr++;
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+        data = __builtin_bswap32(data);
+#endif
 
         if (neg_first && data < 0) {
             pdot(i);
-- 
2.39.2


