Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C367652D69
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 08:45:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7tkr-00072l-PS; Wed, 21 Dec 2022 02:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7tkh-00070D-Cs
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:43:00 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7tkf-00048t-BW
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:42:58 -0500
Received: by mail-wr1-x42d.google.com with SMTP id f18so14064527wrj.5
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 23:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9IrJ9O1ktrVQ17dyt5OElAaiWaC6DDZGAyzE9vW9dtc=;
 b=XKRBRM1Ke//s/5H4+LstI7OEQPr7fgZt6pKJIXqY2jBb0gnCwvrZRoM8OSp7Uns/bY
 iKbTFMbaE8WD0jA54er+lMIagKlfrZH0FcxM/vCZYtUGvt0JshEbWddQh+rDqAqXvLn5
 ptvBgEMzLPUzqKPEMFUh25o4zOoo97Qtxux/0ndiBGZXr32YVzeeqTR0q1PRtMsFAREK
 GN+r0LieV3UmCVvsfjubndEyrRJWTArBjus74hL5xwCiJFSnbKyA+DBTCBF1jbdqei+7
 O6K1X1ZFZcCKMAZNY/sXU7+4SJs++aKNtTmxA+hmKiQG3rTJ4z4WQWj9y8PrNPWTiGeJ
 lRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9IrJ9O1ktrVQ17dyt5OElAaiWaC6DDZGAyzE9vW9dtc=;
 b=HFjzIoOJF3sudOcL+NlT7vZo9uki/RiKQcjatQ3Qf3QEswL1t7Pce6RoUWt5wWGOcS
 I5WRW11O+oLgXsFgNc3kgcHGAULurXrXgdRY3k2PP6BJOq6dcUsVJebXqXT7wlKfev5n
 yTHcnwKNwa7qKe5vh7Lg+2CgUs3zmcZEdfVZMmFuGdttsQ4yCXxumTmDGfLZCgezQA5P
 0KvybeLgalC4kY4x4g4feSmS49knWt0+xFObcwH0L+hjFeKn4KBfW+KRZLzvi6NmVga7
 ZE7QTHjKJSQ9cfb2GZoPQD16irw6oxyV+LuRQMyKzW8aXcAAMJ/T4EfVAetASnLB/w9T
 5t8w==
X-Gm-Message-State: AFqh2kpc2FZOy+OkmuHq1Z2HdbVbwqjz1XaMzuqkmET6MpNadrgHnl02
 M7p03y6v2zEdCSZIxdWwYDlpS6sXs+4VskK4
X-Google-Smtp-Source: AMrXdXv44XgZ2OeRj7FqxQljXmVjeS4/Or4ZBZhqHn0JRh4LhpQfQtw5+J+SJfbiJqRnTHSTKgTvZQ==
X-Received: by 2002:a5d:4908:0:b0:241:fb10:9369 with SMTP id
 x8-20020a5d4908000000b00241fb109369mr478430wrq.21.1671608575916; 
 Tue, 20 Dec 2022 23:42:55 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u18-20020adfeb52000000b002423dc3b1a9sm14444678wrn.52.2022.12.20.23.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 23:42:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 06F2F1FFBE;
 Wed, 21 Dec 2022 07:42:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [[PATCH]--edit 6/6] gitlab-ci: Disable docs and GUIs for the
 build-tci and build-tcg-disabled jobs
Date: Wed, 21 Dec 2022 07:42:52 +0000
Message-Id: <20221221074252.1962896-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221074252.1962896-1-alex.bennee@linaro.org>
References: <20221221074252.1962896-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
---
 .gitlab-ci.d/buildtest.yml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

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


