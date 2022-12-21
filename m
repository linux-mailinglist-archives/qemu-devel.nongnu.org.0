Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D043465328A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 15:41:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p80Gr-0006yO-KW; Wed, 21 Dec 2022 09:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p80Gh-0006vN-60
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 09:40:31 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p80Gf-0004uI-8D
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 09:40:26 -0500
Received: by mail-wm1-x331.google.com with SMTP id o15so11315815wmr.4
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 06:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dCCnviiSQJfntmqTkYMuxNDewciBaYWqEuBpg+sqhS0=;
 b=LoIGZLGcgKDCQnOEpvpiJ4iOeqz3QPfJBrPuuleIarEZMB6iywN1oumdeZ7xIUuX/Q
 KxHufPhSYHUv1wGjnRNrdxt8vVvXD0T3bKnmYsoklR8nA/HCjVzLQW+qdtHeog4OurIB
 MG3wc0LqHmwwsH9zHTrFtddgEvQQq3k0CFkE2RKqnWS6Ie9Aj5RkEuHKgkAyEe5Wvmuw
 4boLID+WxzIbwuVIYF2G5CKQrDwEWDVzMc9eryYhXoPVwCq47xU6s4XvYHu6MSfp4ALH
 Gk6xTrjjYPiqexVvWntAvF3EQVgR2msmhrvkA0/PmSXslfDedO1LntBdDKaZ/CGLI7qN
 i4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dCCnviiSQJfntmqTkYMuxNDewciBaYWqEuBpg+sqhS0=;
 b=jFYwcZK75hFsWo1kc0Dh7oAIoyvYKz5xchNSExLss/VtRt4FXKZEeqKdgcec2l9uV9
 qMiyEjPPPlyYOgqvOanmXKacPBkWQIg+UIDR0i0ta0TcqSyPNQV502KCTugjn63xLHDL
 CAwsthXheuZLvxGoqPNhBHsBYzdTyEYy1v7IeJOS7O9nKkmlb1T4pUrTRKby0KPaajSd
 O4RCA0FWLRlWyAj9QyBmJBa/UzfGL1wNXSl5OPPsGA2PY5tcaeQgfDSY9uskPLDgOExJ
 vBFeV5OV6yvMMl7MW/BgXcym4RznpzDoVu2y22Cywvs3TlZ6E8ENFLdLhwbCGSY15G2X
 wo3Q==
X-Gm-Message-State: AFqh2ko/RVGtZFFQUMEs3aDjUK8npuCQ4NKm+lYW5EYy7Vv0ZaVOnLLk
 iNLWuIhiEKMbtKcAOaWPGyKQog==
X-Google-Smtp-Source: AMrXdXt2aY3n5QWAWYwxXmsCY4EoxbAZLiPfUzqXNuiH84larkw3uH++L9rJv59282wG8FAHYlf6DA==
X-Received: by 2002:a05:600c:3b83:b0:3d3:864a:116e with SMTP id
 n3-20020a05600c3b8300b003d3864a116emr1831295wms.26.1671633623478; 
 Wed, 21 Dec 2022 06:40:23 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o27-20020a05600c511b00b003c6f8d30e40sm2829881wms.31.2022.12.21.06.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 06:40:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 640931FFBE;
 Wed, 21 Dec 2022 14:40:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 6/6] gitlab-ci: Disable docs and GUIs for the build-tci and
 build-tcg-disabled jobs
Date: Wed, 21 Dec 2022 14:40:19 +0000
Message-Id: <20221221144019.2149905-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221144019.2149905-1-alex.bennee@linaro.org>
References: <20221221144019.2149905-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

From: Thomas Huth <thuth@redhat.com>

These jobs use their own "script:" section and thus do not profit from
the global "--disable-docs" from the template. While we're at it, disable
also some GUI front ends here since we do not gain any additional test
coverage by compiling those here again.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20221208135945.99975-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221221090411.1995037-7-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 93302a96e2..f09a898c3e 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -244,6 +244,7 @@ build-tcg-disabled:
     - mkdir build
     - cd build
     - ../configure --disable-tcg --audio-drv-list="" --with-coroutine=ucontext
+                   --disable-docs --disable-sdl --disable-gtk --disable-vnc
       || { cat config.log meson-logs/meson-log.txt && exit 1; }
     - make -j"$JOBS"
     - make check-unit
@@ -530,8 +531,9 @@ build-tci:
     - TARGETS="aarch64 alpha arm hppa m68k microblaze ppc64 s390x x86_64"
     - mkdir build
     - cd build
-    - ../configure --enable-tcg-interpreter
-        --target-list="$(for tg in $TARGETS; do echo -n ${tg}'-softmmu '; done)" || { cat config.log meson-logs/meson-log.txt && exit 1; }
+    - ../configure --enable-tcg-interpreter --disable-docs --disable-gtk --disable-vnc
+        --target-list="$(for tg in $TARGETS; do echo -n ${tg}'-softmmu '; done)"
+        || { cat config.log meson-logs/meson-log.txt && exit 1; }
     - make -j"$JOBS"
     - make tests/qtest/boot-serial-test tests/qtest/cdrom-test tests/qtest/pxe-test
     - for tg in $TARGETS ; do
-- 
2.34.1


