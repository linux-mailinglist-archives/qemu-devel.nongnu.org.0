Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B936A3C17A8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:01:35 +0200 (CEST)
Received: from localhost ([::1]:36864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XP4-0004bZ-PX
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5G-0001nX-T9
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:07 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5B-0008Cc-JE
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:06 -0400
Received: by mail-pg1-x52b.google.com with SMTP id v7so6622142pgl.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ecRVVJ3PnvHarcdzmtFHD+/SxpG+hJSwypTpiV6o5c4=;
 b=yhKtwvdBIQ5Ny4Gkh8MZRdurVNZs5Q4H8WYIxjVCLMQTzSVPXb8kd74k+zKzJt0svO
 1X1jLkkVHeJG2vMxEXhMl7UZFh8D4KBYX0OF5bLnb11oOLdO9l6PhuN3Ic/YJM13A5NR
 tdUfqp9k0w1BDa9I4uXTGjK2oCDnyQotgi+h8BSywxEo8HHLM9C00CEQbiuQp5YVYxxV
 h2ABc7GZsz3NxObx+sEBJnuMXyW4HWWqHyzSoesFB27ZishyuDn6P/FGVQM2DB9YYm8+
 /Q82KiLVuEU8X8JS9nmKFNgb6Q1vrSKGwQzy8TkoapQGDa28I0Sjo3jO+x26kHQI+psX
 EXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ecRVVJ3PnvHarcdzmtFHD+/SxpG+hJSwypTpiV6o5c4=;
 b=CfNShhi6gdcVfbBf4Gvlt6+gJsQRihALZcRHr2ZpaISWVNHyWi6lBhSK6hZzAQj/WW
 5S29dKWlXKW/NkARM+3XoRoFlEmd6YctRVbRA+d7DNdlrC3FGat8Fn2NcsDwpP4zlaf7
 DWRw8IkgRMzEdJR1xLoUNNP8O8adoN076po1kou4F/ttHreDvB5fXu1VIDxfD7vbPFP4
 jvau7x0QDagesujkNqwwcCWOtbSvcQDjzg4odnGLB+KJhBCvMOXTvVWihViQjZu2lB/8
 LuKgho2DavOAx2Umb6V6HKLgNVKEFNkKD24AU9P6zvD14yfaEe8i0hCios+AuAF4UBAL
 PM3g==
X-Gm-Message-State: AOAM5310pSLnETLm+ayekEVoNLcNlmyQIMsRQFRSyaH5qWtA2pUxpGSL
 EHLcP2ytnIubtyrDO1J7q+biL0j7JgTSzA==
X-Google-Smtp-Source: ABdhPJxQ451cZ9OoiMymtbWj2KYaahHylnV8ar9qvoxccaEBBFbxMHapY1lGYV41is4kGEOy/YKoDA==
X-Received: by 2002:a63:3dcb:: with SMTP id
 k194mr32700785pga.202.1625762460462; 
 Thu, 08 Jul 2021 09:41:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:41:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/28] target/nios2: Use translator_use_goto_tb
Date: Thu,  8 Jul 2021 09:40:39 -0700
Message-Id: <20210708164050.711967-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 930f3d3395..17742cebc7 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -150,24 +150,11 @@ static void t_gen_helper_raise_exception(DisasContext *dc,
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
-static bool use_goto_tb(DisasContext *dc, uint32_t dest)
-{
-    if (unlikely(dc->base.singlestep_enabled)) {
-        return false;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    return (dc->base.pc_first & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
 static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
 {
     const TranslationBlock *tb = dc->base.tb;
 
-    if (use_goto_tb(dc, dest)) {
+    if (translator_use_goto_tb(&dc->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_tl(cpu_R[R_PC], dest);
         tcg_gen_exit_tb(tb, n);
-- 
2.25.1


