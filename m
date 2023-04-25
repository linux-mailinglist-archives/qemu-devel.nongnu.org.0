Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ADF6EE86C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:43:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOXS-0002BK-FE; Tue, 25 Apr 2023 15:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOXP-00028r-0v
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:41:19 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOXM-0007DO-1J
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:41:18 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4ec816d64afso26828388e87.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451674; x=1685043674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xNYQj2Zg5TENytieXxeMxebRkQ90woYbMY4x/xns2OM=;
 b=PMMjqVVqIk1Nm6j4pJLL3nLW0EB4bWKzxY8fL79gc6G+4Ln3fvLbqBaGsGPno69vOy
 qRqhQrYgJbmlViPBoqrYCQlca90TjjWdHMx0ck6IjbOL7NeASL1n222gusSS5TZvyv/N
 K/+fehDco33dv3mjqI4tkANgWJdeeMJR6B6f0ApNkkromV/BqLQBp5nOWxVwniPZLxcF
 wJ92zj7XTOMuG0FBUjvUansCU2i4pgez075ZFIRKdVZSSFwkl7BnpPEfB85SgShJWZyM
 3OcesGy9hRXaFeF3GAGmEYHFqUkZCU/B467Mgl6yHfgLhurXXoP03o+o4SrLFzJvJRSA
 rDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451674; x=1685043674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xNYQj2Zg5TENytieXxeMxebRkQ90woYbMY4x/xns2OM=;
 b=kn7odfReboaOMPWwKD7OyLFxK0/XTMwnd9W31svu+5k4BX9H3tyV3ULZ80HLRTBAhg
 2TKMJwGUvfd2zH4IO05aQZbwJE7BwW3vpq/fzZDXENn9vVBxc0F21UBgyQL18zVR+TaS
 oIwTfqaeIRLESyUFTnrhX4dqiUZufSg27upnfXWan31WVQVRN1wgvO3qhWJFH4w4cm45
 NNc4jOP7kY9L5prRatJZ+/fvIOI/kZonUONSxjWbIz0THD+ajnSJs+N48WK1AMWgy7zj
 p0n2R1zkkgr4N9QKkQSlX4pf/XqwYNTv7PSOrZZ9NjKikor8NfrQ+IuvrrBY8hx97rh0
 Ha+w==
X-Gm-Message-State: AC+VfDz7sWvfXEqwAFXz19eOqUVBFINFBsfk2O4542WO4RVbPSGIOO8+
 m00ymwAn4VvLhoXj5NjwzvZiZF15G3OjGMgba51IzA==
X-Google-Smtp-Source: ACHHUZ5CWthZrfeTOjFe21N7XKEZySe/FsL7UQ5E7j6qQJ+giwKPXP6xoQ6gmSy8TspYdRo8QfQpQw==
X-Received: by 2002:ac2:4a68:0:b0:4eb:438b:de16 with SMTP id
 q8-20020ac24a68000000b004eb438bde16mr6652lfp.15.1682451674571; 
 Tue, 25 Apr 2023 12:41:14 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac25448000000b004ec55ac6cd1sm2175662lfn.136.2023.04.25.12.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:41:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 45/57] tcg/arm: Use atom_and_align_for_opc
Date: Tue, 25 Apr 2023 20:31:34 +0100
Message-Id: <20230425193146.2106111-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x135.google.com
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

No change to the ultimate load/store routines yet, so some atomicity
conditions not yet honored, but plumbs the change to alignment through
the relevant functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index e5aed03247..edd995e04f 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1323,6 +1323,8 @@ typedef struct {
     TCGReg base;
     int index;
     bool index_scratch;
+    MemOp align;
+    MemOp atom;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1379,8 +1381,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    MemOp a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1 << a_bits) - 1;
+    MemOp a_bits, atom_a, atom_u;
+    unsigned a_mask;
+
+    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
+                                    MO_ATOM_IFALIGN, false);
+    a_mask = (1 << a_bits) - 1;
 
 #ifdef CONFIG_SOFTMMU
     int mem_index = get_mmuidx(oi);
@@ -1498,6 +1504,9 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     };
 #endif
 
+    h->align = a_bits;
+    h->atom = atom_a;
+
     return ldst;
 }
 
-- 
2.34.1


