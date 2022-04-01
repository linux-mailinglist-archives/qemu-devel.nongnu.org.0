Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E384EEF1F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:18:40 +0200 (CEST)
Received: from localhost ([::1]:35226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naI6l-0003Sd-9o
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:18:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI23-0003Wq-Fa
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:43 -0400
Received: from [2a00:1450:4864:20::531] (port=33385
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI21-0006cn-UT
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:43 -0400
Received: by mail-ed1-x531.google.com with SMTP id r23so3183554edb.0
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TGCoHf+X9Hr53C9PpVImrayZCSq2g9oom+Gz5PIhxX4=;
 b=GI3yjgsQLWeFvca3LywLx51U4db4s27LP7mQr1HOzalWMfUejY7jtB5DhTKlT6TLuC
 vOvoLf6u3Vo0O4k1enmyuryaL9y8Yitta8je+l/+dDEJEvKLU8WhRUl97zTSEYX8f6Q7
 cmnKmqUGgrMfjZc774QkO9HUeNafri3EOKowuHHPDb3SWiHDXQxBotkKVWUNQ2gDJokI
 dHDMVfvpM17jxiD1opOkFr7BWSR0Nps43sLVu2O2VFEqkACmJ3KUjCDY/gh8xTquMXyc
 ScdUJISLSjR+fXtVtFhBZEwq9xwZMV/vmpQUAchbgCxd+cPcfvhPWSsiMvyjYRPHFcRQ
 PdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TGCoHf+X9Hr53C9PpVImrayZCSq2g9oom+Gz5PIhxX4=;
 b=DvVBr+/ECYAqW6VbsLTK6HiZxb/O2loMl5C9PmcQpLWgDRMb70gZLV0AHh07kyXa84
 sdQBKV3As6FYXMIHSndqjTY17yzDIN4rK44Ji9h9xSsqmWjiDdTLIPieLc1ZAPWCTHmx
 fzlTKX5mls5ncwqj3Apgi6Qn5PnvZob2y8NbZaLQfrmSvkSVVV35rsZm7qVUkX0X49f/
 Bl6j70cjvaDCthtnkGIos4D7t+G768eTv+Orrm6+ZYd4jJ902jqMusREFp1Za1wxTH6D
 CMJt9VOLrC/gdGKsKBbc+Sk082yd+EiUAh8XllI7kvfiGGDM82/MSm2wYK01ZHPQYz00
 HliQ==
X-Gm-Message-State: AOAM531E0g5oalpnqxlSVoo6Kya1DTJtXHP8nHNKJLQHHAZsdrKpX/z6
 LLo/yNSWTXccOt6TUKPFRt5w84xV5+w=
X-Google-Smtp-Source: ABdhPJxsFl+n3f0x93mFdKaklzqPOrDO8H2XuBcvnIUC92F4bJL4hWuhVMlQMMScKo40gVJupEeE1A==
X-Received: by 2002:a50:d90f:0:b0:418:8a5a:14b2 with SMTP id
 t15-20020a50d90f000000b004188a5a14b2mr21062745edj.241.1648822420622; 
 Fri, 01 Apr 2022 07:13:40 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bn3-20020a170906c0c300b006e50416e24bsm212595ejb.98.2022.04.01.07.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:13:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/17] tests/docker: do not duplicate rules for hexagon-cross
Date: Fri,  1 Apr 2022 16:13:17 +0200
Message-Id: <20220401141326.1244422-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401141326.1244422-1-pbonzini@redhat.com>
References: <20220401141326.1244422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The commands for docker-image-debian-hexagon-cross are the same as those
in debian-toolchain-run, just with a nonstandard path to build-toolchain.sh.
Reuse the definition by renaming the debian-hexagon-cross.docker.d directory.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/Makefile.include                 | 26 +++----------------
 .../build-toolchain.sh                        |  0
 2 files changed, 4 insertions(+), 22 deletions(-)
 rename tests/docker/dockerfiles/{debian-hexagon-cross.docker.d => debian-hexagon-cross.d}/build-toolchain.sh (100%)

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
2.35.1



