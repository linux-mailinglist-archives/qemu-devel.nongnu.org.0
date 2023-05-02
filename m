Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD0C6F4813
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:11:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsYz-0002pk-6t; Tue, 02 May 2023 12:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYi-0002m4-Tb
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:09:03 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYh-0000ha-5u
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:08:56 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f1cfed93e2so40076485e9.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 09:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683043733; x=1685635733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=azGpR/vI4E4lJ27AqLH4AuBHdfSf/EVVZa9vn6F5YtM=;
 b=tIerp0+3CNOt8TO9USS3yMfdFVcoZPOxzzf9XLkqnrL6Yp9EInCPPRsLP3FVqWiKMZ
 6iM4iilM6RNV8OXRqb8sV57VLHi3OiJVMin3VYCEIqPXsQbosNcHvLdx3QUsqSHAjUyg
 ZmWKHh82t7QZ6XnO2m0ZgcPGrypx6xXaDLBTq4ut+tKGoIWkQI+lrjon0z/U77oJPBNa
 nKRjR6906VBslczgBjncroiNEV9hgTkryD+126zjbxcfqjnqT4tAPITzlQdQ3mG8xnM9
 jh9UKVM84syr4Ss5fEdA/avmq7VKWxVa50rWKY2e4e3bO/D82VTChTr0DhJ47Y5Nyb5B
 wMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683043733; x=1685635733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=azGpR/vI4E4lJ27AqLH4AuBHdfSf/EVVZa9vn6F5YtM=;
 b=cwOFpJW9C4z9IFTgHEgQwxZ/tB+A0kezXo2a01VCl58GYz+lJZSRJT/rPTjJvRGAeP
 yUNxZ1eI/YKFGjtBpgkZyAXInIg9QJSNEQUQKKITZsBLpcyUxylzOBOle+WqUUPAF/jx
 Koo/83BOeX/hNVWS7xvASL+5IHTDQeWXfM06eRHi4PI67MSsFQOAlPPQC3vI82XxyBHS
 DFp5+yKyiNcHifOVh24Iy97mZcqLEm8bbXZBmWs1ErEhJvLPREZ9rCXyWXoiwamwG2nk
 p1A0yajIF8x3rRvmE3ndjDy1XCBnPJjG/E/qqUUG8sPL1NYx0+LVF7nYAswh62P5amqB
 7xlA==
X-Gm-Message-State: AC+VfDz20zy1Z2O70hAxWmJwxuL0sJ6Dn2cnId3okQVWw0ySsMek2DJI
 eV2OpSJicr1Q396jezcE6JaSVYEMrh+Hz7hTwWOb6w==
X-Google-Smtp-Source: ACHHUZ7rJI6X2y/n5TB/vyTGsI9RH/RIMuiHECC3o6HVntJwBbsEF2rbFUP2cj1e370fl0NTL75P6A==
X-Received: by 2002:a05:600c:228f:b0:3ed:2a41:8525 with SMTP id
 15-20020a05600c228f00b003ed2a418525mr12941967wmf.22.1683043733734; 
 Tue, 02 May 2023 09:08:53 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003ede3f5c81fsm39918471wmo.41.2023.05.02.09.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 09:08:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jiaxun.yang@flygoat.com, crwulff@gmail.com,
 marex@denx.de, ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
Subject: [PATCH 09/16] target/mips: Remove TARGET_ALIGNED_ONLY
Date: Tue,  2 May 2023 17:08:39 +0100
Message-Id: <20230502160846.1289975-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502160846.1289975-1-richard.henderson@linaro.org>
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
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


