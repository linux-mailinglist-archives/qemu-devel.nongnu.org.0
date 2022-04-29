Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B928514346
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 09:27:06 +0200 (CEST)
Received: from localhost ([::1]:57138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkL1t-0003gp-J9
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 03:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nkKri-0003K0-0I; Fri, 29 Apr 2022 03:16:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nkKrf-0001ky-8D; Fri, 29 Apr 2022 03:16:32 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23T7DqwL004141;
 Fri, 29 Apr 2022 07:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=Z9uNj7hJbx2gbLmGmJvHsMQbQDsf+BLeyWWaloX5ZCg=;
 b=KdJiooCjG8EApbgMWDswgP2sNrdRn4v029ULBAjJNrY4OtY0rqNkq/4+DhiaeMQFemZO
 yJ/fWqC59Heo93s41F6i4AFBTNmiFFCYknzEJKGcx+w6hqhUN/Xxj9WL8awDYE8urcmW
 MO+LDj8vg1+qQtRS0BusO51h2zPKnXVWr1MCVN85VWBgeiDGM3ot0GKs6vtLm15UkMWV
 BLrz2nxZXt9EOfDmV+JXmQbzpUnJ6Lv+hXnSQJJu9BZT3tR6v/KY8GrtIHvemvh9b7XX
 vLXPDAaQW7hbj3NKwdVEHwH6h1e5nIbuaveXDWQxLdAOuklWepOEpwqWQzWUIifHsw/0 cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3frbeq80xc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 07:16:25 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23T7GPIK009385;
 Fri, 29 Apr 2022 07:16:25 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3frbeq80wx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 07:16:25 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23T77C64010073;
 Fri, 29 Apr 2022 07:16:22 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3fm9390n71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 07:16:22 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 23T73CWY53608878
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Apr 2022 07:03:12 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A209511C050;
 Fri, 29 Apr 2022 07:16:20 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61A1411C04C;
 Fri, 29 Apr 2022 07:16:20 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.145.32.10])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 Apr 2022 07:16:20 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] ppc/xive: Update for guest interrupt handling
Date: Fri, 29 Apr 2022 09:16:18 +0200
Message-Id: <20220429071620.177142-1-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iix43Fldh8UgPTILpsr_MMlQEcaiWLDj
X-Proofpoint-ORIG-GUID: V-id7P4fuj5IrA1JBNOX--B2bw0d4N3q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-29_05,2022-04-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=627 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204290039
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: npiggin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This short series fixes a couple of issues about interrupt handling
found when running a KVM guest on the powernv9 and powernv10 models. I
split a patch I previously sent.

Changlog:
v2:
 - update comment on patch 1
 - picked up Cedric's reviewed-by on patch 2

Frederic Barrat (2):
  ppc/xive: Always recompute the PIPR when pushing an OS context
  ppc/xive: Update the state of the External interrupt signal

 hw/intc/xive.c        | 25 ++++++++++++++++++++++---
 hw/intc/xive2.c       | 18 +++++++++++-------
 include/hw/ppc/xive.h |  1 +
 3 files changed, 34 insertions(+), 10 deletions(-)

-- 
2.35.1


