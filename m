Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AC16B3C5E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:36:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paa26-0007Tz-2V; Fri, 10 Mar 2023 05:31:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paa24-0007Sc-33
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:31:28 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paa22-0004FE-07
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:31:27 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so3077728wmi.3
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 02:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678444284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+9R+WJAtyA8SeJ/1as6Ou9Go9GUXAmG0Tw994EVyLcw=;
 b=f2o9vKZra78HWQnWncPu7hbGH9C93KTNsRZiibAVPngUCGKgCekmYIz8W4NrUYWQra
 fRBBPZ5QBwc9SkNEnB1jyrytWZhLqKWqBbztk6C5mXgYOXQFgnLIaXaVlhWqwYgRjLEJ
 anlcRZq40uhFBejT8uiH7TPOQ+iepTchPoF6xCpBCrQIutcmZhnVsANe24rel2D8eM6o
 aSETlUCcLJyVNZa/3s4J2DYySwOukRED9apGN+3Muw8nJUnDNx4Nor0S76LHRCHJsIP5
 J3SZq6I+qTLax8LEtKEfvT/cDFxmGcB+JmuQQeNKGdewTmrFmOIedKWpiwtflFnfsHKf
 M5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678444284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+9R+WJAtyA8SeJ/1as6Ou9Go9GUXAmG0Tw994EVyLcw=;
 b=Iepd35vnBXzVSSBF7ECKbWGYFMgDKP5ZP9diBgkeWgBRy/9xPk6KFKH3lcbPCiqXqz
 7tPdi8NW5ZSZgR7LbuQS5MuiQ5CUL55ZQSqP5Sfj3cNKtP2G5jy8D/R2RvP3uKbLlCCl
 /ShMjjZJE1c58wzfXd2BKxeo3D/YkE1b3ohSkCC5AOX2zQA9KRGAjNGfgxSYYKu0Nt7n
 NFfI273tcVHAkP2vzllyCC8zNPqeGXFRBGpP94ynmSQLw9Lf/QlfKukjSdJauTfUhPDY
 qC33DzYwR79wx9MhV34xIuep0Wc+0hHcy1qT696K74dPONS54AxxfNc3iaVthFqiXvba
 mBfw==
X-Gm-Message-State: AO0yUKXTtvrCr6IUTSClizg8w4yqty80AwgpV1RC5eME4DiI0pEQKgta
 iNJ7Gkkvj0+/KNNtT6DTvuFFSQ==
X-Google-Smtp-Source: AK7set9slgWQ7Wl+rxoQBIC9j++KjpoQ1I8aBhzPVkpSBStTN6dq9Bpg+JM6ByH2ZO2Ib3qF0JRS2g==
X-Received: by 2002:a05:600c:3113:b0:3e2:24a0:ba26 with SMTP id
 g19-20020a05600c311300b003e224a0ba26mr2141410wmo.16.1678444284587; 
 Fri, 10 Mar 2023 02:31:24 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 20-20020a05600c22d400b003ebfc075eaasm1748419wmg.16.2023.03.10.02.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 02:31:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B493C1FFBA;
 Fri, 10 Mar 2023 10:31:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Fabiano Rosas <farosas@suse.de>
Subject: [PATCH 02/11] tests/docker: all add DOCKER_BUILDKIT to RUNC
 environment
Date: Fri, 10 Mar 2023 10:31:14 +0000
Message-Id: <20230310103123.2118519-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310103123.2118519-1-alex.bennee@linaro.org>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

It seems we also need to pass DOCKER_BUILDKIT as an argument to docker
itself to get the full benefit of caching.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Suggested-by: Fabiano Rosas <farosas@suse.de>
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 54ed77f671..9401525325 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -39,7 +39,7 @@ docker-qemu-src: $(DOCKER_SRC_COPY)
 # General rule for building docker images.
 docker-image-%: $(DOCKER_FILES_DIR)/%.docker
 	  $(call quiet-command,			\
-		$(RUNC) build				\
+		DOCKER_BUILDKIT=1 $(RUNC) build		\
 		$(if $V,,--quiet)			\
 		$(if $(NOCACHE),--no-cache,		\
 			$(if $(DOCKER_REGISTRY),--cache-from $(DOCKER_REGISTRY)/qemu/$*)) \
-- 
2.39.2


