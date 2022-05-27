Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481955364E1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 17:47:48 +0200 (CEST)
Received: from localhost ([::1]:60738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucBn-0008LU-Bx
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 11:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0o-0000pc-Gz
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:26 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0m-0002TV-Rs
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:26 -0400
Received: by mail-ej1-x62c.google.com with SMTP id y13so9542179eje.2
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3nC9Ii6G0qVy/KgJCelMhSQ1EJWDkNVLGhKHdxNQ7iE=;
 b=yUSOIFRfT2PnAWtS1Sm0eMsMsjaT/ot9APZveGyNeSXgr+V72LQjGzSxa6vngBuSEe
 raWi7gEzVENdOsqCm/yrFKhm6lNMUZv4wRhs6y++gbYH99qEXC7YGJhkyEyGMY/BNV3o
 6w0Z9vd5JRov5R1G+gbb4BuWUyYm2VatEkLlpXo7OKqOvSVrUAqbaK7fqVZ3hGS0L81l
 MhkAajRwpqmFiFSp1DUI7uBy41dsP6Uh6c+Kr9i2XPzRtMmYxPAiKqclRK5toWGWWusK
 q1br539OOxGSyrZEdlbhsC3WpIYXr3p+eoo0kGNElccYshVutEyXjq0ceyuMiPIMXu1E
 33Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3nC9Ii6G0qVy/KgJCelMhSQ1EJWDkNVLGhKHdxNQ7iE=;
 b=2d/i4ihwrHUXq2atN3YrCZpC2OiIfiERTT73i+xMbQ2ab9rqk7bLQSjb0RIQueZeWg
 onwNkbAPS+LMua4JVa/heEL/BNgZ36PX9Huk5CuxnJu4QNggtrE2fpVdGd2wlfChtS1F
 RII2J1+bLU4/mklsXwHDgoHy1LCJtr2SqHQNatiQv8zEdcxnyNmXwbEQ3QZHw79rIIIE
 lbDOoxqFpCJg/4dZ5o6kWyIscALSLPo/OrR91V6/5QsckA7o1oJAiZB6V9j/9FxvryiX
 WYqxEG7S1rW8x/6XaDrc7jO1uCOwbwLUl7k1nyQuZwpA/nVxOnkIeKzqlA2NPbsXZgFz
 2pyQ==
X-Gm-Message-State: AOAM530PPtVGG0akL+GZP89Di4DitXGD8c1E/wIfM3XkIYYikM1HHZmB
 7oPBYGvHeuTDnjd/AzYUXTIIKg==
X-Google-Smtp-Source: ABdhPJxHZaF1iLLJ2nd9x8UYGcTk8QoTK76LCI10SR2ak5IL1G29P+yUNF33QvX2qLJvh6pje0jl+A==
X-Received: by 2002:a17:906:478b:b0:6f8:5850:4da9 with SMTP id
 cw11-20020a170906478b00b006f858504da9mr38356085ejc.619.1653665783469; 
 Fri, 27 May 2022 08:36:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a170906a40b00b006f3ef214ddbsm1580562ejz.65.2022.05.27.08.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:36:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 252061FFC6;
 Fri, 27 May 2022 16:36:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v1 14/33] build: add a more generic way to specify make->ninja
 dependencies
Date: Fri, 27 May 2022 16:35:44 +0100
Message-Id: <20220527153603.887929-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
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

From: Paolo Bonzini <pbonzini@redhat.com>

Let any make target specify ninja goals that needs to be built for it
(though selecting the goals is _not_ recursive on depending targets)
instead of having a custom mechanism only for "make check" and "make
bench".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220517092616.1272238-4-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile              | 3 +--
 scripts/mtest2make.py | 8 ++++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index fad312040f..3c0d89057e 100644
--- a/Makefile
+++ b/Makefile
@@ -145,8 +145,7 @@ NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
         $(filter-out -j, $(lastword -j1 $(filter -l% -j%, $(MAKEFLAGS)))) \
         -d keepdepfile
 ninja-cmd-goals = $(or $(MAKECMDGOALS), all)
-ninja-cmd-goals += $(foreach t, $(.check.build-suites), $(.check-$t.deps))
-ninja-cmd-goals += $(foreach t, $(.bench.build-suites), $(.bench-$t.deps))
+ninja-cmd-goals += $(foreach g, $(MAKECMDGOALS), $(.ninja-goals.$g))))
 
 makefile-targets := build.ninja ctags TAGS cscope dist clean uninstall
 # "ninja -t targets" also lists all prerequisites.  If build system
diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
index 304634b71e..0fe81efbbc 100644
--- a/scripts/mtest2make.py
+++ b/scripts/mtest2make.py
@@ -81,12 +81,12 @@ def emit_prolog(suites, prefix):
 
 def emit_suite_deps(name, suite, prefix):
     deps = ' '.join(suite.deps)
-    targets = f'{prefix}-{name} {prefix}-report-{name}.junit.xml {prefix} {prefix}-report.junit.xml'
+    targets = [f'{prefix}-{name}', f'{prefix}-report-{name}.junit.xml', f'{prefix}', f'{prefix}-report.junit.xml',
+               f'{prefix}-build']
     print()
     print(f'.{prefix}-{name}.deps = {deps}')
-    print(f'ifneq ($(filter {prefix}-build {targets}, $(MAKECMDGOALS)),)')
-    print(f'.{prefix}.build-suites += {name}')
-    print(f'endif')
+    for t in targets:
+        print(f'.ninja-goals.{t} += $(.{prefix}-{name}.deps)')
 
 def emit_suite(name, suite, prefix):
     emit_suite_deps(name, suite, prefix)
-- 
2.30.2


