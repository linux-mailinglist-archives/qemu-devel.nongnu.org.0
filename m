Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD21C6A4726
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 17:38:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWgVU-0002Bo-Fu; Mon, 27 Feb 2023 11:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1pWgVL-0001fH-QS; Mon, 27 Feb 2023 11:37:36 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1pWgVK-0005wz-0l; Mon, 27 Feb 2023 11:37:35 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RFx8j8016994; Mon, 27 Feb 2023 16:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2022-7-12; bh=D+fZBSHNS95JlBUPkZXChqL0XI8X8MPDGYglEQdUGRI=;
 b=HWE384/kzSh+KOX/7nap+Bpx25a4fCDQfshlv1wged+1KtOR73wctxH72MWv40LADbzL
 eq+O0H2IcZT1p74+Qyb0r1764GXpMxWuDJ+OPr2Uv62fqyrrFC5t3bR/Zp/8Uh1tIatx
 78X+oH1mR6xC0adyNRDC/Q5FBkBULFPeBmCWSn8GGUO0GeMMith5p2wACMH6BvymSp5E
 H+2d5PMqabcpeywZACtREWTXdn0Ve/VFngXO9ndjzjks5S9LuvWeH5XneTjy1Aibrmhy
 378dZ2eT5Qt68/SFtOwuItxqMHqOxYU9C1tNDJ+IBXxmwb6ZFSrbA90TMooutnulll5H KA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyb72c0u6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Feb 2023 16:37:23 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31RGQetb016004; Mon, 27 Feb 2023 16:37:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8s5sxtf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Feb 2023 16:37:23 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31RGbMkE006629;
 Mon, 27 Feb 2023 16:37:22 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-167-110.vpn.oracle.com
 [10.175.167.110])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3ny8s5sxr5-1; Mon, 27 Feb 2023 16:37:22 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Haibo Xu <haibo.xu@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Marc Zyngier <maz@kernel.org>
Cc: Miguel Luis <miguel.luis@oracle.com>
Subject: [RFC PATCH 0/5] QEMU v7.2.0 aarch64 Nested Virtualization Support
Date: Mon, 27 Feb 2023 15:37:13 -0100
Message-Id: <20230227163718.62003-1-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_13,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302270129
X-Proofpoint-ORIG-GUID: H0vZE8s1oEzHA38X_V8BddUN4dB3rB0P
X-Proofpoint-GUID: H0vZE8s1oEzHA38X_V8BddUN4dB3rB0P
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=miguel.luis@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This series adds ARMv8.3/8.4 nested virtualization support in KVM mode.
    
To enable nested virtualization for a guest, the host must expose EL2
support via QEMU command line switches:

-machine virt,accel=kvm,virtualization=on

Inspired on Haibo Xu's previous work [0][1], Marc Zyngier's kvmtool branch [2]
and kernel patches [3] on nested virtualization for aarch64, this has been
tested on an Ampere implementation.

This series adapts previous work on top of v7.2.0, it considers comments given
at the time and preserves authorship of the original patches.

[0]: https://lore.kernel.org/qemu-devel/cover.1616052889.git.haibo.xu@linaro.org/
[1]: https://lore.kernel.org/qemu-devel/cover.1617281290.git.haibo.xu@linaro.org/
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/maz/kvmtool.git/log/?h=arm64/nv-5.16
[3]: https://lore.kernel.org/linux-arm-kernel/20230131092504.2880505-1-maz@kernel.org/

Miguel Luis (5):
  linux-headers: [kvm,arm64] add the necessary definitions to match host
    kernel
  hw/intc/gicv3: add support for setting KVM vGIC maintenance IRQ
  target/arm/kvm: add helper to detect EL2 when using KVM
  target/arm: enable feature ARM_FEATURE_EL2 if EL2 is supported
  arm/virt: provide virtualization extensions to the guest

 hw/arm/virt.c                      |  8 +++++++-
 hw/intc/arm_gicv3_common.c         |  1 +
 hw/intc/arm_gicv3_kvm.c            | 25 +++++++++++++++++++++++++
 include/hw/intc/arm_gicv3_common.h |  1 +
 linux-headers/asm-arm64/kvm.h      |  2 ++
 linux-headers/linux/kvm.h          |  1 +
 target/arm/cpu.h                   |  2 +-
 target/arm/kvm64.c                 | 21 +++++++++++++++++++++
 target/arm/kvm_arm.h               | 12 ++++++++++++
 9 files changed, 71 insertions(+), 2 deletions(-)

-- 
2.39.2


