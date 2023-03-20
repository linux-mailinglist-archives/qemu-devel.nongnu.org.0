Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBC96C128F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:04:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFBA-0001GM-Hh; Mon, 20 Mar 2023 09:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFB7-0001Fb-RN
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:03:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFB5-0006El-0G
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:03:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679317434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rtxgh4HwOam0+QR9nCTbVkGVvs2Tub+N3ghGni4Pjm0=;
 b=Nm5WNZ/OOuflg52DV+HXbdYsK4bvRCCCGEwey1KhutOmjRv/kGQYg8uJhBN1Wro9oaWP4y
 Y16i1o3xnp3kYm7EtfoICkjJ8Xdt+tKrMpGquQ4qRvqmi952/uRVtVtOwFdToXmIjCJ+bE
 mM+0nW+VBIiaEQuSoS3sb5wzY1APG7I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-k2Q_fLmCNJqdaiBeZLWxWg-1; Mon, 20 Mar 2023 09:03:51 -0400
X-MC-Unique: k2Q_fLmCNJqdaiBeZLWxWg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81819100DECC;
 Mon, 20 Mar 2023 13:03:50 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C8FDC15BAD;
 Mon, 20 Mar 2023 13:03:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 13/24] target/s390x: Handle LLGFRL from non-aligned addresses
Date: Mon, 20 Mar 2023 14:03:19 +0100
Message-Id: <20230320130330.406378-14-thuth@redhat.com>
In-Reply-To: <20230320130330.406378-1-thuth@redhat.com>
References: <20230320130330.406378-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Use MO_ALIGN and let do_unaligned_access() generate a specification
exception.

Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Suggested-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230316164428.275147-6-iii@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/insn-data.h.inc | 6 +++---
 target/s390x/tcg/translate.c     | 3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-data.h.inc
index 5aff4c0873..3abd2dbedd 100644
--- a/target/s390x/tcg/insn-data.h.inc
+++ b/target/s390x/tcg/insn-data.h.inc
@@ -502,16 +502,16 @@
     C(0xc405, LHRL,    RIL_b, GIE, 0, ri2, new, r1_32, ld16s, 0)
     C(0xc404, LGHRL,   RIL_b, GIE, 0, ri2, r1, 0, ld16s, 0)
 /* LOAD HIGH */
-    C(0xe3ca, LFH,     RXY_a, HW,  0, a2, new, r1_32h, ld32u, 0)
+    D(0xe3ca, LFH,     RXY_a, HW,  0, a2, new, r1_32h, ld32u, 0, 0)
 /* LOAG HIGH AND TRAP */
     C(0xe3c8, LFHAT,   RXY_a, LAT, 0, m2_32u, r1, 0, lfhat, 0)
 /* LOAD LOGICAL */
     C(0xb916, LLGFR,   RRE,   Z,   0, r2_32u, 0, r1, mov2, 0)
-    C(0xe316, LLGF,    RXY_a, Z,   0, a2, r1, 0, ld32u, 0)
+    D(0xe316, LLGF,    RXY_a, Z,   0, a2, r1, 0, ld32u, 0, 0)
 /* LOAD LOGICAL AND TRAP */
     C(0xe39d, LLGFAT,  RXY_a, LAT, 0, a2, r1, 0, llgfat, 0)
 /* LOAD LOGICAL RELATIVE LONG */
-    C(0xc40e, LLGFRL,  RIL_b, GIE, 0, ri2, r1, 0, ld32u, 0)
+    D(0xc40e, LLGFRL,  RIL_b, GIE, 0, ri2, r1, 0, ld32u, 0, MO_ALIGN)
 /* LOAD LOGICAL CHARACTER */
     C(0xb994, LLCR,    RRE,   EI,  0, r2_8u, 0, r1_32, mov2, 0)
     C(0xb984, LLGCR,   RRE,   EI,  0, r2_8u, 0, r1, mov2, 0)
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 8f6202bc9c..756afc2928 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2777,7 +2777,8 @@ static DisasJumpType op_ld32s(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_ld32u(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_qemu_ld32u(o->out, o->in2, get_mem_index(s));
+    tcg_gen_qemu_ld_tl(o->out, o->in2, get_mem_index(s),
+                       MO_TEUL | s->insn->data);
     return DISAS_NEXT;
 }
 
-- 
2.31.1


