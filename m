Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9724F49B4AB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 14:13:44 +0100 (CET)
Received: from localhost ([::1]:34942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCLdn-0001v3-OD
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 08:13:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nrb@linux.ibm.com>) id 1nCKwu-0006TL-HM
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 07:29:24 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53502
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nrb@linux.ibm.com>) id 1nCKws-0004re-LH
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 07:29:24 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20PCK12j000768; 
 Tue, 25 Jan 2022 12:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=emwkbs6YjOuH3VFhZtvs7dxU1IGRDZDvVQtbya4xOk4=;
 b=AwPeAL+9nleKpFSLoMgMLZKWlWnE2BTu7i+jgg3xbFuWK2r+/RzRHYbswjREIEdtIqMA
 cHbXsVsOC6P7pGiWkvL4OJVdOgQvlOw/qJ2x35rW3yjkaJRduOfNQdARbj0uZTYnN2B3
 slsqb7Qf4QgtFabq+ZA2Yc11yWyiW/TeVVI3Ry0F3BdznhvDDRWSoPmXVFmYG09IZya0
 cH4g0R05z2MHgBScAzW3g7OUZw04GIXtMLgdtDM1wIX+6ALrcEnG2JnwkzV93B0I4uuK
 E59/GC4y2ZSZKpuhfiRkn1pFT1XmhBUVU3aHiZLe84HrMFssVd/LteWvymxxFofZ+POy Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dtafr9dts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 12:29:19 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20PCTJ2c003571;
 Tue, 25 Jan 2022 12:29:19 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dtafr9dt1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 12:29:19 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20PCI8qb015503;
 Tue, 25 Jan 2022 12:29:17 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 3dr9j8vkmd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 12:29:17 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20PCTFBC37552478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 12:29:15 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BBC65205A;
 Tue, 25 Jan 2022 12:29:15 +0000 (GMT)
Received: from t46lp57.lnxne.boe (unknown [9.152.108.100])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id DCD4A52051;
 Tue, 25 Jan 2022 12:29:14 +0000 (GMT)
From: Nico Boehr <nrb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH qemu] s390x: sck: load into a temporary not into in1
Date: Tue, 25 Jan 2022 13:29:14 +0100
Message-Id: <20220125122914.567599-1-nrb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KRxqDOvoE6pHizKyx_EAa8yxpDmr6S8I
X-Proofpoint-ORIG-GUID: WcGOCJE45nR-JYG7_Y-bXXO0gb43Zp1e
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-25_02,2022-01-25_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 mlxlogscore=865
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201250078
Received-SPF: pass client-ip=148.163.158.5; envelope-from=nrb@linux.ibm.com;
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
Cc: linux-s390@vger.kernel.org, thuth@redhat.com, richard.henderson@linaro.org,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We previously loaded into in1, but in1 is not filled during
disassembly and hence always zero. This leads to an assertion failure:

  qemu-system-s390x: /home/nrb/qemu/include/tcg/tcg.h:654: temp_idx:
  Assertion `n >= 0 && n < tcg_ctx->nb_temps' failed.`

Instead, load into a temporary and pass that to the helper.

This fixes the SCK test I sent here under TCG:
<https://www.spinics.net/lists/kvm/msg265169.html>

Signed-off-by: Nico Boehr <nrb@linux.ibm.com>
---
 target/s390x/tcg/translate.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 46dea733571e..dc0baec5a5f4 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -4290,9 +4290,16 @@ static DisasJumpType op_stcke(DisasContext *s, DisasOps *o)
 #ifndef CONFIG_USER_ONLY
 static DisasJumpType op_sck(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_qemu_ld_i64(o->in1, o->addr1, get_mem_index(s), MO_TEUQ | MO_ALIGN);
-    gen_helper_sck(cc_op, cpu_env, o->in1);
+    TCGv_i64 t1;
+
+    t1 = tcg_temp_new_i64();
+
+    tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_TEUQ | MO_ALIGN);
+    gen_helper_sck(cc_op, cpu_env, t1);
     set_cc_static(s);
+
+    tcg_temp_free_i64(t1);
+
     return DISAS_NEXT;
 }
 
-- 
2.31.1


