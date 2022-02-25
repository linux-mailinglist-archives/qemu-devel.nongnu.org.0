Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4544C4CC0
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 18:42:26 +0100 (CET)
Received: from localhost ([::1]:41694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNebp-0006ZY-E0
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 12:42:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeGo-0003wu-3q
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:42 -0500
Received: from [2a00:1450:4864:20::533] (port=35684
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeGg-0002LZ-4n
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:41 -0500
Received: by mail-ed1-x533.google.com with SMTP id bq11so8374743edb.2
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v71m4fmS0F91ZsaDPV4GFfE4X3gNbp87d+UfrwfWQJI=;
 b=hMTBUWlI/+e8YIGom2CUyzDQUkKvTc+pradEPmyxzFm6+PwsQCqkEQfG7xRYZluANc
 8zgLR/Xou3GwYYL6U3AxSAJo17gpvtc6zeVZVOrY6xlx2on+6Kew5916aWq8vsKElMZV
 gnRDW8BIkfmmoIe2i69Brt5/qb9adFcqQHYeKls7+0M1AFXIOTC/YLVfucP2kj+1R6qL
 4lUm09WDMKsRCk27EAE0mf8v4CHK8rx8QF5tcDDwDcN2qxiRaue3ZnD6xglHrLjT/V1s
 hYbhVbXUEWWLy2se4miSkKeY3mT1v3HNZ0Js3MOr7ytWrDZOG4fwCMi5YMYR8rFpOq/q
 jNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v71m4fmS0F91ZsaDPV4GFfE4X3gNbp87d+UfrwfWQJI=;
 b=ojxqVo3lyujuA5+Tnsd6nfcgVi1JvaNtVMG6oJ9GJ+ZIbg7lseyxwh+CwMgYcOAvI4
 +gUGhyM60Kg/wXUTBzv8TEviFpVr6WllqabCvkaIB7dZ6cCbN+32qdIjeiWoVWrVlGDf
 +e5OS3a9JsclydKlgCGqwC4W6hH5hmj3SxVBb921uZwXWDvP8RBmws98KAtM0hU4aWbR
 c6uRMZ58ch3n3NIS1WSrSkiQ3GQzCWhl2L8uDNe+l4anUcC0AT3zlCsXDTYNBvomXsKG
 tu5j/i+ux3r1NBS/monNFqmIWWGHs5++b0dzSfhDFfWmtj82mbzAsgNvqLv7oELnSyc9
 TXoA==
X-Gm-Message-State: AOAM530t6avSARLmQG6gHsc92aV6J+tShY0tb2QDlJEZ7wXRFrdj5yct
 t6HQdZh5DbbvfUk4+225RoCY8w==
X-Google-Smtp-Source: ABdhPJxvqQzukj7mT1lSxJZYToAJBRGKhp+o4T4ppIBSwYmoiESCdNJ5E7Kp7EwQt9kB0vWMq5JIIA==
X-Received: by 2002:a05:6402:1341:b0:407:cece:49f8 with SMTP id
 y1-20020a056402134100b00407cece49f8mr7981811edw.152.1645809631009; 
 Fri, 25 Feb 2022 09:20:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a056402280c00b00412ca9508b7sm1667727ede.17.2022.02.25.09.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 09:20:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 13F531FFB8;
 Fri, 25 Feb 2022 17:20:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 01/18] tests/docker: restore TESTS/IMAGES filtering
Date: Fri, 25 Feb 2022 17:20:04 +0000
Message-Id: <20220225172021.3493923-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de, richard.henderson@linaro.org,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was broken in the re-factor:

  e86c9a64f4 ("tests/docker/Makefile.include: add a generic docker-run target")

Rather than unwind the changes just apply the filters to the total set
of available images and tests. That way we don't inadvertently build
images only not to use them later.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Alex Williamson <alex.williamson@redhat.com>
Message-Id: <20220211160309.335014-2-alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index f1a0c5db7a..0ec59b2193 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -8,13 +8,19 @@ COMMA := ,
 
 HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
 
+# These variables can be set by the user to limit the set of docker
+# images and tests to a more restricted subset
+TESTS ?= %
+IMAGES ?= %
+
 DOCKER_SUFFIX := .docker
 DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
 # we don't run tests on intermediate images (used as base by another image)
 DOCKER_PARTIAL_IMAGES := debian10 debian11
 # we don't directly build virtual images (they are used to build other images)
 DOCKER_VIRTUAL_IMAGES := debian-bootstrap debian-toolchain empty
-DOCKER_IMAGES := $(sort $(filter-out $(DOCKER_VIRTUAL_IMAGES), $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker)))))
+__IMAGES := $(sort $(filter-out $(DOCKER_VIRTUAL_IMAGES), $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker)))))
+DOCKER_IMAGES := $(if $(IMAGES), $(filter $(IMAGES), $(__IMAGES)), $(__IMAGES))
 DOCKER_TARGETS := $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
 # Use a global constant ccache directory to speed up repetitive builds
 DOCKER_CCACHE_DIR := $$HOME/.cache/qemu-docker-ccache
@@ -23,16 +29,14 @@ DOCKER_DEFAULT_REGISTRY := registry.gitlab.com/qemu-project/qemu
 endif
 DOCKER_REGISTRY := $(if $(REGISTRY),$(REGISTRY),$(DOCKER_DEFAULT_REGISTRY))
 
-DOCKER_TESTS := $(notdir $(shell \
-	find $(SRC_PATH)/tests/docker/ -name 'test-*' -type f))
+__TESTS := $(notdir $(shell \
+		find $(SRC_PATH)/tests/docker/ -name 'test-*' -type f))
+DOCKER_TESTS := $(if $(TESTS), $(filter $(TESTS), $(__TESTS)), $(__TESTS))
 
 ENGINE := auto
 
 DOCKER_SCRIPT=$(SRC_PATH)/tests/docker/docker.py --engine $(ENGINE)
 
-TESTS ?= %
-IMAGES ?= %
-
 CUR_TIME := $(shell date +%Y-%m-%d-%H.%M.%S.$$$$)
 DOCKER_SRC_COPY := $(BUILD_DIR)/docker-src.$(CUR_TIME)
 
@@ -274,8 +278,8 @@ endif
 	@echo '    TARGET_LIST=a,b,c    Override target list in builds.'
 	@echo '    EXTRA_CONFIGURE_OPTS="..."'
 	@echo '                         Extra configure options.'
-	@echo '    IMAGES="a b c ..":   Filters which images to build or run.'
-	@echo '    TESTS="x y z .."     Filters which tests to run (for docker-test).'
+	@echo '    IMAGES="a b c ..":   Restrict available images to subset.'
+	@echo '    TESTS="x y z .."     Restrict available tests to subset.'
 	@echo '    J=[0..9]*            Overrides the -jN parameter for make commands'
 	@echo '                         (default is 1)'
 	@echo '    DEBUG=1              Stop and drop to shell in the created container'
-- 
2.30.2


