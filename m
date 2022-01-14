Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E4948F1A5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 21:47:18 +0100 (CET)
Received: from localhost ([::1]:43620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8TTi-0000ei-1A
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 15:47:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1n8TLp-0004SH-7q; Fri, 14 Jan 2022 15:39:09 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1n8TLm-00057h-3I; Fri, 14 Jan 2022 15:39:08 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20EJvpM2017506; 
 Fri, 14 Jan 2022 20:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=1iQ5P5txPvuJR9ya+vTLrfN+PIPqiw6VN7RJnObuOF8=;
 b=HasTMkt4/sspCh09qYDLSONrRSysNjF7t0JXUhxE2ww0ekEas5BGbQifwnauPwDTgXM9
 1WqV4sujM3u1HcOC32i/14FaiqhRdMRp6gBa1ge08sMs8IzBbNFf1oh1bJdzOLlR1jbe
 f9f+uLBvIy/KTqnPVUG8NqJhcC3tc0GW3DVbY10oCf0bKEtStGBffXQOsuWsK5+n+Sch
 rehQaCFq2QcB8b5dPa9FtTaOVC+cPK2I9AE9l8yf9hRs0BNxezayhW0zYlU96EDA/tnJ
 IJ4RS358k7hnlRXW/zWsoPnf46dSaozatLIm5C698q2T/+4UrQkRVOXmj7xADns2JzZ/ +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dkfsvgpp2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 20:38:57 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20EKMFvl006540;
 Fri, 14 Jan 2022 20:38:57 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dkfsvgpnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 20:38:57 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20EKLr8c027865;
 Fri, 14 Jan 2022 20:38:55 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma05wdc.us.ibm.com with ESMTP id 3df28cyj26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 20:38:55 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20EKcsJS26411510
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jan 2022 20:38:54 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A72FC605F;
 Fri, 14 Jan 2022 20:38:54 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09502C6057;
 Fri, 14 Jan 2022 20:38:52 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.65.142])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 14 Jan 2022 20:38:52 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v2 0/9] s390x/pci: zPCI interpretation support
Date: Fri, 14 Jan 2022 15:38:40 -0500
Message-Id: <20220114203849.243657-1-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Yz1z78IqfFMh9kUVHCo9eJZ4v7JbHAAn
X-Proofpoint-GUID: Q5k42dAKHx9PDrLl-BU-6kv7StBOOirD
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_06,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201140120
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, pmorel@linux.ibm.com,
 schnelle@linux.ibm.com, cohuck@redhat.com, richard.henderson@linaro.org,
 thuth@redhat.com, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 alex.williamson@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 david@redhat.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For QEMU, the majority of the work in enabling instruction interpretation
is handled via new VFIO ioctls to SET the appropriate interpretation and
interrupt forwarding modes, and to GET the function handle to use for
interpretive execution.  

This series implements these new ioctls, as well as adding a new, optional
'intercept' parameter to zpci to request interpretation support not be used
as well as an 'intassist' parameter to determine whether or not the
firmware assist will be used for interrupt delivery or whether the host
will be responsible for delivering all interrupts.

The ZPCI_INTERP CPU feature is added beginning with the z14 model to
enable this support.

As a consequence of implementing zPCI interpretation, ISM devices now
become eligible for passthrough (but only when zPCI interpretation is
available).

From the perspective of guest configuration, you passthrough zPCI devices
in the same manner as before, with intepretation support being used by
default if available in kernel+qemu.

Associated kernel series:
https://lore.kernel.org/kvm/20220114203145.242984-1-mjrosato@linux.ibm.com/

Changes v1->v2:

- Update kernel headers sync                                                    
- Drop some pre-req patches that are now merged                                 
- Add some R-bs (Thanks!)                                                       
- fence FEAT_ZPCI_INTERP for QEMU 6.2 and older (Christian)                     
- switch from container_of to VFIO_PCI and drop asserts (Thomas)                
- re-arrange g_autofree so we malloc at time of declaration (Thomas) 

Matthew Rosato (9):
  Update linux headers
  target/s390x: add zpci-interp to cpu models
  fixup: force interp off for QEMU machine 6.2 and older
  s390x/pci: enable for load/store intepretation
  s390x/pci: don't fence interpreted devices without MSI-X
  s390x/pci: enable adapter event notification for interpreted devices
  s390x/pci: use I/O Address Translation assist when interpreting
  s390x/pci: use dtsm provided from vfio capabilities for interpreted
    devices
  s390x/pci: let intercept devices have separate PCI groups

 hw/s390x/s390-pci-bus.c                       | 121 ++++++++++-
 hw/s390x/s390-pci-inst.c                      | 168 ++++++++++++++-
 hw/s390x/s390-pci-vfio.c                      | 204 +++++++++++++++++-
 hw/s390x/s390-virtio-ccw.c                    |   1 +
 include/hw/s390x/s390-pci-bus.h               |   8 +-
 include/hw/s390x/s390-pci-inst.h              |   2 +-
 include/hw/s390x/s390-pci-vfio.h              |  45 ++++
 include/standard-headers/asm-x86/kvm_para.h   |   1 +
 include/standard-headers/drm/drm_fourcc.h     |  11 +
 include/standard-headers/linux/ethtool.h      |   1 +
 include/standard-headers/linux/fuse.h         |  60 +++++-
 include/standard-headers/linux/pci_regs.h     |   4 +
 include/standard-headers/linux/virtio_iommu.h |   8 +-
 linux-headers/asm-mips/unistd_n32.h           |   1 +
 linux-headers/asm-mips/unistd_n64.h           |   1 +
 linux-headers/asm-mips/unistd_o32.h           |   1 +
 linux-headers/asm-powerpc/unistd_32.h         |   1 +
 linux-headers/asm-powerpc/unistd_64.h         |   1 +
 linux-headers/asm-s390/kvm.h                  |   1 +
 linux-headers/asm-s390/unistd_32.h            |   1 +
 linux-headers/asm-s390/unistd_64.h            |   1 +
 linux-headers/linux/kvm.h                     |   1 +
 linux-headers/linux/vfio.h                    |  22 ++
 linux-headers/linux/vfio_zdev.h               |  51 +++++
 target/s390x/cpu_features_def.h.inc           |   1 +
 target/s390x/gen-features.c                   |   2 +
 target/s390x/kvm/kvm.c                        |   1 +
 27 files changed, 693 insertions(+), 27 deletions(-)

-- 
2.27.0


