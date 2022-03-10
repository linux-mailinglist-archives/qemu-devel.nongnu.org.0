Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BC14D45A7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:29:59 +0100 (CET)
Received: from localhost ([::1]:60320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGzV-000740-KI
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:29:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGw3-0003yw-Kz; Thu, 10 Mar 2022 06:26:23 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:10262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGw1-0007ct-KE; Thu, 10 Mar 2022 06:26:23 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AAXs2K024300; 
 Thu, 10 Mar 2022 11:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=URf9PMiC+AukI7D6kiPgAODIiUiW7zKGtVFeuMhhzpo=;
 b=fZrXDXdBHsPgAecl2uc38qd+ASdLC1G9DkoGwMYbv65P9WydTOzMu4CPUW9mL1hsk8BZ
 RrT7B8RriM6B8mXqEUAnq0TaHdAnk/ACZGhxE9d+4slORRiYzUY9B9HmaZhEmfPx2s08
 5sQC3N/HcSD1w5ooD04nOGiYZvsty2MZGc8MSM53xlPg2/mw8kYX8AbcSV7i0p6OaZkm
 2MTxMV1chPvb3ehD43rE3nNrKlV32ni4IckxNvwXhoMJT7tgDMXaiWiX5ipHSc2yUOiT
 REtOBrBF5+4aADJW/3A5HN2i/YyUwaA8EQ84gwSm73h4yvBMQSHMMnvYY1s6dGl+3uZv ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eny19sexb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:26:19 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22AAepaq016240;
 Thu, 10 Mar 2022 11:26:19 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eny19sevs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:26:19 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22ABEkKi007746;
 Thu, 10 Mar 2022 11:26:16 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3enpk2x5rb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:26:16 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22ABQDCE33096082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 11:26:13 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC29542045;
 Thu, 10 Mar 2022 11:26:12 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF6CD42041;
 Thu, 10 Mar 2022 11:26:11 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Mar 2022 11:26:11 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] s390x: dump: Add PV dump support
Date: Thu, 10 Mar 2022 11:25:42 +0000
Message-Id: <20220310112547.3823-1-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kAK73JWV3zOx3hqG20VbPDtbo1GB4P3W
X-Proofpoint-ORIG-GUID: tvylx7Is0Py6CtKUnvRrmGLxVtnaH_o9
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxlogscore=640 phishscore=0 mlxscore=0 spamscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100059
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: thuth@redhat.com, borntraeger@linux.ibm.com, cohuck@redhat.com,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org, mhartmay@linux.ibm.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the qemu part of the PV dump support where we take the data
that the KVM PV dump API gives us and put it into the ELF file for
later processing.

The encrypted PV cpu state is added as an additional note like the
other architecture registers.

The storage state and completion data however are put into their own
sections. The storage state data provides one part of the puzzle
needed to decrypt the memory and the completion data contains the
other part as well as a key derivation seed for the encrypted cpu data.

Based on:
https://lore.kernel.org/qemu-devel/20220310110854.2701-1-frankja@linux.ibm.com/T/#t
https://lore.kernel.org/qemu-devel/20220310111608.3362-2-frankja@linux.ibm.com/T/#t

Personal notes:
I still need to improve error management which will mean that the
ioctl functions in hw/s390x/pv.c will need to be changed to return the
rc/rrc.

Janosch Frank (5):
  linux header sync
  s390x: Add protected dump cap
  s390x: Introduce PV query interface
  s390x: Add KVM PV dump interface
  s390x: pv: Add dump support

 dump/dump.c                  |  27 ----
 hw/s390x/pv.c                | 113 ++++++++++++++++
 hw/s390x/s390-virtio-ccw.c   |   5 +
 include/elf.h                |   1 +
 include/hw/s390x/pv.h        |  18 +++
 include/sysemu/dump.h        |  27 ++++
 linux-headers/linux/kvm.h    |  55 ++++++++
 target/s390x/arch_dump.c     | 247 ++++++++++++++++++++++++++++++-----
 target/s390x/kvm/kvm.c       |   7 +
 target/s390x/kvm/kvm_s390x.h |   1 +
 10 files changed, 443 insertions(+), 58 deletions(-)

-- 
2.32.0


