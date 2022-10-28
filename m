Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33307611B33
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 21:50:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooVM6-0000Wh-HZ; Fri, 28 Oct 2022 15:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1ooVLa-0008FR-36; Fri, 28 Oct 2022 15:48:54 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1ooVLY-000843-Dr; Fri, 28 Oct 2022 15:48:53 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SIuJSE027356;
 Fri, 28 Oct 2022 19:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=XNvoOo6WgVxygJU/UvsiTPFbURHHC07eRLaGZgtK/U8=;
 b=fJQqt2oufCcokNhtWtCFNoLSODRFkShAq9vxlIxoMTJs0bRZEnfbaT0fxVPsTSH2W8wV
 Ns6POpB7DS9imqhs5BL1TkZeYK/E/qRP9yRRw9aiXvGL3SfD5EoA2tOgoyhyI+WtuHSP
 wutkPwqqX+sufFvIYl1ZDY3EEjCr2vABtvv87ozNFOSCH0uW7+1qqOsmk9hXfpS80fqt
 Qd9L3C1qs+qCniSWl6ydd6ZQTykg0CW7tK/CJFBu4w3Ag5bxOr2xk+dZEcfxt0sr/h1R
 Vn8TnAhpJ3pqXdT4FtSPBt56XnM4oYvnr8m1lKyJQn8TPeag1T6/bHZSIUg3nSTTiCnA jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgmstshxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 19:48:02 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29SIwfcj006505;
 Fri, 28 Oct 2022 19:48:02 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgmstshxe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 19:48:02 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29SJaMQ5019924;
 Fri, 28 Oct 2022 19:48:01 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 3kfahep1xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 19:48:01 +0000
Received: from smtpav03.dal12v.mail.ibm.com ([9.208.128.129])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29SJm1P939125332
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Oct 2022 19:48:01 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 224255805A;
 Fri, 28 Oct 2022 19:48:00 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C660258061;
 Fri, 28 Oct 2022 19:47:58 +0000 (GMT)
Received: from li-2311da4c-2e09-11b2-a85c-c003041e9174.ibm.com.com (unknown
 [9.160.93.208]) by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 28 Oct 2022 19:47:58 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: farman@linux.ibm.com, pmorel@linux.ibm.com, schnelle@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com, richard.henderson@linaro.org,
 david@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 0/3] s390x/pci: rpcit fixes and enhancements
Date: Fri, 28 Oct 2022 15:47:55 -0400
Message-Id: <20221028194758.204007-1-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9447ehudvRE1FEhCJvsW6aN3GqgCISy9
X-Proofpoint-ORIG-GUID: pADOGe2AhebqaKE_-atAi57Gqneq796u
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_10,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 mlxlogscore=875 mlxscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280123
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following series fixes an issue with guest RPCIT processing discovered
during development of [1] as well as proposes a few additional optimizations
to the current RPCIT codepath.

[1] https://lore.kernel.org/linux-s390/20221019144435.369902-1-schnelle@linux.ibm.com/

Matthew Rosato (3):
  s390x/pci: RPCIT second pass when mappings exhausted
  s390x/pci: coalesce unmap operations
  s390x/pci: shrink DMA aperture to be bound by vfio DMA limit

 hw/s390x/s390-pci-inst.c        | 80 ++++++++++++++++++++++++++++++---
 hw/s390x/s390-pci-vfio.c        | 11 +++++
 include/hw/s390x/s390-pci-bus.h |  1 +
 3 files changed, 85 insertions(+), 7 deletions(-)

-- 
2.37.3


