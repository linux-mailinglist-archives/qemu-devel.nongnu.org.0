Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3373625DA0
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 15:58:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otVRa-00072u-4D; Fri, 11 Nov 2022 09:55:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otVRU-00072j-Vh
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:55:40 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otVRR-0007ws-EY
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:55:40 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 t25-20020a1c7719000000b003cfa34ea516so5644537wmi.1
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 06:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7uXwU/1og6Y5YFCCkzlXH6mHIAZKAJashuR6BqLq8xE=;
 b=hISuD/8oCArKVnAiTPxR6SY2cVCunPN/PNrA6NKRnggfjKVi75e841i50s9ERTXpsF
 OB0Hclo2GKqviJSRwTTR2zd6HZ2cd+GHsCoxHwMJxD/JRHvWmRtgmCbVvmlU/LQnhqWD
 cPdf2BqLKj7JqAvNUM4iUc1vo0M+hNz/8TvddrlSXDWTUZM4FQLYeVSnRXOaQoREZcSS
 VjHKGbHG2nqMZjlZa7SBFo4OlC/RoNKcear6xo5O+9qpcqrU5VYGY4C6dif88jfEyZ6+
 DNrLEs+I2V7FmlAoO9gzddNL55UgnAmV+XEN/FxFwDI7SmCGX2op9JGdIwcyEVJ1lnsH
 uv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7uXwU/1og6Y5YFCCkzlXH6mHIAZKAJashuR6BqLq8xE=;
 b=r9bKdNNDu46NTzvRUPzrXaGE4MRgR91VBTkgJD0SpxpUeW4A6JGm1pRpuWWza0HGBK
 6/R/94vnAYBUuIwXXG+vSPlRJcjnU7fsCCNAX8V8KNwjOAg31edJRkUFAz4eM5Eel9iD
 I4dLXwyTHS3ZMvSVz0znxOcob0+BO10gM0UI6g4NtUSI4rpBDAmsurzXZa9XjBwFhgMi
 W/HkN2e2+ncQrDX7ggp9DyldUvfhcnak7bQcketoq08FdErqTaKbZucAD8tphdT7a+yA
 2c70sgKCkVwUObqt76PfYYAMGyWg0Yyd7O+hGN1AbNzVra/4WNChpzheQuD1E6BHTLtc
 Gg6A==
X-Gm-Message-State: ANoB5pnvCEKUU6IC60L7EUbsz2m8Oq6gu9dCNUf4+PJ23aNuF+tcs5aF
 v2HWHKT/PIKpQVkLJNMcqlK7NQ==
X-Google-Smtp-Source: AA0mqf6Y9NMwFfRuDv4pB6xWb9WnmoI+YiTAaw0h/hjLNc2DAIxotdHdez2Dn2kcIFY/RGWS1TQUNg==
X-Received: by 2002:a1c:730a:0:b0:3cf:89c3:3837 with SMTP id
 d10-20020a1c730a000000b003cf89c33837mr1467779wmb.92.1668178534787; 
 Fri, 11 Nov 2022 06:55:34 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 cy6-20020a056000400600b002416ecb8c33sm1802202wrb.105.2022.11.11.06.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 06:55:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5ECD41FFBC;
 Fri, 11 Nov 2022 14:55:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v2 04/12] tests/docker: allow user to override check target
Date: Fri, 11 Nov 2022 14:55:21 +0000
Message-Id: <20221111145529.4020801-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111145529.4020801-1-alex.bennee@linaro.org>
References: <20221111145529.4020801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

This is useful when trying to bisect a particular failing test behind
a docker run. For example:

  make docker-test-clang@fedora \
    TARGET_LIST=arm-softmmu \
    TEST_COMMAND="meson test qtest-arm/qos-test" \
    J=9 V=1

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v1
 - fix s/target /target./
 - CHECK_TARGET -> TEST_COMMAND
---
 tests/docker/Makefile.include | 2 ++
 tests/docker/common.rc        | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index c87f14477a..fc7a3b7e71 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -184,6 +184,7 @@ docker:
 	@echo '    TARGET_LIST=a,b,c    Override target list in builds.'
 	@echo '    EXTRA_CONFIGURE_OPTS="..."'
 	@echo '                         Extra configure options.'
+	@echo '    TEST_COMMAND="..."   Override the default `make check` target.'
 	@echo '    IMAGES="a b c ..":   Restrict available images to subset.'
 	@echo '    TESTS="x y z .."     Restrict available tests to subset.'
 	@echo '    J=[0..9]*            Overrides the -jN parameter for make commands'
@@ -230,6 +231,7 @@ docker-run: docker-qemu-src
 			$(if $(NETWORK),$(if $(subst $(NETWORK),,1),--net=$(NETWORK)),--net=none) \
 			-e TARGET_LIST=$(subst $(SPACE),$(COMMA),$(TARGET_LIST))	\
 			-e EXTRA_CONFIGURE_OPTS="$(EXTRA_CONFIGURE_OPTS)" \
+			-e TEST_COMMAND="$(TEST_COMMAND)" 		\
 			-e V=$V -e J=$J -e DEBUG=$(DEBUG)		\
 			-e SHOW_ENV=$(SHOW_ENV) 			\
 			$(if $(NOUSER),,				\
diff --git a/tests/docker/common.rc b/tests/docker/common.rc
index e6f8cee0d6..9a33df2832 100755
--- a/tests/docker/common.rc
+++ b/tests/docker/common.rc
@@ -63,12 +63,12 @@ check_qemu()
 {
     # default to make check unless the caller specifies
     if [ $# = 0 ]; then
-        INVOCATION="check"
+        INVOCATION="${TEST_COMMAND:-make $MAKEFLAGS check}"
     else
-        INVOCATION="$@"
+        INVOCATION="make $MAKEFLAGS $@"
     fi
 
-    make $MAKEFLAGS $INVOCATION
+    $INVOCATION
 }
 
 test_fail()
-- 
2.34.1


