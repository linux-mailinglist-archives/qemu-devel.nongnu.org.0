Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E996F0893
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:46:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3oA-0001pq-6G; Thu, 27 Apr 2023 11:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o4-0001oD-6z
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:16 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o1-0004ia-Sq
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:15 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f315735514so29117135e9.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682610311; x=1685202311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8/qtbypS+zMfBjvyTpm1Br1Ca+O9tkkfRjWzVGRifNU=;
 b=DYjzh/JeYu65JmawbYSPleiqnF+ZhAu4Vh4jf2ogVRJpK0yC9wnyG8STZ+yqLdIwcL
 oLS5Hsx4YqnJfLHiZtcatnih1HUlfmKjrwcUCSFOxH/0ky/FsNXlKCArQlK4YNLsULDJ
 lZGuyTD1aVgoVsWVEOc9TXB+nAX2yasN5ixrtkgJ2+zYqe5pzXjifigNI2e1YyUuYswu
 7WCVJpZxpgjxYUqqZ8YNsOY55yVsA4kw7sU/Ka+Xgo2zsEW1CluCUzIIwpOk5SXSNl8A
 IOe4K/38w1fG6WCV5wgPnyLqyET37+mv0T2flsSp4awFmBeAJEb6x0JtznpsMjomaCO6
 ss0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682610311; x=1685202311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8/qtbypS+zMfBjvyTpm1Br1Ca+O9tkkfRjWzVGRifNU=;
 b=UyI3PJOlCqu4fxGSBdjiH4J29zqyQqdO/yLgSkK0ojK27Uxymc0pu/mMBLWaz4hp60
 1Fi78gzO7sV4BO1MRRiA7Z05fj/2CmZUNZ39BDMtoW4mQnExOEuRsb2eRrfzWdhpvihC
 1FCHMGxlL7fVYmnGGf2gwgN8wwxpFFmro7XyodxfikUDW8LdUNPZpixMLuhCfmqVs6rn
 xzHJNH5zg3gYaCG4PyH1GTpybMHPDqXd1iC0e61hb6KQQxH51VIy7SxhFBOj42HYLAxl
 bqSGoAeXKNPp3yY0kBrse6DvN/OF6QXJ/8bJ4R+TCU+nLlEhrXy/t4z6Ovxy+sjmT64e
 h/3A==
X-Gm-Message-State: AC+VfDyWpb+DXM4ojosMbLzY3g0vKJ4peqrcIYxpErpSraYGTj1YSrNW
 XQSZ75K9wg/lNi7rhU9wHeB3f0qFBKKNPdLZ5Po=
X-Google-Smtp-Source: ACHHUZ6XLsz7zoHD9KgDw1TYsps4HfZpH9McH6eeKgUXvESyatVrkpOiM/BmdFZMxNWd8NGWpjjN2w==
X-Received: by 2002:a05:600c:5409:b0:3f1:754e:69e6 with SMTP id
 he9-20020a05600c540900b003f1754e69e6mr4560560wmb.17.1682610311493; 
 Thu, 27 Apr 2023 08:45:11 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 3-20020a05600c22c300b003f31d44f0cbsm825405wmg.29.2023.04.27.08.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 08:45:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CC3BF1FFB8;
 Thu, 27 Apr 2023 16:45:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 01/18] tests/requirements.txt: bump up avocado-framework
 version to 101.0
Date: Thu, 27 Apr 2023 16:44:53 +0100
Message-Id: <20230427154510.1791273-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427154510.1791273-1-alex.bennee@linaro.org>
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Kautuk Consul <kconsul@linux.vnet.ibm.com>

Avocado version 101.0 has a fix to re-compute the checksum
of an asset file if the algorithm used in the *-CHECKSUM
file isn't the same as the one being passed to it by the
avocado user (i.e. the avocado_qemu python module).
In the earlier avocado versions this fix wasn't there due
to which if the checksum wouldn't match the earlier
checksum (calculated by a different algorithm), the avocado
code would start downloading a fresh image from the internet
URL thus making the test-cases take longer to execute.

Bump up the avocado-framework version to 101.0.

Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
Message-Id: <20230424092249.58552-2-alex.bennee@linaro.org>

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 9422ddaece..a4de0ad5a2 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -138,14 +138,18 @@ get-vm-image-fedora-31-%: check-venv
 # download all vm images, according to defined targets
 get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOWNLOAD))
 
+JOBS_OPTION=$(lastword -j1 $(filter-out -j, $(filter -j%,$(MAKEFLAGS))))
+
 check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
-	$(call quiet-command, \
-            $(TESTS_PYTHON) -m avocado \
-            --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
-            $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
-			--filter-by-tags-include-empty-key) \
-            $(AVOCADO_CMDLINE_TAGS) \
-            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
+	$(call quiet-command, 							\
+            $(TESTS_PYTHON) -m avocado 						\
+            --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) 	\
+            $(if $(AVOCADO_TAGS),, 						\
+			--filter-by-tags-include-empty 				\
+			--filter-by-tags-include-empty-key) 			\
+		--max-parallel-tasks $(JOBS_OPTION:-j%=%) 			\
+            $(AVOCADO_CMDLINE_TAGS) 						\
+            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), 			\
             "AVOCADO", "tests/avocado")
 
 check-acceptance-deprecated-warning:
diff --git a/tests/requirements.txt b/tests/requirements.txt
index 0ba561b6bd..a6f73da681 100644
--- a/tests/requirements.txt
+++ b/tests/requirements.txt
@@ -2,5 +2,5 @@
 # in the tests/venv Python virtual environment. For more info,
 # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
 # Note that qemu.git/python/ is always implicitly installed.
-avocado-framework==88.1
+avocado-framework==101.0
 pycdlib==1.11.0
-- 
2.39.2


