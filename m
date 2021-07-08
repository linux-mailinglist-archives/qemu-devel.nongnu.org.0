Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0353C1777
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:53:39 +0200 (CEST)
Received: from localhost ([::1]:41298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XHO-0002q2-CW
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5A-0001Rh-G3
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:00 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X54-0008AS-Dv
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:00 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 h1-20020a17090a3d01b0290172d33bb8bcso6288143pjc.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OjLj3bWSXSwoFF9tVv9gpEnSwuE/0j9Oo5pN/7U1dhk=;
 b=MfDYLBzydmucsUG4Op1HfAIPF/oX/t9r8AtFkGvg/i3C1l15FQ9kR4Wj9i4ndBFxkJ
 CqlvmVMl+qzOpTlKRTul0rnAjHtYXdkafDLBiIeXpuTrGviPNmcPnr4KR4aKYOU+YBE0
 DyZzGzpK1oQ3/8RbwMU+sbkgoicpcwhna2KG7VzgS0sf/DwEUccaJZe7q7JNWkk2lONI
 pYfp55QarUkfU4mp1taPNc+hWA9mhCwDiiRs5O/GFWgnbSnmZgphgQo6HJOYF58otURx
 xXilZQRNn1LDIhY0ZpzqvPHiytvmvZsru/doHFxUNWmpJERXzGz32bP2bCPpKUQO2+Vw
 K9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OjLj3bWSXSwoFF9tVv9gpEnSwuE/0j9Oo5pN/7U1dhk=;
 b=FJZauJl7UpzLVfHbZjvyuMAYr8aJKc+QWsu2MCc+YAq1ajcXVh86ErCPRE2qC509k5
 wA9DoauT7xsxpND1x1cx9VHqzd/u6646ZPu52ArPWqM+9mX2LQudLINjxJh5YBiHVW7u
 pSKxDmP2PkW1obfUQsPkY+SYpOzkbiUp/MaxG5NlsiXOt30mbUg2NAph10TT8/YEnKJj
 BeExfICmJYe5JyXCckqWtxSlXrXQB1kRzvwtDXSlmGwF6XBUNwrAx8c3FSTm36s3XoHt
 tSXVDVxiwpsC981D7haDnGMyC29HZitLt5zCSGKe6jeLgcLG9m8yQ9pFo5H4UvDavV5x
 G6PQ==
X-Gm-Message-State: AOAM533C5vODY+Kghcu9amUq5+qaQEg6B/0JdOj/J/Xml+8VLvCx8U5F
 /UtGbJ0z23yfuEZAOD13tQxdy9pTVkORUg==
X-Google-Smtp-Source: ABdhPJwPRcDQ+e2+VXLhqbEpNceKCzcVilHk0xVfSaes+6q7ZdujSME4n88bwkS0c8gX4LtlzTlcKw==
X-Received: by 2002:a17:90b:3608:: with SMTP id
 ml8mr5816828pjb.215.1625762453198; 
 Thu, 08 Jul 2021 09:40:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:40:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/28] target/alpha: Use translator_use_goto_tb
Date: Thu,  8 Jul 2021 09:40:26 -0700
Message-Id: <20210708164050.711967-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 8fa00a79d1..de769f7633 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -441,12 +441,7 @@ static DisasJumpType gen_store_conditional(DisasContext *ctx, int ra, int rb,
 
 static bool use_goto_tb(DisasContext *ctx, uint64_t dest)
 {
-#ifndef CONFIG_USER_ONLY
-    /* Check for the dest on the same page as the start of the TB.  */
-    return ((ctx->base.tb->pc ^ dest) & TARGET_PAGE_MASK) == 0;
-#else
-    return true;
-#endif
+    return translator_use_goto_tb(&ctx->base, dest);
 }
 
 static DisasJumpType gen_bdirect(DisasContext *ctx, int ra, int32_t disp)
-- 
2.25.1


