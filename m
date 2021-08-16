Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642A93EDED8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 22:56:06 +0200 (CEST)
Received: from localhost ([::1]:59278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFjeP-0007Dp-Fe
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 16:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFjaL-0000FC-VJ
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:51:53 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFjaK-00039Q-JD
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:51:53 -0400
Received: by mail-wr1-x42a.google.com with SMTP id z9so25328693wrh.10
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 13:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FKpak1M/4asc8KoNklCuXW/Sh+X7+tzXxt6gTH+Vi2g=;
 b=ZWmLG5ijxq0c8+Ou+tlOgIrNHs3JLCAw+cn0UYKtzWaR59c6BRmOa6bTc+SR9Xb3rH
 6JCv+p0rhabHQPwJli1wg9o4OOjjgB+5m0T+ADaFs3m83Znv1TU16WIQIlYluYOfX8zG
 EzU9THfww/KQFxokzl9DgmDt9XQgCYVjdcETGCpzXWEK+z2+dggT729NEleMt0PMA8K0
 FR7caZWAXXCko0YOeIFPvXFWlOzySd+UOY3CmSjoM9gyUJHnIWjVlrPRJ/XMyaHO0OFW
 CQOHzCc2W+O7W218N6gXbqJg39q7EPnDgUvHC8A9KgLOpvTJ867Iw7WucfceQAT6D81t
 P6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FKpak1M/4asc8KoNklCuXW/Sh+X7+tzXxt6gTH+Vi2g=;
 b=GHsYw/cDTEMDiDuZFn8jAGl8VxKY5LdMsf5cgyX+BbjuYwOmcqwwBj8gWHbn7f9M/M
 ftjvuA/s3SQms+//7lDJXqVnfLO12J9yISMuRHg/mbwDqYPtuN9Y9Q3wMdw7/vp2KKsd
 0KT6cwp7A1aKppOGONbmT5dWfxNHS7z5F+mNXGksxuN3tdJ0gyfbY9xVUh4e/Rt02iMU
 FoL4tHgU4tHaSTRJAsElNXe2vQWeJ8EFeDX9LOKXvGAYGl6nhFeLyMukOhnZLxtbgG0u
 cxTsWd6pS2OQ+xuDN/tcQgXLnTenIWMBUGP7Ar2p+H09t9J1nx3pccZRArCzdWil5scg
 BOkQ==
X-Gm-Message-State: AOAM5314OA2uUGzAa96YzPDzKaZO78FPmrNGNM80WX9fMxP8rRxHo6sI
 Cauwhuw6UVLGDjbO/2569oCIJs+4Sig=
X-Google-Smtp-Source: ABdhPJzrLWZ+yKuREZC//TGjlCxmxaBsyfpK6BDPV4RC/MVfZrmVBYR/ePyw5lQvhr8oo7Tq3A05cw==
X-Received: by 2002:a5d:6108:: with SMTP id v8mr18317wrt.96.1629147111170;
 Mon, 16 Aug 2021 13:51:51 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 l38sm246659wmp.15.2021.08.16.13.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 13:51:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] target/mips: Use tcg_constant_i32() in
 generate_exception_err()
Date: Mon, 16 Aug 2021 22:51:06 +0200
Message-Id: <20210816205107.2051495-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210816205107.2051495-1-f4bug@amsat.org>
References: <20210816205107.2051495-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

excp/err are temporaries input, so we can replace tcg_const_i32()
calls by tcg_constant_i32() equivalent.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index c515a337ebc..93b72c994f2 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1363,12 +1363,9 @@ static inline void restore_cpu_state(CPUMIPSState *env, DisasContext *ctx)
 
 void generate_exception_err(DisasContext *ctx, int excp, int err)
 {
-    TCGv_i32 texcp = tcg_const_i32(excp);
-    TCGv_i32 terr = tcg_const_i32(err);
     save_cpu_state(ctx, 1);
-    gen_helper_raise_exception_err(cpu_env, texcp, terr);
-    tcg_temp_free_i32(terr);
-    tcg_temp_free_i32(texcp);
+    gen_helper_raise_exception_err(cpu_env, tcg_constant_i32(excp),
+                                   tcg_constant_i32(err));
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.31.1


