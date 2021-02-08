Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2785D313E5A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:02:39 +0100 (CET)
Received: from localhost ([::1]:59064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Bny-0001W4-5k
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95uk-0004Nd-RM
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:45:16 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95uV-0000fL-2R
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:45:07 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h12so658222wrw.6
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 04:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fZc8/pcIL1JNoWlbKYvFp4P3eVREddnQsSh5KL055gw=;
 b=aA1o84fqZycjL2AGaWmi7JYy1jSoYFV0htXgvvJ3d7HrFfFUEEFHGPsTQgqcRoUzLu
 9LLF6kGWwZSAXyNFb3e27ZGvyb7aNcucbojGye5dtJPStsbU7DnQHr0bT5GX3VbcMHeN
 TNEKVrtGGxDMkE34V5hg0PCY4gwsQ+8sazr6JKGGi2oxc/MDim0s5EhFYHU8ia40kVuo
 RVmhEOjpWRdHsa4ecbdUe+9KqCE0MYWqB95m/hq7fWF+c4pMebQ4/7lQGKfhUnssRe72
 Ww2AhW8HOUVWovoeM9VQBVU0H6RkbjY8q1JpMQPkg9cLMAdVHsx/6UM5dZyeLjZ0lhn2
 3xCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fZc8/pcIL1JNoWlbKYvFp4P3eVREddnQsSh5KL055gw=;
 b=lGqFxM9Pc4QBawJ8r4Z+i45qbYih/Id0GstWAOY8rCCCoucmXAOgOz+iwh1ljNE7ip
 aP3fFXUHp6vinCDtzg9ZgAZBSWYn0SwWYunzDaWaEMsMOXqO5vkD3XYbVOYFTLXUvMgc
 aYsGvoqKl3eoYTA6iRImi/XY4L4gRWpycG1qcpFeePi+/rGVg+hXSz8BoJju8RcTDftC
 rExik0bS1nFCXc3FsZvp+kbc9dMLti/+tIFPXEoITfK8KflVCk5AfvUdXMm7ewUBYk57
 iM2iZscVq5OzvrruQqankTP+6oNWK1NCvWBDYqaPni4YyFL0Qg806EkEJ/S8kb3XDRoq
 sJXw==
X-Gm-Message-State: AOAM530Rtz2+RwIfaCBgfkN5gXDqxKc3s0kcz86+mZpeIFXlawXVtE5J
 cIobtekp3mCKWxMvwAkh9PdglCSf7sbWa6V8
X-Google-Smtp-Source: ABdhPJw01ve8NjNYAwA8SNCyJo29KkpnQDeLYZpX+lmBS5BBATJyC2BD+Bd1cVN3+XfqozvA1QC4Iw==
X-Received: by 2002:adf:a59a:: with SMTP id g26mr12483429wrc.271.1612788294766; 
 Mon, 08 Feb 2021 04:44:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u10sm19876441wmj.40.2021.02.08.04.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 04:44:52 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 105CC1FF9D;
 Mon,  8 Feb 2021 12:38:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 14/16] tests/Makefile.include: don't use TARGET_DIRS for
 check-tcg
Date: Mon,  8 Feb 2021 12:38:19 +0000
Message-Id: <20210208123821.19818-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208123821.19818-1-alex.bennee@linaro.org>
References: <20210208123821.19818-1-alex.bennee@linaro.org>
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TARGET_DIRS reflects what we wanted to configure which in the normal
case is all our targets. However once meson has pared-down our target
list due to missing features we need to check the final list of
ninja-targets. This prevents check-tcg barfing on a --disable-tcg
build.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210202134001.25738-14-alex.bennee@linaro.org>

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 17dafdfe98..d34254fb29 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -40,11 +40,13 @@ SYSEMU_TARGET_LIST := $(subst -softmmu.mak,,$(notdir \
 
 SPEED = quick
 
-# Per guest TCG tests
+# Build up our target list from the filtered list of ninja targets
+TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-targets)))
 
-BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TARGET_DIRS))
-CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TARGET_DIRS))
-RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TARGET_DIRS))
+# Per guest TCG tests
+BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TARGETS))
+CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TARGETS))
+RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TARGETS))
 
 # Probe for the Docker Builds needed for each build
 $(foreach PROBE_TARGET,$(TARGET_DIRS), 				\
-- 
2.20.1


