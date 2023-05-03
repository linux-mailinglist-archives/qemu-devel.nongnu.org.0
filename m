Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9926F50EC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:14:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6bY-0002qs-3g; Wed, 03 May 2023 03:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ab-0007V7-0o
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:07:49 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a6-0005lo-Nv
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:07:48 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2f95231618aso2891790f8f.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097636; x=1685689636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FTTMHsLpwQYpWnG78YNnZ0NpPI0wmyIkbfAohw2iqQs=;
 b=EE/BdF3LUZn0+RFbj9eD8sRo31AJoIRhtSAp1qW8WgHvbz6cWjryCZWl8nq9rpnDRk
 RrDVLl6XCN+F24/viQwtm1H6beKrAY8RlN/ZiX93tE96zG8xPRuPnKx0J6XH6a99f3nR
 O5m5UbYfpKCocJPxjPxyRpte0wTyFHTj25W11r+hlVHP10tannfDNwWZyxp5EFVQ0GSK
 c48pYlXwQJbyxhPewnacqF1ZDwwk/3C/0hx6lDSi2wPp+EbXauhUXVj91KnLdMQXsY6T
 9lZHYgVYmY+s3fqK9GKBZOWIfW3KyU63sj1DZLPbftXKwuLIkJbjEsig0ZQB+XwKlZlg
 cGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097636; x=1685689636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FTTMHsLpwQYpWnG78YNnZ0NpPI0wmyIkbfAohw2iqQs=;
 b=IJKZTI3YsGMNX1hK7GcQJrODB+uaCxk0vbULO2iicvt0sDOrM1NdA9awPOH18FIwts
 8sE7Plljul4XbPGHrPUmPkifrpBOB8ZiRiGIRzX0ze9a4TcISaAPoOUBQGBn5jEAlttg
 JPNFtSomMloNPvfTJWkjoB1dSJZ0cQixLnSIG2idBbqLtD5B1G3GTjpqYdi6PVSJC2W3
 8MBLo5dAeIhWndePkcEuMQvG5pYoHWycsXVqlriJso+mDlb8L9WTPKPy/T3jP9Ceo6x9
 jPG+u5bPnjihqdxzAYi+MWE21WBh3pFGzEZWDPpDucEFuUwGsgxKjiqQT+iSSrnT9tRm
 AUHQ==
X-Gm-Message-State: AC+VfDwQJ5dLGXeQcc94PT0t4IN57gwFByAcAcLiEZkZsxLxs89bBFZO
 gToLZnbvlCPew1Uwe9qvsCbuEz246peXiCRAF6FKAQ==
X-Google-Smtp-Source: ACHHUZ6c4Mzd6GLwlanmiAR3+aXn9UobaRCR6sP8Ksof71FxQXDV5yZB/eHspRsRhZECSvFDRAlHYw==
X-Received: by 2002:adf:e881:0:b0:306:30e0:ba44 with SMTP id
 d1-20020adfe881000000b0030630e0ba44mr5007513wrm.6.1683097636502; 
 Wed, 03 May 2023 00:07:16 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 25/57] tcg/riscv: Use full load/store helpers in user-only
 mode
Date: Wed,  3 May 2023 08:06:24 +0100
Message-Id: <20230503070656.1746170-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 8ed0e2f210..19cd4507fb 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -846,7 +846,6 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
  * Load/store and TLB
  */
 
-#if defined(CONFIG_SOFTMMU)
 static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
 {
     tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, 0);
@@ -893,34 +892,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_goto(s, l->raddr);
     return true;
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    /* resolve label address */
-    if (!reloc_sbimm12(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-        return false;
-    }
-
-    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_A1, l->addrlo_reg);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
-
-    /* tail call, with the return address back inline. */
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_RA, (uintptr_t)l->raddr);
-    tcg_out_call_int(s, (const void *)(l->is_ld ? helper_unaligned_ld
-                                       : helper_unaligned_st), true);
-    return true;
-}
-
-static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-#endif /* CONFIG_SOFTMMU */
 
 /*
  * For softmmu, perform the TLB load and compare.
-- 
2.34.1


