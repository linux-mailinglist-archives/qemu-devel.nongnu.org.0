Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68C1362477
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 17:53:05 +0200 (CEST)
Received: from localhost ([::1]:56304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXQmG-00053E-Ux
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 11:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lXQjA-00033s-8O; Fri, 16 Apr 2021 11:49:52 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:64850
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lXQj8-000085-GT; Fri, 16 Apr 2021 11:49:51 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13GFY0ia065465; Fri, 16 Apr 2021 11:49:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=noW5sQQCRmg+yeWGQnejM9mslGtD7xpsjveru2Pctc0=;
 b=cg8F/jysqjSbb7PeucDArGIptbmlBdPtiYacJHiGdbWcrii1qyricN9B+iszb47TJ8+j
 HUPRtTo+hqI3E0mxTbqxkWMiopaxW1rk5OatWaR6QiuvJ154K3IbX/ccbIpIjretUkbA
 gqYvbFTpA7i++fapDAmqheuxTjfGZu5Ok1OWtBCXi5ZllB9fUyDPXWUzbv8MSgzk3xDN
 F/MNkejimUHMD/FvG/FmLUA01SbFctYYS8teEKU6vlTM29xR1uYQyUygFFrk7v8ttYR4
 9tffG3VdQX7nQQZL9P2LevtPSlVk8g8W05fg5gSAp4mnCTNhSG2+qoqYC1zQgTa9mRDs Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37xxnpq9rc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 11:49:48 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13GFYUHM067985;
 Fri, 16 Apr 2021 11:49:48 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37xxnpq9qv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 11:49:48 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13GFcoDE014255;
 Fri, 16 Apr 2021 15:49:46 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 37u3n8af7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 15:49:46 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13GFnhiW23462286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 15:49:43 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B4E711C04C;
 Fri, 16 Apr 2021 15:49:43 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C00111C050;
 Fri, 16 Apr 2021 15:49:42 +0000 (GMT)
Received: from vm.lan (unknown [9.145.157.105])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Apr 2021 15:49:42 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v5 2/4] target/arm: Make sure that commpage's tb->size != 0
Date: Fri, 16 Apr 2021 17:49:37 +0200
Message-Id: <20210416154939.32404-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210416154939.32404-1-iii@linux.ibm.com>
References: <20210416154939.32404-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vmJfguCAx6tIG_ESjfhEJnw66f8i9uXT
X-Proofpoint-ORIG-GUID: QpSuOqeBSt0GW49ex5au31BXOt4bM06M
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-16_08:2021-04-16,
 2021-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104160113
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tb_gen_code() assumes that tb->size must never be zero, otherwise it
may produce spurious exceptions. For ARM this may happen when creating
a translation block for the commpage.

Fix by pretending that commpage translation blocks have at least one
instruction.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/arm/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 62b1c2081b..cb9e30c341 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9060,6 +9060,7 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     unsigned int insn;
 
     if (arm_pre_translate_insn(dc)) {
+        dc->base.pc_next += 4;
         return;
     }
 
@@ -9129,6 +9130,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     bool is_16bit;
 
     if (arm_pre_translate_insn(dc)) {
+        dc->base.pc_next += 2;
         return;
     }
 
-- 
2.29.2


