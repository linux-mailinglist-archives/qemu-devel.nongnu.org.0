Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65A34D9AEF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:16:34 +0100 (CET)
Received: from localhost ([::1]:59314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU66L-0000Ba-Bc
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:16:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU62r-0005rD-2I
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:12:57 -0400
Received: from [2a00:1450:4864:20::531] (port=39471
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU62p-0000ZD-Do
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:12:56 -0400
Received: by mail-ed1-x531.google.com with SMTP id g20so23906968edw.6
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UF17Kk3QoODmmAuugJo++SVs9V0a1dWe/CS0x7/pys4=;
 b=m+eu/SzVKHFlfkck3kHdhYjzq5BSVPZBgm/RZn3AvPBhNTHZ2UOOZYNL6n+HLDqJmI
 rciE/odFIwy8XvDIgW/S+0A2QMOU38Ei1vy7MU+4bUKgVxrt3XHqVdURXxkmJJotDBUI
 hxQVBNNFw1Fv4kTE9wDuI+fb9qlRUlzCOZhLyzCDGO7AJ50xRAoWp0pPrjOLdqfu3eDH
 OftMnrY2DBOKviaMrLzhm/k25dW/bvTwyIr0pae/nn7A+Cnk3nS/FrPjqpX1spBKOL0U
 JQK0nmMa6pkL0mfxqvBelzt9lQDBf4pqcowz2goVoOxi3zlhyrU+7WFhz+CzbXvGbqJ3
 xZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UF17Kk3QoODmmAuugJo++SVs9V0a1dWe/CS0x7/pys4=;
 b=1daGgYU3s/ZEvkXxs06wT+R7s/FZ5ZVECrSVDbW7DZDdAHCLHgZZcfe5V4ECuULoKC
 7Q0dxqTEgQuqbFBVNEKXTMtUF52075bx1MkCjgCwi+ru4CJPUMR5ngvrM4TMiUQK0GG4
 4ySTwYFBvzLDezTEQqCXQmwJwnPxAU5OWyhKBrmxhkOf0GKHInHnyau5CfWLJmj1Rnza
 IuL8wl061+SBdttUXaKJQofkW4FHVk+3cka9zd/eJjXjlUBqARbigT+yrDTc4yvShV7Q
 S/ABmDa/nGM2tvuQ9cMe+fAf3kvL2FnHXVOnDWjcdJemfMAHpqtjnSWqRzFnh5jP2C87
 cgZA==
X-Gm-Message-State: AOAM530lBBp/Zuux+XBM9Zd//BLulfx0o61DYp5yAOBpQynRfl4BGxe2
 tnJucmRpAhF+S+a3tiLmNobFPw==
X-Google-Smtp-Source: ABdhPJwCGEzXQ22/6bPTuL6OeeXHMavCN10CAkhG0X7ZrBMHAbWLISeqd9D+NUEP8PFYz7NzE/6D8A==
X-Received: by 2002:a05:6402:4409:b0:416:2859:94e4 with SMTP id
 y9-20020a056402440900b00416285994e4mr24974165eda.137.1647346373513; 
 Tue, 15 Mar 2022 05:12:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a17090637c300b006d8631b2935sm7970614ejc.186.2022.03.15.05.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 05:12:52 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0D4701FFB8;
 Tue, 15 Mar 2022 12:12:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/8] tests/Makefile.include: Let "make clean" remove the
 TCG tests, too
Date: Tue, 15 Mar 2022 12:12:44 +0000
Message-Id: <20220315121251.2280317-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315121251.2280317-1-alex.bennee@linaro.org>
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 sw@weilnetz.de, richard.henderson@linaro.org, f4bug@amsat.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

"make clean" should clear all binaries that have been built, but so
far it left the TCG tests still in place. Let's make sure that they
are now removed, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220301085900.1443232-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index e7153c8e91..7a932caf91 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -162,6 +162,6 @@ check-build: run-ninja
 check-clean:
 	rm -rf $(TESTS_VENV_DIR) $(TESTS_RESULTS_DIR)
 
-clean: check-clean
+clean: check-clean clean-tcg
 
 endif
-- 
2.30.2


