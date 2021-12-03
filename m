Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE82C467967
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 15:29:55 +0100 (CET)
Received: from localhost ([::1]:59866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt9ZS-0008JC-PU
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 09:29:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mt9X1-00063f-34; Fri, 03 Dec 2021 09:27:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17604
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mt9Wz-0004qM-KT; Fri, 03 Dec 2021 09:27:22 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B3EGFUg021331; 
 Fri, 3 Dec 2021 14:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FSe53jcr2pk93Bec1tV+i+NljgCR+Rp3qKK4rLPX5ZE=;
 b=VSQBLssUqOFP0WOZvJL6wgjPNqyQqIiBkctirupRdBDKMKcNd7Wm0QdkCs0maBi6smn2
 PdF3pPT9AbYGOj8snGljiKE71R+JZMI529F+Dd6sxWxf5GccaUYZXAQbu+ExN+wtTo5E
 +moNsrkhOCK8P6tj/UZahTls03DehD0DUX8s+2/0AvTDbARoc9MsL0gVNXN/rUTuZ37D
 imFAZLhNMePuX6HOhjKSI3xzrZMArgINqiMzyi/CzyctP7u6rtXlvuGgGbXE0kjDSEtt
 2RM+eUC80bsZpopW0RW6xyJgkbao5tXPl3JznJntw6nOBqVC63k5pIiz+rvKzoaI/ED4 Kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cqmuu88nq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 14:27:20 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B3EGTtI022303;
 Fri, 3 Dec 2021 14:27:19 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cqmuu88nd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 14:27:19 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B3ENTDu029439;
 Fri, 3 Dec 2021 14:27:18 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 3cnne410eh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 14:27:18 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B3ERGBL58655096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Dec 2021 14:27:16 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B07BB6E05B;
 Fri,  3 Dec 2021 14:27:16 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D33C6E058;
 Fri,  3 Dec 2021 14:27:15 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.96.25])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  3 Dec 2021 14:27:15 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: thuth@redhat.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] s390x/pci: use the passthrough measurement update
 interval
Date: Fri,  3 Dec 2021 09:27:05 -0500
Message-Id: <20211203142706.427279-4-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211203142706.427279-1-mjrosato@linux.ibm.com>
References: <20211203142706.427279-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZHbgr-gEq2WlJLJPn_3QyDJCCU6P2rNl
X-Proofpoint-GUID: RS4zYSAIgNyIIlW8Ck7BrYM86iSzTRN7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-03_07,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112030088
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: farman@linux.ibm.com, pmorel@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We may have gotten a measurement update interval from the underlying host
via vfio -- Use it to set the interval via which we update the function
measurement block.

Fixes: 28dc86a072 ("s390x/pci: use a PCI Group structure")
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-inst.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 11b7f6bfa1..07bab85ce5 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -1046,7 +1046,7 @@ static void fmb_update(void *opaque)
                       sizeof(pbdev->fmb.last_update))) {
         return;
     }
-    timer_mod(pbdev->fmb_timer, t + DEFAULT_MUI);
+    timer_mod(pbdev->fmb_timer, t + pbdev->pci_group->zpci_group.mui);
 }
 
 int mpcifc_service_call(S390CPU *cpu, uint8_t r1, uint64_t fiba, uint8_t ar,
@@ -1204,7 +1204,8 @@ int mpcifc_service_call(S390CPU *cpu, uint8_t r1, uint64_t fiba, uint8_t ar,
         }
         pbdev->fmb_addr = fmb_addr;
         timer_mod(pbdev->fmb_timer,
-                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + DEFAULT_MUI);
+                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
+                                    pbdev->pci_group->zpci_group.mui);
         break;
     }
     default:
-- 
2.27.0


