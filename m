Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345E35365D0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:16:15 +0200 (CEST)
Received: from localhost ([::1]:60458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucdK-0006L3-3g
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8L-00038P-J9
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:14 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8K-0003sU-0O
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:13 -0400
Received: by mail-wr1-x431.google.com with SMTP id d26so770955wrb.13
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1fkRhNUeXkU9zPTiWSyeicWROmvCEmDtFl8CThXj3fE=;
 b=FQz0edpnUPd4PAXlUKGDa6QGUXVzFAdATMqIqoXj889jZMfwnhH6B7b2oeOTWG1oCL
 Wb35CKv88GHfKIW4+tKgO7UG5dXDCJPDme96nHV7chgwICT7Ve4FKwguR0/pBGjvEngy
 b+I0A1rmIwnqYUgilubtch+YFLDbnM09kT0/zBrlwjsz7MM2galqNMoKCnVCMK6Scw2K
 BiAXs0d6ITqqyj8x03xi656IRQmfpWdjQWlxHVxsnG7LWQY+Hmp5DcRH27ksoS47t+lZ
 yPMRAtnMgbe8jtxq9Bm+vtC9feo4z26kynywh/d6sye33kHJ0Jqn3YK+W3kPQJjkzdXA
 IV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1fkRhNUeXkU9zPTiWSyeicWROmvCEmDtFl8CThXj3fE=;
 b=PP9o5DiFvlotAK+KbDyu7yuQPawDIvlpSM4asdY9kUVPaG8Dhbw3vwC7vf732ZWjwv
 ghCATmlZaWB7LP0P/cwPenTonvYQZVkoT+Y1YgQxzFIaN0C5RP4V063jElDPxJ4NlPSq
 J/f0Yi491t6r9LgBpbBKn/maLCA8dzQziTCaodY160UPX6oxhezkfte5np05kB4+7v9Q
 6UHPMRzbsx2D70/96N5HcZv8OSVSj3fnCEBDad9iVWhbFmQGsvrpOBwi7pEzT7ET1u35
 sPZpVC9/dp6DBijdcj7KYIckg8NvrqaOvzz63q/KwvTsmWvY9+F/NmWpyd+oJp/eZ6xN
 xf3A==
X-Gm-Message-State: AOAM533yHE/tYEKFayQncjcxAeWxZzm1pF5RytvZjM7o66JE9OvWhnPT
 VHmi/YgFWkagG90dxHACHxfhrA==
X-Google-Smtp-Source: ABdhPJzVnbubPbPGVbKEZXwhDbcyUq5QFHO/oUrtAy/wNqWSJmuHk1jQQZxYf97u9WVet59P9z0Kiw==
X-Received: by 2002:a05:6000:1569:b0:20f:e429:d6d8 with SMTP id
 9-20020a056000156900b0020fe429d6d8mr19533793wrz.663.1653666250760; 
 Fri, 27 May 2022 08:44:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a1c5402000000b003972dcfb614sm2413797wmb.14.2022.05.27.08.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:44:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0C2F81FFC5;
 Fri, 27 May 2022 16:36:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 13/33] build: clean up ninja invocation
Date: Fri, 27 May 2022 16:35:43 +0100
Message-Id: <20220527153603.887929-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
---
 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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


