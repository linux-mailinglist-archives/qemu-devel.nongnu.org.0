Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13EF6EE8AE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:52:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOXm-0002c2-S7; Tue, 25 Apr 2023 15:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOXk-0002ap-KN
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:41:40 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOXh-0007JL-Uy
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:41:40 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4efe9a98736so3900988e87.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451696; x=1685043696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4sDcHMsV6UnaIVOp+Xo/707fzlwAwqK9fjYxSZbgJwQ=;
 b=YbVrfL7u9UzIC2n0oYc6ToWMnFhl4tYFCdP7c1XMnZUa2dwRrH9Y7NjFw5uqDi9b0s
 9jMFKrJYCBiM5e2X9BFkukePlpMFcT2LZPwLKvxKDfkriAvptsay0D06yKqeEW+GtdP/
 nuIioTiJBi/GLKrR1aSTV3L0+Ox+X4t859vp0dn8ckkSPxx6fanv4VcvMcr13TZ+Mvtj
 XwZCAr7oJucXTN5rTNmbkzUHQkix3C6Ytud9d9OcnEZUo5q2Ez7lCA4y3ZVL6QoJQZbn
 VCLkcVWiV3VO6dZeX310wwvPtdDvsCP793stlDDSSbPtQK2m6hbPqB8h4tvtR2Fg/TxK
 Rrbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451696; x=1685043696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4sDcHMsV6UnaIVOp+Xo/707fzlwAwqK9fjYxSZbgJwQ=;
 b=kTTHdfzbd0gzV+lFMaJuEgxAQI52NE3d8yfYP4lKRnt2z0TPN+UoJVG8UnDbbbQQGC
 eudatMvILIPYq5cazzlMv1m7mA58RQ7yUoEhl97jt8EWccHQnkkSzjZD2AEYXUc+1s8v
 zX0dNpRUNLZMvhZa7NjI8kmVMmadhIwQiCvZ19+igSky+lBf6tqJ9iCrFyi744mei8/7
 pSnWpTU8FZwpfwoII8sPJqfcETauBp3OIa5o/UtFJOjvo2LtQtS6lu3r96WfyihO8X0S
 ICcLREEdyBZ7QhlR0Jm/gwzrl4EX7Enjx8AQiZHU0gJyOXuihrsJ6gUevL5dfV3C0mt3
 F2ug==
X-Gm-Message-State: AAQBX9dMpzLQPibn5iLYYiuUwpjNlEXllplkZTYXdtTVywYwGEufrSar
 rNCZaOFLM3wU7No7eLFcvQeCVueCq5pkOmjIIL8kqg==
X-Google-Smtp-Source: AKy350YafrI7T+z4obJPVBRSgpM8cUh3N9aHfQxj/mJL/xw0V2wSqBpAlmpbvXoZXP5V9uHov8t5gg==
X-Received: by 2002:ac2:5975:0:b0:4ed:d1d6:c595 with SMTP id
 h21-20020ac25975000000b004edd1d6c595mr4841448lfp.55.1682451696540; 
 Tue, 25 Apr 2023 12:41:36 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac25448000000b004ec55ac6cd1sm2175662lfn.136.2023.04.25.12.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:41:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 48/57] tcg/ppc: Use atom_and_align_for_opc
Date: Tue, 25 Apr 2023 20:31:37 +0100
Message-Id: <20230425193146.2106111-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x134.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index c799d7c52a..743a452981 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2037,7 +2037,22 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
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


