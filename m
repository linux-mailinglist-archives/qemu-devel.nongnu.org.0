Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390E9466888
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 17:44:08 +0100 (CET)
Received: from localhost ([::1]:40506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mspBm-0000uT-RT
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 11:44:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1msp9D-0006kI-Fy; Thu, 02 Dec 2021 11:41:27 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52318
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1msp9B-00039A-Vr; Thu, 02 Dec 2021 11:41:27 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B2GJDpT015186; 
 Thu, 2 Dec 2021 16:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=QzSN5bfyef8EI4/zLcizyWhLI7LRCOd06WP/E2gdZAI=;
 b=QUDspTL5YSt1tES9JE50hCN38oIYv3xFkqX5I14IjXizgedOhWeBhlExSPfBwOxWD3VB
 z0J9B6Nb3UqNYODHV3+lPN36U74RC82tmy51KFJv200mEtLs5glFkAzom7BbsHpIVMV6
 DhrVeZUgwr33umE04NSMQOgesDBnMg9oHQIPh0bPaSTlKSZtALsi0WmIPvoGOC5QJ5tm
 I/+RAycZJVUh/oits6fvAmc8sf/44nzxrFZGo2vYx1tPgZPF+52hPbW+PJkSs3apOfwP
 PvzL5SZBpaKtt/zm4WEOaJrRGUjqHZfeh5vtqWYySea+MCEqTsnjry/9iCPBIn2++2W5 uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cq09qtjvn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 16:41:24 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B2GASEL008338;
 Thu, 2 Dec 2021 16:41:24 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cq09qtjtj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 16:41:23 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B2GRi0B016171;
 Thu, 2 Dec 2021 16:41:18 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 3ckcacj3wp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 16:41:18 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B2GfHtv33620348
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Dec 2021 16:41:17 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1584913605D;
 Thu,  2 Dec 2021 16:41:17 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BBF6136060;
 Thu,  2 Dec 2021 16:41:15 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.48.116])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  2 Dec 2021 16:41:15 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: thuth@redhat.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 0/4] s390x/pci: some small fixes 
Date: Thu,  2 Dec 2021 11:41:06 -0500
Message-Id: <20211202164110.326947-1-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: c1JlYO1oRplz2c58lkswEDu2sZNIOH8x
X-Proofpoint-ORIG-GUID: uAx0MKtTCXT61uFT6CR-mUN59sl1FdK5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-02_10,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=708 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112020109
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: farman@linux.ibm.com, pmorel@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A collection of small fixes for s390x PCI (not urgent).  The first 3 are        
fixes related to always using the host-provided CLP value when provided         
vs a hard-coded value.  The last patch adds logic for QEMU to report a          
proper DTSM clp response rather than just 0s (guest linux doesn't look          
at this field today).

Matthew Rosato (4):
  s390x/pci: use a reserved ID for the default PCI group
  s390x/pci: don't use hard-coded dma range in reg_ioat
  s390x/pci: use the passthrough measurement update interval
  s390x/pci: add supported DT information to clp response

 hw/s390x/s390-pci-bus.c         |  1 +
 hw/s390x/s390-pci-inst.c        | 14 ++++++++------
 hw/s390x/s390-pci-vfio.c        |  1 +
 include/hw/s390x/s390-pci-bus.h |  3 ++-
 include/hw/s390x/s390-pci-clp.h |  3 ++-
 5 files changed, 14 insertions(+), 8 deletions(-)

-- 
2.27.0


