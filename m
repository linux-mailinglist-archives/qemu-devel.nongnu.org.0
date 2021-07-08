Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A533C1970
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:54:14 +0200 (CEST)
Received: from localhost ([::1]:41994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZA5-0001El-54
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1YiP-00016A-GK
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:25:37 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:36539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1YiA-0007qy-Jg
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:25:32 -0400
Received: by mail-pf1-x436.google.com with SMTP id 21so6314319pfp.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 11:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0YHXigbNVImYxDExVacGLi6TZJUTMaB3TPviVltVso0=;
 b=i0B+RxHn4yB59I3XINnfJV9zy1kL77yashOmIwhlsGokKXNJHfrl2hCkls4MAy6f9P
 PQ9GQZQzl8+yAt+i1iU4M6IrbSooYoAkEf5bspQlCDke3Spq7LFqoKYyEV08mc1O+1/h
 IJvexd0cWs1XSqOEvMV43IWV7uFoTpgZ8a0eK/83FlmOl0sSs8mM8K7T3JYvE60KuFqc
 7Aa8he5uITNSUigEcdYo0l8xJZyA/LyMexYabMxJtDQGBCxUz6lEdOwpvd3Pu8mIqTzt
 O0l+uy6nCTQq7bfoBcffnSWrd75omEQALXBY2S+khUVGKi/tvFAAhDqTEOoeM1EtcJQq
 jXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0YHXigbNVImYxDExVacGLi6TZJUTMaB3TPviVltVso0=;
 b=OuL/Tu53P+9HIE7EDYUvHhtzgfXXQhsbMdypzlEivJ1rhqlFVX4jnZAdCSV+3diT+7
 owmf07NO4rS+I8i7IRH1nDWGxcAwhmwmfm3yRLJMGhs8nzRyvJRTbBg1kQRY6CgDH+tZ
 V2nvyxySMJFgMB0DlV1yxj7w6fMuq8yLRfpaPapLggcnd3wOzSj83ZuWhE2MI4xl15bJ
 0HHdofQ1+Uej0qBlvgqQUluKMASIuiMuZn+myKjfRSrj4fXb1FFTOr2WWbF7YvmJjP0I
 jT9fU/MJi1VlKOGwY8xK2hpZDFkURxc1evbTomPhf4ycQmpQq007+xvblc7uWz6r1SpJ
 l0Hw==
X-Gm-Message-State: AOAM530KvMszqI+0PO9RrbSwcDnEVS7Zk5Wtq0J3JRK8+FXJn7gpPyJk
 encTZA6Zlun6bq+gOZ32/qWPCI+dwVFANw==
X-Google-Smtp-Source: ABdhPJxDcHB33BNdRN3qOGJcQMkRzRHqL81hspgBjXJWJwMRd9XLIYfa6dZ5fdEdya79OwkBC+v0zg==
X-Received: by 2002:a63:4a18:: with SMTP id x24mr32971216pga.303.1625768721338; 
 Thu, 08 Jul 2021 11:25:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d67sm2751810pfd.81.2021.07.08.11.25.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 11:25:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/alpha: Use dest_sink for HW_RET temporary
Date: Thu,  8 Jul 2021 11:25:17 -0700
Message-Id: <20210708182519.750626-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708182519.750626-1-richard.henderson@linaro.org>
References: <20210708182519.750626-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This temp is automatically freed, just like ctx->lit.
But we're about to remove ctx->lit, so use sink instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index d8bd47de75..5ea091eef5 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -2749,7 +2749,7 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             /* Pre-EV6 CPUs interpreted this as HW_REI, loading the return
                address from EXC_ADDR.  This turns out to be useful for our
                emulation PALcode, so continue to accept it.  */
-            ctx->lit = vb = tcg_temp_new();
+            vb = dest_sink(ctx);
             tcg_gen_ld_i64(vb, cpu_env, offsetof(CPUAlphaState, exc_addr));
         } else {
             vb = load_gpr(ctx, rb);
-- 
2.25.1


