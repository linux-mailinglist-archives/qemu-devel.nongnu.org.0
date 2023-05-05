Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1E26F8ADB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:26:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vS-0000lw-Ve; Fri, 05 May 2023 17:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vE-0000eO-88
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:01 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vC-0004Qr-Op
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:00 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f415a90215so3023335e9.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321896; x=1685913896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=swNKPZEVj6WtYC73JG1+6YoXeoe7hSurM9orzPiUbwo=;
 b=f5e3LBw5A8JtPElxtXF7yguaog/Be3066XqGj1zGylpkZy/noL37rxql6IwuKmR6/0
 FBaNZRWbDuvo6rXd9LqpEqFKc9PJoxYHXWKp7OK/Je6El5r0c3bMdp68UXyVNtDxJJwa
 hNgbSFpMdtC1JgY1gRSwRpJDHx2SHJfdXmWPhbK6r4Bq1Uod3R2MHxV8wRU5PTHjHUwY
 2nR7FmHYWGBHPxJ++legjLVWwG9kMFkjB2Cs28QiWezoE88YPNOnjphL3oMedOHcUamv
 lszKa8aevE584d7nWmcYd/2UcXQzreZDsilh38YoPttgZa+bSjxdtlkmI5aICLgkoGvZ
 kTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321896; x=1685913896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=swNKPZEVj6WtYC73JG1+6YoXeoe7hSurM9orzPiUbwo=;
 b=cSD+L6bVUz1fQQYWWW/bJzv48mBqUOgESRZyRvwIfyxB2mNNFp+VaAoUWS3nm5DNSA
 lx5qkr58PLLeDbRGUWWBW7ib/NA/f4a3nZgZmqzEvqjsruL7ckc5ccouoqjD5IG7kgJc
 O2+vylpBIraL5bMdpQdtFcRBJFVrdODIRNwBHt/CDVcJHsEHCLn/tVxOw/OqDJ9jQnEe
 VrZKWDUNXb/EsB8v8ll7j8E46M87l073nJdjA4+arA6nnHNAG4VrLgSuUw66pzuJIqVK
 Grwy2sMvTxg8ObCh0vr4fDpmRs4+CzDw9yQDxbjftVl3+mcqjXDhM2K3yoHNxr6X1pp/
 bN9w==
X-Gm-Message-State: AC+VfDzOEh++Qsiue9n1M1eZE9EWQ0XRJ6i83bRyo2+Yb7YRQHXJzngS
 WIM7E3n5aPm72bJIg8w1x/iixptsyTuFVkd/MWC3vA==
X-Google-Smtp-Source: ACHHUZ65EmZvKmp+S+/3y8AAKR5yqcPvBA05fc7VJmOsKkG10O0C3cGaOnqqqEM4sL18ip3GHscALA==
X-Received: by 2002:a7b:c3c1:0:b0:3f0:3a57:f01e with SMTP id
 t1-20020a7bc3c1000000b003f03a57f01emr2043222wmj.4.1683321896346; 
 Fri, 05 May 2023 14:24:56 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.24.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:24:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/42] target/alpha: Remove TARGET_ALIGNED_ONLY
Date: Fri,  5 May 2023 22:24:18 +0100
Message-Id: <20230505212447.374546-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
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
 configs/targets/alpha-linux-user.mak | 1 -
 configs/targets/alpha-softmmu.mak    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/configs/targets/alpha-linux-user.mak b/configs/targets/alpha-linux-user.mak
index 7e62fd796a..f7d3fb4afa 100644
--- a/configs/targets/alpha-linux-user.mak
+++ b/configs/targets/alpha-linux-user.mak
@@ -1,4 +1,3 @@
 TARGET_ARCH=alpha
 TARGET_SYSTBL_ABI=common
 TARGET_SYSTBL=syscall.tbl
-TARGET_ALIGNED_ONLY=y
diff --git a/configs/targets/alpha-softmmu.mak b/configs/targets/alpha-softmmu.mak
index e4b874a19e..9dbe160740 100644
--- a/configs/targets/alpha-softmmu.mak
+++ b/configs/targets/alpha-softmmu.mak
@@ -1,3 +1,2 @@
 TARGET_ARCH=alpha
-TARGET_ALIGNED_ONLY=y
 TARGET_SUPPORTS_MTTCG=y
-- 
2.34.1


