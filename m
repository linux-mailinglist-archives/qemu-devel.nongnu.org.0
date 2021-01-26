Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C013041C8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 16:12:58 +0100 (CET)
Received: from localhost ([::1]:41734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Q1Z-0005At-Lv
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 10:12:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l4PjI-0005gt-Qr
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:54:06 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l4PjE-00007E-L8
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:54:04 -0500
Received: by mail-wr1-x42a.google.com with SMTP id 6so16770686wri.3
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 06:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UlvfDxj7BQqNhHmBMs0ah4O/KbAuLVUJ+0kQsdSlOMw=;
 b=hLYy0scEQI3oGwxi3eMH0otHcZRF3Ie+ENrP/YsvAbkhPFxNHpkHxkdPUYf0AhzqXH
 /k/TnS9ei5NIEmOqbyj3zwBCebaBIbLknn2x2VOrJYzJd34hVai0ImNccQ3TfuAzxWvA
 iWrTJlamgm7kIBRG9kULTxzPsQ93JcEQX19bGwLyQIOyxjYrwpA8Ge9NJjVoi/qGoPf6
 N72CAwtpOD1fQg+oMl91uBKKVjU/fOZ5Bg/Esmoy6MW2J7NU4VYu50B8s2PAVMpI/XVT
 hwQePKZ6oZI5EHbv6Mhpc/O3dAocesqbgVWpYgaz57FgKsbLtTtlPRsazJ9DcNJ+KzK5
 wfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UlvfDxj7BQqNhHmBMs0ah4O/KbAuLVUJ+0kQsdSlOMw=;
 b=ouPSgB9er0U84PNIRXqsObUAoFJGveP5BDQ+5TL2WkUGKMx8dR6Gi+GxboXT9+YEcg
 jN7kEfge8xb//X4hlp+LodGpl/KT8aZZwoGviJduA0g37dmLcK2z5AhWan16nb98QUEA
 rHYr3C4DIoWsMQNggVt76g1FX5+W+D1AGgSGrGW+xhiMaPpKiOZhWljZeBof5Za9mNrl
 caGaaWhHpUIEU6Z1IGA2lysrerXAsAuPZRVJP/5xDj0CeY22wsTk0ZkS/jxoC+77oUu3
 WvWK6/YGvSjyEZvB0/5ANXsqaGjuQ7aQVD4qVG3URqF75esCbNZwySavNhfuzFcId4IF
 J6Lg==
X-Gm-Message-State: AOAM533gmiNcjEg2wCzDz9FAI5HUJRxMgl+kPn0YG0Fd3csWINclTh4P
 jKfAuWg1esPajxEAue2d+jKlUw==
X-Google-Smtp-Source: ABdhPJxrRSMKV4atjE1uGWwU+eJ/IhQgrVDn/pJSQlCb2dT4XS4Z1HLQzCl1u9HJ2v0wfS0dF5LInQ==
X-Received: by 2002:a5d:560c:: with SMTP id l12mr6314367wrv.417.1611672839008; 
 Tue, 26 Jan 2021 06:53:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m18sm8323731wrx.17.2021.01.26.06.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 06:53:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 213A31FF87;
 Tue, 26 Jan 2021 14:53:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/2] scripts/mtest2make.py: export all-%s-targets variable
 and use it
Date: Tue, 26 Jan 2021 14:53:55 +0000
Message-Id: <20210126145356.7860-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210126145356.7860-1-alex.bennee@linaro.org>
References: <20210126145356.7860-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are some places where the conditional makefile support is the
simplest solution. Now we don't expose CONFIG_TCG as a variable create
a new one that can be checked for the check-help output.

As check-tcg is a PHONY target we re-use check-softfloat to gate that
as well.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/mtest2make.py  | 1 +
 tests/Makefile.include | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
index 25ee6887cf..cbbcba100d 100644
--- a/scripts/mtest2make.py
+++ b/scripts/mtest2make.py
@@ -110,6 +110,7 @@ def emit_suite(name, suite, prefix):
     print('ifneq ($(filter %s %s, $(MAKECMDGOALS)),)' % (target, prefix))
     print('.tests += $(.test.$(SPEED).%s)' % (target, ))
     print('endif')
+    print('all-%s-targets += %s' % (prefix, target))
 
 targets = {t['id']: [os.path.relpath(f) for f in t['filename']]
            for t in introspect['targets']}
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 3a0524ce74..3ce8b03f34 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -12,7 +12,7 @@ check-help:
 	@echo " $(MAKE) check-speed          Run qobject speed tests"
 	@echo " $(MAKE) check-qapi-schema    Run QAPI schema tests"
 	@echo " $(MAKE) check-block          Run block tests"
-ifeq ($(CONFIG_TCG),y)
+ifneq ($(filter $(all-check-targets), check-softfloat),)
 	@echo " $(MAKE) check-tcg            Run TCG tests"
 	@echo " $(MAKE) check-softfloat      Run FPU emulation tests"
 endif
-- 
2.20.1


