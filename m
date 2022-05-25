Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE263533D39
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 15:07:43 +0200 (CEST)
Received: from localhost ([::1]:55932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntqjl-0005OH-Qi
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 09:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ntqcy-0002qA-MA
 for qemu-devel@nongnu.org; Wed, 25 May 2022 09:00:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ntqcs-0003U5-0S
 for qemu-devel@nongnu.org; Wed, 25 May 2022 09:00:40 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24PCuCI3012732;
 Wed, 25 May 2022 13:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=VtzpWYjsRz/x7t/ecuFFokoaY2FsQeNUor8ZHfDAXHg=;
 b=a/mlHrPfm8E+3yLrKN/t+F34JgfdFkXgCVKu0dIBsloo6M4dO7Akna4X/gfeXpyoA2Ug
 aLXygoYd0p0BXwg1nh98TuTTSCgcjJGYUvANgibA2LSndcDpjaYGWJ8rVMbSI4U2XUZk
 kNRoACg9g+huvqVm5tzX4Tu5Hl50PP6na7fJJI7E9yA4LwnI4Om2LETv11UL+fAmoEHJ
 qqXTp2s8SZkbMAZLQurMvTl5NjMzQnwQS01Aqo6Af+XK6ATCTbmNlankDk5p75Oi4Gtg
 DacljJpegUEj+kaouXPU9QNlOZ3SBuOLVwJJrn06MMMtVyIl5qummSk6IhJ6d/no9/LF vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9fxjx64s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 13:00:21 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24PCUZVs008600;
 Wed, 25 May 2022 13:00:20 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9fxjx643-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 13:00:20 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24PCwxu1017779;
 Wed, 25 May 2022 13:00:19 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 3g93v87hxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 13:00:19 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24PCxIPi37486868
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 May 2022 12:59:18 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95F2B78060;
 Wed, 25 May 2022 12:59:18 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EC197805F;
 Wed, 25 May 2022 12:59:18 +0000 (GMT)
Received: from sbct-2.pok.ibm.com (unknown [9.47.158.152])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 25 May 2022 12:59:18 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, f4bug@amsat.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v2] hw/tpm/tpm_tis_common.c: Assert that locty is in range
Date: Wed, 25 May 2022 08:59:04 -0400
Message-Id: <20220525125904.483075-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OHPSdMrCy7Q9Mh0tQY0Xdl3Dga8_Ukws
X-Proofpoint-GUID: jjrGFHkCCdi5S4i_h8fEczicSVFWZPpa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_03,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 mlxscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=802
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205250063
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

---

v2:
  - Moved 3 asserts from 3 callsites of tpm_tis_locality_from_addr() into
    tpm_tis_locality_from_addr()
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
2.36.1


