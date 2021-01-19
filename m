Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3775F2FBE9B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:12:22 +0100 (CET)
Received: from localhost ([::1]:43754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1vUJ-0005s6-OS
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:12:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1vB0-000124-4y
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:52:26 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1vAs-0003mm-Mc
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:52:21 -0500
Received: by mail-wm1-x334.google.com with SMTP id c124so572144wma.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 09:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sE2rw1O4u9cYqn0FvywReTtt3n/OCFCQyRnzm4hokb8=;
 b=Vxf/T+guXKKFi79QLvzeis3tcD1TTzYG3CknaiX/DIKiMGVOTtXYtRtE5C9Iwu5q9+
 zYVbHlpOjoOOqdr9h2CK5H1GW/eb6i6VJW+81MYCP1fEkDkZSRC/FCAh7NBcyfo2UVRA
 72hD4mmTOdEpYJ/TckWPGWJDDOe8GKUaSjPn+1dZVq1C+DZYnqr/iXKrF6dFrh3WLbpP
 /PpACeQqsjhHIdKGtWMxAr+7F/sARQOpp0xmrmLMLf/zCC2qF3ja2A4rT/DMiFCXGbKG
 MpcBhbwtSbWeEMdxpRQ6uds1Sd5OnqIzqXsOuFER9HuXhPxPk/NIPQ6NzLJwWjdLYYNG
 yl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sE2rw1O4u9cYqn0FvywReTtt3n/OCFCQyRnzm4hokb8=;
 b=s254rKRUfJcy3qgdlcRpwqB62KXs216mhoc5LV2BTm5q+OHd0AfjdiHMYzwUlGGKxO
 SqMFqtapQ43G5fEOxkIkLKO1bBmfJCN9SnGhx1E7pOhnTxqS9mSPT3kzwzl4SlyXogqO
 DgQzrW0ED7kjRVMqh0kjLGTFPCzIkJeHxK4lpshf2k6pqayWrZpkqZ+y2jqVM1/9ZwAF
 tuuOzYFoxYn+AQqYG82In3EXBlhegRcr0t/bBS6PkbaTtpF0RPDkshXou4fU4lEnduic
 k0jjBIHJvWLAk8NoSQP+hcot4yD1GYMXcm7B2XhujgDzwo+4dTGScHOasxFGqrUlP6ej
 zETQ==
X-Gm-Message-State: AOAM530UopXt6QEtO6ooMejw0513gpTr4xiaWyqJXGkWPIN536kBNQ6U
 Ov+QbBhv83YGoP37JKxtq3IM9Q==
X-Google-Smtp-Source: ABdhPJzjv8+6G6mXo49wN/wp/kVz9bjVzlFSnWkHlXv/ZXh56+y6XhxJwBZyq3LElJDy1VW+t/sZXA==
X-Received: by 2002:a1c:9844:: with SMTP id a65mr705534wme.113.1611078732917; 
 Tue, 19 Jan 2021 09:52:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n11sm41984176wra.9.2021.01.19.09.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:52:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 377AD1FF8C;
 Tue, 19 Jan 2021 17:52:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 2/6] tests/docker: Fix typo in help message
Date: Tue, 19 Jan 2021 17:52:03 +0000
Message-Id: <20210119175208.763-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119175208.763-1-alex.bennee@linaro.org>
References: <20210119175208.763-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

To have the variable properly passed, we need to set it,
ie. NOUSER=1. Fix the message displayed by 'make docker'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210119052120.522069-1-f4bug@amsat.org>
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 0779dab5b9..bdc53ddfcf 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -209,7 +209,7 @@ endif
 	@echo '                         before running the command.'
 	@echo '    NETWORK=1            Enable virtual network interface with default backend.'
 	@echo '    NETWORK=$$BACKEND     Enable virtual network interface with $$BACKEND.'
-	@echo '    NOUSER               Define to disable adding current user to containers passwd.'
+	@echo '    NOUSER=1             Define to disable adding current user to containers passwd.'
 	@echo '    NOCACHE=1            Ignore cache when build images.'
 	@echo '    EXECUTABLE=<path>    Include executable in image.'
 	@echo '    EXTRA_FILES="<path> [... <path>]"'
-- 
2.20.1


