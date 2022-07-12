Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ED3570FF2
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 04:02:27 +0200 (CEST)
Received: from localhost ([::1]:59380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB5EI-0003kA-NS
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 22:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oB59v-0006bt-CU; Mon, 11 Jul 2022 21:57:55 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oB59t-0003LO-RJ; Mon, 11 Jul 2022 21:57:55 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26C1ttok032598;
 Tue, 12 Jul 2022 01:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kQOHw8/gGLJ2nR5cQgaSUF7OyTYFFvhTbDVtn+U+zgQ=;
 b=OrChChI7/xM0sKyCsVyBDGlN9Nsx1HdI8F5ZRY13bURTe2xJVUzEDheGpihCBMmZvkIe
 csSA89ZV/NOklZQFaVFCzzGm8YRaPCWEsOU+0OeB5ofuyMtC7sSIQoNNUXNZdb7gHWjd
 6b+WFMaFPvClDwKW7G/D5Xl5+i6wPkETqKpG5rO1RPEQT39PBQ2Trh0KNnkXIDDYLeSF
 ZTW0aQjN8KVeJPv9k7rh+fxsaZFRWQLWSzc76W+pWhC8XjF6vfJO9X1SMtyaFcGGZLvi
 4nCTpqHRejlVj69mB5MzIbFQYeKpsGwLht1y9gSNEIFdBWLuqmHHKkbp/IVRzOM/lzHq /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8yqtg0xx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 01:57:40 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26C1uDOC001159;
 Tue, 12 Jul 2022 01:57:39 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8yqtg0xh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 01:57:39 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26C1ocGC015569;
 Tue, 12 Jul 2022 01:57:38 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3h70xhufht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 01:57:37 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26C1vYE319530020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jul 2022 01:57:34 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9635EA4051;
 Tue, 12 Jul 2022 01:57:34 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11821A4040;
 Tue, 12 Jul 2022 01:57:34 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.48.196])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 12 Jul 2022 01:57:33 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 2/3] target/s390x: fix NaN propagation rules
Date: Tue, 12 Jul 2022 03:57:16 +0200
Message-Id: <20220712015717.3602602-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220712015717.3602602-1-iii@linux.ibm.com>
References: <20220712015717.3602602-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NxxnlV-4CsTgjh5s5nCpbcP_qOjMBGis
X-Proofpoint-GUID: 0Zpu6T7SkiPbQ1k0p9yvYkn_-kxLtnow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_01,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=846
 suspectscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207120004
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

s390x has the same NaN propagation rules as ARM, and not as x86.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 fpu/softfloat-specialize.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 943e3301d2..a43ff5e02e 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -390,7 +390,8 @@ bool float32_is_signaling_nan(float32 a_, float_status *status)
 static int pickNaN(FloatClass a_cls, FloatClass b_cls,
                    bool aIsLargerSignificand, float_status *status)
 {
-#if defined(TARGET_ARM) || defined(TARGET_MIPS) || defined(TARGET_HPPA)
+#if defined(TARGET_ARM) || defined(TARGET_MIPS) || defined(TARGET_HPPA) || \
+    defined(TARGET_S390X)
     /* ARM mandated NaN propagation rules (see FPProcessNaNs()), take
      * the first of:
      *  1. A if it is signaling
-- 
2.35.3


