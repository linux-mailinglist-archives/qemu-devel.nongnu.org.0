Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA0B42B2E7
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 04:50:30 +0200 (CEST)
Received: from localhost ([::1]:53318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maULd-0004co-B1
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 22:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHZ-00048k-L8
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:17 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:46686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHX-0004lX-Pb
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:17 -0400
Received: by mail-pl1-x62f.google.com with SMTP id 21so784967plo.13
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fbekWwHWkYvCfsIkbs+I86iCi1VerGNgnv3kr2JgTV8=;
 b=yKI3Oslf+ydNniICaebBvl2IVQ8bxJd6Pqb06kvwFHTSAqVVv+SUvWy7WSG/TgHyj7
 q8oqlzajKqTX+XAb4clXSVIKfKbH4sJ569V9UWh3yXvWK0EW5qz4UkoA7oyrNEyrKWvz
 VVijhmESu9l4GjZdIdfv19V1HyQf2imVe47dGqHMJy6VCG6DgFMAaqnEF21kGxQ4h76+
 eVzrMyLp7FTen+CUFVHhisjwBQHEuAfC3hwx1uca7HNEVkLJGKQeqILJlGdR9wLsmSsU
 pM+EzThCalEPO5PMvbUPsonnYsD6jG50mCAE+bnwnALz92YF2VtfoOupQmWTsOeTeWzE
 yvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fbekWwHWkYvCfsIkbs+I86iCi1VerGNgnv3kr2JgTV8=;
 b=iEMdD6qI2S8NEX2uuEa8gP1HjAbb+je96nMyM3V53+5lAx1gkvLZXs9m/iBYuuwpB0
 z30SnamM9nVW3nYFUdMPfUORIx6UZwjjb3KGe0m/k+RmWWBkwEJJSuH8ACC9m4EWtgw+
 Lbz/At6nQdllrIntyj/DVor56eKUdEBs8H0xKupvNwG9PlT+O1nWlrrirmw0s8KPK2p5
 XDJHYT0GSK0vJK+5OEEGXVJCPHOy06r+6YGofzEdwcbax/fI9hFNW6jEF9nanCrONlyL
 aam1YO9lanj8HOYXhlYyTeQs+psEOcF1AfNggU4jBLJROkuhe0HUif9WXgcbIJBdspfv
 0/5w==
X-Gm-Message-State: AOAM531ENByWbTtuofpBqUO+uj9nEbSsYxpLcN5/RE0f0ygsosRh/2Dr
 6UhdG4qjQt5Q6FvP9dMUzLro9Z8fbUMZEQ==
X-Google-Smtp-Source: ABdhPJzbmFlP23jE4ktX1OEediMuYSpexiCSeNH5B7f5aZ2IXQEjfkR+OHOyooXifwsFC/LQWtP1Pg==
X-Received: by 2002:a17:90b:2493:: with SMTP id
 nt19mr10659306pjb.78.1634093174311; 
 Tue, 12 Oct 2021 19:46:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/48] linux-user/hppa: Remove EXCP_UNALIGN handling
Date: Tue, 12 Oct 2021 19:45:24 -0700
Message-Id: <20211013024607.731881-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

We will raise SIGBUS directly from cpu_loop_exit_sigbus.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/cpu_loop.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index e0a62deeb9..375576c8f0 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -144,13 +144,6 @@ void cpu_loop(CPUHPPAState *env)
             env->iaoq_f = env->gr[31];
             env->iaoq_b = env->gr[31] + 4;
             break;
-        case EXCP_UNALIGN:
-            info.si_signo = TARGET_SIGBUS;
-            info.si_errno = 0;
-            info.si_code = 0;
-            info._sifields._sigfault._addr = env->cr[CR_IOR];
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case EXCP_ILL:
         case EXCP_PRIV_OPR:
         case EXCP_PRIV_REG:
-- 
2.25.1


