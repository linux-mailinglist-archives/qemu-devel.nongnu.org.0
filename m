Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD383ABF62
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 01:29:25 +0200 (CEST)
Received: from localhost ([::1]:45628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu1Rs-0007jl-Gw
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 19:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lu1OQ-0000fy-N0; Thu, 17 Jun 2021 19:25:50 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40842
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lu1ON-0007XD-OF; Thu, 17 Jun 2021 19:25:50 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HNFX4h153449; Thu, 17 Jun 2021 19:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=dcat5K6tJpvtVMmMJOYUfaWFCTrRmJayE7fwD2pgXYY=;
 b=BG0HzTZhKFE6tkWgOrE3s8Fv5iQzzr06JLbp2sgb9YrFHDzy1jTbbIVaGo/x3f3dGlaR
 xnN+VzagKS6d17KJNZMdZKChGzM/LqJ1kVNE8cvbyuMjXlpRFK9PjZRp/+5L/pU2nTgl
 Je2QKR+2ywp19L0HkHkFik87lgJXlIEH7pnPSLbL0dL9mL3pHSYpgeAIeTfqFcuiOjc1
 BS9UNbXn5c1VIr9ToSFEvnobNqJQLLfD00SEmXXDuSqkWe/3PJQdquZXLm5qO1UJMulq
 vl2NiBX6c3ICHXgFRAKSGSyadUBLdRmhaMnWyl/gVEycRjQ7zp4u+r3/t4y+BK+AqK3w og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 398fwag6w4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 19:25:44 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HNHJXF160692;
 Thu, 17 Jun 2021 19:25:43 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 398fwag6vp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 19:25:43 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HNPfh1005247;
 Thu, 17 Jun 2021 23:25:41 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 394mj91nb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 23:25:41 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HNPcbd20906346
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 23:25:38 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 797AB4C044;
 Thu, 17 Jun 2021 23:25:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6613C4C040;
 Thu, 17 Jun 2021 23:25:38 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 17 Jun 2021 23:25:38 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 2403BE0320; Fri, 18 Jun 2021 01:25:38 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH v4 0/4] s390x: Fix IRB sense data
Date: Fri, 18 Jun 2021 01:25:33 +0200
Message-Id: <20210617232537.1337506-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: N4CI5Nl1eSqz_vdq1yBmjtKzLc7pXBZ5
X-Proofpoint-GUID: 4WaLJmfQ48qxPRumBDOGrZJo9k3SZsw9
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_16:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170140
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Conny, et al,

Here is a quick update to the series for fixing passthrough
sense data in the irb, using a subchannel-specific callback.

As before, the first three patches are code refactoring.
Since patch 3 doesn't implement the callback for vfio-ccw
subchannels, it fixes the problem encountered with
"dasdfmt -M quick" failing to run correctly in the guest.
Since the callback isn't invoked for passthrough subchannels
the SCSW and ERW bits don't get set indicating sense data
is present, even though the sense data itself is still zero.

Patch 4 implements that for vfio-ccw.

v3->v4:
 - [CH] Rename ESW.sublog to ESW.word0
 - [CH] Add comment that ESW.f_addr and .s_addr are only Fmt0 ESW
 - [CH] Always copy ECW data into IRB to include mysterious
        "model-dependent information" that could exist there
 - [TH] Added r-b to patch 2 (thank you!!)

v2->v3:
 - [EF] Drop Fixes tag
 - [CH] Implement a callback for the IRB sense data
 - [CH] Copy IRB.ESW from passthrough hardware
 - [CH] Only put sense in IRB.ECW if passthrough device did

v1->v2:
 - [MR] Add Fixes: tags
 - [CH] Reinstate the memcpy(sch->sense_data, irb.ecw) in vfio_ccw
 - [CH] Look at IRB.SCSW.E before copying sense into guest IRB

v3: https://lore.kernel.org/qemu-devel/20210616014749.2460133-1-farman@linux.ibm.com/
v2: https://lore.kernel.org/qemu-devel/20210611202151.615410-1-farman@linux.ibm.com/
v1: https://lore.kernel.org/qemu-devel/20210610202011.391029-1-farman@linux.ibm.com/

Eric Farman (4):
  s390x/css: Introduce an ESW struct
  s390x/css: Split out the IRB sense data
  s390x/css: Refactor IRB construction
  s390x/css: Add passthrough IRB

 hw/s390x/3270-ccw.c       |  1 +
 hw/s390x/css.c            | 87 ++++++++++++++++++++++++++++-----------
 hw/s390x/s390-ccw.c       |  1 +
 hw/s390x/virtio-ccw.c     |  1 +
 hw/vfio/ccw.c             |  4 ++
 include/hw/s390x/css.h    |  5 +++
 include/hw/s390x/ioinst.h | 12 +++++-
 7 files changed, 86 insertions(+), 25 deletions(-)

-- 
2.25.1


