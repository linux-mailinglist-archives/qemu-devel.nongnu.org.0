Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3388E6EE8AD
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:52:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOXq-0002eB-Uv; Tue, 25 Apr 2023 15:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOXp-0002ds-Ub
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:41:45 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOXo-0007Kb-EE
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:41:45 -0400
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2a8bb726210so59492911fa.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451703; x=1685043703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IwfQsco1hxF3XHjRYzbNyV4rrRWNhq8it3E+wHc4wxU=;
 b=mvExPJBCVtAUA1IGymCoo7ZSxMGWsopnTGT6rFxBaSur5n9mTmWe/O960ts99y5nKw
 LFVGz7mHvOurQnMDhxtYWstTqJPQGdlFgtOTgbXjgbbpue4NpFwhYdHrQf58llj8K3Ih
 dFsj0NC4ZrNYZtY7Kf3AV6C1wy671O1zXTlUvXkLvAsnghaOC24FY5cfTjcw9zlVoMco
 Azb/Ex70IqohHZkwtctPj61tggqHcp/bW4o0JBLVDyIjquplw0zuabGH0xK5dhIStHXd
 rTBFVBoScxtqVH6d7lenAnC9uh2a4SFCO/wTK+9OwbfchBrrku21Kn2tT1c2TAOk3yq1
 QOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451703; x=1685043703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IwfQsco1hxF3XHjRYzbNyV4rrRWNhq8it3E+wHc4wxU=;
 b=IlCEXywUDaFrWIN9l76fCBgHHRtkgvSpOvRWs1l/mfMbeCK/H099aGGmYLeT0nk4ap
 Qqbk86bWHSwTZGqeyfdxqU8wMuUGQTjz30UPk71dkoyFLl3n3ml/jReZ6r53xIbAGKwV
 UHW0o2lTbCoASYLYcwx94Dho3/o4GBceoayHMR0jXvrY46O+qu5K/x7KCppdzyS1t7gN
 yieKViEPvdC57fcFnLrcysCn+IDfxWh0VGcjmmFH7eZoFE4K1YLv9ZQIsy9xaifm5JSI
 W7aS/dtuuxY/lu1Ugh9pphV0+WcVxqpXaw+inrP467G+p4NGJIe7ZafNAWECOzoPIvhO
 S8Cw==
X-Gm-Message-State: AAQBX9cxS9TSad3Z6m29I/1zcfOpI9d36JjfWIb2DW8R2FKnZGimwt7r
 aeMhMfQdaOO2ajaHuk963giKl5DIb0RNVXRbvcJAtQ==
X-Google-Smtp-Source: AKy350aWkGQVHuE+hrXuduBs/WUQA0efnsftuDi0k2cTnnaBAEcmZ7jOZeuIBqfjnsYtJd0XNC5xTQ==
X-Received: by 2002:ac2:4910:0:b0:4ee:8ff3:c981 with SMTP id
 n16-20020ac24910000000b004ee8ff3c981mr4411726lfi.10.1682451702769; 
 Tue, 25 Apr 2023 12:41:42 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac25448000000b004ec55ac6cd1sm2175662lfn.136.2023.04.25.12.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:41:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 49/57] tcg/riscv: Use atom_and_align_for_opc
Date: Tue, 25 Apr 2023 20:31:38 +0100
Message-Id: <20230425193146.2106111-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x232.google.com
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
 tcg/riscv/tcg-target.c.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 5193998865..aae0512cbf 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -924,8 +924,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1u << a_bits) - 1;
+    MemOp a_bits, atom_a, atom_u;
+    unsigned a_mask;
+
+    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
+                                    MO_ATOM_IFALIGN, false);
+    a_mask = (1u << a_bits) - 1;
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
-- 
2.34.1


