Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79315F453B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 16:15:05 +0200 (CEST)
Received: from localhost ([::1]:33188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofihM-0001Ox-Rm
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 10:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhq3-0001Iz-Hg
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:02 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:50945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhpz-0001qM-HY
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:19:58 -0400
Received: by mail-wm1-x336.google.com with SMTP id ay36so8873726wmb.0
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=aMdrY3bNL4xFq/9HOGTlA1ptoK89idiqoPrj5xyoGhs=;
 b=h7kwHDjaWlCIuFDh25tzIzqirc+QqEBjC75niSvqARJiCoXTbBy5sffcYlyWQTv/kl
 AqCXBO8k9Taa9ZKdSCYY7drooA4oMsS8xGcLPfyfIFOdX6zlZbjkPm3QUBogP4zPSgeI
 VK0QtkNkfn/f9mjVmp+7m1uUtE1GdwweBLfFobg1sr1sE/ws+1AcLZsBYEbS10BGPpEs
 rss6EQVpugRE9qH21mbZqlJAsO3atJONzOOHE0wdvorB2DusObmd2Dj6sFBzTgBDWdcb
 +mFk0s5gzasvewT2/3Bok9fL2FSmhrqcw7vAUzKItipJ0iZl+0h8wWlhoVrJtVC4jRwg
 Ix0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aMdrY3bNL4xFq/9HOGTlA1ptoK89idiqoPrj5xyoGhs=;
 b=AWWdXHi81YkE7QyXb5oflvqdd1hY9F5wJKndmR9vc5Hyo7YfjtiJkAulcIHnKEfPlt
 Qs62oRcZxBdNnR4AlCdtx7hd2OuZAA926BELhFWdnayR67tfF7WWAuR3bj4EbrDPLydj
 pXFCDIsJJJW0RSpHeP4XIb2AygWw0urLbTVgrKYZLZQyOCtkXZWsT3R9o7DdI4qEmTAL
 WKgpXBAeFAgIdCkJhsNXfi1UEQHBGyiROBUhTOpylO1G71yxdt3czIGmAVEdctT5lxdJ
 yVEwXM+6/3xn3b+g9DV3GlN5YSiBiQ8FCMN3a4xe8rFBNM/5SAF5D0Lnh1z8ZXkkNToM
 8QXg==
X-Gm-Message-State: ACrzQf1ke0p0cK9P+vgapteh/iAe+58CIdI4HviepkDgKLIl0zboXZpR
 YkLAiU7y0tVcnlBEu7RZGYgT3yxrXXChkA==
X-Google-Smtp-Source: AMsMyM5XHn8UBEar7NSQemF5UmI6g/ncety1FaQcFtMEh/sZgrNB7HNJ4sWM/M58op/GlDPukI+ORQ==
X-Received: by 2002:a05:600c:3d13:b0:3b4:be25:9236 with SMTP id
 bh19-20020a05600c3d1300b003b4be259236mr10340255wmb.65.1664889593713; 
 Tue, 04 Oct 2022 06:19:53 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c154b00b003a3442f1229sm20918289wmg.29.2022.10.04.06.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:19:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A1DBF1FFCB;
 Tue,  4 Oct 2022 14:01:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 21/54] tests/tcg: add distclean rule
Date: Tue,  4 Oct 2022 14:01:05 +0100
Message-Id: <20221004130138.2299307-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Message-Id: <20220929114231.583801-22-alex.bennee@linaro.org>

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


