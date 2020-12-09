Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BA12D4C34
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 21:51:23 +0100 (CET)
Received: from localhost ([::1]:39154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn6Qk-0001Z5-3r
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 15:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kn6Ar-0000A3-2r; Wed, 09 Dec 2020 15:34:57 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kn6Ah-0005mS-Sg; Wed, 09 Dec 2020 15:34:56 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B9KXA4l054550; Wed, 9 Dec 2020 15:34:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=zn7ZGBitJeFUzjDGrufwAFAf9ljcF73kT/P4wovcUsM=;
 b=WnUxjADTzQhqpKcvLZtJcmsr5FMcZEblKLATJ5VyVubP4DKXXLEI+EmmDiUlr51h/5Eb
 AZYDCtAHkcThQUef2Vq4QrUtY3xhgzfrZQmiUvhjOQqlAa3t0v//jQxOcEtDfclQqeMn
 jPWOHh/Y670uRfxV35VduuB1G/nL1lv/jRHwyPzBceE5fzFflifTYELr+eayKL7zCSy3
 QZcobnG73IrQV93xyB2Gn8+UBzjd+Ed0Oaqu2iMuzVcQPMJKtw19vtf0XabpbqgLGV9H
 sHbw8J4vgxlvyynljltKYPuhnGEzFoMqBvav2eu8OjBmq7eArugRMHLf0pukVe8jjVMr fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35avp1q4ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 15:34:36 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B9KXH4Y055104;
 Wed, 9 Dec 2020 15:34:34 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35avp1q4e0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 15:34:34 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B9KSVuE020319;
 Wed, 9 Dec 2020 20:34:32 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 3581u9j9r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 20:34:32 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B9KYWSA3343052
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 20:34:32 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 056B4124054;
 Wed,  9 Dec 2020 20:34:32 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 769A2124052;
 Wed,  9 Dec 2020 20:34:29 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.163.37.122])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  9 Dec 2020 20:34:29 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: cohuck@redhat.com, thuth@redhat.com
Subject: [RFC 0/8] s390x/pci: Fixing s390 vfio-pci ISM support
Date: Wed,  9 Dec 2020 15:34:18 -0500
Message-Id: <1607546066-2240-1-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_16:2020-12-09,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=2 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 mlxlogscore=918 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090143
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: pmorel@linux.ibm.com, david@redhat.com, schnelle@linux.ibm.com,
 richard.henderson@linaro.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Today, ISM devices are completely disallowed for vfio-pci passthrough as
QEMU rejects the device due to an (inappropriate) MSI-X check.  Removing
this fence, however, reveals additional deficiencies in the s390x PCI
interception layer that prevent ISM devices from working correctly.
Namely, ISM block write operations have particular requirements in regards
to the alignment, size and order of writes performed that cannot be
guaranteed when breaking up write operations through the typical
vfio_pci_bar_rw paths. Furthermore, ISM requires that legacy/non-MIO
s390 PCI instructions are used, which is also not guaranteed when the I/O
is passed through the typical userspace channels.

This patchset provides a set of fixes related to enabling ISM device
passthrough and includes patches to enable use of a new vfio region that
will allow s390x PCI pass-through devices to perform s390 PCI instructions
in such a way that the same instruction issued on the guest is re-issued
on the host.

The region is intended for use with ISM devices specifically, as they do
not implement MSI-X and thus transferring I/O in this manner will not
interfere with vfio-pci MSI-X masking.  If someone can think of a good way
to also make this MSI-X compatible (and thus usable by other device types
besides ISM), I'm open to suggestions...

Associated kernel patchset:
https://lkml.org/lkml/2020/12/9/1059

Matthew Rosato (8):
  linux-headers: update against 5.10-rc7
  s390x/pci: MSI-X isn't strictly required for passthrough
  s390x/pci: fix pcistb length
  s390x/pci: Introduce the ZpciOps structure
  s390x/pci: Fix memory_region_access_valid call
  s390x/pci: Handle devices that support relaxed alignment
  s390x/pci: PCISTB via the vfio zPCI I/O region
  s390x/pci: PCILG via the vfio zPCI I/O region

 hw/s390x/s390-pci-bus.c                            |  32 ++-
 hw/s390x/s390-pci-inst.c                           | 289 ++++++++++++++-------
 hw/s390x/s390-pci-vfio.c                           | 164 ++++++++++++
 include/hw/s390x/s390-pci-bus.h                    |  24 ++
 include/hw/s390x/s390-pci-clp.h                    |   1 +
 include/hw/s390x/s390-pci-inst.h                   |   3 +
 include/hw/s390x/s390-pci-vfio.h                   |  23 ++
 include/standard-headers/asm-x86/kvm_para.h        |   1 +
 .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.h        |   2 +-
 include/standard-headers/linux/vhost_types.h       |   9 +
 linux-headers/linux/vfio.h                         |   4 +
 linux-headers/linux/vfio_zdev.h                    |  33 +++
 linux-headers/linux/vhost.h                        |   4 +
 13 files changed, 486 insertions(+), 103 deletions(-)

-- 
1.8.3.1


