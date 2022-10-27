Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A51A6101AC
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:30:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7tL-0005lK-Cx; Thu, 27 Oct 2022 14:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7sI-0005UN-B4
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:45:07 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7sC-0004lG-Mn
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:45:05 -0400
Received: by mail-wm1-x333.google.com with SMTP id jb18so1580064wmb.4
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aiqxcURpWemXtfy2ejkjSFGPBju8Q9jPUI6+wXEAfhU=;
 b=xOisjE0I5JXGfjzH+yHuCBWRy1dbvPNbjs/vCMACJjuOjUohO/KWe23dxYSQKZFTMY
 gKYWcsRyehIaOUDdYerAx98i7CBhcetgAePD+uGmhECJlJoSE7Hr83uiwhBsx65NBMSq
 FA9cIV5IgirFSYQN+dtzrLKqZDhE43gA48GC02EHIgTgPr6usZ286KjNSLPJvkUAt1mk
 Q2NBcVLviBcy3qIhbCtb1NDrkV1WJ3UfDlSuWfF3YnaIX7n7beJkE/pg++WOjYLwnpTT
 S2a2U0VbihfvOI+FZc08nca0Guth2bfFuimDaOsd8mRWapeXNDOkevXXXSOr5bFYDI/v
 18pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aiqxcURpWemXtfy2ejkjSFGPBju8Q9jPUI6+wXEAfhU=;
 b=aJhPyfYF/5J/UclKeZGy3u4daZBSMvnnnv+STlprD/c6DIyYM7kZMDmSvQ6B6EG9j2
 nLMYfHsvdFGUMJCTXljzocmm0kmBp8XNH8xb1SjSq/zsGW5dhf4kZtVEckuY9cdyOYsr
 Osn298iDNencOoiZEfiII6n+wlmHwewayVvLw8oL7JKiJyWlP7KTi9VQfaS3fqJI8YcD
 RJYe+45XiLdJG6vIbS6BZ02721nogPfrpoQt0v2YqroR7E6wBJ0NxMylZIvPenn9h1g1
 d9V5GedIhoiBPVp4aeGVwgDUgcqcHub0Fn6o13KkJXApc4nHrZL1t9HuNVkcn+qRVuMY
 RUdg==
X-Gm-Message-State: ACrzQf3PrPIMiV3DGJ+wqpSo0RfXTm853CgxAJ/RWtqAoQeKmy3NGOTP
 P4eiSYihLkUXPJzCh4ewJ9FByG9nCRQ6DA==
X-Google-Smtp-Source: AMsMyM5+YtAYpvwlT+TgCU5EV1IymM2W1egvaq5lavxRVCUZzyqLJydYez+WkU3atts3EVs7gn7vMw==
X-Received: by 2002:a05:600c:4e11:b0:3cf:452a:2bcf with SMTP id
 b17-20020a05600c4e1100b003cf452a2bcfmr6867487wmq.108.1666896298555; 
 Thu, 27 Oct 2022 11:44:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b003c83465ccbfsm5531994wmq.35.2022.10.27.11.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:44:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D530C1FFD1;
 Thu, 27 Oct 2022 19:36:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PATCH  v4 27/30] contrib/plugins: enable debug on CONFIG_DEBUG_TCG
Date: Thu, 27 Oct 2022 19:36:33 +0100
Message-Id: <20221027183637.2772968-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We used to rely on QEMU_CFLAGS to expose the debug flags but now this
is synthesised by meson and only available to the main build. Add our
own flags if we detect the build has been enabled with
CONFIG_DEBUG_TCG (which is the default for --enable-debug anyway).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 contrib/plugins/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index df3499f4f2..23e0396687 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -29,6 +29,7 @@ SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 CFLAGS = $(GLIB_CFLAGS)
 CFLAGS += -fPIC -Wall $(filter -W%, $(QEMU_CFLAGS))
 CFLAGS += $(if $(findstring no-psabi,$(QEMU_CFLAGS)),-Wpsabi)
+CFLAGS += $(if $(CONFIG_DEBUG_TCG), -ggdb -O0)
 CFLAGS += -I$(SRC_PATH)/include/qemu
 
 all: $(SONAMES)
-- 
2.34.1


