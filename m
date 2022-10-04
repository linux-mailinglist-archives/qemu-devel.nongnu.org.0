Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7D75F44DF
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:55:37 +0200 (CEST)
Received: from localhost ([::1]:38692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofiOW-0005gE-8y
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhq1-0001In-90
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:01 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhpy-0001pn-Te
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:19:56 -0400
Received: by mail-wr1-x435.google.com with SMTP id a10so8947005wrm.12
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=3w+bjpM8X7ClsceEYaojlv3+SvzK1wDqMMAZn+rwyHQ=;
 b=zMwMbHo1G4HS2zeRRBTX+Q3zu1ksrD3Cjgn2CJHScem9ihLH2LIXPnkJToGYLgrKha
 0AqbXKW97k5qDPMz0YTLwfiaWXQuTWlZtAzeyT/ug3fEkn7f3K+tza7RweHEtYOfOUFN
 VTIFM7E8c9VqDsTgjg3QZepCSqiSRFwP8mZ1QPumPYJn+XEDRfrrMArL7NHHZXjfVaux
 y40sRdACd+2EesAwfl5X8qZAW0WVsOkfsolD/4sGOJPwMQ7wyGlluT2Bqr95QNfMMIhg
 ZWUB7pbpTKePc5eUxmuUwE65o27I+KfpUyat8QZRxuHYGPvkeEjjvH6j4+O86geIWvQ7
 oCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3w+bjpM8X7ClsceEYaojlv3+SvzK1wDqMMAZn+rwyHQ=;
 b=wTvBnpEvCNfN6u4i6HPss8baV+/WMNYBn8N5onXHiGGL9DR4f125Hqg1g4Kwr2mJpw
 NCTq2HbwUFJTbE/gGmR7HqbkS7TUACPviqrqyQQYRLp8vVUamqqEv11sdD38yM3yldPP
 4p1vX+eMTIUYjL9pwQoIdU2iT5I4MTqBkYQ1Ca+w3jq4yew56lhq3n7FPezs+F+PHTHO
 FUuvHxYpVILsOuaq2AthTRXQrj4C+hSdAgczTN+uOLQV6lITir/vXlqb3FD5fDwY5y3N
 kkiYJ6ynNZGYuvIlGrbHSrlY4KId/xWBKfv1Y4xFqDKetMJqMUDvjl1rtX3Ob/SdArQN
 eJCg==
X-Gm-Message-State: ACrzQf0Z2CGalPZ+s6VGsDYI83BAMYtN+J212f/8EMQ6qfzHe84e99AU
 iWYD3QWvNooyZU1ddmEkIPIgZA==
X-Google-Smtp-Source: AMsMyM6fC+WG/3jxU+MRzYJ+V3nGbGVx146jItfFRBN4qvTxF9iE9OkFKE2eAyD288fyMCZX7mRqvQ==
X-Received: by 2002:a5d:4748:0:b0:22e:32c1:d11e with SMTP id
 o8-20020a5d4748000000b0022e32c1d11emr9036725wrs.672.1664889592330; 
 Tue, 04 Oct 2022 06:19:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a05600c199400b003b4fe03c881sm20234700wmq.48.2022.10.04.06.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:19:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4DCF61FFC8;
 Tue,  4 Oct 2022 14:01:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 18/54] configure: store container engine in config-host.mak
Date: Tue,  4 Oct 2022 14:01:02 +0100
Message-Id: <20221004130138.2299307-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

In preparation for removing $(DOCKER_SCRIPT) from the tests/tcg configuration
files, have Make use the same container engine that had been probed at
configure time.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220929114231.583801-19-alex.bennee@linaro.org>

diff --git a/configure b/configure
index f3984bb193..ad70c81bfe 100755
--- a/configure
+++ b/configure
@@ -1810,9 +1810,11 @@ fi
 
 container="no"
 if test $use_containers = "yes"; then
-    if has "docker" || has "podman"; then
-        container=$($python "$source_path"/tests/docker/docker.py probe)
-    fi
+    case $($python "$source_path"/tests/docker/docker.py probe) in
+        *docker) container=docker ;;
+        podman) container=podman ;;
+        no) container=no ;;
+    esac
 fi
 
 # cross compilers defaults, can be overridden with --cross-cc-ARCH
@@ -2444,6 +2446,9 @@ if test -n "$gdb_bin"; then
     fi
 fi
 
+if test "$container" != no; then
+    echo "ENGINE=$container" >> $config_host_mak
+fi
 echo "ROMS=$roms" >> $config_host_mak
 echo "MAKE=$make" >> $config_host_mak
 echo "PYTHON=$python" >> $config_host_mak
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 270e99786e..c87f14477a 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -14,7 +14,7 @@ DOCKER_DEFAULT_REGISTRY := registry.gitlab.com/qemu-project/qemu
 endif
 DOCKER_REGISTRY := $(if $(REGISTRY),$(REGISTRY),$(DOCKER_DEFAULT_REGISTRY))
 
-ENGINE := auto
+ENGINE ?= auto
 DOCKER_SCRIPT=$(SRC_PATH)/tests/docker/docker.py --engine $(ENGINE)
 
 CUR_TIME := $(shell date +%Y-%m-%d-%H.%M.%S.$$$$)
-- 
2.34.1


