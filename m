Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAAC4C5E0C
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 19:25:30 +0100 (CET)
Received: from localhost ([::1]:34236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOOEb-0001hE-Aq
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 13:25:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOAs-0002fy-H1
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:21:38 -0500
Received: from [2607:f8b0:4864:20::1030] (port=51108
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOAq-0007o6-Fo
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:21:38 -0500
Received: by mail-pj1-x1030.google.com with SMTP id m22so9243979pja.0
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 10:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NbiZjwZMOI9QBNqQOVnUdzp1maV43aZ7/lLWc9/UloU=;
 b=vlNF5cmgJAbbqmcZaAeVhKYZyodeUq02DGyyv16HwwlaS9+uON7YyQF5DbBmKGcqKq
 XuUNBkJLZ6P5/XNdHw49E/i633xET4YkID6s4WEl88KUfQAQ8OsmbwgCkuNcYKKYh9UL
 1VYJxGvsI9Fpo0/0yQ+Hs5C+dZVI4ntsZ0vYi2NrD3Cdd7qLpifwxfvyjCN0wV4SlErS
 Xsc8qY/nsI3wTP99j6G37sxzjHg1XMQsyo8mjakT3G69eEtXIjCCxspUU0SNZZWX41Kc
 +Sz+DOOO3ifhbGMXuqy21Fzl3n/4BwB/ZFMGXh3r8/wZp98rLS2gpJE9u89mELGP8nXT
 0Dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NbiZjwZMOI9QBNqQOVnUdzp1maV43aZ7/lLWc9/UloU=;
 b=q1yl6SqE+kclRhAf1Druygj75rEVirca6P/LMJdX4ZNtBPLC3VJ40jg18mxjsmNO6n
 /SdrVZxbCuB7Rc1QzIHz1QjuFF2T+d2vl+peGvOVRkqWtf5XgIgpd5BMkg4LVi5hNPYX
 tcXGAM3mBLf3eC6L5Gr9Ho/kgK6Ra8ghLBPpHLhZ3GMxwkqU+FTBou8UhG6FEyd+GvQO
 S0JUPu/5lMLd3NUfooARBnyFhWm+2kkp9j039DZCSJaJCnUghENYqssYwwaWPoaoAryQ
 bvItj14ne+oyCkDMdKDI7MbnC0zgCfwx1hz9sWKvrjUZ8bW/OevST3fIAhggR1bS23wz
 4RdA==
X-Gm-Message-State: AOAM533kP4sHxRQAOOY/P4XytvmV/Uhs0UXIhHZP0OA403Ppes+dn/gc
 8GnHidsk/fYd5Lo3jGJIxIy51r3YEyzhlQ==
X-Google-Smtp-Source: ABdhPJyHB6fv+8SvB0HbOTqsNfnmVWWRGl5KH20xIqsjfs83uC1/JVyCTPAOgWiQVsEw1gzfscMBWw==
X-Received: by 2002:a17:90a:9b08:b0:1bc:9b4f:8dff with SMTP id
 f8-20020a17090a9b0800b001bc9b4f8dffmr12783493pjp.159.1645986095229; 
 Sun, 27 Feb 2022 10:21:35 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-23be-43d9-7006-705a.res6.spectrum.com.
 [2603:800c:1201:c600:23be:43d9:7006:705a])
 by smtp.gmail.com with ESMTPSA id
 t41-20020a056a0013a900b004e167af0c0dsm10776252pfg.89.2022.02.27.10.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 10:21:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] target/nios2: Hoist R_ZERO check in rdctl
Date: Sun, 27 Feb 2022 08:21:22 -1000
Message-Id: <20220227182125.21809-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220227182125.21809-1-richard.henderson@linaro.org>
References: <20220227182125.21809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will avoid having to replicate the check to additional cases.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 194c8ebafd..fa355308a9 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -447,11 +447,13 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
 
     gen_check_supervisor(dc);
 
+    if (unlikely(instr.c == R_ZERO)) {
+        return;
+    }
+
     switch (instr.imm5 + CR_BASE) {
     default:
-        if (likely(instr.c != R_ZERO)) {
-            tcg_gen_mov_tl(cpu_R[instr.c], cpu_R[instr.imm5 + CR_BASE]);
-        }
+        tcg_gen_mov_tl(cpu_R[instr.c], cpu_R[instr.imm5 + CR_BASE]);
         break;
     }
 }
-- 
2.25.1


