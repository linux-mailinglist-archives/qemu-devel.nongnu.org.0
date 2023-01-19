Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CCC674086
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:05:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZHF-0003NE-Ix; Thu, 19 Jan 2023 13:04:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZH5-0003J0-Pc
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:04:31 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZH1-00011g-Uy
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:04:31 -0500
Received: by mail-wm1-x32a.google.com with SMTP id l8so2188657wms.3
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ckg71MG7SVvhUWMlWrtuql+u6S+Ri9y1vJzFG4YdetM=;
 b=UO3XgEVa7kkdVw88Uiy0nia85aO8FQ0wv7dmYkJV2d8xNBhMMlzDXmx0fmVeXYC6d+
 ASl/+GUqmgHhYF22FAsCgZMjX/Fjv6CQIwIPk786y1srdQ3hk3Sw2fZr4waq3OJE0tYC
 +7tQZWTynQedKJO3ZmFV2yFK/UY2fNeAmYzUEwROQSS449V4XGyqQwR/loJ/dPR9TxwR
 s0WvpCUju+RnGpSwnHmNB47NBSR/SoVVrIDGdluyRUrYB/dj4WkTiWaJGW0Fkv6/E0d/
 cfucqVB52Fm9woJUchIs0LqTQRM7OGnRdUXkOqVXcfq+wkvLntOnTxhb1nCHtaV8TULj
 7bXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ckg71MG7SVvhUWMlWrtuql+u6S+Ri9y1vJzFG4YdetM=;
 b=426uYvGFICgaIt7aS7cEMBHFc19M4xXNXgoZ6zIHY/VUAcd5Eag8IFwV9noovCEMxJ
 O7JFXUstg80iZxCSzT+iFQhqxsioJGqEWWls2KyV0RphkGMfHr8A3Cw922FVPPA7TJTz
 YAq0IDvkqT1/fhJIqvZZYThMTS+EViPlerSt12tXMMldu9jDQ362+CIY3EsLvrzPl0aO
 5LZNF8hvoQXnvd+cIXmGf+l/dH4vitF2OAxFxf9xiBJt0a+QuW7dA1f3ILWh3JEyvUIA
 EG184TtxYsa/v5bVZrDwSJkinVy407wWQLI8tnlpIbXvJYQQDqcvNHBvAUouMeaDfExb
 IOVg==
X-Gm-Message-State: AFqh2kpfKu62wQUeWuCbQ5DdypcDMX4k6eW4rLC5VRFd1BNnhLRmCjaA
 7xMnt8vw1OKeINM/jCUODzl5dg==
X-Google-Smtp-Source: AMrXdXugqz+oZBP0cPsheQ9wkcgnJKYfv0QLlquMGuwE6DO3tCQLp/aKCwAXjn2vh8BntqusnvccPQ==
X-Received: by 2002:a05:600c:4e93:b0:3db:d3f:a91f with SMTP id
 f19-20020a05600c4e9300b003db0d3fa91fmr8890674wmq.23.1674151466305; 
 Thu, 19 Jan 2023 10:04:26 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c510200b003c6f8d30e40sm6298551wms.31.2023.01.19.10.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:04:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5DBA61FFC1;
 Thu, 19 Jan 2023 18:04:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bandan Das <bsd@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 09/18] gitlab: add lsan suppression file to workaround
 tcmalloc issues
Date: Thu, 19 Jan 2023 18:04:10 +0000
Message-Id: <20230119180419.30304-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119180419.30304-1-alex.bennee@linaro.org>
References: <20230119180419.30304-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

The up-coming upgrade to Fedora 37 will bring in libtcmalloc as a
dependency of libglusterfs which confuses our fuzz run. Rather than
disable the build lets use LSAN's suppression mechanism to prevent the
job from failing.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/buildtest.yml             | 1 +
 scripts/oss-fuzz/lsan_suppressions.txt | 2 ++
 2 files changed, 3 insertions(+)
 create mode 100644 scripts/oss-fuzz/lsan_suppressions.txt

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index f09a898c3e..9a6ba1fe3b 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -511,6 +511,7 @@ build-oss-fuzz:
     IMAGE: fedora
   script:
     - mkdir build-oss-fuzz
+    - export LSAN_OPTIONS=suppressions=scripts/oss-fuzz/lsan_suppressions.txt
     - CC="clang" CXX="clang++" CFLAGS="-fsanitize=address"
       ./scripts/oss-fuzz/build.sh
     - export ASAN_OPTIONS="fast_unwind_on_malloc=0"
diff --git a/scripts/oss-fuzz/lsan_suppressions.txt b/scripts/oss-fuzz/lsan_suppressions.txt
new file mode 100644
index 0000000000..02ec0a6ed5
--- /dev/null
+++ b/scripts/oss-fuzz/lsan_suppressions.txt
@@ -0,0 +1,2 @@
+# The tcmalloc on Fedora37 confuses things
+leak:/lib64/libtcmalloc_minimal.so.4
-- 
2.34.1


