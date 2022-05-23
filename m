Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBE7531D90
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 23:17:13 +0200 (CEST)
Received: from localhost ([::1]:55576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntFQN-00053D-Fj
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 17:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy9-0008UA-Qv
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:48:01 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy8-000548-5F
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:48:01 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 o13-20020a17090a9f8d00b001df3fc52ea7so289785pjp.3
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 13:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XRiK/19DWWGa+NhpLf6AkOpMmSAQF90yzy5A4YWSxoA=;
 b=bV1DuWmDQX1KtqbaHwYK5B8unjJu2sgSW46SqRdrxw1aicb3i+5xmfABZ5X5y4pro+
 F67JlpL8zNt9W6ibowHIaMvHlTxLAurv7+yaSLzemOSp570hBwBUmDnLQJwUKbXzl9/2
 cpVwtNzkjja/GvjS5tnbfpJu2BtZvNtDJ9lnNUBQXJEghxxnqnin2wW8u4dxO9IURHKl
 JXgOLNqEnXMVXoYlLT8XayYcYjt0UvQtgX9QNNjj8TlIJaMmCfEQFgJRIbjbNtVvxRiZ
 vSvvQY28lFzonPHBG1dM7nOEbNCm7dz4pfRg7tjY/0CoyKh7f7yNu+qGXxfKhpAOW2Co
 diiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XRiK/19DWWGa+NhpLf6AkOpMmSAQF90yzy5A4YWSxoA=;
 b=UNCNP2jcezAO7vfEg4Y2iLibrLkxtC95TDuGI+x1E7pJjhIBxvroz6KhFj/uCvcPtt
 EVukv71ZLurLRjPpmy8e7elksDUp9wNDvzo6ZALu/TduZ9Y2iuK2NVCMXwufR2kECofF
 6mWSAd4wuDV2mSHAyBfO9e0Uauk2bymivKuSQJlw4aAkvR+GVvG8CURYGVNv9rjnJ7nY
 E5IL9sSKiGEqj/BQMOw6GJbeqr2YlBSxa1ZEwC0wVCjjLsWvogAJgk1hcKx+IJSVQGo/
 fL9Xa5qajruvqxaa4gx9NXzdfINHl+Ak6P+U9Bwh+4RDVaCVhHh6SWgLwrgZq7xeiu1/
 1QfA==
X-Gm-Message-State: AOAM532ifA6SwG0qtB/n5sXiHYTZejHS4ooeEIJwr7pp3Arpl3RAqDxC
 2vHtInCpYbO9b1Naty5kLhXwN6TO8ZGRuA==
X-Google-Smtp-Source: ABdhPJw/Ynw0rz0FEHnmlL4EyqlsMY0zuhy8kla5zJU2zCLIsRPj/1nRlivmRShWxnrhpINMvb0zLA==
X-Received: by 2002:a17:902:dad1:b0:161:9abb:fb75 with SMTP id
 q17-20020a170902dad100b001619abbfb75mr24319653plx.135.1653338878604; 
 Mon, 23 May 2022 13:47:58 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 14/18] target/arm: Mark exception helpers as noreturn
Date: Mon, 23 May 2022 13:47:38 -0700
Message-Id: <20220523204742.740932-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index b1334e0c42..5161cdf73d 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -44,9 +44,9 @@ DEF_HELPER_FLAGS_2(usad8, TCG_CALL_NO_RWG_SE, i32, i32, i32)
 
 DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
                    i32, i32, i32, i32)
-DEF_HELPER_2(exception_internal, void, env, i32)
-DEF_HELPER_4(exception_with_syndrome, void, env, i32, i32, i32)
-DEF_HELPER_2(exception_bkpt_insn, void, env, i32)
+DEF_HELPER_2(exception_internal, noreturn, env, i32)
+DEF_HELPER_4(exception_with_syndrome, noreturn, env, i32, i32, i32)
+DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
 DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
 DEF_HELPER_1(setend, void, env)
 DEF_HELPER_2(wfi, void, env, i32)
-- 
2.34.1


