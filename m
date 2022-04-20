Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5E0509008
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:09:35 +0200 (CEST)
Received: from localhost ([::1]:46920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFhm-0004bn-Ox
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEr9-0008Qo-1A
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:15:12 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEr6-0002Lo-ID
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:15:10 -0400
Received: by mail-wr1-x433.google.com with SMTP id q3so3380471wrj.7
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IawuXP1v+jm+E/7hmN4gmCCl27H/+0Wyl9aLwh+O/AA=;
 b=XRFisWoPqpRAyTBt6meIiOYfBeFfdHiwIrE1WElXjzigE007nYZHCAdu/TeZC+2Sjq
 4K6neDVv+nRkhkF4qZeD5uMs8WYQlLCqFAnSbVPYSQyCw5BqrsvAK+XWnj0dOcIu3aG+
 0iOAmi7oiOuE/vi6mpZwKfA6yCux0DkTsSeRoFkIIJZK4spd2dA5/QywqQk6sWITuQw8
 0Pl9AMFI/tgqgl2y162HhMKGWw04Df7vtBzZDKXEkzfuzYbDfFZhMA/HRKtLPKvVJABN
 E4+jvBEd1FwNriTkPsVXDzo/6v0XXzdymdT/bDJanIAgbbeQcebxUC3uMMR04iC7HYwN
 VbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IawuXP1v+jm+E/7hmN4gmCCl27H/+0Wyl9aLwh+O/AA=;
 b=iciGO9MF49x/FuEB2njO8VQu1S10xCigGzIk7TccVypJvbtF7k3OdLrvbVS1/QIFo8
 PqT+9/FEyxe7LUlcvabpZFvyO94pueZMqNdsRPkNsdV5dmyEuXWpp/+UnqvzM49hcA/s
 79K7gkm6Twd8clxw1QuQF9LRjykfve4S2wl5TTTniBo8EngISpRlsvVqOBjDLlPiBfoo
 bPMLQvWcvPctIlr9Li6EOcrg5N8lYXKP8zxI5LH9DEDV855IxiiPtHuJFs6ybKkcn3uu
 6RahkMfl2VSXSM3Nj+409Se6oq4q/L2YSQLVvbxOaNtHrHTssiJiaZPoTrzWDbe7vDcE
 Uf/Q==
X-Gm-Message-State: AOAM532vo06gwkywu8HaKpxupdB16c+cIpCZGwkYmLK7LuaLJ3mzMjtm
 HhpjpiLMuyJSwH6A07yGk2LRUA==
X-Google-Smtp-Source: ABdhPJylfmBuDuK973ZAQC2FAG/ReAYACK626eZXvU6DGn8l1kgtrIO55hmQT80bsej2tgreUpKTTw==
X-Received: by 2002:a5d:64e3:0:b0:20a:87e9:7daa with SMTP id
 g3-20020a5d64e3000000b0020a87e97daamr16291127wri.345.1650478492346; 
 Wed, 20 Apr 2022 11:14:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c350800b003928b925796sm64889wmq.47.2022.04.20.11.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:14:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2EC161FFC3;
 Wed, 20 Apr 2022 19:08:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 11/25] tests/docker: do not duplicate rules for hexagon-cross
Date: Wed, 20 Apr 2022 19:08:18 +0100
Message-Id: <20220420180832.3812543-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

The commands for docker-image-debian-hexagon-cross are the same as those
in debian-toolchain-run, just with a nonstandard path to build-toolchain.sh.
Reuse the definition by renaming the debian-hexagon-cross.docker.d directory.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-9-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-12-alex.bennee@linaro.org>

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 2a187cb5a2..eb100c294f 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -121,28 +121,6 @@ docker-image-debian11: NOUSER=1
 # alpine has no adduser
 docker-image-alpine: NOUSER=1
 
-#
-# The build rule for hexagon-cross is special in so far for most of
-# the time we don't want to build it. While dockers caching does avoid
-# this most of the time sometimes we want to force the issue.
-#
-docker-image-debian-hexagon-cross: $(DOCKER_FILES_DIR)/debian-hexagon-cross.docker
-	$(if $(NOCACHE), 								\
-		$(call quiet-command,							\
-			$(DOCKER_SCRIPT) build -t qemu/debian-hexagon-cross -f $< 	\
-			$(if $V,,--quiet) --no-cache 					\
-			--registry $(DOCKER_REGISTRY) --extra-files			\
-			$(DOCKER_FILES_DIR)/debian-hexagon-cross.docker.d/build-toolchain.sh, \
-			"BUILD", "debian-hexagon-cross"),				\
-		$(call quiet-command,							\
-			$(DOCKER_SCRIPT) fetch $(if $V,,--quiet)			\
-				qemu/debian-hexagon-cross $(DOCKER_REGISTRY),		\
-			"FETCH", "debian-hexagon-cross")				\
-		$(call quiet-command,							\
-			$(DOCKER_SCRIPT) update $(if $V,,--quiet) 			\
-				qemu/debian-hexagon-cross --add-current-user,		\
-			"PREPARE", "debian-hexagon-cross"))
-
 debian-toolchain-run = \
 	$(if $(NOCACHE), 						\
 		$(call quiet-command,					\
@@ -162,6 +140,10 @@ debian-toolchain-run = \
 			"PREPARE", $1))
 debian-toolchain = $(call debian-toolchain-run,$(patsubst docker-image-%,%,$1))
 
+docker-image-debian-hexagon-cross: $(DOCKER_FILES_DIR)/debian-hexagon-cross.docker \
+	$(DOCKER_FILES_DIR)/debian-hexagon-cross.d/build-toolchain.sh
+	$(call debian-toolchain, $@)
+
 docker-image-debian-microblaze-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
     $(DOCKER_FILES_DIR)/debian-microblaze-cross.d/build-toolchain.sh
 	$(call debian-toolchain, $@)
diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh b/tests/docker/dockerfiles/debian-hexagon-cross.d/build-toolchain.sh
similarity index 100%
rename from tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
rename to tests/docker/dockerfiles/debian-hexagon-cross.d/build-toolchain.sh
-- 
2.30.2


