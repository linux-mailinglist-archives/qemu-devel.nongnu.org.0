Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B4A54208F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 03:01:55 +0200 (CEST)
Received: from localhost ([::1]:39134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyk54-0000QS-4W
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 21:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nyk3i-00083g-Mo
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 21:00:30 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nyk3g-0005t3-Lv
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 21:00:30 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2580Tu93007906;
 Wed, 8 Jun 2022 01:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=6uw873q0A7qKpxTEc1UaqCNpYgGTnrnwmDuJKzruvDU=;
 b=TUFwPQNtai6WlgXTd+l9gPMl5vs8D4NGPwbqEgQrpICULFdXn/Y9DmocmQoyc/Cm1dMB
 d8N3sgmwMJcAzGHYNxN4lXoC4zcWebCBIkG58zpnmiUvve9Wcxwg3H96/ZAssfqeuXNq
 TzXY8ubPzU9g3imu5uF/mLH0xN7cGsGZSlw8xapb0Ue9CXRMyCZXXDArFNdeUpkGJrQg
 iVq618NPjlzKUpfLXtFueTcLTdjk3eFCW/x5raFliCAZ/yy1+mXGwHxDBVvlzZWPVP6E
 F5AZar4Nn6eQ3ur0hIyz/0N0KoF5Gq6qdXPCebv8hS7LzDXoSGisjo7inMjLbPgcdTuZ XQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gjg5r1cuy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jun 2022 01:00:25 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2580rYZ0018880;
 Wed, 8 Jun 2022 01:00:24 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gjg5r1cup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jun 2022 01:00:24 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2580oOKs006078;
 Wed, 8 Jun 2022 01:00:24 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 3gfy19qsqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jun 2022 01:00:24 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25810NRf31719738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jun 2022 01:00:23 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55D15BE051;
 Wed,  8 Jun 2022 01:00:23 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07C70BE054;
 Wed,  8 Jun 2022 01:00:23 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Jun 2022 01:00:22 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Stefan Berger <stefanb@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL v1 1/2] hw/tpm/tpm_tis_common.c: Assert that locty is in range
Date: Tue,  7 Jun 2022 21:00:05 -0400
Message-Id: <20220608010006.2122022-2-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220608010006.2122022-1-stefanb@linux.ibm.com>
References: <20220608010006.2122022-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: L_9dCSW6Df5I-xIwDsco0cCPqnZBVxVT
X-Proofpoint-ORIG-GUID: kXfk1PxSwLrgxpMb_UkpydJVYzOcLgoF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-07_11,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=986 impostorscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206080000
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

From: Peter Maydell <peter.maydell@linaro.org>

In tpm_tis_mmio_read(), tpm_tis_mmio_write() and
tpm_tis_dump_state(), we calculate a locality index with
tpm_tis_locality_from_addr() and then use it as an index into the
s->loc[] array.  In all these cases, the array index can't overflow
because the MemoryRegion is sized to be TPM_TIS_NUM_LOCALITIES <<
TPM_TIS_LOCALITY_SHIFT bytes.  However, Coverity can't see that, and
it complains (CID 1487138, 1487180, 1487188, 1487198, 1487240).

Add an assertion to tpm_tis_locality_from_addr() that the calculated
locality index is valid, which will help Coverity and also catch any
potential future bug where the MemoryRegion isn't sized exactly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-id: 20220525125904.483075-1-stefanb@linux.ibm.com
---
 hw/tpm/tpm_tis_common.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/tpm/tpm_tis_common.c b/hw/tpm/tpm_tis_common.c
index e700d82181..503be2a541 100644
--- a/hw/tpm/tpm_tis_common.c
+++ b/hw/tpm/tpm_tis_common.c
@@ -50,7 +50,12 @@ static uint64_t tpm_tis_mmio_read(void *opaque, hwaddr addr,
 
 static uint8_t tpm_tis_locality_from_addr(hwaddr addr)
 {
-    return (uint8_t)((addr >> TPM_TIS_LOCALITY_SHIFT) & 0x7);
+    uint8_t locty;
+
+    locty = (uint8_t)((addr >> TPM_TIS_LOCALITY_SHIFT) & 0x7);
+    assert(TPM_TIS_IS_VALID_LOCTY(locty));
+
+    return locty;
 }
 
 
-- 
2.35.3


