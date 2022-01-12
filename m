Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F2248BDEE
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 05:42:05 +0100 (CET)
Received: from localhost ([::1]:59874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7VSW-0003sE-Mq
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 23:42:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7VQZ-0002Gs-Lv; Tue, 11 Jan 2022 23:40:03 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60620
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7VQX-0003Sg-7g; Tue, 11 Jan 2022 23:40:02 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20C3Qx1B016174; 
 Wed, 12 Jan 2022 04:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=e0NM9VyJ8zNyHoAMSyD5gpLuzTYDfwsOJeXfi1MbzIw=;
 b=S0UBu7MedBC80mzvKug4Ry/QQQMvsvFc2OnqCblscH8DU14Tyk1irj0RbrQgRvzqM5ni
 pswhia1SNNJVJKo7icw7fZkuTLecvFioBH9Uw9shR9ypu7eeHl4sUc7diqLjYWuOQNhB
 guLPF4UQj9/GI3DtspxWeHFtqp4p9QSJejfgwJIoVWCOwVIyuFHAq3ozyvxTRPORehYX
 4VAh/9gx1xyq8dS4ZhGkpfmk94GUYrA7Ype32RgKFmdNajGIApLEgJSz8HSaJU76IxY+
 319sVrTxXIDZEUBM/wioQBDohkm3gp8shfMKHKmOuW9XOXG0XVfGFtiC0BZMZ+t6P11f HA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhq3crx71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 04:39:58 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20C4VAsE024238;
 Wed, 12 Jan 2022 04:39:58 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhq3crx6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 04:39:57 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20C4XubG024541;
 Wed, 12 Jan 2022 04:39:56 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3df289ncqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 04:39:56 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20C4dr2829032852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 04:39:53 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BFEA42041;
 Wed, 12 Jan 2022 04:39:53 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 815114203F;
 Wed, 12 Jan 2022 04:39:52 +0000 (GMT)
Received: from vm.lan (unknown [9.171.78.41])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jan 2022 04:39:52 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 1/5] target/s390x: Fix SLDA sign bit index
Date: Wed, 12 Jan 2022 05:39:44 +0100
Message-Id: <20220112043948.224405-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112043948.224405-1-iii@linux.ibm.com>
References: <20220112043948.224405-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rVsVCM7tV4lvLF4eC9VtrO58sIVfmBeH
X-Proofpoint-ORIG-GUID: cNjgsYwa8sXsQuyVqvgoftU5elHadhmY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_01,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120024
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand noticed that sign bit index for SLDA is wrong: since
SLDA operates on 64-bit values, it should be 63, not 31.

Fixes: a79ba3398a0a ("target-s390: Convert SHIFT DOUBLE")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/insn-data.def | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index f0af458aee..90c753068c 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -800,7 +800,7 @@
     C(0xebde, SRLK,    RSY_a, DO,  r3_32u, sh32, new, r1_32, srl, 0)
     C(0xeb0c, SRLG,    RSY_a, Z,   r3_o, sh64, r1, 0, srl, 0)
 /* SHIFT LEFT DOUBLE */
-    D(0x8f00, SLDA,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, sla, 0, 31)
+    D(0x8f00, SLDA,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, sla, 0, 63)
 /* SHIFT LEFT DOUBLE LOGICAL */
     C(0x8d00, SLDL,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, sll, 0)
 /* SHIFT RIGHT DOUBLE */
-- 
2.31.1


