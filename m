Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF904F9684
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 15:15:52 +0200 (CEST)
Received: from localhost ([::1]:45574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncoSt-0002nb-IF
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 09:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1ncoQO-0000iZ-71; Fri, 08 Apr 2022 09:13:16 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1ncoQL-00082X-IM; Fri, 08 Apr 2022 09:13:15 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 238Bg5i0004531; 
 Fri, 8 Apr 2022 13:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=d+DCvD1PGgcp1A5YFTiuhOwkF2mvdzQ33wioYOCX/y4=;
 b=sDwQnN1BFHv2teO9y2ziweRdX3YjkTnDlu9Bf9lsXB2JwgRdivdP5HsJPxP0j7vdQim9
 5ult6FLY4YXZXsAFfOKBScr4bHCC/EAe8za8St71uxwEkAxhmsejx5nYQbg65y4sCPKW
 1gp+V0OI7JwadOeTgMNqlnc/+dUpkKufRZYDGd+uHzWn4fGEjPrXaL3aW+lQ/1WpAHKT
 m7N1g8MNtEjCI6nsLiVnYF0qOZum/3JeCeO8DvIO6nmpbzRw/toyFPfJZ4luUxMXmkek
 SrBHcVG2coKD8GpVLYY8qP9cslwHjLbcXHjK6gbUwRe5EOH1l/ck/vVYQuKfB0qaiD5r fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fabs13af4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 13:13:08 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 238CowLo008127;
 Fri, 8 Apr 2022 13:13:08 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fabs13aen-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 13:13:08 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 238CvIBI027618;
 Fri, 8 Apr 2022 13:13:06 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3f6e491rff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 13:13:06 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 238D0hBf44827082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Apr 2022 13:00:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8228A405F;
 Fri,  8 Apr 2022 13:13:03 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CA5EA405B;
 Fri,  8 Apr 2022 13:13:03 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.145.145.202])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  8 Apr 2022 13:13:03 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] Remove PCIE root bridge LSI on powernv
Date: Fri,  8 Apr 2022 15:13:01 +0200
Message-Id: <20220408131303.147840-1-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IjibuNaBe3N3hwD1zvNXYymQfzpuoA7q
X-Proofpoint-ORIG-GUID: 5wv0OH9foLbiWNuFhEgveeNDfUmErpHH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_04,2022-04-08_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=812 bulkscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204080067
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
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


Changes from v1:
 - addressed comments from Daniel


Frederic Barrat (2):
  pcie: Don't try triggering a LSI when not defined
  ppc/pnv: Remove LSI on the PCIE host bridge

 hw/pci-host/pnv_phb3.c | 1 +
 hw/pci-host/pnv_phb4.c | 1 +
 hw/pci/pcie.c          | 5 +++--
 hw/pci/pcie_aer.c      | 2 +-
 4 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.35.1


