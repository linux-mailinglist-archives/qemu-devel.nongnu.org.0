Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E9C48C39C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:56:47 +0100 (CET)
Received: from localhost ([::1]:40506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7cFC-0004Pi-9X
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:56:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bvT-0007dD-RN
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:36:23 -0500
Received: from [2a00:1450:4864:20::52e] (port=46770
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bvS-0004kN-9e
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:36:23 -0500
Received: by mail-ed1-x52e.google.com with SMTP id k15so8590732edk.13
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WVQWEwB7DW0S7EcK0bMuECSnyWWWVwcHAm+O9XR3q5c=;
 b=YcEMhx06TnrXme5oeVI0TyFYTBnMhT4oyza/kS+ye3mCfutjZlduiKOAKlwKsxMpOX
 eGFiD0vtJArC97yyKz5iDceQw83EKEyCC4/8T623tTbyjzpe7QKJqSkYY41HytgGPOvy
 KA3MHa9JOkFFv+taGHiGNK1jiirv5YRPP1aVsguw6W9zxUCMjGKua1954AqFX5ai9eKR
 f55mZDT0TkuBrY+pNY+Xk3bB4VNsAarUqgsvyttUhf7yZcNIiqc/3EZzpiAnF+l5deMk
 a+BLohymcQp3fgTy+RU/klAOaiXm97msD1SqxaTZ9f5+1zxMYLR8NTdS+ouejIqBvmBu
 QAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WVQWEwB7DW0S7EcK0bMuECSnyWWWVwcHAm+O9XR3q5c=;
 b=OETwXQnXVcrShViGC6nHMaj6jqqKhiSELABtXfoHQwSJLM3OwY3Kt+kdidEeHmLtqp
 rAK6datBJTpm5GgnZOirFLvMgN3EFabuxQl5ZtQaKLBCx7ZQgOfLzOirKMdH7BLoTcQv
 xe+UY1KFIsl+tEQWFmYxV80B0pS5cE9EiOn9A3+b0q9/k0kshcvDM235UHst6Ogp+tpL
 U3TmliRcAenpDpm8sh03rQTl55gitg8wB2155wavvSBrmRr7JpuwFFbFEtPlOJfr9cc4
 T4Q+lpz4mBBXjNc3K+niOmJzneEsApEclsWDy2K03uATtPDWTx3i4GLhRocuhCq58+Ck
 6iGA==
X-Gm-Message-State: AOAM532L+EsrK5/d3cz/WI5ueHKOnNphHxFvgMQNzC5Q5BOtO+ArvRGv
 +XqH5A5X/1sRVkmZOS+GGm6SchSHNKngng==
X-Google-Smtp-Source: ABdhPJyH94wPwZwNYM7kibXAh/Wbb5z7IYeYNvCZ09PJMMIWRt8/naTMRDMbqBDCeycaQjApk7MEEA==
X-Received: by 2002:a17:907:6d1e:: with SMTP id
 sa30mr7420694ejc.1.1641987381027; 
 Wed, 12 Jan 2022 03:36:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j11sm5978319edv.0.2022.01.12.03.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:36:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A333E1FFD2;
 Wed, 12 Jan 2022 11:27:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 26/31] linux-user: don't adjust base of found hole
Date: Wed, 12 Jan 2022 11:27:17 +0000
Message-Id: <20220112112722.3641051-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pgb_find_hole function goes to the trouble of taking account of
both mmap_min_addr and any offset we've applied to decide the starting
address of a potential hole. This is especially important for
emulating 32bit ARM in a 32bit build as we have applied the offset to
ensure there will be space to map the ARM_COMMPAGE bellow the main
guest map (using wrapped arithmetic).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/690
Message-Id: <20220105135009.1584676-27-alex.bennee@linaro.org>

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 8ef0626eb0..cb2f01ff01 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2339,8 +2339,7 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
     brk = (uintptr_t)sbrk(0);
 
     if (!maps) {
-        ret = pgd_find_hole_fallback(guest_size, brk, align, offset);
-        return ret == -1 ? -1 : ret - guest_loaddr;
+        return pgd_find_hole_fallback(guest_size, brk, align, offset);
     }
 
     /* The first hole is before the first map entry. */
@@ -2380,7 +2379,7 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
 
         /* Record the lowest successful match. */
         if (ret < 0) {
-            ret = align_start - guest_loaddr;
+            ret = align_start;
         }
         /* If this hole contains the identity map, select it. */
         if (align_start <= guest_loaddr &&
-- 
2.30.2


