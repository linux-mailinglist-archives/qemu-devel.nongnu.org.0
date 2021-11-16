Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE930453848
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 18:08:16 +0100 (CET)
Received: from localhost ([::1]:41766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1wN-00054t-Tf
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 12:08:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1mn1q8-0002OX-Kq; Tue, 16 Nov 2021 12:01:49 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:8650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1mn1q5-00018d-5A; Tue, 16 Nov 2021 12:01:48 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AGGj3o6031165; 
 Tue, 16 Nov 2021 17:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=FUjR5aiB60zXkgtbCb4yMpL5ZdOQ9hmsL0B/XqxhxRw=;
 b=RAeZHegHIPcAAztpt87wtUxJLihh+uKvpCQWiWnGCv59qvO6xb2xgnNNKimprccx3nIG
 BftM7UXACAYbiHJmiYpiFp7PAYUSuZ+NhU7BRWyBcMk4X0yieQ6Q8EJYLLOMMudjhUtr
 2II7olUvScK3xIgnrOKx5Q/Zcxo30ufXKx7N7sOxELYb2BR0j4wDQnlChTOMqfZPqQtd
 m3tDROgLTsb7duClD4F6YvlpZk0q23UhsdsSPIJYrg9wx4fiH91hG7klVMfWdZ/cQM85
 WlAZIuoPBuGcrQJYW7xxuDjAT4ZUE9T+wwN4TWuYWHZmYGkxKD16D5i6nPwNGUET/bQJ xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ccge8rb74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 17:01:39 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AGH0PvJ023360;
 Tue, 16 Nov 2021 17:01:38 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ccge8rb5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 17:01:38 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AGGr5sU010699;
 Tue, 16 Nov 2021 17:01:36 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3ca4mjt8ag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 17:01:36 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AGH1YPU16449798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Nov 2021 17:01:34 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CD66AE051;
 Tue, 16 Nov 2021 17:01:34 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D427EAE055;
 Tue, 16 Nov 2021 17:01:33 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.101.4.17])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Nov 2021 17:01:33 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, mst@redhat.com, marcel.apfelbaum@gmail.com,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 0/3] Fix irq allocation of PCI host bridge on powernv
Date: Tue, 16 Nov 2021 18:01:30 +0100
Message-Id: <20211116170133.724751-1-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VubaD4QXQwbnqNIppxw21iuW7nnDzIl7
X-Proofpoint-ORIG-GUID: snHCRcLzdMUwnhURfu5IaFXS2y_554M4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-16_03,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111160084
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series removes a bogus allocation of a LSI interrupt for the PCI
Host Bridge found in the powernv model (phb4). The real hardware
doesn't declare any LSI, so the model should match. It was causing
some inconsistencies in the interrupt controller data.

However, removing that LSI shows that the PCI AER code assumes an
interrupt is defined (LSI or MSI or MSI-X), which is not the case with
the root bridge device on powernv. So the last patch adds a check to
make sure a LSI is defined before entering pci_set_irq() as it asserts
if it's called with no LSI defined.


Frederic Barrat (3):
  ppc/pnv: Tune the POWER9 PCIe Host bridge model
  pci: Export the pci_intx() function
  pcie_aer: Don't trigger a LSI if none are defined

 hw/pci-host/pnv_phb4.c | 5 ++++-
 hw/pci/pci.c           | 5 -----
 hw/pci/pcie_aer.c      | 4 +++-
 include/hw/pci/pci.h   | 5 +++++
 4 files changed, 12 insertions(+), 7 deletions(-)

-- 
2.33.1


