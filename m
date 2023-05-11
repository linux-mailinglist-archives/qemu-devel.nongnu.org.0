Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0E26FEDB8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:15:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Lc-0007HG-BF; Thu, 11 May 2023 04:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1La-0007En-Lc
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:22 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1LY-0001wu-TI
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:22 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-965f7bdab6bso1337278766b.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792499; x=1686384499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=azGpR/vI4E4lJ27AqLH4AuBHdfSf/EVVZa9vn6F5YtM=;
 b=GHolTKxwWWyqiO5xU6FXGRkooH/fBFCjJDLReUe13UIFBppe3MzyPd8movtVAFcRvk
 7uXN3rZdxdxwJo9XCeHMj7lmdsGeb6fqBr75xQqr3qP+/inwRzLvJusd8Q83I1DTX8VA
 dEaefLx8ZMdUMWPUPW46dMj/LtFsse34i5fqdA8ADk4fjlTRvdu9P1VjpunnEG9Fafa5
 rRAB5OtwuqgdR3b5OwCS/yDhIsWHP2j85gCJA8SE9TeUngW1oYtCuVQ3tyjjQp4tZNct
 rjAil1tlv4p+hDvW2e8/8ALOcmjdvHUJX3e+7q5T9ToKoDpSkJuxe3bI5k0mL82PMiy1
 mOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792499; x=1686384499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=azGpR/vI4E4lJ27AqLH4AuBHdfSf/EVVZa9vn6F5YtM=;
 b=MwZHSRrPMqBXZ77k1NNjBXLOuU2Og9oL7qwpuG/yglg6dSB+97UwVl17lo8JrQLL/G
 H2rlb8BxkMGf+ucrCIRaJEvt7yJ7WSxwuru/kqOFchfn342paK38lejMtP6B5eS2eoiz
 aiXxU3M6+A7tVUqp6n3/P5eVmIf1uEHWZtKqlJ7WKZb9PYch3QETQYROk5uH24n9YxIp
 LofXDlShIZnqiE007QcvRYAKf/iopUwkybvh27FYQacM4Lz6Siu7+qJjV8utYc9jSxel
 lYFfoD0qLQpE8xUEjnHfnBeHMeDK4LZrqv3U6oFKlg3HKpOHuF8/e1ObWy8LDf8A5Q02
 Kt+Q==
X-Gm-Message-State: AC+VfDw02M+nf1Aq69ZvKfjZkPS1W5UNWHJUeKs+XzOB3Ig/98rxXNqU
 7UBM6YfY9RF2/rLzceE/YbvKidb20nL+JQpAeSNs4A==
X-Google-Smtp-Source: ACHHUZ7d7LM405vR/zHAb+++fZwply5xpXETtJqXvKhZeknS/4QvtqFCvbihQGgV7sjOAKKc532X1Q==
X-Received: by 2002:a17:907:d86:b0:953:42c0:86e7 with SMTP id
 go6-20020a1709070d8600b0095342c086e7mr18243083ejc.4.1683792499462; 
 Thu, 11 May 2023 01:08:19 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b00959c6cb82basm3635225ejc.105.2023.05.11.01.08.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:08:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 44/53] target/mips: Remove TARGET_ALIGNED_ONLY
Date: Thu, 11 May 2023 09:04:41 +0100
Message-Id: <20230511080450.860923-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x636.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/mips-linux-user.mak      | 1 -
 configs/targets/mips-softmmu.mak         | 1 -
 configs/targets/mips64-linux-user.mak    | 1 -
 configs/targets/mips64-softmmu.mak       | 1 -
 configs/targets/mips64el-linux-user.mak  | 1 -
 configs/targets/mips64el-softmmu.mak     | 1 -
 configs/targets/mipsel-linux-user.mak    | 1 -
 configs/targets/mipsel-softmmu.mak       | 1 -
 configs/targets/mipsn32-linux-user.mak   | 1 -
 configs/targets/mipsn32el-linux-user.mak | 1 -
 10 files changed, 10 deletions(-)

diff --git a/configs/targets/mips-linux-user.mak b/configs/targets/mips-linux-user.mak
index 71fa77d464..b4569a9893 100644
--- a/configs/targets/mips-linux-user.mak
+++ b/configs/targets/mips-linux-user.mak
@@ -2,5 +2,4 @@ TARGET_ARCH=mips
 TARGET_ABI_MIPSO32=y
 TARGET_SYSTBL_ABI=o32
 TARGET_SYSTBL=syscall_o32.tbl
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/mips-softmmu.mak b/configs/targets/mips-softmmu.mak
index 7787a4d94c..d34b4083fc 100644
--- a/configs/targets/mips-softmmu.mak
+++ b/configs/targets/mips-softmmu.mak
@@ -1,4 +1,3 @@
 TARGET_ARCH=mips
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
 TARGET_SUPPORTS_MTTCG=y
