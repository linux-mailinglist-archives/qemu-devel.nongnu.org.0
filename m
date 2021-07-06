Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DB43BCF63
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 13:28:34 +0200 (CEST)
Received: from localhost ([::1]:39122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0jFh-0002Rj-RU
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 07:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1m0jCE-0005Ku-TG; Tue, 06 Jul 2021 07:24:59 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:64816
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1m0jCB-00019C-Kh; Tue, 06 Jul 2021 07:24:58 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166BE7GW011901; Tue, 6 Jul 2021 07:24:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=nZy+4KL6klvt+8FqSTQtkWQanqPL1uesbVAaPufgDgQ=;
 b=AAY8vr6s0shWPXKqCz3q5aQhy2c2Pl7JVqMibayE0LNl1eMu6sXhkkUrskFysWHaiR1N
 IHEkXLnrKYKGXr1zLeI6J6u5Sv+d8rfQx7w9GBHxExGhM6APzNhn14s23DGMli3NAvqA
 GW9/52+a09fQegQ4PkV9QGQ9r/o0zlARY2CdxNexaqbJFRfoUSUaUzeBaNIdxISdoLwo
 XGJY5aCjZP+88k6xbZQqo33rNOfeS1EhOPg5XLN/ydchuL6LpRCLJDftwjBOaK2e8i34
 +MYjv8yB9AGv2fStR8AFCqtjUs/KkUOucXLaYWF4bD51OGGQ9R4OgVmBkL3NKKPAAaKE CA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39m8xstf96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jul 2021 07:24:49 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 166BKZOw021384;
 Tue, 6 Jul 2021 11:24:48 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 39jfh88ncb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jul 2021 11:24:48 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 166BOjWU31457738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Jul 2021 11:24:45 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0C694204B;
 Tue,  6 Jul 2021 11:24:45 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8E4242041;
 Tue,  6 Jul 2021 11:24:44 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.34.138])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Jul 2021 11:24:44 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/2] Enable support for H_RPT_INVALIDATE hcall
Date: Tue,  6 Jul 2021 16:54:38 +0530
Message-Id: <20210706112440.1449562-1-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tG6obsEOjajzdt51TIyMb5zJaG4tqFxk
X-Proofpoint-GUID: tG6obsEOjajzdt51TIyMb5zJaG4tqFxk
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-06_06:2021-07-02,
 2021-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 mlxlogscore=914 suspectscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060054
Received-SPF: pass client-ip=148.163.158.5; envelope-from=bharata@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: Bharata B Rao <bharata@linux.ibm.com>, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series enables the support for H_RPT_INVALIDATE hcall
which was added to upstream kernel recently.

It adds a new sPAPR machine capability cap-rpt-invalidate
and if it is set by the user, checks for the availability
of H_RPT_INVALIDATE hcall in the hypervisor (via
KVM_CAP_RPT_INVALIDATE KVM capability) and enables the same.

Headers update is needed for KVM_CAP_PPC_RPT_INVALIDATE.

v0: https://lore.kernel.org/qemu-devel/20210106085910.2200795-1-bharata@linux.ibm.com/

Bharata B Rao (2):
  linux-headers: Update
  target/ppc: Support for H_RPT_INVALIDATE hcall

 hw/ppc/spapr.c                                |   6 +
 hw/ppc/spapr_caps.c                           |  41 +++++++
 include/hw/ppc/spapr.h                        |   8 +-
 include/standard-headers/asm-x86/kvm_para.h   |  13 +++
 include/standard-headers/drm/drm_fourcc.h     |   7 ++
 include/standard-headers/linux/ethtool.h      |   4 +-
 .../linux/input-event-codes.h                 |   1 +
 include/standard-headers/linux/virtio_ids.h   |   2 +-
 include/standard-headers/linux/virtio_vsock.h |   9 ++
 linux-headers/asm-arm64/kvm.h                 |  11 ++
 linux-headers/asm-generic/mman-common.h       |   3 +
 linux-headers/asm-generic/unistd.h            |   4 +-
 linux-headers/asm-mips/mman.h                 |   3 +
 linux-headers/asm-mips/unistd_n32.h           |   1 +
 linux-headers/asm-mips/unistd_n64.h           |   1 +
 linux-headers/asm-mips/unistd_o32.h           |   1 +
 linux-headers/asm-powerpc/unistd_32.h         |   1 +
 linux-headers/asm-powerpc/unistd_64.h         |   1 +
 linux-headers/asm-s390/unistd_32.h            |   1 +
 linux-headers/asm-s390/unistd_64.h            |   1 +
 linux-headers/asm-x86/kvm.h                   |  13 +++
 linux-headers/asm-x86/unistd_32.h             |   7 +-
 linux-headers/asm-x86/unistd_64.h             |   7 +-
 linux-headers/asm-x86/unistd_x32.h            |   7 +-
 linux-headers/linux/kvm.h                     | 105 ++++++++++++++++++
 linux-headers/linux/userfaultfd.h             |  11 +-
 target/ppc/kvm.c                              |  12 ++
 target/ppc/kvm_ppc.h                          |  12 ++
 28 files changed, 274 insertions(+), 19 deletions(-)

-- 
2.31.1


