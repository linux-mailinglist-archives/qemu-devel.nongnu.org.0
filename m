Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F0E67E530
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 13:30:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLNqz-0005ux-SN; Fri, 27 Jan 2023 07:29:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pLNqs-0005s6-OH; Fri, 27 Jan 2023 07:29:07 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pLNqr-0003e6-5n; Fri, 27 Jan 2023 07:29:06 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30RBuXQb028425; Fri, 27 Jan 2023 12:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=u1F5VtGliLQ3LoR6s5vkGmpRzH8rtREwK7Hfc9jRPI0=;
 b=Kf1/7m3jk7jpGwEjtXHHu3Sgg6H4EsKUMmKeYUXGvYt2lu3krbrcEMVuSRy+Ij6j2iO4
 ewdlk9PTrJP5VbAxc+MS4hcvtw+coDqQf/I6MZB+ZIe+ScaZXZauKIpw2gUE8f5OBH4J
 vzRk+cvSxdOsvwDuDDp2aJoV71cYgmL4nvoyrzZTESwJhh6EGC72BtFb2Tl69QoeWCu0
 buNfhpTsR3QFRHeJmobI0EFPb5/bkjZaEbG+L2KDhHJUPhrdmGQJrmOyIJ34UGwkvSuM
 gQkeuKWhgXlmBRQA5cf4kH6f+HqbKDPc73yZGTnFkX+I6/hGGCChKSDMcTaBZo78Ucni PA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nce6brsnb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 12:28:54 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30RBxAnG008670;
 Fri, 27 Jan 2023 12:28:54 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nce6brsmk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 12:28:54 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30R6xeFU010402;
 Fri, 27 Jan 2023 12:28:52 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3n87p6qggy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 12:28:51 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30RCSnCg22151552
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Jan 2023 12:28:49 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87C4520043;
 Fri, 27 Jan 2023 12:28:49 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31E6F20040;
 Fri, 27 Jan 2023 12:28:49 +0000 (GMT)
Received: from borneo.ibmuc.com (unknown [9.171.86.232])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 27 Jan 2023 12:28:49 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 0/4] PCI-related cleanup for ppc/powernv
Date: Fri, 27 Jan 2023 13:28:44 +0100
Message-Id: <20230127122848.550083-1-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: C9NCxfHoflC9IjGdCPcwK60iLKEQXENl
X-Proofpoint-GUID: LVocgxCAORGr0yWu3NMJ71PLjF6pFIxV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_06,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=517 clxscore=1011 impostorscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301270113
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Pretty simple PCI-related cleanup for powernv

Frederic Barrat (4):
  ppc/pnv/pci: Cleanup PnvPHBPecState structure
  ppc/pnv/pci: Remove duplicate definition of PNV_PHB5_DEVICE_ID
  ppc/pnv/pci: Update PHB5 version register
  ppc/pnv/pci: Fix PHB xscom registers memory region name

 hw/pci-host/pnv_phb4.c         | 2 +-
 include/hw/pci-host/pnv_phb4.h | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

-- 
2.39.1


