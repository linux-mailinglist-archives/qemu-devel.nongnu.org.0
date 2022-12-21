Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C739D652E31
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 10:05:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7v1a-0000BW-S1; Wed, 21 Dec 2022 04:04:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7v1P-00007D-7y
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:04:22 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7v1N-0000Fy-Hd
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:04:18 -0500
Received: by mail-wr1-x42e.google.com with SMTP id bx10so14289265wrb.0
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 01:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9IrJ9O1ktrVQ17dyt5OElAaiWaC6DDZGAyzE9vW9dtc=;
 b=dfwve8NQYRsFccrWVlOXszZLBBpIoMTqBEKCSnIV1MWNfenrcGqrJHkLKEY85SoQGQ
 0MCGySILCNlBOl+g+l1mZoTQEIqFXxid07DYPKHKen3zD2+bOHNc0wIt7vhxL/g6Zz/z
 RNcQd4eU1pxqgjmAiJot5drl1KWoVMwxbMBbEuPhUkAC9/sfyaUUIPiR4ZIqLv/x2i2i
 NP8PqWavyzHcNRWSNOtM+dXwXGuNEmISbWFD/KhKgNwyfQftOTtiSR3ggaXxtXN00lKM
 6IB8HlSZtcEsW4NQq35yfmlX/kbfGm2fNFfzp9VEfClHWTuMQy3Mt7ylouWPLLJesr5R
 pTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9IrJ9O1ktrVQ17dyt5OElAaiWaC6DDZGAyzE9vW9dtc=;
 b=CD0EszSSXaz2qm/jAKh/+NvfyU19/Jaz1vwOVSFSqvNKKk1fBYse0bav6OtrNeGVLH
 /iA9UJ1KUsTzYtkit4qcS8yYbAlw0SfaxasV3Y2yaiVxSvHP76QoUBmhlzgSAYD41XeS
 p4kY0xi01vd5je9gC45ZDdYwy4byjoMf/Nq2Nu/+Sh5LzB2M3dkznzn7U0UWwq8hHY/x
 8+66JNhRJMzpZ3uqoo33DkzONVr0uLMxRtIiuJukP4m4qWmMBHT4VkH/ClwgZlhTQ+oy
 6oEdvq94eu4vDLQMNLZb5ZyaclRCgandC49B+Ua8r/QrAItiXvYRuy9PANQ4B3pPFyNa
 DORQ==
X-Gm-Message-State: AFqh2koDfoZgMt+bJHPU8udmD62VCJOYxBKLr6vQBvpGoavsgeahcDp8
 0YUFjszhZw74/OuALmUmgGWDcA==
X-Google-Smtp-Source: AMrXdXvYWZ35qSLIvIwZO8BtQmctVoQ2mDXY7TVc3aHZq6YbdYTA3dBns9K0/ksB4GjOhcayjm22hg==
X-Received: by 2002:a5d:5c0d:0:b0:242:1809:7e13 with SMTP id
 cc13-20020a5d5c0d000000b0024218097e13mr3693182wrb.11.1671613455542; 
 Wed, 21 Dec 2022 01:04:15 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a5d65cf000000b00241d21d4652sm14845396wrw.21.2022.12.21.01.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 01:04:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7EFB81FFBE;
 Wed, 21 Dec 2022 09:04:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, fam@euphon.net,
 berrange@redhat.com, f4bug@amsat.org, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 6/6] gitlab-ci: Disable docs and GUIs for the build-tci and
 build-tcg-disabled jobs
Date: Wed, 21 Dec 2022 09:04:11 +0000
Message-Id: <20221221090411.1995037-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221090411.1995037-1-alex.bennee@linaro.org>
References: <20221221090411.1995037-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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


