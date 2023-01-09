Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77009663433
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 23:44:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF0rg-0004nc-FI; Mon, 09 Jan 2023 17:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pF0rb-0004iP-QE; Mon, 09 Jan 2023 17:43:31 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pF0ra-00045n-A0; Mon, 09 Jan 2023 17:43:31 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6D1375CDE2;
 Mon,  9 Jan 2023 22:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673304208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HGJ4/+qQUdyPODxPG2cP+HJYVboRrZ3kGN9lq/KT9Qo=;
 b=S7nXKTaFaN3znEDGqEPHwKAb/JqzLtAVrypyG0xrUNmzB+CIrovmqFV1ByLZw4s9oWaUni
 JxSYxK9vmhCcFcKGjtce8NR73F2LWoYOn1GXWfrT4Zl5yX/WROppysdMzqfUpwPVdMfsjS
 1yu5KVhT1jdgWJf0P15LLd5eZPjSpJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673304208;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HGJ4/+qQUdyPODxPG2cP+HJYVboRrZ3kGN9lq/KT9Qo=;
 b=d4/BtsdUbOVzEXmAn5WN/t3joprzEv2y6kRHIFFA/l43/wZ5HWODxT2hxKdMp2J3sjnnJ8
 +FjaWOqiRvbj1lCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 988D613583;
 Mon,  9 Jan 2023 22:43:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UHV3GI2YvGMdIQAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 22:43:25 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>
Subject: [RFC PATCH v2 16/19] tests/tcg: Do not build/run TCG tests if TCG is
 disabled
Date: Mon,  9 Jan 2023 19:42:29 -0300
Message-Id: <20230109224232.11661-17-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230109224232.11661-1-farosas@suse.de>
References: <20230109224232.11661-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

The tests under tests/tcg depend on the TCG accelerator. Do not build
them if --disable-tcg was given in the configure line.

Test against CONFIG_TCG='' instead of CONFIG_TCG=y to account for
CONFIG_TCG=m.

sample output:

$ make check-tcg
  GIT     ui/keycodemapdb meson dtc
  SKIPPED x86_64-softmmu guest-tests because TCG is disabled in this build

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 configure              |  4 ++++
 tests/Makefile.include | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/configure b/configure
index 2281892657..ad25a3b5f5 100755
--- a/configure
+++ b/configure
@@ -2351,6 +2351,10 @@ if test "$plugins" = "yes" ; then
     echo "CONFIG_PLUGIN=y" >> $config_host_mak
 fi
 
+if test "$tcg" = "enabled" ; then
+    echo "CONFIG_TCG=y" >> $config_host_mak
+fi
+
 if test -n "$gdb_bin"; then
     gdb_version=$($gdb_bin --version | head -n 1)
     if version_ge ${gdb_version##* } 9.1; then
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 9422ddaece..aa0e610cf2 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -45,6 +45,7 @@ RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TCG_TESTS_TARGETS))
 $(foreach TARGET,$(TCG_TESTS_TARGETS), \
         $(eval $(BUILD_DIR)/tests/tcg/config-$(TARGET).mak: config-host.mak))
 
+ifneq ($(CONFIG_TCG),)
 .PHONY: $(TCG_TESTS_TARGETS:%=build-tcg-tests-%)
 $(TCG_TESTS_TARGETS:%=build-tcg-tests-%): build-tcg-tests-%: $(BUILD_DIR)/tests/tcg/config-%.mak
 	$(call quiet-command, \
@@ -56,6 +57,15 @@ $(TCG_TESTS_TARGETS:%=run-tcg-tests-%): run-tcg-tests-%: build-tcg-tests-%
 	$(call quiet-command, \
            $(MAKE) -C tests/tcg/$* $(SUBDIR_MAKEFLAGS) SPEED=$(SPEED) run, \
         "RUN", "$* guest-tests")
+else
+.PHONY: $(TCG_TESTS_TARGETS:%=build-tcg-tests-%)
+$(TCG_TESTS_TARGETS:%=build-tcg-tests-%):
+	@echo "  SKIPPED $(subst build-tcg-tests-,,$@) guest-tests because TCG is disabled in this build"
+
+.PHONY: $(TCG_TESTS_TARGETS:%=run-tcg-tests-%)
+$(TCG_TESTS_TARGETS:%=run-tcg-tests-%):
+	@echo "  SKIPPED $(subst run-tcg-tests-,,$@) guest-tests because TCG is disabled in this build"
+endif
 
 .PHONY: $(TCG_TESTS_TARGETS:%=clean-tcg-tests-%)
 $(TCG_TESTS_TARGETS:%=clean-tcg-tests-%): clean-tcg-tests-%:
-- 
2.35.3


