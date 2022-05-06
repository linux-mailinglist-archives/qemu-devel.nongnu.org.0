Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEE651DC59
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 17:42:27 +0200 (CEST)
Received: from localhost ([::1]:49588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn066-0007fC-8I
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 11:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1nn03u-0004uL-Dp; Fri, 06 May 2022 11:40:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1nn03s-0007CI-Gp; Fri, 06 May 2022 11:40:10 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246FKuF4005826;
 Fri, 6 May 2022 15:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=jYlmolPUFontAfuGN6LGBCL56omGzc67y0IH6MPf38U=;
 b=e552tpsSQzNyUjcHuZDCL7KqNyiic5mY09AtsYal/6x5E/1BaS898M3zda1FN1V+CWcx
 qEl8lSN1yyKFuz/sH/hC611xWBRD88TTj6fwY3Gc4PcI3ARhCwLMdRSy0XE3sV/gjrH5
 7pyn2nbYMT99uipT9H120gTqTGgQ/q45H4HAK7MoPhkHU+mLRRIkDXII8Oe9KjDzIwSY
 Ni3kLCi98AyF+UH8oqIreCahtRTd7AP76FhB+Tk+tJOzPpJYm8Zh9WUp4ai90z6Pcb5w
 Zm0agkRrNZGycSbhk5RfVCYVvdUINQGCBlGDbdVqJLmRN7iSWO0qGvs5i5b+W5qQTDuE Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw6850cdn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 15:40:04 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 246FMmqB009441;
 Fri, 6 May 2022 15:40:04 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw6850ccw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 15:40:03 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 246FIhPL024183;
 Fri, 6 May 2022 15:40:02 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3fvg611gqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 15:40:02 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 246Fdwpd32178508
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 15:39:58 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4CDC11C052;
 Fri,  6 May 2022 15:39:58 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F1A911C050;
 Fri,  6 May 2022 15:39:58 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 15:39:58 +0000 (GMT)
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
To: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Halil Pasic <pasic@linux.ibm.com>
Cc: Janis Schoetterl-Glausch <scgl@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH 0/2] s390x: kvm: Honor storage keys during emulation
Date: Fri,  6 May 2022 17:39:54 +0200
Message-Id: <20220506153956.2217601-1-scgl@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Bl5zSTephpQp9Mq7Uf8jMYrkTG-0zCVl
X-Proofpoint-GUID: pgahNHDHOX1bJ3mo3MFUqDbF4IaspFI9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_04,2022-05-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205060082
Received-SPF: pass client-ip=148.163.158.5; envelope-from=scgl@linux.ibm.com;
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

Make use of the storage key support of the MEMOP ioctl, if available,
in order to support storage key checking during emulation.

I did not update all the headers, since that broke the build,
not sure what the best way of dealing with that is.

Janis Schoetterl-Glausch (2):
  Pull in MEMOP changes in linux-headers
  target/s390x: kvm: Honor storage keys during emulation

 linux-headers/linux/kvm.h | 11 +++++++++--
 target/s390x/kvm/kvm.c    |  9 +++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)


base-commit: 31abf61c4929a91275fe32f1fafe6e6b3e840b2a
-- 
2.32.0


