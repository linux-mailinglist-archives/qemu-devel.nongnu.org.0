Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 495492CEA00
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 09:39:40 +0100 (CET)
Received: from localhost ([::1]:52980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl6ct-00063Q-BT
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 03:39:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1kl6bs-0005Mz-FL; Fri, 04 Dec 2020 03:38:36 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1kl6bq-0007Tn-96; Fri, 04 Dec 2020 03:38:36 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B48bYFM096160; Fri, 4 Dec 2020 03:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Cjtl++h0WfXrEGWQe15v5skawZc6E8eGLYLOchlj4jc=;
 b=Fuj7L6W/oP33DVb327m6D6xicRuUUkNhi90eIGyzFKdIW9i5KavaiXitog3sANciu74b
 34qL9johQtMhziTFPZ62wr+E0tgD0oj5w9NyI1xngpmY1S0VbPSlotxSSg0lVehAr1z3
 6ATUOQa96O7cOW/FH7vM8jMV/keH3WxMzWo2vUGm4zQiGEe2jT3qliQfXmjAygAbl0Rc
 0TQ6P+brtu6n4EdNpD2/mDvH0k9NJi6D4BPOv1bTntWqmHgJXTMLUXSAzyfkjyWZh4sg
 uU0kqC1tueKJmlK2Kma8wfaWP1scBXhGNCD3OCivL3Hw3z8v7ecCwmOanSgBsgXmMTln ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357742xvdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 03:38:30 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B48bdbe096329;
 Fri, 4 Dec 2020 03:38:29 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357742xvc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 03:38:29 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B48bOum032228;
 Fri, 4 Dec 2020 08:38:23 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 353e688xyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 08:38:23 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B48b6M519071420
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 08:37:06 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98D124C05C;
 Fri,  4 Dec 2020 08:37:06 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0893C4C046;
 Fri,  4 Dec 2020 08:37:06 +0000 (GMT)
Received: from linux01.pok.stglabs.ibm.com (unknown [9.114.17.81])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  4 Dec 2020 08:37:05 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] s390x: pv: Fence additional unavailable SCLP facilities for
 PV guests
Date: Fri,  4 Dec 2020 03:36:55 -0500
Message-Id: <20201204083655.27946-1-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_02:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040047
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's no VSIE support for a protected guest, so let's better not
advertise it and its support facilities.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
CI:
https://gitlab.com/frankja/qemu/-/pipelines/224881703
---
 target/s390x/cpu_features.c | 38 ++++++++++++++++++++++++++++++++++++-
 target/s390x/cpu_models.c   | 24 +++++++++++++++++++++--
 2 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/target/s390x/cpu_features.c b/target/s390x/cpu_features.c
index 42fe0bf4ca..7d7ea8e3b8 100644
--- a/target/s390x/cpu_features.c
+++ b/target/s390x/cpu_features.c
@@ -107,8 +107,44 @@ void s390_fill_feat_block(const S390FeatBitmap features, S390FeatType type,
         feat = find_next_bit(features, S390_FEAT_MAX, feat + 1);
     }
 
-    if (type == S390_FEAT_TYPE_SCLP_FAC134 && s390_is_pv()) {
+    if (!s390_is_pv()) {
+        return;
+    }
+
+    /*
+     * Some facilities are not available for CPUs in protected mode:
+     * - All SIE facilities because SIE is not available
+     * - DIAG318
+     *
+     * As VMs can move in and out of protected mode the CPU model
+     * doesn't protect us from that problem because it is only
+     * validated at the start of the VM.
+     */
+    switch (type) {
+    case S390_FEAT_TYPE_SCLP_CPU:
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_F2)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_SKEY)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_GPERE)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_SIIF)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_SIGPIF)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_IB)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_CEI)->bit, data);
+        break;
+    case S390_FEAT_TYPE_SCLP_CONF_CHAR:
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_KSS)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_GSLS)->bit, data);
+        break;
+    case S390_FEAT_TYPE_SCLP_CONF_CHAR_EXT:
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_64BSCAO)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_CMMA)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_PFMFI)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_IBS)->bit, data);
+        break;
+    case S390_FEAT_TYPE_SCLP_FAC134:
         clear_be_bit(s390_feat_def(S390_FEAT_DIAG_318)->bit, data);
+        break;
+    default:
+        return;
     }
 }
 
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index b5abff8bef..51feb71546 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -239,8 +239,28 @@ bool s390_has_feat(S390Feat feat)
         }
         return 0;
     }
-    if (feat == S390_FEAT_DIAG_318 && s390_is_pv()) {
-        return false;
+
+    if (s390_is_pv()) {
+        switch (feat) {
+        case S390_FEAT_DIAG_318:
+        case S390_FEAT_SIE_F2:
+        case S390_FEAT_SIE_SKEY:
+        case S390_FEAT_SIE_GPERE:
+        case S390_FEAT_SIE_SIIF:
+        case S390_FEAT_SIE_SIGPIF:
+        case S390_FEAT_SIE_IB:
+        case S390_FEAT_SIE_CEI:
+        case S390_FEAT_SIE_KSS:
+        case S390_FEAT_SIE_GSLS:
+        case S390_FEAT_SIE_64BSCAO:
+        case S390_FEAT_SIE_CMMA:
+        case S390_FEAT_SIE_PFMFI:
+        case S390_FEAT_SIE_IBS:
+            return false;
+            break;
+        default:
+            break;
+        }
     }
     return test_bit(feat, cpu->model->features);
 }
-- 
2.25.1