diff --git a/configs/targets/mips64-linux-user.mak b/configs/targets/mips64-linux-user.mak
index 5a4771f22d..d2ff509a11 100644
--- a/configs/targets/mips64-linux-user.mak
+++ b/configs/targets/mips64-linux-user.mak
@@ -3,5 +3,4 @@ TARGET_ABI_MIPSN64=y
 TARGET_BASE_ARCH=mips
 TARGET_SYSTBL_ABI=n64
 TARGET_SYSTBL=syscall_n64.tbl
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/mips64-softmmu.mak b/configs/targets/mips64-softmmu.mak
index 568d66650c..12d9483bf0 100644
--- a/configs/targets/mips64-softmmu.mak
+++ b/configs/targets/mips64-softmmu.mak
@@ -1,4 +1,3 @@
 TARGET_ARCH=mips64
 TARGET_BASE_ARCH=mips
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/mips64el-linux-user.mak b/configs/targets/mips64el-linux-user.mak
index f348f35997..f9efeec8ea 100644
--- a/configs/targets/mips64el-linux-user.mak
+++ b/configs/targets/mips64el-linux-user.mak
@@ -3,4 +3,3 @@ TARGET_ABI_MIPSN64=y
 TARGET_BASE_ARCH=mips
 TARGET_SYSTBL_ABI=n64
 TARGET_SYSTBL=syscall_n64.tbl
-TARGET_ALIGNED_ONLY=y
diff --git a/configs/targets/mips64el-softmmu.mak b/configs/targets/mips64el-softmmu.mak
index 5a52aa4b64..8d9ab3ddc4 100644
--- a/configs/targets/mips64el-softmmu.mak
+++ b/configs/targets/mips64el-softmmu.mak
@@ -1,4 +1,3 @@
 TARGET_ARCH=mips64
 TARGET_BASE_ARCH=mips
-TARGET_ALIGNED_ONLY=y
 TARGET_NEED_FDT=y
diff --git a/configs/targets/mipsel-linux-user.mak b/configs/targets/mipsel-linux-user.mak
index e23793070c..e8d7241d31 100644
--- a/configs/targets/mipsel-linux-user.mak
+++ b/configs/targets/mipsel-linux-user.mak
@@ -2,4 +2,3 @@ TARGET_ARCH=mips
 TARGET_ABI_MIPSO32=y
 TARGET_SYSTBL_ABI=o32
 TARGET_SYSTBL=syscall_o32.tbl
-TARGET_ALIGNED_ONLY=y
diff --git a/configs/targets/mipsel-softmmu.mak b/configs/targets/mipsel-softmmu.mak
index c7c41f4fb7..0829659fc2 100644
--- a/configs/targets/mipsel-softmmu.mak
+++ b/configs/targets/mipsel-softmmu.mak
@@ -1,3 +1,2 @@
 TARGET_ARCH=mips
-TARGET_ALIGNED_ONLY=y
 TARGET_SUPPORTS_MTTCG=y
diff --git a/configs/targets/mipsn32-linux-user.mak b/configs/targets/mipsn32-linux-user.mak
index 1e80b302fc..206095da64 100644
--- a/configs/targets/mipsn32-linux-user.mak
+++ b/configs/targets/mipsn32-linux-user.mak
@@ -4,5 +4,4 @@ TARGET_ABI32=y
 TARGET_BASE_ARCH=mips
 TARGET_SYSTBL_ABI=n32
 TARGET_SYSTBL=syscall_n32.tbl
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/mipsn32el-linux-user.mak b/configs/targets/mipsn32el-linux-user.mak
index f31a9c394b..ca2a3ed753 100644
--- a/configs/targets/mipsn32el-linux-user.mak
+++ b/configs/targets/mipsn32el-linux-user.mak
@@ -4,4 +4,3 @@ TARGET_ABI32=y
 TARGET_BASE_ARCH=mips
 TARGET_SYSTBL_ABI=n32
 TARGET_SYSTBL=syscall_n32.tbl
-TARGET_ALIGNED_ONLY=y
-- 
2.34.1


