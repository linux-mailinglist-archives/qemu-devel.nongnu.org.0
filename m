Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3685FC95E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 18:36:26 +0200 (CEST)
Received: from localhost ([::1]:59290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oieiY-0005t8-1R
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 12:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oieUH-000439-MN; Wed, 12 Oct 2022 12:21:41 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:27870
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oieUE-0008Bb-7n; Wed, 12 Oct 2022 12:21:40 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CFgYur029910;
 Wed, 12 Oct 2022 16:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=moA1gCy37REtfKB/2j3iph073OJSB/WRw4KqLefFtlA=;
 b=BMrzsbXX5xVD6Dgcya0MrD5jmBK79D95hQ/pQXsILW7KjQ3xWN5+/FA/ggdPO5IiWTeZ
 5dAE0VaGELpozrdK+gYbmodis6HNG/UsFqaTTTBvC3cEPqaaKZrwjUwHTBFVY6tzYZL6
 SSIn4MqKw+RAN4HkzcVFvtzcYO7W9NNSCd7M7qxavro6pLtkw07MqlZRmBv74+yY+6bc
 x3WPUOX+QJH91SGaCpWWbJFCIVAvp4qrly4sp43nHSrZt7n+nEzBAU+Sq8bLipfRa2vd
 EKhHz9HxZlmfTRzUluL7t3jN2ZucjYvCDot3Maj/5cxgZnropCzWaufTTUhVHMNa9kiP yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k607x9chf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 16:21:26 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29CFhvkL001429;
 Wed, 12 Oct 2022 16:21:26 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k607x9cg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 16:21:26 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29CGLOXH011388;
 Wed, 12 Oct 2022 16:21:24 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 3k30fj4r5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 16:21:24 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29CGLK8k918114
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Oct 2022 16:21:20 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEA01A405B;
 Wed, 12 Oct 2022 16:21:20 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD5F0A4054;
 Wed, 12 Oct 2022 16:21:19 +0000 (GMT)
Received: from li-c6ac47cc-293c-11b2-a85c-d421c8e4747b.ibm.com.com (unknown
 [9.171.34.168])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Oct 2022 16:21:19 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
Subject: [PATCH v10 8/9] s390x/cpu_topology: activating CPU topology
Date: Wed, 12 Oct 2022 18:21:06 +0200
Message-Id: <20221012162107.91734-9-pmorel@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221012162107.91734-1-pmorel@linux.ibm.com>
References: <20221012162107.91734-1-pmorel@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vqO1hFMRS3oj_TsBpxFipL0YG-Le1OIc
X-Proofpoint-ORIG-GUID: r2pM5GLrFCTCR6sMK9taVKRQnVZDyoOP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_07,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=868
 spamscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120106
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The KVM capability, KVM_CAP_S390_CPU_TOPOLOGY is used to
activate the S390_FEAT_CONFIGURATION_TOPOLOGY feature and
the topology facility for the guest in the case the topology
is available in QEMU and in KVM.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 target/s390x/kvm/kvm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 49a99931a4..1c4e24c9a7 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -2464,6 +2464,22 @@ void kvm_s390_get_host_cpu_model(S390CPUModel *model, Error **errp)
         set_bit(S390_FEAT_UNPACK, model->features);
     }
 
+    /*
+     * If we have the CPU Topology allowed in QEMU and
+     * implemented in KVM, activate the CPU TOPOLOGY feature.
+     */
+    if (s390_has_topology()) {
+        if (!kvm_check_extension(kvm_state, KVM_CAP_S390_CPU_TOPOLOGY)) {
+            error_setg(errp, "KVM: S390 topology not present in kernel");
+            return;
+        }
+        if (kvm_vm_enable_cap(kvm_state, KVM_CAP_S390_CPU_TOPOLOGY, 0) < 0) {
+            error_setg(errp, "KVM: Error enabling KVM_CAP_S390_CPU_TOPOLOGY");
+            return;
+        }
+        set_bit(S390_FEAT_CONFIGURATION_TOPOLOGY, model->features);
+    }
+
     /* We emulate a zPCI bus and AEN, therefore we don't need HW support */
     set_bit(S390_FEAT_ZPCI, model->features);
     set_bit(S390_FEAT_ADAPTER_EVENT_NOTIFICATION, model->features);
-- 
2.31.1


