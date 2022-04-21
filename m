Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC3B50A4E5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:59:34 +0200 (CEST)
Received: from localhost ([::1]:43568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZDQ-0001A9-Io
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZN-0007M7-95
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:11 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:34337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZL-0006Hq-F8
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:08 -0400
Received: by mail-pg1-x52b.google.com with SMTP id t4so4920371pgc.1
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fNAOMB88DY+Kw1JJ7inCrhRV3itMDCTZQXxLxXQ6rBA=;
 b=N2w9LXf4nU7Dku1VQuHKEnfY1roIbQltFUGQplbLRlrXXM42+LmzbGc+Q3faUM0eJw
 LYHOgSRFMrmRZEgo5fdZMWZwxyPEbqG/0CjzPkepDacDvbvRAahjO0trAEVASfzKNkTF
 ycSj5iZl/HxxxboS50DzHcIgTSbYFNCqdqFZLq1J/wlQoxWQ1k1zUsICQMIW+HlootNx
 xmhosXHQQzmSI4zCiRw/Y/EAvzlLMICBlVDkk9BX5QzYJJE4Ibl7jSZmJiHk5VPLcqYv
 sn3mkyO284y0HHmZV6QGuqYuc7jL0Psli3HOgMMpdVcut8nnYwwYu+U1NlmMQtfbpnHI
 yNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fNAOMB88DY+Kw1JJ7inCrhRV3itMDCTZQXxLxXQ6rBA=;
 b=IuaMNGj5V34e/HjMaczQQHfNYw9VcQRZq3amEAp4NjAu0AhyjLaj4oFMp0f8z2CGLH
 h4TMElrTnoYeC66MwQ0a1jUE8qS/PWz9vpgpicH+tHy4h7aoXZcPQR3bozA4GkfTsLDU
 elRoWujsH3wwk31ZYyRIZ6U9U22FSmdplo8NjnIr2o6f3w90OzhdR+ZAvqCeTsHW93yt
 86bYbYRqJL1S1pq7QxxiY34YAxmASudExbJWBhvqsq7KbkQ++xiM2h/gZYbmaLoDT7lD
 MhepeGpfElMZArLFui8xLJsCcuYWpqY+4L24IsMmb2UhfYwTUEhd6Etvyh6Af+xeeChJ
 JK0w==
X-Gm-Message-State: AOAM531a4+1IZjvMWraViY64Bz3HUVrIxeSPlfrnl9nqABPi0cu6wP+O
 3ge10HiLDg5gMrkC48c7jqWHBCMiqUCmVA==
X-Google-Smtp-Source: ABdhPJyWtzoTLBaYsksCXF/8Kq1FCB4n9GUpNpBVo2fRxXW/cKfW1XnHy2W6P+vq/dRLFFQ6ewUbKw==
X-Received: by 2002:a05:6a00:c8f:b0:50a:77a3:e7b with SMTP id
 a15-20020a056a000c8f00b0050a77a30e7bmr130242pfv.41.1650554286065; 
 Thu, 21 Apr 2022 08:18:06 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:18:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 18/64] target/nios2: Fix BRET instruction
Date: Thu, 21 Apr 2022 08:16:49 -0700
Message-Id: <20220421151735.31996-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We had failed to copy BSTATUS back to STATUS, and diagnose
supervisor-only.  The spec is light on the specifics of the
implementation of bret, but it is an easy assumption that
the restore into STATUS should work the same as eret.

Therefore, reuse the existing helper_eret.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 53699ee088..3694f2503b 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -407,12 +407,22 @@ static void ret(DisasContext *dc, uint32_t code, uint32_t flags)
     dc->base.is_jmp = DISAS_JUMP;
 }
 
-/* PC <- ba */
+/*
+ * status <- bstatus
+ * PC <- ba
+ */
 static void bret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_mov_tl(cpu_pc, cpu_R[R_BA]);
+    if (!gen_check_supervisor(dc)) {
+        return;
+    }
 
-    dc->base.is_jmp = DISAS_JUMP;
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
+    gen_helper_eret(cpu_env, cpu_R[CR_BSTATUS], cpu_R[R_BA]);
+    dc->base.is_jmp = DISAS_NORETURN;
+#endif
 }
 
 /* PC <- rA */
-- 
2.34.1


