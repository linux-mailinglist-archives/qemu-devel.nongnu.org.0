Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EAF6F5108
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:17:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6bm-0004jh-36; Wed, 03 May 2023 03:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6al-0008F7-S9
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:08:00 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aF-0005kw-Ao
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:07:59 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f19a80a330so29503455e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097636; x=1685689636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FBYlnrp5r0dnt/Qn2+Cyqv4p//zkrum+IysmcShvf5s=;
 b=fq/Q/Fim4Jowm2cI85zyikEMpFfBtR77DowUda/NBWVIKllP5uPYynmWMACj/xapBK
 HkORVmtzIauZfQZKyXLER4o3RKAN4JxudX8TsmCDFL2rS3yQ21r0vOpx7ZSJXvw2YYgc
 55zfYEudQgCg9K/p6KTj3Y+TP2ZwnUyg8IZQdsfq1abFo7Fw2BYJDFwaMscp4sB3nB4i
 p9jF2DvfwegHbBOnp2y13Y/Whh/46kBJSVThCByTUMofc9RR6tQUt+BLKO2M/r2zPJwq
 gUlvFe5ijZ09VWbSz6S86yCKKjnxaSqmepNrUXhfwhfbQSC4MiWfEez4yKu/vy1npTOV
 oMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097636; x=1685689636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FBYlnrp5r0dnt/Qn2+Cyqv4p//zkrum+IysmcShvf5s=;
 b=BN4D2nHzS0P4qGnBfcjw1bHhW/7sOrxlkUVGJEHEsWN1mPUbViCKHzug+ETvWb7wVM
 dlMOwMZV7Jx0ae6cPwNUJWSswo5RnPctRbixnJkqXr6vuhGNG9GdNoDeNgwHWGyFOf6V
 QQjzq3I+QSleGceEce6e1XPtTZEFIZ6g2zYzTmKMY0+u3wllwUmvo4dPLx74jymUvxHz
 xd1w4NYsaEbldLI97Hr4Xzmg9qhlKrj7eqaDBb0AX2PAa2+3A8diBeHLDwHeeMLCScvL
 mO/vs1RSWpu7pkgVh5bswUycU/fS9tlpeQJkM9RNHqBlAKSJZCLU4lGZm6Sj3rbkODRg
 CQFw==
X-Gm-Message-State: AC+VfDwnLqHBXyugkSORTyYv7woXV1weMdU2keiqatHMwlW+5ZJpsPy9
 UB+ZT1qPndV0TLlOnaaUYoEgO42msvO6LlV3lUrTjg==
X-Google-Smtp-Source: ACHHUZ7NfLUQqbQNba0cyh6AcA8PDoE2u264u5lzDLPVlMbdm2Nt1BygFq05MIa9HmwUKMed2CqY6A==
X-Received: by 2002:a05:600c:b54:b0:3f0:a785:f0e0 with SMTP id
 k20-20020a05600c0b5400b003f0a785f0e0mr13230204wmr.40.1683097635906; 
 Wed, 03 May 2023 00:07:15 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 24/57] tcg/loongarch64: Use full load/store helpers in
 user-only mode
Date: Wed,  3 May 2023 08:06:23 +0100
Message-Id: <20230503070656.1746170-25-richard.henderson@linaro.org>
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

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index d1bc29826f..e651ec5c71 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -783,7 +783,6 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
  * Load/store helpers for SoftMMU, and qemu_ld/st implementations
  */
 
-#if defined(CONFIG_SOFTMMU)
 static bool tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
 {
     tcg_out_opc_b(s, 0);
@@ -822,35 +821,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE], false);
     return tcg_out_goto(s, l->raddr);
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    /* resolve label address */
-    if (!reloc_br_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
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
-
-#endif /* CONFIG_SOFTMMU */
 
 typedef struct {
     TCGReg base;
-- 
2.34.1


