Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D257E5EF6B7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:35:18 +0200 (CEST)
Received: from localhost ([::1]:44060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odth7-0000g5-UE
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3B-0000N5-BY
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:05 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods37-0002NH-Cx
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:49:55 -0400
Received: by mail-wr1-x436.google.com with SMTP id cc5so1782122wrb.6
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=y7HCvdUpnCrsqATmOrnvLqUAfNj99taTmx3C50C4mVM=;
 b=mXShESeT6IbLwHjFd8ZQ/JZYMrgThgyTWA9RMuSi8NiFOeOx7Ywojw5kpU1mvbw5W5
 4HTIvYrl1XcPoolv8RUJmwp/v86Huwg3immDLuJzcUbhqbC4oFcr0/kDGi2be9q8dl+J
 rCezTMpnyMxh9A23pS9g3dtJhONY7c8jNg8hbCD/k/ayMgR0VpndVO4h9aCPRD7Vp2x4
 xVajxiIKTJXW0UJ10Aos9St12dGEP39rIM4dTajH63RMlA06nI5oTyyCNrVTw33U8Ih9
 4+ppzRy3RqVOwwAIBfc03jg00b1nlcCXEj5Gv5EuUHFDqiWevkLb+024y2U+LVePTYIe
 9cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=y7HCvdUpnCrsqATmOrnvLqUAfNj99taTmx3C50C4mVM=;
 b=ANeB/0QKcIWq9o6sXxpPKu9B4GHP8gWaPOLC7sq6nb2PPKDCZxUYSFrDmA3UtxclVq
 9HYXI6jLCvhGABl+1OypwUHB6h/SqOTQq5PZkd2+xD6I9Xa1FPtik6Pogu4JmS6ruJdF
 Y1xSqFu38OjnXqNpeaKLv4Wbbyu52mw02lA8gb+1vVM+rEiLLXMnwtOuzDskNNrV/mG8
 HVOJjYvMUWnEUVNBd/3AF0WbU5hcf+yuZIHFQAxdMcIKoNYwfFDGmCKoAW9pgQb/J74q
 JLmXqOh8j+mjMP6V/SJCCz/c2tZ9cI40gShIyl5qU5wvbBQ7n54YsZ30wy/m0t3sFWSP
 NTug==
X-Gm-Message-State: ACrzQf2sVmrV5rgjkHVtifuD6R5I+wC+UHojJexTuv4SENCNAZpG8vsh
 oZDMz4PhF+mtGICHsqr9uIW7EA==
X-Google-Smtp-Source: AMsMyM7OQXIqXBdx3ovkqW7piLBoSL+XDDpBxdsgxa+4fOFAgdQi63uqjnhyG/p9fvsX3cjoNsvn2A==
X-Received: by 2002:a05:6000:794:b0:22b:311:afe9 with SMTP id
 bu20-20020a056000079400b0022b0311afe9mr1890015wrb.509.1664452192097; 
 Thu, 29 Sep 2022 04:49:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a05600c19ce00b003b2878b9e0dsm4484546wmq.20.2022.09.29.04.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:49:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9898F1FFBA;
 Thu, 29 Sep 2022 12:42:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 21/51] tests/tcg: add distclean rule
Date: Thu, 29 Sep 2022 12:42:01 +0100
Message-Id: <20220929114231.583801-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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

From: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/Makefile.include    | 11 +++++++++++
 tests/tcg/Makefile.target |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index caef287957..9ed67721e2 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -42,6 +42,7 @@ tests/tcg/Makefile.prereqs: config-host.mak
 # Per guest TCG tests
 BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TCG_TESTS_TARGETS))
 CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TCG_TESTS_TARGETS))
+DISTCLEAN_TCG_TARGET_RULES=$(patsubst %,distclean-tcg-tests-%, $(TCG_TESTS_TARGETS))
 RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TCG_TESTS_TARGETS))
 
 $(foreach TARGET,$(TCG_TESTS_TARGETS), \
@@ -65,6 +66,12 @@ $(TCG_TESTS_TARGETS:%=clean-tcg-tests-%): clean-tcg-tests-%:
            $(MAKE) -C tests/tcg/$* $(SUBDIR_MAKEFLAGS) clean, \
         "CLEAN", "$* guest-tests")
 
+.PHONY: $(TCG_TESTS_TARGETS:%=distclean-tcg-tests-%)
+$(TCG_TESTS_TARGETS:%=distclean-tcg-tests-%): distclean-tcg-tests-%:
+	$(call quiet-command, \
+           $(MAKE) -C tests/tcg/$* $(SUBDIR_MAKEFLAGS) distclean, \
+        "CLEAN", "$* guest-tests")
+
 .PHONY: build-tcg
 build-tcg: $(BUILD_TCG_TARGET_RULES)
 
@@ -75,6 +82,9 @@ check-tcg: $(RUN_TCG_TARGET_RULES)
 .PHONY: clean-tcg
 clean-tcg: $(CLEAN_TCG_TARGET_RULES)
 
+.PHONY: distclean-tcg
+distclean-tcg: $(DISTCLEAN_TCG_TARGET_RULES)
+
 # Python venv for running tests
 
 .PHONY: check-venv check-avocado check-acceptance check-acceptance-deprecated-warning
@@ -159,5 +169,6 @@ check-clean:
 	rm -rf $(TESTS_VENV_DIR) $(TESTS_RESULTS_DIR)
 
 clean: check-clean clean-tcg
+distclean: distclean-tcg
 
 endif
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index b9c3d247e9..c14eca82c2 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -189,3 +189,6 @@ run: $(RUN_TESTS)
 
 clean:
 	rm -f $(TESTS) *.o $(CLEANFILES)
+
+distclean:
+	rm -f config-target.mak ../config-$(TARGET).mak
-- 
2.34.1


