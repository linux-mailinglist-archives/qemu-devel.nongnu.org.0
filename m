Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3783165E97E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 12:02:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDNzl-00083V-2u; Thu, 05 Jan 2023 06:01:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDNz2-0007sX-OP
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 06:00:48 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDNyw-0006Hy-9Y
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 06:00:25 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so2243024wml.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 03:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/uH+xALmRKBwnyPRoXqnK5RDFLZX9NQN/iCiACzyGgk=;
 b=WUCPtZA6lJVgM0XXfUldTfZvGd+ZcYBi7odiPvoWq6+qI7ligO2m3nb5Wrv3JEHUDm
 7PcZ7s6/b0ZAoW99ZeAZm1eyfi5gZVbMLShnRXk5kZjdK8pVUVxqthZA62EhCIBegNij
 VrGmF1W356fthAimu2IISC2Tx0Hy6il4lvWyb5edp+j/4J3LEXVHFYZfCd22qEN5E5lg
 OTQMCCs4HsYlInHQuazA4MI4Rjf82LpOnXDJBmJwJhvBAcEWJLvcte/TkHtw6SaNwuad
 VWDbw3pDBci7XvMCkvI7cdfPdwH7N3KP5DXQ2YxE95eQ6pvy8hqLTXFBaRCtE/vkWsl+
 Sr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/uH+xALmRKBwnyPRoXqnK5RDFLZX9NQN/iCiACzyGgk=;
 b=2qUVtbJ0WNvnrH+loTYxX+K3SBPOmw5Z8h0OaY3/6HSE1AiOlwhAcx6/9fhqgV1lTt
 KfNJPvkGij+XrNXkw8B7VhxH+kwQfelG2Wp32IhkQLuS7mGHJb6UqDsGI0GWEHQJR1fO
 ccbDhxGyey+jE72G7xAxXOXvDEd4jxxmXchVk5h67KfJ+sfcaZ3Xr+kADMr6eMwdESXX
 wT14GqoOE5u+yn77FKEJeXw+My2MHgOOOPgDjIIWeafc7rJ8De4Gy6oSqTlLuhAbcXtQ
 lGtSvLxq13GzcUHFOjd9wMCEoaK6+EPIIqkQPwNUdeh6+FZUkrZDToysLx+jIWK5iDc1
 yapg==
X-Gm-Message-State: AFqh2krsApst4d2ATrGb3z/MU5QwfE8pGrUZL6iaLpuVGeCHCwWdkBC7
 3FbtQbGtaIAc4944qZ3LmKw46A==
X-Google-Smtp-Source: AMrXdXsdcOiY6X8ZWndJO1d/YB3HCVXyDpBfvdihU2dKLu7F1eq9NCWmKbEIvkP5xNmpKG9ihQ5C7A==
X-Received: by 2002:a05:600c:1d1d:b0:3cf:81af:8b73 with SMTP id
 l29-20020a05600c1d1d00b003cf81af8b73mr35708238wms.23.1672916408417; 
 Thu, 05 Jan 2023 03:00:08 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q187-20020a1c43c4000000b003c6c182bef9sm2378783wma.36.2023.01.05.03.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 03:00:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 900201FFB8;
 Thu,  5 Jan 2023 11:00:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 1/4] semihosting-tests: add timeout support
Date: Thu,  5 Jan 2023 11:00:04 +0000
Message-Id: <20230105110007.1977399-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105110007.1977399-1-alex.bennee@linaro.org>
References: <20230105110007.1977399-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

If you break semihosting in a way that hangs you need to be able to
detect that. Add support for a timeout.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 1296fde..f58b79e 100644
--- a/Makefile
+++ b/Makefile
@@ -57,10 +57,14 @@ SYSGDB := -gdb tcp::$(GDBPORT)
 USRGDB := -g $(GDBPORT)
 endif
 
+ifdef TIMEOUT
+SYSTIMEOUT := timeout --foreground 10s
+endif
+
 QEMU_ARM = $(QEMU_BUILDDIR)/arm-linux-user/qemu-arm $(USRGDB)
 QEMU_AARCH64 = $(QEMU_BUILDDIR)/aarch64-linux-user/qemu-aarch64 $(USRGDB)
-QEMU_SYSTEM_ARM = $(QEMU_BUILDDIR)/arm-softmmu/qemu-system-arm $(SYSGDB)
-QEMU_SYSTEM_AARCH64 = $(QEMU_BUILDDIR)/aarch64-softmmu/qemu-system-aarch64 $(SYSGDB)
+QEMU_SYSTEM_ARM = $(SYSTIMEOUT) $(QEMU_BUILDDIR)/arm-softmmu/qemu-system-arm $(SYSGDB)
+QEMU_SYSTEM_AARCH64 = $(SYSTIMEOUT) $(QEMU_BUILDDIR)/aarch64-softmmu/qemu-system-aarch64 $(SYSGDB)
 
 all: usertest-a32 usertest-a64 usertest-t32 \
 	systest-a32.axf systest-t32.axf \
-- 
2.34.1


