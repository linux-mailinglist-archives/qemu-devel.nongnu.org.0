Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 242CF4D8D6A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 20:52:31 +0100 (CET)
Received: from localhost ([::1]:39046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTqk1-0003aS-PP
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 15:52:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1nTqhI-0001A7-LM; Mon, 14 Mar 2022 15:49:43 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13740
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1nTqhG-00036I-Ko; Mon, 14 Mar 2022 15:49:40 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EJlVnM009010; 
 Mon, 14 Mar 2022 19:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=E/oDn7pQI5rqG2up5ajWc98ZO6oaWKVCXd3/R/OuNZE=;
 b=BB/LPeXt8f7hFOhS/JGaYBo5QP1+qdkN62gza+Bki6hzPolVbThHuautDt6tv1bBHgko
 uYtiJYvRO7jjFSr7evO+Qwc+ugiglG5Ni7NsB2541uQBDTOgqg0bnvW5zDvjeGMDgecq
 tOIzkpiumJqr97rktEhhijdRO2sNFHLXyRC//6IzSxa+x0KjYENdAKecsSljA+XQ/4gJ
 jZELdXj473/SOr93dKqZ1MwEmICqyhc9hUTkOvFdSmudCuq+J6+/NqcsvzhPDDed+P93
 WZbFBoz9eijohp9QcgyxwHuzMDAdaH2poOuNh4urp/M6GcamHHMTvdOM8sJVCG0awIpV FA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3et6d28p7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 19:49:31 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22EJnUfd015259;
 Mon, 14 Mar 2022 19:49:30 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3et6d28p7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 19:49:30 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22EJltfi010580;
 Mon, 14 Mar 2022 19:49:29 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 3erk594d8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 19:49:29 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22EJnSvN31129980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 19:49:28 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB464112070;
 Mon, 14 Mar 2022 19:49:27 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6CBA4112062;
 Mon, 14 Mar 2022 19:49:24 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.32.184]) by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 14 Mar 2022 19:49:24 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v4 00/11] s390x/pci: zPCI interpretation support 
Date: Mon, 14 Mar 2022 15:49:09 -0400
Message-Id: <20220314194920.58888-1-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0MtzxKiTTbBVD4dj6RLW9ZBVfNh6rpYk
X-Proofpoint-GUID: ezghJ_ay3XYxpsJF7OtUizH5_6NFLikC
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_13,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203140116
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
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
is handled via a new KVM ioctls to enable interpretation, interrupt             
forwarding and registration of the guest IOAT tables.  In order to make         
use of the KVM-managed IOMMU domain operations on the host, we also add         
some code to vfio to indicate that a given device wishes to register the        
alternate domain type for its group.                                            
                                                                                
This series also adds a new, optional 'interpret' parameter to zpci which       
can be used to disable interpretation support (interpret=off) as well as        
an 'forwarding_assist' parameter to determine whether or not the firmware       
assist will be used for interrupt delivery (default when interpretation         
is in use) or whether the host will be responsible for delivering all           
interrupts (forwarding_assist=off).                                             
                                                                                
The ZPCI_INTERP CPU feature is added beginning with the z14 model to            
enable this support.                                                            
                                                                                
As a consequence of implementing zPCI interpretation, ISM devices now           
become eligible for passthrough (but only when zPCI interpretation is           
available).                                                                     
                                                                                
From the perspective of guest configuration, you passthrough zPCI devices       
in the same manner as before, with intepretation support being used by          
default if available in kernel+qemu.                                            
                                                                                
Associated kernel series:                                                       
https://lore.kernel.org/kvm/20220314194451.58266-1-mjrosato@linux.ibm.com/

Changelog v3->v4                                                                
- Unfortunately I had to remove some Review tags because the userspace API      
  moved from vfio device feature ioctls to KVM ioctls in response to            
  feedback from the kernel series.  The vast majority of the QEMU logic         
  remains intact however, with most changes being to the way we issue           
  ioctls.                                                                       
- Additional logic was added to test for availability of the KVM ioctl,         
  this replaces the probe logic done for the vfio ioctls                        
- Add code to issue indicate on VFIO_SET_IOMMU that a KVM-managed IOMMU         
  domain is to be allocated.       

Matthew Rosato (11):
  Update linux headers
  vfio: handle KVM-owned IOMMU requests
  target/s390x: add zpci-interp to cpu models
  s390x/pci: add routine to get host function handle from CLP info
  s390x/pci: enable for load/store intepretation
  s390x/pci: don't fence interpreted devices without MSI-X
  s390x/pci: enable adapter event notification for interpreted devices
  s390x/pci: use KVM-managed IOMMU for interpretation
  s390x/pci: use I/O Address Translation assist when interpreting
  s390x/pci: use dtsm provided from vfio capabilities for interpreted
    devices
  s390x/pci: let intercept devices have separate PCI groups

 hw/s390x/meson.build                |   1 +
 hw/s390x/s390-pci-bus.c             | 125 ++++++++++++++++++++--
 hw/s390x/s390-pci-inst.c            | 136 +++++++++++++++++++++--
 hw/s390x/s390-pci-kvm.c             | 160 ++++++++++++++++++++++++++++
 hw/s390x/s390-pci-vfio.c            | 151 ++++++++++++++++++++++----
 hw/s390x/s390-virtio-ccw.c          |   1 +
 hw/vfio/ap.c                        |   2 +-
 hw/vfio/ccw.c                       |   2 +-
 hw/vfio/common.c                    |  26 ++++-
 hw/vfio/pci.c                       |   3 +-
 hw/vfio/pci.h                       |   1 +
 hw/vfio/platform.c                  |   2 +-
 include/hw/s390x/s390-pci-bus.h     |   8 +-
 include/hw/s390x/s390-pci-inst.h    |   2 +-
 include/hw/s390x/s390-pci-kvm.h     |  68 ++++++++++++
 include/hw/s390x/s390-pci-vfio.h    |  11 ++
 include/hw/vfio/vfio-common.h       |   4 +-
 linux-headers/asm-s390/kvm.h        |   1 +
 linux-headers/asm-x86/kvm.h         |   3 +
 linux-headers/linux/kvm.h           |  51 ++++++++-
 linux-headers/linux/vfio.h          |   6 ++
 linux-headers/linux/vfio_zdev.h     |   6 ++
 target/s390x/cpu_features_def.h.inc |   1 +
 target/s390x/gen-features.c         |   2 +
 target/s390x/kvm/kvm.c              |   8 ++
 target/s390x/kvm/kvm_s390x.h        |   1 +
 26 files changed, 731 insertions(+), 51 deletions(-)
 create mode 100644 hw/s390x/s390-pci-kvm.c
 create mode 100644 include/hw/s390x/s390-pci-kvm.h

-- 
2.27.0


