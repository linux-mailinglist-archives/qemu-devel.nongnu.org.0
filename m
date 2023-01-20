Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C557967600A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 23:18:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIzhI-0005aM-D7; Fri, 20 Jan 2023 17:17:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pIzhE-0005a7-7e
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 17:17:16 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pIzhA-00079L-Ed
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 17:17:14 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B785D3389B;
 Fri, 20 Jan 2023 22:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674253029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=702jP5ex4ZxJiqdr56IM9l5rrWzdFVZCbS0jspohVFU=;
 b=UJk+SN79X6Mi52SyPf4UIc+c9ZA0LQdqez5UlIZizDYu6G6CbPCKYkF+xl7APS/17EshBj
 wmzPg/A8tI/uWAk0iP1kbiiDa3KLLnnlhcKzHcOU0Iyo4zTs8wm+7CKE4A4DI68fpB84Hv
 k1G7LkUbSIm7gj5KuTIp6vbZTWKV+VQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674253029;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=702jP5ex4ZxJiqdr56IM9l5rrWzdFVZCbS0jspohVFU=;
 b=szGqJxZ7M3x6lOVYRVsyQ8rEbPxKinM3DNNlBAsLd3IsuA5T1iF1jQIuy3I5jX2nZNpPRZ
 x4vVGcZc3mQRQKAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 604F113251;
 Fri, 20 Jan 2023 22:17:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QFCnCeMSy2P6RwAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 20 Jan 2023 22:17:07 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 2/2] tests/avocado: Allow passing command line parameters via
 Makefile
Date: Fri, 20 Jan 2023 19:15:00 -0300
Message-Id: <20230120221500.4194-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230120221500.4194-1-farosas@suse.de>
References: <20230120221500.4194-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
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

Add support for the 'avocado run' "-p" option, which allows us to pass
parameters in the form key=value to be applied to all tests selected
for a given run. This is useful to force generic tests to use a
specific machine, cpu or qemu-binary where otherwise the defaults
would be used.

E.g.:
 $ make check-avocado AVOCADO_PARAMS="machine=virt arch=riscv64"

 <runs all tests replacing machine and arch in those that do not have
  these parameters already set via tags>

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/Makefile.include | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 9422ddaece..f92e730aa0 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -107,6 +107,10 @@ else
 	AVOCADO_CMDLINE_TAGS=$(addprefix -t , $(AVOCADO_TAGS))
 endif
 
+ifdef AVOCADO_PARAMS
+	AVOCADO_CMDLINE_PARAMS=$(addprefix -p , $(AVOCADO_PARAMS))
+endif
+
 quiet-venv-pip = $(quiet-@)$(call quiet-command-run, \
     $(TESTS_PYTHON) -m pip -q --disable-pip-version-check $1, \
     "VENVPIP","$1")
@@ -144,7 +148,7 @@ check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
             --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
             $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
 			--filter-by-tags-include-empty-key) \
-            $(AVOCADO_CMDLINE_TAGS) \
+            $(AVOCADO_CMDLINE_TAGS) $(AVOCADO_CMDLINE_PARAMS) \
             $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
             "AVOCADO", "tests/avocado")
 
-- 
2.35.3


