Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DB73B88A0
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:39:56 +0200 (CEST)
Received: from localhost ([::1]:50824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyf7r-0006NE-LX
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0o-0005EN-K0
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:38 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:37397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0l-00021f-7k
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:38 -0400
Received: by mail-pf1-x432.google.com with SMTP id 17so3087680pfz.4
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cH+sdopDqg3AA/XmKjvzj97BFIKh2FfG1/i/yI9Y2V4=;
 b=nZWpNRvmJr8B0KLGBlmol8zFkgwK9OeS5n1S8HpnfR8XZtneZQMeYlm1xQVmWhTSDX
 nn78T4xFepqoJfUdbrxjRgL1Lgy9Xi8iR+dIkqeErBZpTetY8jwTG/qWfakhxadbVqUA
 gbkLNbHMpG83++qabE6HHlcfT2K84ryb+563YjwHRDhMtvpXV47GpdWcBW73Xo17JfZI
 ziZT1KOWn+eQBf8LxccUQ68S6rLFX7YD9hysqtjVR4FJvuU0udwtjdNMAkj/LvPKYH43
 J5nnFcfXnZ5HFbyvZDuNKBqMCS6CLSC/HXT3j4AFkSmHFICgiIiay9lugaDnkfrgiDp1
 KcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cH+sdopDqg3AA/XmKjvzj97BFIKh2FfG1/i/yI9Y2V4=;
 b=bGlliZcukAPFCbyL54c+qot7JN1/dmgefhH7lIN5KXa8racDF7K01898uIKNIY+rm6
 xQnuzagvodEGgPPsi/gMm6DSDpVjLdtHUN8FJSwaVGFZNytGZtfmpyZLg6AKLcaU7zPm
 b6yC58kTsJDDLFnlEfXD854kMlmJYOTOlE4THbSvA3VOyM1omFLDZorAqitYqGlAVqnr
 NbhfBPthtULdWxd1GvWAwaaJmhcrToFFxEngxltUFcpCH/DVwhbC2QZA1dJ52/Not5bN
 KZk9P9oPPFXJK42DggdHgYIXAQOpvC+cXir8rXpaDle4ilyTzQoc12LfghbSsM7zzQcV
 myCg==
X-Gm-Message-State: AOAM533LgJ5elUDKkbgbs9YphM+gSwh62mbzSTiqDa8GDvjlSUBYsYuw
 r90Tg2vhrbVW8mZdBka4OXVyQDMUbqz/Kw==
X-Google-Smtp-Source: ABdhPJwWzfsFbvrZzJ9WIjV8/KKmRkuiHlgRGxT9AYky4ZNLUQOR8+6BQlsB9bSJVFg8ZvOyPlvfnw==
X-Received: by 2002:a65:5889:: with SMTP id d9mr395398pgu.410.1625077954111;
 Wed, 30 Jun 2021 11:32:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/28] target/hppa: Use translator_use_goto_tb
Date: Wed, 30 Jun 2021 11:32:09 -0700
Message-Id: <20210630183226.3290849-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/translate.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 64af1e0d5c..952cfe09a6 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -817,10 +817,7 @@ static bool gen_illegal(DisasContext *ctx)
 
 static bool use_goto_tb(DisasContext *ctx, target_ureg dest)
 {
-    /* Suppress goto_tb for page crossing, IO, or single-steping.  */
-    return !(((ctx->base.pc_first ^ dest) & TARGET_PAGE_MASK)
-             || (tb_cflags(ctx->base.tb) & CF_LAST_IO)
-             || ctx->base.singlestep_enabled);
+    return translator_use_goto_tb(&ctx->base, dest);
 }
 
 /* If the next insn is to be nullified, and it's on the same page,
-- 
2.25.1


