Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073A5511C3F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 18:11:52 +0200 (CEST)
Received: from localhost ([::1]:52586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njkGd-0007C1-5b
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 12:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1njk7i-0007qz-9l; Wed, 27 Apr 2022 12:02:38 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4572
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1njk7g-0005eA-Nb; Wed, 27 Apr 2022 12:02:38 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23RFDrFd014412;
 Wed, 27 Apr 2022 16:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=wfOzrIyEs4dZO3/bl9ywnVw45MPD6RMBCax56OEzEyE=;
 b=bwopNV1flBaAHzfdmLdTe/7xUfFtR3ckWbVeCID9AEJSaLyZASQXLpEk88bRCh25Fw3q
 qMhaX+dhs5rA2/UcDR75hvoU4IH9hEWYVCEsMwOIkqhKUCV+T5JZguqD5XZkvr/7a93w
 wbh1qsZMctopdnhQKb6GPwNEv6/F0yzNV5El6PDviLAf4ZLtfCpSCgigfyc4iOiQiV1w
 YUw1LXR6maUAnWc1q8YiXAjprAr0NiaSz2/t/UgLSiGImU5SBiGqBOF2RVgqsdCeiD3L
 rpoC6Sgl4sst8F2X+rHj++09V/kQxYEay8BNcfMO3WgPlhR1iNRSbdL8Ug9OZXKifybm Vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fpv88eujm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Apr 2022 16:02:29 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23RG0aKG014480;
 Wed, 27 Apr 2022 16:02:28 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fpv88euj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Apr 2022 16:02:28 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23RFwlOE030744;
 Wed, 27 Apr 2022 16:02:26 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3fm938x80u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Apr 2022 16:02:26 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 23RG2bK58782388
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 16:02:37 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FA56AE053;
 Wed, 27 Apr 2022 16:02:24 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDF52AE051;
 Wed, 27 Apr 2022 16:02:23 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.145.79.152])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Apr 2022 16:02:23 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 0/2] ppc/xive: Update for guest interrupt handling
Date: Wed, 27 Apr 2022 18:02:21 +0200
Message-Id: <20220427160223.96758-1-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: b7R5axrMvNIe5O1PqENRDmMX0ibWnsdt
X-Proofpoint-ORIG-GUID: zU-P5vIajOotw5j_Yda7x871bu6wcT_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-27_04,2022-04-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=659 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204270098
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


Frederic Barrat (2):
  ppc/xive: Always recompute the PIPR when pushing an OS context
  ppc/xive: Update the state of the External interrupt signal

 hw/intc/xive.c        | 24 +++++++++++++++++++++---
 hw/intc/xive2.c       | 17 ++++++++++-------
 include/hw/ppc/xive.h |  1 +
 3 files changed, 32 insertions(+), 10 deletions(-)

-- 
2.35.1


