Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECD3548605
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 17:50:10 +0200 (CEST)
Received: from localhost ([::1]:42932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0mKP-0007Dn-BI
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 11:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o0mFf-0008PV-VA; Mon, 13 Jun 2022 11:45:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o0mFe-0001yp-6l; Mon, 13 Jun 2022 11:45:15 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DFQciT002584;
 Mon, 13 Jun 2022 15:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=PQd8/YpLTOn7X/O9QtlLtsAzsCHjDNRSlSR3slDTAwM=;
 b=RDB820SCW80gyEwAUmSv6+JO9GYEwCPUIBY5LhwZvD0lmLAYF1YTFWNM3hblL3w9iztZ
 Q5436O1vIeQ24w7ooE/50Gd5um2/FXa7A/KeIxJpZvIHuv51QiWwdeNSUGwoWG+alaey
 1KsW1qZSa8ay50KKO7n6xSLwVNnFiTg1SfbdCFa+ifSripMEw5qj+VpKtUQ4FFLs1cwE
 TD9xLvaQrcUbRoTGfCeT/L0Qbc2mJuQVf+LK8RtkFOR3dCXNLKUj/eE3fAL9Oxla6E3n
 6wNF77W5RIZiaI5LUdXlJFUF+llyYrmzZ9jRQTMZd+02vjg3AMzJUzWXUIfJl8PwtOyN 1Q== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gp7vtgcgf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 15:45:02 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25DFOvuw021354;
 Mon, 13 Jun 2022 15:45:01 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 3gmjp9j046-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 15:45:01 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25DFj09S36897108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 15:45:00 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3EAAAC060;
 Mon, 13 Jun 2022 15:45:00 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5376EAC05E;
 Mon, 13 Jun 2022 15:44:59 +0000 (GMT)
Received: from balboa.COMFAST (unknown [9.77.153.150])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jun 2022 15:44:59 +0000 (GMT)
From: Daniel Henrique Barboza <danielhb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 mark.cave-ayland@ilande.co.uk
Subject: [PATCH 00/11] pnv-phb related cleanups 
Date: Mon, 13 Jun 2022 12:44:45 -0300
Message-Id: <20220613154456.359674-1-danielhb@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J--U7MwvCsA1VIxdBlfbIMih1U_T1AqT
X-Proofpoint-ORIG-GUID: J--U7MwvCsA1VIxdBlfbIMih1U_T1AqT
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_07,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 clxscore=1011 malwarescore=0 phishscore=0 mlxlogscore=629
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130068
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=danielhb@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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

Hi,

I decided to make some cleanups/fixes after the feedback received in the
v2 of the pnv-phb proxy series [1]. A lot of the reviews and comment were
related to the current state of the code instead of what was being done
there.

With this series we want to:

- provide a better base for proxy pnv-phb series, fixing and changing code
that is already in place;
- make a common logic that applies to both default and user created devices.
There's no reason to make distinctions between them aside from what we will
already have to deal with.


After these cleanups we'll be able to simplify the work required in [1].

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg06254.html

Daniel Henrique Barboza (11):
  ppc/pnv: move root port attach to pnv_phb4_realize()
  ppc/pnv: attach phb3/phb4 root ports in QOM tree
  ppc/pnv: use dev->parent_bus->parent to get the PHB
  ppc/pnv: use dev instead of pci->qdev in root_port_realize()
  ppc/pnv: make pnv_ics_get() use the chip8->phbs[] array
  ppc/pnv: make pnv_ics_resend() use chip8->phbs[]
  ppc/pnv: make pnv_chip_power8_pic_print_info() use chip8->phbs[]
  ppc/pnv: turn chip8->phbs[] into a PnvPHB3* array
  ppc/pnv: add PHB object/bus parenting helpers
  ppc/pnv: move PHB3 initialization to realize time
  ppc/pnv: move PHB4 parent fixup to phb4_realize()

 hw/pci-host/pnv_phb3.c     |  30 +++++++--
 hw/pci-host/pnv_phb4.c     |  31 +++++++--
 hw/pci-host/pnv_phb4_pec.c |   4 --
 hw/ppc/pnv.c               | 127 +++++++++++++++++++++----------------
 include/hw/ppc/pnv.h       |  10 ++-
 5 files changed, 128 insertions(+), 74 deletions(-)

-- 
2.36.1


