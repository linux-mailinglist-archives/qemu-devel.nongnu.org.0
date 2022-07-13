Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8B757373E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 15:19:42 +0200 (CEST)
Received: from localhost ([::1]:40130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBcHF-0002nE-HM
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 09:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oBc57-0008P8-MJ; Wed, 13 Jul 2022 09:07:09 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oBc55-0006CI-US; Wed, 13 Jul 2022 09:07:09 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DCp8R7038422;
 Wed, 13 Jul 2022 13:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=RGeqen2EXOUIsFRz1ZKBaQ7Hh1ptEfTdRJe9Qo/hIEE=;
 b=b5ji2ucD6IaqZYPz3jVY8KNv6iYRPGVb3l4CHPnFxBGTAZNkF3cixNw679g8yUycsYAW
 4olpPFdxBpYLw5WZDLDRcc8ML0i6koXtWf7YBYrN02ijtXmEKWaqU5eVFsN3/uLm1xSB
 /y7XX0Od8BSd2eyiZm7oS6VBC0CELg9bM5eENu2792St5PdJZc8wxBVI1d/ptD48dNpf
 bXEKOXN/4KVWwwaEZGlBbclPt6jyfU+BPQWgNayjyRX8kb1J2V6GEVBpq/WWaApd9Czh
 sUlEQmZwXBzaLEgQygs/L1r4DX4EKwHnNpCqujNATi/xVr/Gvhy2dKCWhXpTWxwP0RBy Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9xdx0d7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:07:05 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26DCqRdm040585;
 Wed, 13 Jul 2022 13:07:05 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9xdx0d3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:07:05 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26DCpFst029997;
 Wed, 13 Jul 2022 13:06:49 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 3h71a8mybp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:06:49 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26DD6uvp30015960
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jul 2022 13:06:56 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED089AE053;
 Wed, 13 Jul 2022 13:06:45 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD28CAE04D;
 Wed, 13 Jul 2022 13:06:44 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 13 Jul 2022 13:06:44 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 richard.henderson@linaro.org
Subject: [PATCH v2 00/11] dump: Add arch section and s390x PV dump
Date: Wed, 13 Jul 2022 13:03:11 +0000
Message-Id: <20220713130322.25517-1-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7ArfIx94dtTNp_h7OG3dvwGTyfjFeNUZ
X-Proofpoint-GUID: fA6tZpsAgH1duSk7pvtUT7axgcdQY5ES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-13_01,2022-07-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=665 mlxscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207130053
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previously this series was two separate series:
 * Arch section support
   Adds the possibility for arch code to add custom section data.

 * s390 PV dump support
   Adds PV dump data to the custom arch sections.

I've chosen to merge them so it's easier to understand why the arch
section support has been implement the way it is.

Additionally I've added a cleanup patch beforehand which cleans up the
GuestPhysBlock usage.

v2:
	* Added "dump: Cleanup memblock usage"
	* Fixed whitespace problems and review comments
	* Added missing *errp check in dump_end


Janosch Frank (11):
  dump: Cleanup memblock usage
  dump: Allocate header
  dump: Split write of section headers and data and add a prepare step
  dump: Reorder struct DumpState
  dump/dump: Add section string table support
  dump/dump: Add arch section support
  linux header sync
  s390x: Add protected dump cap
  s390x: Introduce PV query interface
  s390x: Add KVM PV dump interface
  s390x: pv: Add dump support

 dump/dump.c                  | 443 ++++++++++++++++++++++-------------
 hw/s390x/pv.c                | 112 +++++++++
 hw/s390x/s390-virtio-ccw.c   |   5 +
 include/elf.h                |   1 +
 include/hw/s390x/pv.h        |  18 ++
 include/sysemu/dump-arch.h   |  27 +++
 include/sysemu/dump.h        |  70 +++++-
 linux-headers/linux/kvm.h    |  55 +++++
 target/s390x/arch_dump.c     | 248 +++++++++++++++++---
 target/s390x/kvm/kvm.c       |   7 +
 target/s390x/kvm/kvm_s390x.h |   1 +
 11 files changed, 780 insertions(+), 207 deletions(-)

-- 
2.34.1


