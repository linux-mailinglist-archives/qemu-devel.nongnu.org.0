Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0A462E30D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 18:30:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovieE-0006Pg-OS; Thu, 17 Nov 2022 12:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovie5-0006LX-4P
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:49 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovidt-0006Dp-St
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:48 -0500
Received: by mail-wr1-x42b.google.com with SMTP id a14so5004094wru.5
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 09:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hCWUi2imTcF7NdRj0zJ1YkRrLEYeaUzgFlh+Cacz5b8=;
 b=WVB7VvZyOVYZY+RFjsC/MI5GSCK343nuKrVag8qRuoikhe1LnQmKF+JvNSvPXXfDdo
 smIyDbAsWluB1kbgi7jRli1v3884lcx5RFft79v/jHQ4pI2lSs1JeUAZ449lfoUIlpcg
 RYInTVUKYwuq+ClNxFXy4rbzoQDpScwQrqfaMaxsY0nN4corUuT8I1DBLJzi7M1Neme6
 /Y4PgxrSAnzbZ0xZApigaUScuZn4bRnM3Zj/XRHaM/Byb2+njJ88xZfPgi+dClVHwWyG
 VA92oxK2aHOs3uAAh+OeuxjrwM8JAtXNbYA6/Z7q7cu+dRKvYTbwwFcSWeWcxKmwNfRG
 TQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hCWUi2imTcF7NdRj0zJ1YkRrLEYeaUzgFlh+Cacz5b8=;
 b=avnMSTY2zikQ1/deGP2EtlrQaqMp1S7WaSV8goOrWB1lxcj2cZzo3Zaxv9iMddpj6R
 UhDvi+Uvsfbwwb/CN727ZNgQ3xv1IJe0Ls54tPWMG5fZA9PkE9txlJzKchluqE9wLHOG
 eLr7FL3ovx1dMp5LeFpg7X/nDdmv4+9DyrWJXnwW4VsbEV6gtFTAqNFNhghafzKpS1UD
 Idhrbz0rVDweT94kr0cSmlYKBE9Rwbwgywgm0J3pAKkEvk9DZaxPX8O7HaHm7BKHWPAw
 8AriQHgRNokuhCL7PsJn8llrhbpJJn5QMxZfb/jvP5pk6XiNB2vr6ZzNh1/+rMOCVZ85
 z5/g==
X-Gm-Message-State: ANoB5pkA4VcFFop//UtjEx4zeWQq2NzBH7yIFHukR9x4OOd6740BIQK1
 sW1ykKtT8aQYhvyp/xCh5ALoWg==
X-Google-Smtp-Source: AA0mqf7K8YRq/K1q4hgFKaeLkI83c8ib0dMUFLmRNZ+ASHmhjC62or8SWFcemTym6Jp4COJrw/pbQQ==
X-Received: by 2002:a05:6000:10c3:b0:241:bee0:c56e with SMTP id
 b3-20020a05600010c300b00241bee0c56emr304205wrx.534.1668705935297; 
 Thu, 17 Nov 2022 09:25:35 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 23-20020a05600c229700b003cf75213bb9sm6084440wmf.8.2022.11.17.09.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 09:25:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 231A91FFBB;
 Thu, 17 Nov 2022 17:25:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v3 03/13] tests/docker: allow user to override check target
Date: Thu, 17 Nov 2022 17:25:22 +0000
Message-Id: <20221117172532.538149-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117172532.538149-1-alex.bennee@linaro.org>
References: <20221117172532.538149-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221111145529.4020801-5-alex.bennee@linaro.org>
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


