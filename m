Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AD56F8AEE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:27:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vQ-0000iS-6m; Fri, 05 May 2023 17:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vG-0000fz-VR
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:02 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vE-0004Ru-Sl
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:02 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f19a80a330so15628955e9.2
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321899; x=1685913899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pbAgzG/DXQiDwooC2dp0ZtQphp0ZPty+CqajwWoQmzw=;
 b=dUn3JjmOo22s80wkeP+kv/sE+yQNTnsxCQNFMyuJ2/ZVQpvCFehwXdCeoqVQBNQgb1
 Qz1PsFA6ExMvZu3jglPLAoEb/kNjR8QHzvhm6rtseRBwOtkbY8kU5v2RKzHro8fpor2C
 Hp4ViCMtLbcrn2Ubou57YYW+wILs9OSfXiHU55fi6v0cD1LptI9C/YFAmWzd882jKwXg
 orY4PuBXB1+89XGvaSPIZVvhSFBznkEOkqXAm8fjR11QEuG5bTqxv9EmJTqxcZpUbW5m
 pYB27H03DVf74SM/UfWdf8L7yQ7EMCuDJqjutadSrjyRlosoLVi+qucQupP+TbqXkJ7t
 qagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321899; x=1685913899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pbAgzG/DXQiDwooC2dp0ZtQphp0ZPty+CqajwWoQmzw=;
 b=Qn8CdZS8SEtzTf71pD3gUai2kKAVs0pPawuwZIM82vLIJJbWLDwiEO/zJ/wKNQJges
 FbixJOYl0EcL+HCg+gdaj0lAjYLtB04fXnEnZyT439tweiwZvxEN8Ps6CZIDc393N/OW
 gpSCyhAgUQDMrnTqTktxB1VntoQQce4aiUQf8kXg54kNj+Sf2T4fpVlJVqVj8cs+wJAc
 xoQiUbU3qI0Vp2B81BBAAAKSEJDKNZNNkrIyA6xCAV/oauj6hXW0qGjkQA4XIRMWFNjl
 mYGghrRVIRcY3qw+tK65UZpTLmpQkyz62nEraauFNGsI3In8wOhBhNKzfUeW+V5tHBm8
 wCQA==
X-Gm-Message-State: AC+VfDwGyE6aZp8FyVfMMwVLy57DbpZ9/fVPY6Qh3AH7S9kPIZhUphQA
 wwLN9UtM9ulnTOregz9ZVxqpLn4donZydNsp8ODirQ==
X-Google-Smtp-Source: ACHHUZ7LC37LZePdnYL/aCT9dLaNbm+Cxw93H9VxDIP8AidcnSvEvHkUA5+BFL/TdTDErj7NkezlsQ==
X-Received: by 2002:adf:f00a:0:b0:306:3286:69a2 with SMTP id
 j10-20020adff00a000000b00306328669a2mr2122996wro.48.1683321898872; 
 Fri, 05 May 2023 14:24:58 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:24:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 18/42] target/sparc: Remove TARGET_ALIGNED_ONLY
Date: Fri,  5 May 2023 22:24:23 +0100
Message-Id: <20230505212447.374546-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001,
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

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/sparc-linux-user.mak       | 1 -
 configs/targets/sparc-softmmu.mak          | 1 -
 configs/targets/sparc32plus-linux-user.mak | 1 -
 configs/targets/sparc64-linux-user.mak     | 1 -
 configs/targets/sparc64-softmmu.mak        | 1 -
 5 files changed, 5 deletions(-)

diff --git a/configs/targets/sparc-linux-user.mak b/configs/targets/sparc-linux-user.mak
index 00e7bc1f07..abcfb8fc62 100644
--- a/configs/targets/sparc-linux-user.mak
+++ b/configs/targets/sparc-linux-user.mak
@@ -1,5 +1,4 @@
 TARGET_ARCH=sparc
 TARGET_SYSTBL_ABI=common,32
 TARGET_SYSTBL=syscall.tbl
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/sparc-softmmu.mak b/configs/targets/sparc-softmmu.mak
index a849190f01..454eb35499 100644
--- a/configs/targets/sparc-softmmu.mak
+++ b/configs/targets/sparc-softmmu.mak
@@ -1,3 +1,2 @@
 TARGET_ARCH=sparc
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/sparc32plus-linux-user.mak b/configs/targets/sparc32plus-linux-user.mak
index a65c0951a1..6cc8fa516b 100644
--- a/configs/targets/sparc32plus-linux-user.mak
+++ b/configs/targets/sparc32plus-linux-user.mak
@@ -4,5 +4,4 @@ TARGET_BASE_ARCH=sparc
 TARGET_ABI_DIR=sparc
 TARGET_SYSTBL_ABI=common,32
 TARGET_SYSTBL=syscall.tbl
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/sparc64-linux-user.mak b/configs/targets/sparc64-linux-user.mak
index 20fcb93fa4..52f05ec000 100644
--- a/configs/targets/sparc64-linux-user.mak
+++ b/configs/targets/sparc64-linux-user.mak
@@ -3,5 +3,4 @@ TARGET_BASE_ARCH=sparc
 TARGET_ABI_DIR=sparc
 TARGET_SYSTBL_ABI=common,64
 TARGET_SYSTBL=syscall.tbl
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/sparc64-softmmu.mak b/configs/targets/sparc64-softmmu.mak
index c626ac3eae..d3f8a3b710 100644
--- a/configs/targets/sparc64-softmmu.mak
+++ b/configs/targets/sparc64-softmmu.mak
@@ -1,4 +1,3 @@
 TARGET_ARCH=sparc64
 TARGET_BASE_ARCH=sparc
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
-- 
2.34.1


