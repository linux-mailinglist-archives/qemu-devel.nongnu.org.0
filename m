Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FD758FA52
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 11:59:09 +0200 (CEST)
Received: from localhost ([::1]:51628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM4y3-0006Mc-ND
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 05:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oM4uy-0002Ak-HB; Thu, 11 Aug 2022 05:55:56 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oM4uw-0002fo-GD; Thu, 11 Aug 2022 05:55:56 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27B82H70003823;
 Thu, 11 Aug 2022 09:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+JAO3hReEkzoOoRBeJnKndQpD4pR/meFfm3qaYPkoH8=;
 b=a4oMepT9iwaGEzc2FrX5kVyi2qCF7XOUQlKnGSRpc7mqGjdLyMClJf+kaHNHlmAIczSg
 Prn7XOcLv77CP485+aWuSps7cg26tdE7h9+VkYrZccLLCtRNc4pCC0QJW3uWMtuRiC03
 /NWNUBrXqwHJ5LoAtW16+r830P21X1ESOZMFBZj/++elMTmqKQsZP+7uZuMx77F09Mbf
 oxvIVQtCKSj7/lWsYr2onjBXlfnePyFql4TFRQQuiDsXklDSx1zAJ5iixvomRdfh3rf8
 9HqYwZrlWh+4IaLyfF9BqR9HiNVundgL8mTTFYlDGnuQfyixDP0uXSskAgO+/kin9d0N 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvuggq9ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 09:55:44 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27B9jH8c023063;
 Thu, 11 Aug 2022 09:55:43 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvuggq9d5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 09:55:43 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27B9pARm022084;
 Thu, 11 Aug 2022 09:55:40 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3huwvfsda5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 09:55:40 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 27B9tsAN31850996
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 09:55:54 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F18BAA404D;
 Thu, 11 Aug 2022 09:55:36 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 559FEA4040;
 Thu, 11 Aug 2022 09:55:36 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.43.253])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Aug 2022 09:55:36 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 2/5] accel/tcg: Introduce is_same_page()
Date: Thu, 11 Aug 2022 11:55:31 +0200
Message-Id: <20220811095534.241224-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220811095534.241224-1-iii@linux.ibm.com>
References: <20220811095534.241224-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 376dmWGanya0-5Ihw8W2cqLUElyKrjxm
X-Proofpoint-GUID: 39QD_ek-qN3_LlWe0J0y1Ohi3A4pd3__
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110027
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a function that checks whether a given address is on the same
page as where disassembly started. Having it improves readability of
the following patches.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 include/exec/translator.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 7db6845535..d27f8c33b6 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -187,4 +187,14 @@ FOR_EACH_TRANSLATOR_LD(GEN_TRANSLATOR_LD)
 
 #undef GEN_TRANSLATOR_LD
 
+/*
+ * Return whether addr is on the same page as where disassembly started.
+ * Translators can use this to enforce the rule that only single-insn
+ * translation blocks are allowed to cross page boundaries.
+ */
+static inline bool is_same_page(DisasContextBase *db, target_ulong addr)
+{
+    return ((addr ^ db->pc_first) & TARGET_PAGE_MASK) == 0;
+}
+
 #endif /* EXEC__TRANSLATOR_H */
-- 
2.37.1


