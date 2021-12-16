Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C5947739B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:51:28 +0100 (CET)
Received: from localhost ([::1]:51892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxrAM-0005jY-DS
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:51:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nrb@linux.ibm.com>)
 id 1mxqe1-0004iM-CE; Thu, 16 Dec 2021 08:18:01 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nrb@linux.ibm.com>)
 id 1mxqdx-0007eK-Ad; Thu, 16 Dec 2021 08:18:01 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGAxdJF001491; 
 Thu, 16 Dec 2021 13:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Dxpct/PVMPtprUdLdZkgL/YkkoCP088nv+SmNqfl0UM=;
 b=SpaO+0LZy3QqCHCajbvo9yqa2iPlsTOpvYxncC4AxCoI5eg7eOx6XzURraithMoYCLRw
 XKaPhyjFQinQUel1uFv4qG8kjpXxC+7co490diWtk4kVWnMLBv4ohh8vLbntNVbaAxE3
 IVo1IROSS+8Bn3HgOb9uSBS75rC2EcPFKvzAzF+3jnSENZhlMixS6Jte17RdVpSdxiVt
 DNUFxL/JzEnzySDEP8M3tD6fG8Y8fNtu4Kya7QU3EsxdNYmWP//5zOAUemY/Mhrq2E11
 53ESTNUQl/wQgHepxqb10qbZenUuLCiz69DWdhXsx2mrBdXYxwGTbaV0eKNKxSFmICa5 +A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cys717h04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 13:17:52 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BGCkDQf009460;
 Thu, 16 Dec 2021 13:17:52 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cys717gyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 13:17:52 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGDHe2C011991;
 Thu, 16 Dec 2021 13:17:49 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3cy7qw748k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 13:17:49 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGDHkJF21561628
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 13:17:46 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72A15AE05A;
 Thu, 16 Dec 2021 13:17:46 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28C42AE058;
 Thu, 16 Dec 2021 13:17:46 +0000 (GMT)
Received: from t46lp57.lnxne.boe (unknown [9.152.108.100])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 Dec 2021 13:17:46 +0000 (GMT)
From: Nico Boehr <nrb@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH qemu] s390x/css: fix PMCW invalid mask
Date: Thu, 16 Dec 2021 14:16:57 +0100
Message-Id: <20211216131657.1057978-1-nrb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: F-yW9XOGIWf722_kxTQ81pAswULyMT1t
X-Proofpoint-GUID: BD4bIynvn1j5_K04vv2LNCYQ7YkhqwyU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_04,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=817 malwarescore=0 clxscore=1011 mlxscore=0 bulkscore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160073
Received-SPF: pass client-ip=148.163.156.1; envelope-from=nrb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 16 Dec 2021 08:46:41 -0500
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
Cc: thuth@redhat.com, Nico Boehr <nrb@linux.ibm.com>, frankja@linux.ibm.com,
 pmorel@linux.ibm.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previously, we required bits 5, 6 and 7 to be zero (0x07 == 0b111). But,
as per the principles of operation, bit 5 is ignored in MSCH and bits 0,
1, 6 and 7 need to be zero.

As both PMCW_FLAGS_MASK_INVALID and ioinst_schib_valid() are only used
by ioinst_handle_msch(), adjust the mask accordingly.

Fixes: db1c8f53bfb1 ("s390: Channel I/O basic definitions.")
Signed-off-by: Nico Boehr <nrb@linux.ibm.com>
Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
Reviewed-by: Halil Pasic <pasic@linux.ibm.com>
Reviewed-by: Janosch Frank <frankja@linux.ibm.com>
---
 include/hw/s390x/ioinst.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/s390x/ioinst.h b/include/hw/s390x/ioinst.h
index 3771fff9d44d..ea8d0f244492 100644
--- a/include/hw/s390x/ioinst.h
+++ b/include/hw/s390x/ioinst.h
@@ -107,7 +107,7 @@ QEMU_BUILD_BUG_MSG(sizeof(PMCW) != 28, "size of PMCW is wrong");
 #define PMCW_FLAGS_MASK_MP 0x0004
 #define PMCW_FLAGS_MASK_TF 0x0002
 #define PMCW_FLAGS_MASK_DNV 0x0001
-#define PMCW_FLAGS_MASK_INVALID 0x0700
+#define PMCW_FLAGS_MASK_INVALID 0xc300
 
 #define PMCW_CHARS_MASK_ST 0x00e00000
 #define PMCW_CHARS_MASK_MBFC 0x00000004
-- 
2.31.1


