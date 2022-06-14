Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9141954A332
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 02:46:42 +0200 (CEST)
Received: from localhost ([::1]:34854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0uhd-0004jc-F8
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 20:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0udR-0008Q0-Sz
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 20:42:22 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0udO-00052Y-84
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 20:42:19 -0400
Received: by mail-wr1-x42c.google.com with SMTP id k19so9061229wrd.8
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 17:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QpcYgP5Z0SucUsQZRew2vO/aiQde3BIgiJO1uRCHwhY=;
 b=R16nslKp9bvhKZhgxAUwLbsQXAb7QSXxwacphLpbz2yxC5KuPhhOh6SouCt0jKexl8
 Zw4QWos+TqLVZCGdZOseGcaNiH2jR0sZVRtZGIA4GzodJj74s9K6QlaJipZKMxu0Ej2Y
 4urES5URbhW5kA6CaBbDTVzYX14Arb7CkEnUX5sC/TfIPKpB/5RTyjHfiX6uGDMd8thz
 PcoadWK/QrjrjIykGhqaGpiuk2Ir4+pVzb5srdJ5HmAUOV7LRUo8bgW9+PJcQWjC97QK
 2F+36IgjAEjva6BDkciDl6qpRvyug26JZ+qWP5+VpPNNtK3eMln5x9JVEapaiHGFwa72
 +SrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QpcYgP5Z0SucUsQZRew2vO/aiQde3BIgiJO1uRCHwhY=;
 b=UB3+R/HC2v3Hk+HfL4js9BR75aWbhRzj9cLbm7y/O8mvTkk6UuakrkbA8j87u2W5OR
 UZ07KVx1yXGuXGepuRKEa3UkKiwciNE/cRRJbFBuXzdtc9823p8vVOgnapLwxGFm1/Ts
 p561EKyZ0hXcASg6mFcdNmejKQVfgmsLcyErDk6vISErh8LqeXOo03iEH9M/MqSzJ9Uf
 szS2OzofhbpGZJOdI85aVy4l4injCUV4bATC2tDtcU4nMCjPiaYs5zaspTR3mXRliILv
 PqEggbHDH2gh2n+yhOTGfs2BwRsE9yMSFbUqjksziqpQEzDhETo4pI4w2O4Q1rAMSrwb
 JtfQ==
X-Gm-Message-State: AJIora8UjDnRPNsL40kkMu+Dp+X693Nh/i9QDTGhNInx5raA3Mg9Mt83
 Bnn5anDsTTehnskgx/L9bMkQeg==
X-Google-Smtp-Source: AGRyM1upwKwNvEvIQaty/lWMLygTMjzzjQPN0/vEGBcKUOWfI67LD1NCrpD2Ck9+DgLJUkOlqKA/RQ==
X-Received: by 2002:a5d:4405:0:b0:219:e73e:8312 with SMTP id
 z5-20020a5d4405000000b00219e73e8312mr2175047wrq.499.1655167336247; 
 Mon, 13 Jun 2022 17:42:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a056000004b00b0020d02262664sm10065679wrx.25.2022.06.13.17.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 17:42:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6540C1FFBC;
 Tue, 14 Jun 2022 01:42:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 4/7] tests/docker: fix the IMAGE for build invocation
Date: Tue, 14 Jun 2022 01:42:06 +0100
Message-Id: <20220614004209.1970284-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614004209.1970284-1-alex.bennee@linaro.org>
References: <20220614004209.1970284-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We inadvertently broke the ability to run local builds when the code
was re-factored. The result was the run stanza failing to find the
docker image with it's qemu/ prefix.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Fixes: d39eaa2266 ("tests/docker: simplify docker-TEST@IMAGE targets")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220613171258.1905715-5-alex.bennee@linaro.org>

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index e68f91b853..ef4518d9eb 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -171,7 +171,7 @@ DOCKER_TESTS := $(if $(TESTS), $(filter $(TESTS), $(__TESTS)), $(__TESTS))
 $(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES),$(DOCKER_IMAGES)), \
 	$(foreach t,$(DOCKER_TESTS), \
 		$(eval .PHONY: docker-$t@$i) \
-		$(eval docker-$t@$i: docker-image-$i; @$(MAKE) docker-run TEST=$t IMAGE=$i) \
+		$(eval docker-$t@$i: docker-image-$i; @$(MAKE) docker-run TEST=$t IMAGE=qemu/$i) \
 	) \
 	$(foreach t,$(DOCKER_TESTS), \
 		$(eval docker-all-tests: docker-$t@$i) \
-- 
2.30.2


