Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BAC3D2587
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 16:18:01 +0200 (CEST)
Received: from localhost ([::1]:42664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ZWS-0004kB-VG
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 10:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1m6ZTi-0002AC-Qq; Thu, 22 Jul 2021 10:15:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1m6ZTg-0007cB-Uk; Thu, 22 Jul 2021 10:15:10 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16ME5256077972; Thu, 22 Jul 2021 10:14:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=EZ3qMsyNLYW3ZgLVo62nuM9Q40DCpcO9WSAUUzSOMu0=;
 b=GhjOS4EregsSrHPYHNJte3DmtxIrxvjL+VYievses2q6pzZ78NQZVO3AqgDWMUJb5qkr
 nLmdJrfru0T9yDYWSx5+tyA2UDgh+3Lc36cFnT4HJQ/CoCdD+PzZ+oY4er+bRPj5U/oT
 G+fxnsYXeXM8J0Ha/SSGTdmIqAd9oEAMDx5YhMPDsp7r4q8zWdMmaD1tYMwOnNCotb37
 ZK2Z/mR26WP/X56P0bhyHFUDkEPCPz+4Gs23IKxrgZMa/260S4EJ0ZUv9cvUWGd2LDBC
 /X7koWVqh0HvEowfCkvRtoqixWT0O+lhebBLSUB5kpP+QhFfQHHnTxPpYAtiM3dAXJKP pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39y82e4htf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 10:14:48 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16ME5voH081536;
 Thu, 22 Jul 2021 10:14:48 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39y82e4hst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 10:14:48 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16MEDk8H030246;
 Thu, 22 Jul 2021 14:14:47 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04wdc.us.ibm.com with ESMTP id 39upud95k3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 14:14:47 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16MEDkLB29753734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jul 2021 14:13:46 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7937D112067;
 Thu, 22 Jul 2021 14:13:46 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD845112064;
 Thu, 22 Jul 2021 14:13:44 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.86.55])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 22 Jul 2021 14:13:44 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] kvm: ppc: Print meaningful message on KVM_CREATE_VM failure
Date: Thu, 22 Jul 2021 11:13:40 -0300
Message-Id: <20210722141340.2367905-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 13Ic_BOIujxzGL7HirtVU9HwG0W3logT
X-Proofpoint-ORIG-GUID: V_YB7ndNYOzIgHAOb6tncdtzFpfpwYTG
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-22_07:2021-07-22,
 2021-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107220095
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-ppc@nongnu.org, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PowerPC has two KVM types (HV, PR) that translate into three kernel
modules:

kvm.ko - common kvm code
kvm_hv.ko - kvm running with MSR_HV=1 or MSR_HV|PR=0 in a nested guest.
kvm_pr.ko - kvm running in usermode MSR_PR=1.

Since the two KVM types can both be running at the same time, this
creates a situation in which it is possible for one or both of the
modules to fail to initialize, leaving the generic one behind. This
leads QEMU to think it can create a guest, but KVM will fail when
calling the type-specific code:

 ioctl(KVM_CREATE_VM) failed: 22 Invalid argument
 qemu-kvm: failed to initialize KVM: Invalid argument

Ideally this would be solved kernel-side, but it might be a while
until we can get rid of one of the modules. So in the meantime this
patch tries to make this less confusing for the end user by adding a
more elucidative message:

 ioctl(KVM_CREATE_VM) failed: 22 Invalid argument
 PPC KVM module is not loaded. Try 'modprobe kvm_hv'.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 accel/kvm/kvm-all.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 3bd17135ce..4d9a7c7bfc 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2397,6 +2397,12 @@ static int kvm_init(MachineState *ms)
                     "- for kernels supporting the vm.allocate_pgste sysctl, "
                     "whether it is enabled\n");
         }
+#elif TARGET_PPC
+        if (ret == -EINVAL) {
+            fprintf(stderr,
+                    "PPC KVM module is not loaded. Try modprobe kvm_%s.\n",
+                    (type == 2) ? "pr" : "hv");
+        }
 #endif
         goto err;
     }
-- 
2.29.2


