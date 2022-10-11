Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A7B5FAB39
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 05:36:11 +0200 (CEST)
Received: from localhost ([::1]:60270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi63u-0003ST-HB
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 23:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nw-0002Ri-MW
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:41 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nr-00030k-B0
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:39 -0400
Received: by mail-pf1-x42b.google.com with SMTP id h13so10915861pfr.7
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 20:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=igwDK2m9zhrQhVMJ/mwLsQLF4ZyzFm7+yLAGfvHZQnE=;
 b=dx3siBOaf9ACqd49zF6xyV67g7G2cZR/dcN5pnQjKakwWveZA3ruKMjlR6XpWquYqq
 QJLGkGGM0tI8qnMRddjjJqwrYWoZGRQ890WJM5tVSyZTL+h+KqbuSD//jA7vnzlwFnwa
 h0v4Rl7WFetgwmWVtmIoJas37D01i1qto94kOwPZ9oMpUUEtdHtWUWzNgRNl/uGA1c9H
 nctB3mycaiAT+R+oFBfW+QyLMyghlQbUxb+33Unjfro1RsGT2l6TnVlNEsWS7zmD05c8
 1mby5gRHpZ/3M0DI7UdaHTIQa1hBktIvPGowAhBm1/dDjoc5E05qOqHWtyLEIVgXa9yT
 HeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=igwDK2m9zhrQhVMJ/mwLsQLF4ZyzFm7+yLAGfvHZQnE=;
 b=fw23t6jl/SntIqPzc2eleT4MFH5+DRUnbUk+8FMnsnZ1i3gw6mwQWaxebmAM9R2cVK
 kE5pX5X34H/kiUdtdQUb8nDNmUgZC+DwKaWU/CfKPVj6ME7uoEtDM8ASBld/+vtCNDEG
 OymFe/tjx+qcW8SABq6kQelAg4I6R9swRtcPfK/LsHzotcq6oZnIdOaYznbbZn9jNa28
 YNCoyKOdEtf2sM/J1DnTWRcuuYyi2DZznT37h3S4hxYqXFQDa5jHwINPfLInw+cL0RsV
 JFIWx7A3dqoFuaxConL2p1mPPJ/oAhtJckdyODbArQOyHkKavGiuxTObNNjAZ+o3cLq3
 bjqA==
X-Gm-Message-State: ACrzQf2HhJjNUh+jL7Su8IFio+aEkAY6ABmZ4DXyOjtrfW2v5JSa2SQv
 EkHvefWsI3cQoJcjucv7tsHOgLHTrQ3oeQ==
X-Google-Smtp-Source: AMsMyM56AYPvxyLQ9rE1YPbqrOaDsqtiSCxXeorc89q7WQP5TvyDyJvVDxyM2ENrCRwTezjLPGtrww==
X-Received: by 2002:a63:5243:0:b0:43c:96a:8528 with SMTP id
 s3-20020a635243000000b0043c096a8528mr19112743pgl.47.1665458374580; 
 Mon, 10 Oct 2022 20:19:34 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 12/24] target/arm: Use bool consistently for get_phys_addr
 subroutines
Date: Mon, 10 Oct 2022 20:18:59 -0700
Message-Id: <20221011031911.2408754-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The return type of the functions is already bool, but in a few
instances we used an integer type with the return statement.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index dd6556560a..6c5ed56a10 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2432,7 +2432,7 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     result->f.lg_page_size = TARGET_PAGE_BITS;
     result->cacheattrs.shareability = shareability;
     result->cacheattrs.attrs = memattr;
-    return 0;
+    return false;
 }
 
 static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
@@ -2443,9 +2443,8 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 {
     hwaddr ipa;
     int s1_prot;
-    int ret;
     bool is_secure = ptw->in_secure;
-    bool ipa_secure, s2walk_secure;
+    bool ret, ipa_secure, s2walk_secure;
     ARMCacheAttrs cacheattrs1;
     bool is_el0;
     uint64_t hcr;
@@ -2520,7 +2519,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
          && (ipa_secure
              || !(env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))));
 
-    return 0;
+    return false;
 }
 
 static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
-- 
2.34.1


