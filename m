Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0C263392C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:57:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxQ0u-0002W8-45; Tue, 22 Nov 2022 04:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQ0n-0002I5-5Y
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:56:17 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQ0k-0003eJ-4s
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:56:16 -0500
Received: by mail-wr1-x432.google.com with SMTP id z4so9282208wrr.3
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 01:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lGgDp1psLL587PH6+QgHDpl09CcymDIyo6aN/D9+3S8=;
 b=dmh7C+xyEKzTZj7NErSxo7obQw/CRuM86tg2tnJ9sGrPQe+HQIlxxLIUv1Y2tlSgKQ
 XJ3PZWsmRNkPozkV9tI4xJrq9PO1N3YFZ00us32SnhLR51Jz0RcJ5NrVaiyevR3VMnjl
 8jENZI6CZGaMQRDR3+Nu1k06WqJmEw7Zzk2Sv7e9zqHdYpP6HlzJ5J+BGFAnl5zpzUvU
 i7weE4SsSqYrn1rZBrPuEImMGjYYq3wNtiIprWoEOxouOMrJmZr1SPqKyC9v+8C3lx9J
 R9X7pB7R4fD0pjLebI9O+YXSp7SPBMMWAwepMkUMl8FoTwZc27SkKONCtCXjpp9aTapD
 QTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lGgDp1psLL587PH6+QgHDpl09CcymDIyo6aN/D9+3S8=;
 b=rhSZjfW4oXkgXALx3PJHwAjLv/lEmpXmfkLxVnMmZPuXvs5+lHbUFFTwIHzI999bME
 WPStyenClYQfIlvOhcQF8lKjSz+w2JL6746sQzr+/Yy+7c/Gh2n9QnxNqNFTj8KxTfa4
 pKihaHFuzzYPVxI7WeCpwSzsxI5v5sE/mf0EyULMg7sIZdfW/XB5SDOcBSNiNYDJcNZl
 G7BPs1M6oAO51a35P37RzXvLxuyaU6i7zu3rTmLHdnrpvmJXqnJK0CxDXf5Q7OzgQzHO
 O4/cs0XgzHMUf1dKzlTqI9CVZEY+81u4Stxprlh8hducvZ1W+UpkT8rUYVUyd7lIJvmz
 7H7Q==
X-Gm-Message-State: ANoB5pmbTlVzjAfrYHfiVXBgd+HC6F/wjvCms4hosmdWL8wqZdfRWFGz
 xc4kv9Eqx8N5hQFxOX/RWXgUTdzfYLJVpw==
X-Google-Smtp-Source: AA0mqf6IPF/ilYUSmV0RQY6XirIdc40qHpgVRfDbkAHYaoLMSBnrcvVpRLtEx/RG6sTYqE3vBdNJxw==
X-Received: by 2002:a5d:5144:0:b0:22d:d4c:e99c with SMTP id
 u4-20020a5d5144000000b0022d0d4ce99cmr13363285wrt.582.1669110972658; 
 Tue, 22 Nov 2022 01:56:12 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a5d620a000000b002366dd0e030sm13604043wru.68.2022.11.22.01.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 01:56:11 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CFC111FFBB;
 Tue, 22 Nov 2022 09:56:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL v2 03/11] tests/docker: allow user to override check target
Date: Tue, 22 Nov 2022 09:56:02 +0000
Message-Id: <20221122095610.3343175-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122095610.3343175-1-alex.bennee@linaro.org>
References: <20221122095610.3343175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Message-Id: <20221117172532.538149-4-alex.bennee@linaro.org>

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


