Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E136F50E8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:13:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6di-0003io-0D; Wed, 03 May 2023 03:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dL-0002qP-Mb
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:10:46 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dF-000720-Qb
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:10:38 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f4000ec71dso102175e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097830; x=1685689830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ml1dYN+0ocahvRRJROPmQB5pqTLfE2AuSNUfwF2mFh4=;
 b=Cbap4TH6dsr8ok1n7INwlJqpkcBV955R8zccU9z6DmiHHMsVI5BS0sDDMmmCSzjAuv
 W04XImevlf9hVXvlajHYaOxnEvXmHyaCydk/Dd6pk2OXQSI0bvQZd1AFUebjFrJI+ejS
 5dJngeFP1fZCXxobrXc7a0H2Uha3gx0k/Heutdc+OParUGkfDiQ740riOy/ankCRg6Sc
 UJv3zWjUIU/KqPNfUieZdtpIg5PeX1nGBQNoO9hDI6FSYD7DbMn+I1LSn9ndB3iJ2Qrk
 pgympACo+yobu4fYb1vUwNj0xrXnTn5LqF2OKZmhN1h3WHsaJYYyXjCDY1Z/Pl3hF4Tm
 cXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097830; x=1685689830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ml1dYN+0ocahvRRJROPmQB5pqTLfE2AuSNUfwF2mFh4=;
 b=Jv4ACvGVppd7uh7kPLycexGkRLyY7iqc173WO519idqOilblHmEab8ny6qmVYC5/oZ
 ysKxBBi6zBKjBpoNgjuzSwarJbrB0bgxjFab8cVWj0bJBjsKitoQC7mw1hvT5vjC6+bg
 nj/C863iclzuaQ9GkPgMDEi4hU3s1x7Kvg/X79sWz9uu59VbZakgMOEhHKStMcQSAAOx
 0bVvRzwTVHnc26lDUS15e6u26Bzrs8JUwtSRQbZ5DgtYBOsi4JvijSjeUhpva4KTf5uh
 hNQoRANlz0Yo0apunemrvCqNa016G1o8z69hT9R+yEfL63qNG3mUJAswV1CY4ZF7mkRp
 jN4g==
X-Gm-Message-State: AC+VfDyHODjm8fI6kX2BhZwzyhZQ+OJ2LTSsDwR8DjHcZ/CFRKAw9Pez
 yULL+G9iBaIyLC3Q81EP6mT7vQbQHVQfzXbmz1ih8g==
X-Google-Smtp-Source: ACHHUZ6SOtyN8g6EHm89zMDUjjC/7KOW1Spv50Anlc05HK5F9wiL0NIMP11QZmBWGgjADCVdTbFJsA==
X-Received: by 2002:a1c:6a18:0:b0:3f1:7372:f98f with SMTP id
 f24-20020a1c6a18000000b003f17372f98fmr13373219wmc.41.1683097829891; 
 Wed, 03 May 2023 00:10:29 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 42/57] tcg: Introduce atom_and_align_for_opc
Date: Wed,  3 May 2023 08:06:41 +0100
Message-Id: <20230503070656.1746170-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Examine MemOp for atomicity and alignment, adjusting alignment
as required to implement atomicity on the host.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 3905d3041c..2422da64ac 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -220,6 +220,11 @@ static void * const qemu_st_helpers[MO_SIZE + 1] __attribute__((unused)) = {
 #endif
 };
 
+static MemOp atom_and_align_for_opc(TCGContext *s, MemOp *p_atom_a,
+                                    MemOp *p_atom_u, MemOp opc,
+                                    MemOp host_atom, bool allow_two_ops)
+    __attribute__((unused));
+
 TCGContext tcg_init_ctx;
 __thread TCGContext *tcg_ctx;
 
@@ -5123,6 +5128,70 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     }
 }
 
+/*
+ * Return the alignment and atomicity to use for the inline fast path
+ * for the given memory operation.  The alignment may be larger than
+ * that specified in @opc, and the correct alignment will be diagnosed
+ * by the slow path helper.
+ */
+static MemOp atom_and_align_for_opc(TCGContext *s, MemOp *p_atom_a,
+                                    MemOp *p_atom_u, MemOp opc,
+                                    MemOp host_atom, bool allow_two_ops)
+{
+    MemOp align = get_alignment_bits(opc);
+    MemOp atom, atmax, atmin, size = opc & MO_SIZE;
+
+    /* When serialized, no further atomicity required.  */
+    if (s->gen_tb->cflags & CF_PARALLEL) {
+        atom = opc & MO_ATOM_MASK;
+    } else {
+        atom = MO_ATOM_NONE;
+    }
+
+    atmax = opc & MO_ATMAX_MASK;
+    if (atmax == MO_ATMAX_SIZE) {
+        atmax = size;
+    } else {
+        atmax = atmax >> MO_ATMAX_SHIFT;
+    }
+
+    switch (atom) {
+    case MO_ATOM_NONE:
+        /* The operation requires no specific atomicity. */
+        atmax = atmin = MO_8;
+        break;
+    case MO_ATOM_IFALIGN:
+        /* If unaligned, the subobjects are bytes. */
+        atmin = MO_8;
+        break;
+    case MO_ATOM_WITHIN16:
+        /* If unaligned, there are subobjects if atmax < size. */
+        atmin = (atmax < size ? atmax : MO_8);
+        atmax = size;
+        break;
+    case MO_ATOM_SUBALIGN:
+        /* If unaligned but not odd, there are subobjects up to atmax - 1. */
+        atmin = (atmax == MO_8 ? MO_8 : atmax - 1);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    /*
+     * If there are subobjects, and the host model does not match, then we
+     * need to raise the initial alignment check.  If the backend is prepared
+     * to double-check alignment and issue two half size ops, we need not
+     * raise initial alignment beyond half.
+     */
+    if (atmin > MO_8 && host_atom != atom) {
+        align = MAX(align, size - allow_two_ops);
+    }
+
+    *p_atom_a = atmax;
+    *p_atom_u = atmin;
+    return align;
+}
+
 /*
  * Similarly for qemu_ld/st slow path helpers.
  * We must re-implement tcg_gen_callN and tcg_reg_alloc_call simultaneously,
-- 
2.34.1


