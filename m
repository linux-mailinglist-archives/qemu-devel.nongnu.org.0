Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F23553ACFC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:45:59 +0200 (CEST)
Received: from localhost ([::1]:34558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwTLy-0004i4-1L
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSrO-0002bg-Dp
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:22 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:41613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSrM-0006bx-Oc
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:22 -0400
Received: by mail-ej1-x62a.google.com with SMTP id u12so5401683eja.8
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yTa/0uzEfkkhXOiW6+OjBAouplG1hHJ7qPwoee6Vum4=;
 b=gDLJy/XxCGQUw9tiWrK0jfpKwzn0gMMN5JpCX0jcFuW+EDZPP0sgYUHzH5ff7PlC+o
 NeY3Xel9aO+0861ea92jDs5Xl+XZxSZ/C1iahICGBCsn2dofmjdFoXRUK8CgRq/ScACQ
 s4MNCuNj1o0OOkyxiZ6qxs8EQyCVCmTqWcMOCu2tWV0zyAJyCNb49KDic27oG8pc2tJV
 HHIQdGyzexggYXkyL8kW8NeL9YqkrPvWs6MWb0nMmUn5jWwsTyhPytV57m3tShCMqG1X
 MZD/Q31RSIQM8VSdik+UQWQrXEXXdI1/6LwJQ//4AEcGjRre4FOsIlweH3dCyGvtiKzP
 JY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yTa/0uzEfkkhXOiW6+OjBAouplG1hHJ7qPwoee6Vum4=;
 b=zq5L73loOO2Y0ezwBSahZ/gF/99H5nb/tziRQajvRPdrhlb0aPbrlUcXmNjcQFrHtW
 IGF3m+GI4zdeo1TW4HRMS5AOgJyV/7B5YZV5il1PuniM+VBh2f59O1ArwgzRAAbFkczA
 JZr0QES9WmLNRH6miJDD5iYEfq0kDhmCZpgWdPgCLPETbmX3FfVhYCTrXXIhJZBKE0qv
 kPuMe8vxpWXVwKXYgAZD/guU1EtyGD6aaYH4cM2+Mj6U/io4k+yafL7fKvY/jga2tUZE
 X6nU31dDi72A/TCJ/6M/0OSx1JV+Ihf2Au0V+2U2MS2SwwIGDkPuZjVUYlUKPnfkNIpr
 AwlQ==
X-Gm-Message-State: AOAM531h3ezys1+guX1LKlo6NfTgliZEciAOsFPFsKgXXfuEaT9QcBJC
 sGZT7EzUJ6W3K2PnpTSxpJMLgg==
X-Google-Smtp-Source: ABdhPJwIEl3fNMk2LHTo1lOTjl5MVivhCqyYoS9aXiqRrA8KKVfMGrg1Wbml4J1cVcpex4s+pWc5gg==
X-Received: by 2002:a17:906:6a21:b0:704:1440:1bf9 with SMTP id
 qw33-20020a1709066a2100b0070414401bf9mr738658ejc.500.1654107259434; 
 Wed, 01 Jun 2022 11:14:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 bv3-20020a170906b1c300b006f3ef214ddesm984139ejb.68.2022.06.01.11.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:14:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C34E1FFC7;
 Wed,  1 Jun 2022 19:05:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 15/33] build: do a full build before running TCG tests
Date: Wed,  1 Jun 2022 19:05:19 +0100
Message-Id: <20220601180537.2329566-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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

TCG tests need both QEMU and firmware to be built, so do "ninja all" before
trying to run them.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220517092616.1272238-5-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220527153603.887929-16-alex.bennee@linaro.org>

diff --git a/tests/Makefile.include b/tests/Makefile.include
index ec84b2ebc0..72ce0561f4 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -57,7 +57,7 @@ $(TCG_TESTS_TARGETS:%=build-tcg-tests-%): build-tcg-tests-%: $(BUILD_DIR)/tests/
         "BUILD","$* guest-tests")
 
 .PHONY: $(TCG_TESTS_TARGETS:%=run-tcg-tests-%)
-$(TCG_TESTS_TARGETS:%=run-tcg-tests-%): run-tcg-tests-%: build-tcg-tests-% $(if $(CONFIG_PLUGIN),test-plugins)
+$(TCG_TESTS_TARGETS:%=run-tcg-tests-%): run-tcg-tests-%: build-tcg-tests-%
 	$(call quiet-command, \
            $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) \
                         TARGET="$*" SRC_PATH="$(SRC_PATH)" SPEED=$(SPEED) run, \
@@ -74,6 +74,7 @@ $(TCG_TESTS_TARGETS:%=clean-tcg-tests-%): clean-tcg-tests-%:
 build-tcg: $(BUILD_TCG_TARGET_RULES)
 
 .PHONY: check-tcg
+.ninja-goals.check-tcg = all $(if $(CONFIG_PLUGIN),test-plugins)
 check-tcg: $(RUN_TCG_TARGET_RULES)
 
 .PHONY: clean-tcg
-- 
2.30.2


