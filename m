Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA7658FA56
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 11:59:24 +0200 (CEST)
Received: from localhost ([::1]:52382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM4yJ-0006rR-NL
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 05:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oM4v2-0002DP-MO; Thu, 11 Aug 2022 05:56:00 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17930
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oM4v1-0002gS-3v; Thu, 11 Aug 2022 05:56:00 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27B9HhEA001137;
 Thu, 11 Aug 2022 09:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=g7kIo5Xtkc/K15l0qE10cE/d0JfELTGvxEDQdM76Yo4=;
 b=FJV8/X53NjpJjcu5kngwLat5pMZl1wfTEdqbVsS3sBHZ1a+GcTxhk1yPmRciZUMpEcup
 0bOHPEeyJyBxiRNP8t7XR/onabaQG2tTZ/JrfjqBXU56Y6UVT6YdfYPoi4HiycmZjf+5
 mV32ymcb7xypCwpBRoLcazTi3KK+pF0aSaZ937vOz3nP6inJuLle+49ZayaNLw2AziTs
 UDAK3w3r596RvMyBo4y+jY7XRiGiqJYsckRf0exWOGjUWagQ9YuTQVtb7KS7J5JIzGeo
 /sEZsA8rT9eNe5brgGcKIR1oByKAIzXHdPll6l464zcNKSizB3U/4/L33B4Obb3WBYUX Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvy0qs578-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 09:55:43 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27B9rMmK007460;
 Thu, 11 Aug 2022 09:55:43 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvy0qs56h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 09:55:42 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27B9oQgS027371;
 Thu, 11 Aug 2022 09:55:40 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3huww2hv2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 09:55:40 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 27B9ttMQ27853222
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 09:55:55 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A69D6A404D;
 Thu, 11 Aug 2022 09:55:37 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1073CA4040;
 Thu, 11 Aug 2022 09:55:37 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.43.253])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Aug 2022 09:55:36 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 3/5] target/s390x: Make translator stop before the end of a
 page
Date: Thu, 11 Aug 2022 11:55:32 +0200
Message-Id: <20220811095534.241224-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220811095534.241224-1-iii@linux.ibm.com>
References: <20220811095534.241224-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 23aqnJ8D_aphR08iyGH7a-8Ib3uN07Lp
X-Proofpoint-GUID: UU2GTHDLLrBay0-xIyH5j-QAMfyTaGuX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 phishscore=0 mlxlogscore=966 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110027
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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

Right now translator stops right *after* the end of a page, which
breaks reporting of fault locations when the last instruction of a
multi-insn translation block crosses a page boundary.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/translate.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index e2ee005671..8e45a0e0d3 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6609,6 +6609,14 @@ static void s390x_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
     dc->insn_start = tcg_last_op();
 }
 
+static target_ulong get_next_pc(CPUS390XState *env, DisasContext *s,
+                                uint64_t pc)
+{
+    uint64_t insn = ld_code2(env, s, pc);
+
+    return pc + get_ilen((insn >> 8) & 0xff);
+}
+
 static void s390x_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     CPUS390XState *env = cs->env_ptr;
@@ -6616,10 +6624,9 @@ static void s390x_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 
     dc->base.is_jmp = translate_one(env, dc);
     if (dc->base.is_jmp == DISAS_NEXT) {
-        uint64_t page_start;
-
-        page_start = dc->base.pc_first & TARGET_PAGE_MASK;
-        if (dc->base.pc_next - page_start >= TARGET_PAGE_SIZE || dc->ex_value) {
+        if (!is_same_page(dcbase, dc->base.pc_next) ||
+            !is_same_page(dcbase, get_next_pc(env, dc, dc->base.pc_next)) ||
+            dc->ex_value) {
             dc->base.is_jmp = DISAS_TOO_MANY;
         }
     }
-- 
2.37.1


