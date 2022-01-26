Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A15649C573
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 09:44:41 +0100 (CET)
Received: from localhost ([::1]:40022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCduy-0006zh-90
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 03:44:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nrb@linux.ibm.com>) id 1nCdsk-0005CY-FN
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 03:42:22 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nrb@linux.ibm.com>) id 1nCdsg-0002kN-4L
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 03:42:21 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20Q7fnFA025456; 
 Wed, 26 Jan 2022 08:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=p+YI+iN3bc/74H1C+T2icE0+x3L7F1FZU4LF2apsySc=;
 b=h4z6/3E8gRfgo0G4Sd76bLBVQ6uqMfLYmGSdLDUsN15h8PUGDeFtnLhriPjLhdNTvAyG
 yWtCCgjXzM35PJ46mmNX0kXy0+lvpd7llNpQr4vbyapgBNkvErleSaMX1tKEmNCUEFry
 /ciOQE8RsRs1Xwr86miZ2zcAlc5pGK4F2MWACngvBXV2lPu8GLTVtXWvN6o69ZC2EI54
 WO/Q94FPeHr/zNiyuwLaZJRD1JE1rzIBrG8eVMg/Pv+JlAYNo8x67ONPAifh52v8i5Nb
 I0DttRbb71GD3dVFyd05w6w0bIxozpx4hishi5ZhGaqwofxkwfCvZRzgDDrA3XtPAg+Q KQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3du24s92wq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 08:42:07 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20Q8QIFs025307;
 Wed, 26 Jan 2022 08:42:07 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3du24s92vr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 08:42:07 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20Q8fuZl014897;
 Wed, 26 Jan 2022 08:42:05 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3dr9j9caet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 08:42:04 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20Q8g2EN31392034
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 08:42:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AB7A5204F;
 Wed, 26 Jan 2022 08:42:02 +0000 (GMT)
Received: from t46lp57.lnxne.boe (unknown [9.152.108.100])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 03A415204E;
 Wed, 26 Jan 2022 08:42:01 +0000 (GMT)
From: Nico Boehr <nrb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH qemu v2] s390x: sck: load into a temporary not into in1
Date: Wed, 26 Jan 2022 09:42:01 +0100
Message-Id: <20220126084201.774457-1-nrb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dswzQ1BNB8KJRcftcFiFlw7WgODVlTUy
X-Proofpoint-GUID: FNRvmUGG6LpYsYHwcG3wbjrR6AjvTaRp
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-26_02,2022-01-25_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201260049
Received-SPF: pass client-ip=148.163.156.1; envelope-from=nrb@linux.ibm.com;
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

Instead, use in2_la2_m64a to load from storage into in2 and pass that to
the helper, which matches what we already do for SCKC.

This fixes the SCK test I sent here under TCG:
<https://www.spinics.net/lists/kvm/msg265169.html>

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Nico Boehr <nrb@linux.ibm.com>
---
 target/s390x/tcg/insn-data.def | 2 +-
 target/s390x/tcg/translate.c   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index 3e5594210c88..848a9c9e622f 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -1317,7 +1317,7 @@
 /* SET ADDRESS SPACE CONTROL FAST */
     F(0xb279, SACF,    S,     Z,   0, a2, 0, 0, sacf, 0, IF_PRIV)
 /* SET CLOCK */
-    F(0xb204, SCK,     S,     Z,   la2, 0, 0, 0, sck, 0, IF_PRIV | IF_IO)
+    F(0xb204, SCK,     S,     Z,   0, m2_64a, 0, 0, sck, 0, IF_PRIV | IF_IO)
 /* SET CLOCK COMPARATOR */
     F(0xb206, SCKC,    S,     Z,   0, m2_64a, 0, 0, sckc, 0, IF_PRIV | IF_IO)
 /* SET CLOCK PROGRAMMABLE FIELD */
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index dcc249a197ce..7fb87cd9f3b7 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -4295,8 +4295,7 @@ static DisasJumpType op_stcke(DisasContext *s, DisasOps *o)
 #ifndef CONFIG_USER_ONLY
 static DisasJumpType op_sck(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_qemu_ld_i64(o->in1, o->addr1, get_mem_index(s), MO_TEQ | MO_ALIGN);
-    gen_helper_sck(cc_op, cpu_env, o->in1);
+    gen_helper_sck(cc_op, cpu_env, o->in2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
-- 
2.31.1


