Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603864F19AE
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 20:20:52 +0200 (CEST)
Received: from localhost ([::1]:57950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbRJp-0002bO-5l
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 14:20:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1nbRGo-0008QK-7H; Mon, 04 Apr 2022 14:17:42 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46864
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1nbRGm-0007EB-8S; Mon, 04 Apr 2022 14:17:41 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 234IGLiL006983; 
 Mon, 4 Apr 2022 18:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=OYabZZp08I1QTdtDp03ttMh8P1V1SW0jsRIhPssyvmo=;
 b=aO50AskQaFwjXgpJNBgcPAP6Y8AWrsUUKdoskBXVC3DxsSvQSQHSB3tr04fB3fx7TMd4
 MJjdSne/25OpJ0wUu5Kgcgft7Z6LnDlOSZ9yJp1vCp4LOvPMDGO08X0wigpptrwvnGgZ
 abX+fGQ/GCbz/dCW2gJ0AnyWbikeLSlpJhCCNndX/hAobncVVbV2Xj3gJQQQ4RwHCQpV
 nRxGHRKd72g9CdLjtwAtBKtFxT0KaaSp27RFiu2AqUYYGvRSqYq2UmfL6uF5kZgF50d9
 0T65CLuHM1uXv8UA2y1StECVQfhETYOHIvyKlHg0j6WX0o3L0gNonlfisbLiu1tWQ5fv rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f85tc00k4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Apr 2022 18:17:36 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 234IHaNR013900;
 Mon, 4 Apr 2022 18:17:36 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f85tc00jv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Apr 2022 18:17:36 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 234IGvBk017612;
 Mon, 4 Apr 2022 18:17:35 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 3f6tyrwgcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Apr 2022 18:17:35 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 234IHZUA25362932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Apr 2022 18:17:35 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8C45AE05F;
 Mon,  4 Apr 2022 18:17:34 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61744AE060;
 Mon,  4 Apr 2022 18:17:31 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.32.125]) by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  4 Apr 2022 18:17:31 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v5 0/9] s390x/pci: zPCI interpretation support 
Date: Mon,  4 Apr 2022 14:17:17 -0400
Message-Id: <20220404181726.60291-1-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: t8xDadePG4dZ43Ps2cH6icsX54vEr03z
X-Proofpoint-ORIG-GUID: BW_lHs7ZslFjlHjosWs_OLbVDEmw-AHl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-04_06,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 clxscore=1011
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204040103
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, pmorel@linux.ibm.com,
 schnelle@linux.ibm.com, cohuck@redhat.com, richard.henderson@linaro.org,
 thuth@redhat.com, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 alex.williamson@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 david@redhat.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For QEMU, the majority of the work in enabling instruction interpretation       
is handled via SHM bit settings (to indicate to firmware whether or not
interpretive execution facilities are to be used) + a new KVM ioctl is
used to setup firmware-interpreted forwarding of Adapter Event
Notifications.                                        
                                                                                
This series also adds a new, optional 'interpret' parameter to zpci which       
can be used to disable interpretation support (interpret=off) as well as        
an 'forwarding_assist' parameter to determine whether or not the firmware       
assist will be used for adapter event delivery (default when
interpretation is in use) or whether the host will be responsible for
delivering all adapter event notifications (forwarding_assist=off).
                                                                                
The ZPCI_INTERP CPU feature is added beginning with the z14 model to            
enable this support.                                                            
                                                                                
As a consequence of implementing zPCI interpretation, ISM devices now           
become eligible for passthrough (but only when zPCI interpretation is           
available).                                                                     
                                                                                
From the perspective of guest configuration, you passthrough zPCI devices       
in the same manner as before, with intepretation support being used by          
default if available in kernel+qemu.                                            

Will reply with a link to the associated kernel series.                                                                                
                       
Changelog v4->v5:
- Update to match latest interface from kernel code.  Major changes are:
  1) we no longer issue any ioctls to set a device to interpreted mode;
  rather, this will be done automatically if supported by the host kernel
  at the time the vfio group is associated with the KVM.  Then, the SHM
  bit setting will indicate whether or not interpretation is actually
  used.
  2) the RPCIT enhancments (IOMMU changes) are removed from this series,
  so the code associated with indicating a desired IOMMU are also
  removed.  With this series s390x-pci will continue to use only type1
  IOMMU for now.
- Refresh the linux headers sync.  Added a patch to tolerate some vfio
  uapi renames that will happen in 5.18 (this can be discarded if there
  is something else underway to address this)

Matthew Rosato (9):
  Update linux headers
  vfio: tolerate migration protocol v1 uapi renames
  target/s390x: add zpci-interp to cpu models
  s390x/pci: add routine to get host function handle from CLP info
  s390x/pci: enable for load/store intepretation
  s390x/pci: don't fence interpreted devices without MSI-X
  s390x/pci: enable adapter event notification for interpreted devices
  s390x/pci: let intercept devices have separate PCI groups
  s390x/pci: reflect proper maxstbl for groups of interpreted devices

 hw/s390x/meson.build                          |   1 +
 hw/s390x/s390-pci-bus.c                       | 107 ++++-
 hw/s390x/s390-pci-inst.c                      |  52 ++-
 hw/s390x/s390-pci-kvm.c                       |  51 +++
 hw/s390x/s390-pci-vfio.c                      | 129 +++++-
 hw/s390x/s390-virtio-ccw.c                    |   1 +
 hw/vfio/common.c                              |   2 +-
 hw/vfio/migration.c                           |  19 +-
 include/hw/s390x/s390-pci-bus.h               |   8 +-
 include/hw/s390x/s390-pci-kvm.h               |  38 ++
 include/hw/s390x/s390-pci-vfio.h              |   6 +
 .../linux/input-event-codes.h                 |   4 +-
 .../standard-headers/linux/virtio_config.h    |   6 +
 .../standard-headers/linux/virtio_crypto.h    |  82 +++-
 linux-headers/asm-arm64/kvm.h                 |  16 +
 linux-headers/asm-generic/mman-common.h       |   2 +
 linux-headers/asm-mips/mman.h                 |   2 +
 linux-headers/asm-s390/kvm.h                  |   1 +
 linux-headers/linux/kvm.h                     |  50 ++-
 linux-headers/linux/psci.h                    |   4 +
 linux-headers/linux/userfaultfd.h             |   8 +-
 linux-headers/linux/vfio.h                    | 406 +++++++++---------
 linux-headers/linux/vfio_zdev.h               |   7 +
 linux-headers/linux/vhost.h                   |   7 +
 target/s390x/cpu_features_def.h.inc           |   1 +
 target/s390x/gen-features.c                   |   2 +
 target/s390x/kvm/kvm.c                        |   8 +
 target/s390x/kvm/kvm_s390x.h                  |   1 +
 28 files changed, 763 insertions(+), 258 deletions(-)
 create mode 100644 hw/s390x/s390-pci-kvm.c
 create mode 100644 include/hw/s390x/s390-pci-kvm.h

-- 
2.27.0


