Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C3853ACA5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:21:58 +0200 (CEST)
Received: from localhost ([::1]:50574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwSyj-0001bj-Bj
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSjG-000121-Bz
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:05:58 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:33585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSjE-0004xW-Sc
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:05:58 -0400
Received: by mail-ed1-x52c.google.com with SMTP id h19so3311435edj.0
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TX18g1pcfM6buz+YOOCEd0sWaEbIpDVPFIvDk4QPCv8=;
 b=diOmfRqB0bQcMgD53dOozqbj7Q7eOIp0a1Yrf9ZQIn9CBGKuz7wvZbpeqCWggV9n9s
 EzHo1SEnFe5biw3aYceQa6uHN1cbe7bY9E53O3UrZG1QJGP3e2A3HjsE6smL4uiDBAsj
 OtbrWZA9l5nBnzsyxfON0uUMwk7p8fmEr4Vbqayy9O2UwRYQa2+6as7d5SgBTD0mfB/0
 RrL22lPirw/vnJgGm1XLIBtNM24U43zPrvUE5qEkgCMu86iyKyqHNkn+k5DsLpJUKbt1
 7aq81Cv4oZ0/byFpZPWAqff0vxubEr5TJTXl0XGCp2OcB6zfxM80BiyymOd8F+/DlEDL
 yKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TX18g1pcfM6buz+YOOCEd0sWaEbIpDVPFIvDk4QPCv8=;
 b=T28IKDuxeOLmfih4qiLPl0bKk6xU2FfT0vv04E9rsU7+heIh0cigNusNHraxvl4LMo
 Fgo3BC8kZ9UPhTFLSf0dUsga+k7qbH8H0zfOJPIBhumQ3FJg2F0kkki+6YeUkQ3mNKEC
 h0Jmrx4MP7CZEIfLb26pFLntFOwHEpexZ7zw9P4Dz/LBmlhtYFXopC8xB5dQ0xsNh0Oh
 g11euoHoZ7aW+ysibsfBxAX12zF3eQSSjK2mXKx8ERSj0T9zSJuFVdyNs15gRztyGZCl
 atNGoCVYhhxT+l6JgumP19vf0Yu75ZqnAePjmexYbAlEJUGe/JZiDbj+CKxXpUQYKzpm
 s5nw==
X-Gm-Message-State: AOAM531KLsMQBq5+2jxwN71jkSMsM223v5jw1ma9gZq/VNpdjo86LmpM
 yKy1huGvP1uFrp+xQ39bqux3qMdqpHG75w==
X-Google-Smtp-Source: ABdhPJwfWvSCI5uMwQaNQBHlc+qySFoS6ZVKpYCjI3Ygog6jjjdeFs0XwkPISGX6KRQZvArz6aoa7w==
X-Received: by 2002:a05:6402:4307:b0:42d:e4eb:5b6b with SMTP id
 m7-20020a056402430700b0042de4eb5b6bmr1007395edc.411.1654106756185; 
 Wed, 01 Jun 2022 11:05:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a056402101200b0042dc6e250e3sm1303801edu.81.2022.06.01.11.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:05:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0A40B1FFC5;
 Wed,  1 Jun 2022 19:05:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 13/33] build: clean up ninja invocation
Date: Wed,  1 Jun 2022 19:05:17 +0100
Message-Id: <20220601180537.2329566-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
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

From: Paolo Bonzini <pbonzini@redhat.com>

Fix an incorrect "@@:" and move "-d keepdepfile" to the NINJAFLAGS variable.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220517092616.1272238-3-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220527153603.887929-14-alex.bennee@linaro.org>

diff --git a/Makefile b/Makefile
index b842dbccdb..fad312040f 100644
--- a/Makefile
+++ b/Makefile
@@ -143,7 +143,7 @@ MAKE.q = $(findstring q,$(firstword $(filter-out --%,$(MAKEFLAGS))))
 MAKE.nq = $(if $(word 2, $(MAKE.n) $(MAKE.q)),nq)
 NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
         $(filter-out -j, $(lastword -j1 $(filter -l% -j%, $(MAKEFLAGS)))) \
-
+        -d keepdepfile
 ninja-cmd-goals = $(or $(MAKECMDGOALS), all)
 ninja-cmd-goals += $(foreach t, $(.check.build-suites), $(.check-$t.deps))
 ninja-cmd-goals += $(foreach t, $(.bench.build-suites), $(.bench-$t.deps))
@@ -160,8 +160,8 @@ $(ninja-targets): run-ninja
 # --output-sync line.
 run-ninja: config-host.mak
 ifneq ($(filter $(ninja-targets), $(ninja-cmd-goals)),)
-	+$(quiet-@)$(if $(MAKE.nq),@:, $(NINJA) -d keepdepfile \
-	   $(NINJAFLAGS) $(sort $(filter $(ninja-targets), $(ninja-cmd-goals))) | cat)
+	+$(if $(MAKE.nq),@:,$(quiet-@)$(NINJA) $(NINJAFLAGS) \
+	   $(sort $(filter $(ninja-targets), $(ninja-cmd-goals))) | cat)
 endif
 endif
 
-- 
2.30.2


