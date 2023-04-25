Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 096C56EE867
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:42:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOXo-0002cs-Ve; Tue, 25 Apr 2023 15:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOXn-0002ca-GV
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:41:43 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOXX-0007Gx-MU
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:41:43 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4edcdfa8638so6745678e87.2
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451686; x=1685043686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VhQ4va+L9W76HQPa92crHAm/u67MMsKKHsaZ1OacYxI=;
 b=tcgRlDw6ECIOkgdNni+h2heGVFiX9cdS6dn2eQ75VTg7UFOR0S2Jv0RNtS3C0Sgg2g
 343A006kqSjq/4NrAs8sbl90RQPN2O2yHOYfkcdMTpVBrJOvSB1NOFkqe827Pvaxq4Ot
 /Qpvz6TqZBss7eH9JeHgOoHTasNA8gLJaHw9rx/afpWOKMpsUtApdlogPE8SGxN1euN7
 8yYPJeR7ccOFuKRWCR4Fcv4j7OE/1QCO+W2e0hCFErdlXOAM9Z9WoEk7WAR1/s90CPs/
 3mPFqnX/i1dhPI2+SlNanUC99J1xe7tc8lx1DI/3crRiiDcqVpTD2ihCNIaqFOSD1NZd
 L4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451686; x=1685043686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VhQ4va+L9W76HQPa92crHAm/u67MMsKKHsaZ1OacYxI=;
 b=DszPUjS9D6AGG7NBIXTdcAfzduLV5Z2AvhbIWY8eYkzZoyYJhzDq/OauCYxTWktm9Q
 V0OcuOqYBAP21V6sOuA8cg7ehHAyW0qvmHdSJUcbgDsp29+ALUIfQmrNFJRYi2iVddJG
 v4hwDOXFlqKzRzmTaWZW/MrYeD0Wksb8eMoPVMh5O+/bipIPvOVYR+eXXS4l8jtjUyYt
 GmmWkIpQoh30GN5W9I3iv9l/ubHpvq4aec0Jl8Vr7UrK/2qAQB3EljUse+gkpEKmajFT
 N0r7IBohtd+o2ny33NFAk8i23BvJyCNX6YlKy+v1FMXFPTj8VOhGq9pIb5Aq3WI/5ssc
 VqYw==
X-Gm-Message-State: AAQBX9cHgxRakoLnXqcpIY1hDPyXPKQlKI61BdDspNG7dFYOopg0y0Sv
 gKuo2odKmMqXMo7TjActWXgaiyiVrulx16q3KeO5zg==
X-Google-Smtp-Source: AKy350YMYpCNeiK7zqKFInkZqC6bZRtNwu4O8wsNFs7RsXy5CjyodYUX+3PiTYmvpy5c/2eQK2uclQ==
X-Received: by 2002:ac2:4563:0:b0:4ec:8b57:b018 with SMTP id
 k3-20020ac24563000000b004ec8b57b018mr4377425lfm.33.1682451686253; 
 Tue, 25 Apr 2023 12:41:26 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac25448000000b004ec55ac6cd1sm2175662lfn.136.2023.04.25.12.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:41:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 46/57] tcg/loongarch64: Use atom_and_align_for_opc
Date: Tue, 25 Apr 2023 20:31:35 +0100
Message-Id: <20230425193146.2106111-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
 tcg/loongarch64/tcg-target.c.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 62bf823084..43341524f2 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -826,6 +826,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 typedef struct {
     TCGReg base;
     TCGReg index;
+    MemOp align;
+    MemOp atom;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -845,7 +847,11 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
+    MemOp a_bits, atom_u;
+
+    a_bits = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
+                                    MO_ATOM_IFALIGN, false);
+    h->align = a_bits;
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
-- 
2.34.1


