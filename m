Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A63C508F8F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:37:20 +0200 (CEST)
Received: from localhost ([::1]:53246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFCZ-0000Aj-IL
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEkr-0001nq-0U
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:41 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:35334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEkp-0001Ya-99
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:40 -0400
Received: by mail-ed1-x52c.google.com with SMTP id z12so3377499edl.2
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PhvuDgyDdy7r1TOF4D/0DDXsvn7M3Q7D+hAW8k9YOvg=;
 b=X47guf6I6mM5oE+10caYInnQXbU75MtjZotbK0GSJc4YMolUQDot+SEfbDSE/wVjot
 dxGsLS6JCp08u1zmQDdIgDYi08XOdh+UWTeu54XZI5KsM6a72hPrXx1WZC2bs0KQgzm6
 4TRRX26boHMjca+Y68C+BTnfEG75NPuug/9hdbuWUu8NCG3g7EuAqrRcEjsbaacUXZ5g
 p3hI/4HfljO5T3HBdPHjuxZC8dyC4HORglZpM6EG6Z+VN3eAP8d9FFD9KENaUzl60ep0
 dqjwP7G0bZ3e40/dqTPjS66RiiMYGGxTQJpbrYQDFIEdKfMDOeYq9J/N3dxh4O2/oOEB
 86og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PhvuDgyDdy7r1TOF4D/0DDXsvn7M3Q7D+hAW8k9YOvg=;
 b=YEJPQq12hikkLT1gQAmIE5yfdqjtTl3FQSG14foZxRUozJLSVECrjmKnhNK+QxyN/X
 OpODe8xrmrHU4QnEnGS9UrCGaLQbwXZ52kXW26xnLTe2NeeVjsEMnJlrAt4tJJhQlB+0
 9EOie6GG6KmX/ax/dSukT5pwFYEtJQ23hh6i2KidKbOcfYQQJIpLcjpi1DTBMTIRSFQO
 3X7uGVB740Vo40eyAmG0y/6fU4RYM0EO+bAv5UFnHdOX56nTtgwCFZg2gu3HmYKbsraF
 M5123HiZ2MNnzlbN7pqSreuujOxy95AHVl9hi1/rVu0MJkZnUolvG9zdN1C3DpOmarYU
 lLBQ==
X-Gm-Message-State: AOAM531dzlkrvd23plhiOdrBEIgJ9GHbTQ2xQM9/HEz8eKcvTCY9EU5t
 4NXV11jJkVAusU7YeNAglmyN8w==
X-Google-Smtp-Source: ABdhPJysO1hhTbQUOmQEJmRXAyo1r7Deu5nS3vxbj8ckTb3eg9GwQKjtwGYJ0ALHLJpKQjDpUrhiHg==
X-Received: by 2002:a05:6402:50c9:b0:423:e4b1:baac with SMTP id
 h9-20020a05640250c900b00423e4b1baacmr18282794edb.146.1650478117944; 
 Wed, 20 Apr 2022 11:08:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 u4-20020aa7db84000000b004136c2c357csm10433848edt.70.2022.04.20.11.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:08:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A3A8C1FFBC;
 Wed, 20 Apr 2022 19:08:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 04/25] tests/docker: remove dead code for linux-user containers
Date: Wed, 20 Apr 2022 19:08:11 +0100
Message-Id: <20220420180832.3812543-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
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

debian-powerpc-user-cross was the only linux-user powered cross builder
and it was removed in commit 80394ccf21 ("tests/docker: remove
debian-powerpc-user-cross", 2019-09-26). Remove all the infrastructure
around it since it is now unused.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220401141326.1244422-2-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-5-alex.bennee@linaro.org>

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index e495b163a0..a6a5a20949 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -229,12 +229,6 @@ DOCKER_PARTIAL_IMAGES += debian-tricore-cross
 DOCKER_PARTIAL_IMAGES += debian-xtensa-cross
 DOCKER_PARTIAL_IMAGES += fedora-cris-cross
 
-# Rules for building linux-user powered images
-#
-# These are slower than using native cross compiler setups but can
-# work around issues with poorly working multi-arch systems and broken
-# packages.
-
 # Expand all the pre-requistes for each docker image and test combination
 $(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES) $(DOCKER_VIRTUAL_IMAGES),$(DOCKER_IMAGES)), \
 	$(foreach t,$(DOCKER_TESTS), \
@@ -266,11 +260,6 @@ docker:
 	@echo
 	@echo 'Available container images:'
 	@echo '    $(DOCKER_IMAGES)'
-ifneq ($(DOCKER_USER_IMAGES),)
-	@echo
-	@echo 'Available linux-user images (docker-binfmt-image-debian-%):'
-	@echo '    $(DOCKER_USER_IMAGES)'
-endif
 	@echo
 	@echo 'Available tests:'
 	@echo '    $(DOCKER_TESTS)'
-- 
2.30.2


