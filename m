Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F6667E536
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 13:30:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLNqz-0005ts-A9; Fri, 27 Jan 2023 07:29:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pLNqt-0005s9-CH; Fri, 27 Jan 2023 07:29:07 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pLNqr-0003eE-T0; Fri, 27 Jan 2023 07:29:07 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30RBANkQ028614; Fri, 27 Jan 2023 12:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=E+sxlhNAQvHLVBGXkQ49tF+dcNfpAviHZ/qtLGhaG3A=;
 b=d7/HcwIw5izpJ7zoibCKAUbwColFrd8B6SgAG/lxze1sWn6LBa23odlfJCnnE+4qcGcA
 SMZ5adHiDsLgSkNsE6Vl+aG9EEIi/R70Nx9JG5htcugygIcUO/1pYuxBofcBRudexZNq
 7x8oilL1payca2th51oLRvuAc2GjgnDxLN9RgMRBOdD5T075ZnsTsKZ8Dod6WK+GhxJj
 UnHPNeCI5va9mLII8veIalJGL/+BHwx1Vd8aY1wPF/zdY1xAx+5skgVdRTYW5Z05RhaK
 DjFLF24xn8+TG4GSUi0WI58Z7MHPqSZvP9hqzwT21zzLtwijGZZz08ntOW8MhNWHL+U9 lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ncdbxhwk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 12:28:56 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30RC0QFJ011734;
 Fri, 27 Jan 2023 12:28:55 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ncdbxhwjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 12:28:55 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30QEEg7T016036;
 Fri, 27 Jan 2023 12:28:53 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3n87p6dcm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 12:28:52 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30RCSoVo38338924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Jan 2023 12:28:50 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 697FE20040;
 Fri, 27 Jan 2023 12:28:50 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14D8620049;
 Fri, 27 Jan 2023 12:28:50 +0000 (GMT)
Received: from borneo.ibmuc.com (unknown [9.171.86.232])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 27 Jan 2023 12:28:50 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 2/4] ppc/pnv/pci: Remove duplicate definition of
 PNV_PHB5_DEVICE_ID
Date: Fri, 27 Jan 2023 13:28:46 +0100
Message-Id: <20230127122848.550083-3-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127122848.550083-1-fbarrat@linux.ibm.com>
References: <20230127122848.550083-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vZNHsIePQoM-Xyp1NbIhvh09Flr4fIyP
X-Proofpoint-ORIG-GUID: 2hCUNsIE4586KPx4rZ0UHGEqK8ri9WtA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_07,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

PNV_PHB5_DEVICE_ID is defined in two different headers. The definition
in hw/pci-host/pnv_phb4.h was left out in a previous rework.

Remaining definition is in hw/pci-host/pnv_phb.h.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 include/hw/pci-host/pnv_phb4.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 17aef08f91..761525686e 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -215,7 +215,6 @@ struct PnvPhb4PecClass {
     OBJECT_CHECK(PnvPhb4, (obj), TYPE_PNV_PHB5)
 
 #define PNV_PHB5_VERSION           0x000000a500000001ull
-#define PNV_PHB5_DEVICE_ID         0x0652
 
 #define TYPE_PNV_PHB5_PEC "pnv-phb5-pec"
 #define PNV_PHB5_PEC(obj) \
-- 
2.39.1


