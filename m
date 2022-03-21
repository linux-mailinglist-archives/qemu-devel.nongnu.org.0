Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5094E2CF7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:55:37 +0100 (CET)
Received: from localhost ([::1]:52778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKNc-0001iI-8g
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:55:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nWK2s-0007UT-GX; Mon, 21 Mar 2022 11:34:10 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nWK2q-0006xu-N6; Mon, 21 Mar 2022 11:34:10 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22LD7Sqv016212; 
 Mon, 21 Mar 2022 15:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Ko/FuOEwLIAKH3m6TTebE7g7F9yJXcoZpqsMVxdwxR0=;
 b=s6Sy9ALpM9yE2LTfAdbDriM7rYYEdwl0PfYbSkG9zvWO4EkoM1d74pA5lMmchB0fz0Sb
 sV4z2lGWFDkWUhq8Hp5Snqf/zY6RbnnOyIJ2iC6js6QltuhsF6eLTwdV7a+mH+BiVWEG
 9BAIrtHtw3RweYtju8WTfGeax6afUmBzUoSe96iXxkEhdoziMx+Fgeq+XCvpuGFOqciZ
 S4uHhK4eL2+eaQgVvZHWgOgqAK8LFq9cYNMEbC7pD1Q2PeHLFsfQMpaTX3/CXF49o/sP
 aBFh9vg+susVVNDyq5sJd6uwBPspwfN6HmRUmbUSS4DwqBf7BXXIedFpsdTBbzLfD7gh Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3exqd3xrmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 15:34:03 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22LF7IrS018437;
 Mon, 21 Mar 2022 15:34:03 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3exqd3xrkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 15:34:02 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22LFXKY9028795;
 Mon, 21 Mar 2022 15:34:00 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3ew6t93p0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 15:34:00 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22LFMJDU36110712
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 15:22:19 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38CE611C04A;
 Mon, 21 Mar 2022 15:33:58 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D91A911C04C;
 Mon, 21 Mar 2022 15:33:57 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.101.4.17])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Mar 2022 15:33:57 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 0/2] Remove PCIE root bridge LSI on powernv
Date: Mon, 21 Mar 2022 16:33:55 +0100
Message-Id: <20220321153357.165775-1-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: queBYgm3PaN27dedF0og8nO477t7wJHA
X-Proofpoint-GUID: y71bJJYl-W9E0OUeHeNqjB6eGKT3yqBy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-21_07,2022-03-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 mlxlogscore=736 mlxscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203210098
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The powernv8/powernv9/powernv10 machines allocate a LSI for their root
port bridge, which is not the case on real hardware. The default root
port implementation in qemu requests a LSI. Since the powernv
implementation derives from it, that's where the LSI is coming
from. This series fixes it, so that the model matches the hardware.

However, the code in hw/pci to handle AER and hotplug events assume a
LSI is defined. It tends to assert/deassert a LSI if MSI or MSIX is
not enabled. Since we have hardware where that is not true, this patch
also fixes a few code paths to check if a LSI is configured before
trying to trigger it.


Frederic Barrat (2):
  pcie: Don't try triggering a LSI when not defined
  ppc/pnv: Remove LSI on the PCIE host bridge

 hw/pci-host/pnv_phb3.c | 1 +
 hw/pci-host/pnv_phb4.c | 1 +
 hw/pci/pcie.c          | 8 ++++++--
 hw/pci/pcie_aer.c      | 4 +++-
 4 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.35.1


