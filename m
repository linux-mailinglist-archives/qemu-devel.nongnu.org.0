Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E597C629AAD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 14:37:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouw6A-0006Rx-S8; Tue, 15 Nov 2022 08:35:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouw5O-0006I4-Of
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:34:51 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouw5M-0004Ir-Ox
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:34:46 -0500
Received: by mail-wr1-x42d.google.com with SMTP id j15so24315778wrq.3
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 05:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zmtOF1FOfTVQ/UMG540fiUZpW6VglR6cjorQt52ST+E=;
 b=yQtaUFm7Qmv9Y7PgtR57DZFE6aQoJobYUhCR83MIhMsHw6+vBtpBKvDkwKyDLb+iXD
 XyLui49oMy1V+OF6w77Ae0+dPGfXnRjtRHfda4jz/tNJCFnPOJBiTgFvVvXzCz8Ke3dj
 MvsWLNxzTfCoy6uA5E5VMQfe5dqUNLCWVVDR3LDv2UDUulAkhXTCzXa6uUGIrjwCqVQ4
 ktxVEdBSEl5E6b2UQA2m3ncmFRaM9xzi4EeFjUQr0T18A8TT2aU1VvmsO952L+04IT/d
 bodHyp0FptQDnfQpgjkta+2HToXXRu0PJXUi9YQbKpfUWGGmH503MdabUAhBy5vLOa+q
 mBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zmtOF1FOfTVQ/UMG540fiUZpW6VglR6cjorQt52ST+E=;
 b=lM4ICzBN6clTV+wZ5vhTa87egKbnifvDYpxuNdUd+h1ml2SMOKZ3Jun0kyq8XNkD47
 hoZrTiDZCSIIPiAnL1IvZeIq1aCrbviYIR3b/TsWavGehS2XhTK2sX0IytA4IIGJWEoJ
 xE3mr9Z27058C5biMgRcCymZ43AJQcpOIU+9/Okp24HwXoOs98Td4IGoK2hmX4grqOUi
 kax8UDQI/H0U7QOEknc4B2q5y5R8DU3blbq5kk5oONBD5PWTjCtlswBZ2SO++cfilHw5
 LySRFoWSVipCrpdsZaNM1yXN94swzVK60A2rfrpl/CAbc+4TbWP2A5gLE2qUD85hm9rU
 N6QQ==
X-Gm-Message-State: ANoB5plchaMjVtzsgOwc7QCdudBcc7dcy3LV2ygWfOsLX87blCIFUSqL
 YBqlcwHzxRS5BrP3In7KGHACFg==
X-Google-Smtp-Source: AA0mqf6YdPx5zMu1qc47QOtGcSvltgjKspyxJwMeaRZjGfaOBmtH/Kx6u1xXmiVMxkjfEKh0JYpUBw==
X-Received: by 2002:a5d:4c82:0:b0:236:56a6:823e with SMTP id
 z2-20020a5d4c82000000b0023656a6823emr10749492wrs.495.1668519283328; 
 Tue, 15 Nov 2022 05:34:43 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k34-20020a05600c1ca200b003b47b80cec3sm24556815wms.42.2022.11.15.05.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:34:41 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A18D91FFBC;
 Tue, 15 Nov 2022 13:34:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 04/10] tests/docker: allow user to override check target
Date: Tue, 15 Nov 2022 13:34:33 +0000
Message-Id: <20221115133439.2348929-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115133439.2348929-1-alex.bennee@linaro.org>
References: <20221115133439.2348929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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


