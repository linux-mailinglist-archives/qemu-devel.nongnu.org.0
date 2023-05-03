Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707CD6F50F7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:15:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6dm-0004GB-Lp; Wed, 03 May 2023 03:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dL-0002qO-F6
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:10:46 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dH-00074t-UV
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:10:38 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f1763ee8f8so30940305e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097834; x=1685689834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IuwWU1uPieHcXl9aK8i752yth75yKtHblQaohZpSR+k=;
 b=y92PkcNOpzq+QHGKF1ZrxtDQYUzUeOSQwnRrPHcw2qxlOgHljRVQcn8iZJ8frAW2b6
 93Xmrk+Dx9CZ+oJ+zLgDiAzaixPD7GHC1QcYSHRA5XRycAAW/HKpcyanbgjLcPltfxM8
 ApnJMF6msIP1GtZ4ITEOgutPWlizglZ8bOgwXGcUYRoYq085NBvlTRlzypg6KRUpdYgN
 aPjxV7GsMk4T1Bo6aq7flRTQcozgzPWnKnniaCyfUFhGqeVyZ1jpEYAy49By+I2nXxWP
 srnyOPWtLjA/+18WD3ABDj6uvuIMo/afJlYGx9znIPEYksIVLsrseNXYe+IyY9O9cbde
 xUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097834; x=1685689834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IuwWU1uPieHcXl9aK8i752yth75yKtHblQaohZpSR+k=;
 b=hm45V+KzS0Acd3FwucpF3h2k2l86/5kz1s+HVdZzXsbprzNpDi7hQrT0tn4uo7n6JW
 ZwGHb4dwgozi0IGYmZnOovk07t9/Gjgzt7B44sXI1YiKEfC2PbT6DbF8v4+VNFUlfR+L
 8nOc8S7Y5QgLeTtoNdBEs51S512V8Nz2YmnSxBEwR1sDRdCKDRTf+lItYqaYsLicy4PR
 9O/KAfmm8s/eHnj0pMgnEqeVbMHKB44Heo5nxKJqWUuI7BBH8haSjN9uqPNv4RwLUmOe
 b4nTsXeG//Fl3vkfx/cpDtxqrko9FAszx+DtMv2THF+vO3QAkti94VOQFxbs0z2N4qMM
 LP7w==
X-Gm-Message-State: AC+VfDwSLQjlt9pSwmfd8XfuA74KNgOVrIUHM0PuzoHsxYB1S7fJHmBb
 02j3zMaZ13VXvkL+0jS5y8zLnJQi0rdMofBg08faFg==
X-Google-Smtp-Source: ACHHUZ49isjk+60aeAYgXdpcIbeFFKV9lpdIO+pfJjqpiBPanr5EL1lis8OQ5KNdlyR8wScsKFOogA==
X-Received: by 2002:a7b:c85a:0:b0:3f0:9e2b:22de with SMTP id
 c26-20020a7bc85a000000b003f09e2b22demr14347444wml.22.1683097834050; 
 Wed, 03 May 2023 00:10:34 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 48/57] tcg/ppc: Use atom_and_align_for_opc
Date: Wed,  3 May 2023 08:06:47 +0100
Message-Id: <20230503070656.1746170-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index f0a4118bbb..60375804cd 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2034,7 +2034,22 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
+    MemOp a_bits, atom_a, atom_u;
+
+    /*
+     * Book II, Section 1.4, Single-Copy Atomicity, specifies:
+     *
+     * Before 3.0, "An access that is not atomic is performed as a set of
+     * smaller disjoint atomic accesses. In general, the number and alignment
+     * of these accesses are implementation-dependent."  Thus MO_ATOM_IFALIGN.
+     *
+     * As of 3.0, "the non-atomic access is performed as described in
+     * the corresponding list", which matches MO_ATOM_SUBALIGN.
+     */
+    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
+                                    have_isa_3_00 ? MO_ATOM_SUBALIGN
+                                                  : MO_ATOM_IFALIGN,
+                                    false);
 
 #ifdef CONFIG_SOFTMMU
     int mem_index = get_mmuidx(oi);
-- 
2.34.1


