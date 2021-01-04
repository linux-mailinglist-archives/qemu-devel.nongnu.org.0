Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FC92E9EC7
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 21:24:51 +0100 (CET)
Received: from localhost ([::1]:47468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwWPK-00026J-7s
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 15:24:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kwWLm-0000D6-WA; Mon, 04 Jan 2021 15:21:11 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:61510
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kwWLi-0004z5-MS; Mon, 04 Jan 2021 15:21:10 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 104K1Mwa168600; Mon, 4 Jan 2021 15:21:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=9XV5DKYf7edzP8zi8fH5Pij+uwiMDDdg9J09KgrTriQ=;
 b=oZhOm48m3fyU5fjXnBBOgBhexDnTkwJ0hS8KKhLEK/M1Y72mZFMhHCWXmHEASCxMj4aF
 6TEY+Q9YK6Nn/Kc5v+jm0f9WDJRewQbtDsKZC215xH/3YNuag2DNaeDwxMrKPjHLcTZM
 qPUcNpQ/rmz+ZYo2QemCcIT6ctdWvfHYC4GTzOrJ+TEQDfwzwO5Ey5+ug/vaqybz003y
 EPXjm+euIffIBEGAbX2UfoKpsv7BpAICZ6TsNeuobLJqUXjt3jpFrcBzz0nBE4HQ7A3V
 QK8Rdu6awwLH2mhNW29ROR56GDrGttAPcYDiUhH9/cOz62cOPWR7ZjoFKpUtvis5Uf7y CA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35v9e80sk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 15:21:04 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 104K6ZoO000673;
 Mon, 4 Jan 2021 15:21:03 -0500
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35v9e80sjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 15:21:03 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 104K8ATO012704;
 Mon, 4 Jan 2021 20:21:01 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 35tgf7s5fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 20:21:01 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 104KKxZ717170748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Jan 2021 20:20:59 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29272A4062;
 Mon,  4 Jan 2021 20:20:59 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14777A405C;
 Mon,  4 Jan 2021 20:20:59 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon,  4 Jan 2021 20:20:59 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id B3680E02A6; Mon,  4 Jan 2021 21:20:58 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 0/3] vfio-ccw: Implement request notifier
Date: Mon,  4 Jan 2021 21:20:54 +0100
Message-Id: <20210104202057.48048-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-04_12:2021-01-04,
 2021-01-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 clxscore=1011 mlxlogscore=999 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101040123
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: qemu-s390x@nongnu.org, Eric Farman <farman@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Conny, et al,

Here is an updated (final?) version of the QEMU series for the vfio-ccw
request notifier now that the kernel code landed upstream [1]. The actual
meat (patch 3) is identical to its counterpart in v2 [2].

Earlier versions didn't use update-linux-headers.sh; they just carried a
dummy patch with the define that was needed to work, without the noise.
Here, I have run the script properly and patch 2 is its output.

Of course it wasn't that simple, as a change on the kernel side of
things breaks the script and causes processing to end prematurely as
cp_portable() takes its error exit. So I am adding a small patch to
the front of this series to accommodate that, and hopefully isn't
goofed up too badly. :)

[1] https://lore.kernel.org/kvm/20201216123701.00517b52@omen.home/
[2] https://lore.kernel.org/qemu-devel/20201120181526.96446-1-farman@linux.ibm.com/

Eric Farman (3):
  update-linux-headers: Include const.h
  Update linux headers to 5.11-rc2
  vfio-ccw: Connect the device request notifier

 hw/vfio/ccw.c                                 |  40 +++-
 .../infiniband/hw/vmw_pvrdma/pvrdma_ring.h    |  14 +-
 .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.h   |   2 +-
 include/standard-headers/drm/drm_fourcc.h     | 175 +++++++++++++++++-
 include/standard-headers/linux/const.h        |  36 ++++
 include/standard-headers/linux/ethtool.h      |   2 +-
 include/standard-headers/linux/fuse.h         |  30 ++-
 include/standard-headers/linux/kernel.h       |   9 +-
 include/standard-headers/linux/pci_regs.h     |  16 ++
 include/standard-headers/linux/vhost_types.h  |   9 +
 include/standard-headers/linux/virtio_gpu.h   |  82 ++++++++
 include/standard-headers/linux/virtio_ids.h   |  44 +++--
 linux-headers/asm-arm64/kvm.h                 |   3 -
 linux-headers/asm-generic/unistd.h            |   6 +-
 linux-headers/asm-mips/unistd_n32.h           |   1 +
 linux-headers/asm-mips/unistd_n64.h           |   1 +
 linux-headers/asm-mips/unistd_o32.h           |   1 +
 linux-headers/asm-powerpc/unistd_32.h         |   1 +
 linux-headers/asm-powerpc/unistd_64.h         |   1 +
 linux-headers/asm-s390/unistd_32.h            |   1 +
 linux-headers/asm-s390/unistd_64.h            |   1 +
 linux-headers/asm-x86/kvm.h                   |   1 +
 linux-headers/asm-x86/unistd_32.h             |   1 +
 linux-headers/asm-x86/unistd_64.h             |   1 +
 linux-headers/asm-x86/unistd_x32.h            |   1 +
 linux-headers/linux/kvm.h                     |  56 +++++-
 linux-headers/linux/userfaultfd.h             |   9 +
 linux-headers/linux/vfio.h                    |   1 +
 linux-headers/linux/vhost.h                   |   4 +
 scripts/update-linux-headers.sh               |   5 +-
 30 files changed, 501 insertions(+), 53 deletions(-)
 create mode 100644 include/standard-headers/linux/const.h

-- 
2.17.1


