Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492C844B45D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 21:57:54 +0100 (CET)
Received: from localhost ([::1]:42166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkYBl-0003OF-0v
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 15:57:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1mkYAL-0002de-PF; Tue, 09 Nov 2021 15:56:25 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8938
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1mkYAK-0005bP-3K; Tue, 09 Nov 2021 15:56:25 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A9JCS5x025140; 
 Tue, 9 Nov 2021 20:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=36LvLjmRaCROleePEe9QVyFoBmeFJm0x8qwWmnVRANU=;
 b=ThtwLJrB/zs4rNcRr4SWerS11+BHAy3eGbZFzUPOubt6cdq2eZXuSw7mz2w4u9C+UeSY
 u6J1dCLAbZTqE30bW6wdPrrUiqJAo4O9t83V+I2sn9Iad+iyXwSCFRD6qtTEVpsnTeeh
 jOaTO2XJWhjb+/grpec4/05mqSHQ5YMc6vLhF3pFe6vjnfLXhuNg6SjK57NX+aOGM4nZ
 /ZipKQ8/WrWJUf4l9LgYFj/or289iEfUaExNOPhSQNHpbdSzJHaDvt5o7FZ9Y8/LY8Ye
 4/ZwwN1tUFJqQf+ifId1p4U1sHt79vH7c5NCrtoS+I3hw3Tp1Ae5OcWKtVdWqpapTjII bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c7xxh1vbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 20:56:21 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A9KsKxB020630;
 Tue, 9 Nov 2021 20:56:21 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c7xxh1vbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 20:56:21 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A9KRqbI013272;
 Tue, 9 Nov 2021 20:56:20 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 3c5hbbky24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 20:56:20 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A9KuE5Z52822374
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Nov 2021 20:56:14 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53CA4C6059;
 Tue,  9 Nov 2021 20:56:14 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B839FC6055;
 Tue,  9 Nov 2021 20:56:12 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.160.104.209])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  9 Nov 2021 20:56:12 +0000 (GMT)
From: Collin Walling <walling@linux.ibm.com>
To: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3] s390: kvm: adjust diag318 resets to retain data
Date: Tue,  9 Nov 2021 15:56:02 -0500
Message-Id: <20211109205602.99732-1-walling@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MnDWtpNRhdnnm9POoNbHlMLPaJPWXRbn
X-Proofpoint-ORIG-GUID: 1FDJ3Zj6B24n-dhIdj5xrknyHUyQ181Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_06,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111090114
Received-SPF: pass client-ip=148.163.158.5; envelope-from=walling@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: borntraeger@de.ibm.com, thuth@redhat.com, cohuck@redhat.com,
 frankja@linux.ibm.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The CPNC portion of the diag 318 data is erroneously reset during an
initial CPU reset caused by SIGP. Let's go ahead and relocate the
diag318_info field within the CPUS390XState struct such that it is
only zeroed during a clear reset. This way, the CPNC will be retained
for each VCPU in the configuration after the diag 318 instruction
has been invoked.

Signed-off-by: Collin Walling <walling@linux.ibm.com>
Fixes: fabdada9357b ("s390: guest support for diagnose 0x318")
Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
---

Changelog:

    v2
    - handler uses run_on_cpu again
    - reworded commit message slightly
    - added fixes and reported-by tags 

    v3
    - nixed code reduction changes
    - added a comment to diag318 handler to briefly describe
        when relevent data is zeroed

---
 target/s390x/cpu.h     | 4 ++--
 target/s390x/kvm/kvm.c | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 3153d053e9..88aace36ff 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -63,6 +63,8 @@ struct CPUS390XState {
     uint64_t etoken;       /* etoken */
     uint64_t etoken_extension; /* etoken extension */
 
+    uint64_t diag318_info;
+
     /* Fields up to this point are not cleared by initial CPU reset */
     struct {} start_initial_reset_fields;
 
@@ -118,8 +120,6 @@ struct CPUS390XState {
     uint16_t external_call_addr;
     DECLARE_BITMAP(emergency_signals, S390_MAX_CPUS);
 
-    uint64_t diag318_info;
-
 #if !defined(CONFIG_USER_ONLY)
     uint64_t tlb_fill_tec;   /* translation exception code during tlb_fill */
     int tlb_fill_exc;        /* exception number seen during tlb_fill */
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 5b1fdb55c4..6acf14d5ec 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -1585,6 +1585,10 @@ void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info)
         env->diag318_info = diag318_info;
         cs->kvm_run->s.regs.diag318 = diag318_info;
         cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
+        /*
+         * diag 318 info is zeroed during a clear reset and
+         * diag 308 IPL subcodes.
+         */
     }
 }
 
-- 
2.31.1


