Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417543B09B9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:59:41 +0200 (CEST)
Received: from localhost ([::1]:48630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvioO-0003tl-9N
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvidk-0005LA-Je
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:40 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvidc-0005Mn-IJ
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:40 -0400
Received: by mail-pl1-x632.google.com with SMTP id u2so1928714plf.3
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 08:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BEFrU6ndUASVjpTaaDjSOSL65OCRSsx6DfEnmxbUsrM=;
 b=pxraErOEmP8CVTnw5MtbgUg/3POk9RnJSyAcZJNn8J6aidMKEpjXnPXYpC4tRc3ADO
 BaOxFx5thnuZRMlUyDz0iEVwrpI0eRFYfvpfAQUo98sG+NnOhrY9ZMG/xqWXTM55vbhI
 ewvetw1Z1dXbw76tuWUbCGkjBkJp04I+lJMyGlLaknpcYRRrEd+UXkV/c+P8ND5NOEFe
 xcpne0QgoYxZTyTfAA6Rmz7ILo09ceZlxKDNtdz7BRAeVBiJxrnH+Na7w6TUEx9N2xel
 6JNRuWLXfw9jmCOv1g4uqDJ8QVQzibAqWgYyp18PqfPmWcwzcPX9DA6VrxDJDjr4xwl1
 m3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BEFrU6ndUASVjpTaaDjSOSL65OCRSsx6DfEnmxbUsrM=;
 b=qhAEqk8qbkfrPSLsBMawBcRQnuito3DQ1ik4dsxqHuTj+oii1XR6h1G4brzpcdpe7Z
 87F3s5648mjc7ytgpsLg2prHwj9dbdR6YITU7VitkQd6ZV2e6BZP0VCipkXUa0DqoX2e
 p+gXnKPniNbgvZ83z4zNHkBDi9YHWj0v2ZKcHri4AnCGjJcmpj+KNbGLg0aTNHYQgrga
 JotLB3uMt/Jwk3PheQ6KXFrav5Q8MzxmuUqW/0Ae6oYni8j1aB2rVjM1x13dhZ4PWAzf
 LIHzbHRXEUourNyPN1iyzgbQbPAgH4J2+XWqVrLdccPn6oBnheb1kRVjg67qFgp0eRTT
 VbpA==
X-Gm-Message-State: AOAM5319YAGQoxoRnOsElBzkgfgLJ+KCclhEsABf2++/ftFsoA+N1hOZ
 ZkUoLGAHJFM1RWXDeWfZj0jti9dUBDvHSw==
X-Google-Smtp-Source: ABdhPJzCMX+//+Ik6koHiCvQitRDQ6pJZp824Wj5+tlqgd+lBax9uILsJ6lpj3Zje0iaFkfSuFgJBg==
X-Received: by 2002:a17:90a:4592:: with SMTP id
 v18mr4495634pjg.132.1624376911334; 
 Tue, 22 Jun 2021 08:48:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x13sm2898769pjh.30.2021.06.22.08.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 08:48:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/15] target/cris: Do not exit tb for X_FLAG changes
Date: Tue, 22 Jun 2021 08:48:20 -0700
Message-Id: <20210622154820.1978982-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622154820.1978982-1-richard.henderson@linaro.org>
References: <20210622154820.1978982-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We always know the exact value of X, that's all that matters.
This avoids splitting the TB e.g. between "ax" and "addq".

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 45548ffb5e..78cc70a320 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3160,9 +3160,6 @@ static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         cris_clear_x_flag(dc);
     }
 
-    /* Fold unhandled changes to X_FLAG into cpustate_changed. */
-    dc->cpustate_changed |= dc->flags_x != (dc->base.tb->flags & X_FLAG);
-
     /*
      * All branches are delayed branches, handled immediately below.
      * We don't expect to see odd combinations of exit conditions.
-- 
2.25.1


