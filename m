Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 574CC5BEFBE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:09:12 +0200 (CEST)
Received: from localhost ([::1]:55620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalQV-0006AO-Ck
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqt-0000ho-3N
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:16:12 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:34367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqr-0000k5-8t
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:16:06 -0400
Received: by mail-ej1-x62e.google.com with SMTP id y3so7863769ejc.1
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=N5I2F6uV15K8rJ+JfIBb+LUKr5djlIcn2XXO4PUTzSQ=;
 b=kDNettcXcvfqL7fbnmOFmKmC8sk92FCfF2RE7rYPRqi8xu30qiMlo752lSCfwiNzTy
 087UWbizDmilUcdkzHjaG1nsvuS8JpJKlppwNLHo+mv3s35LhTd1tKLqYqJ/dvPizfdJ
 6quu7Zfpd7/uxc6zMJDCzyIAEOWM3cR2Oqhwk8l6jDC2mgp4wJbtUDOLNNF9rHuMEFVj
 +XTZzLfPDcL8CmzMjf+8psVACOu8i123i5fzmSIuPuwSJHMorx6Ighpt599q5wvX6HVZ
 B+FVXVEaaT7kGXn3hkV2ZzGF5CF31ZCJLhUGIZKqZamrcNmeu2Mb/t0GIVwkuBn2vvvz
 7xOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=N5I2F6uV15K8rJ+JfIBb+LUKr5djlIcn2XXO4PUTzSQ=;
 b=l9qLtKWr71DK8TUSUGWN3iRxkLBlUqO5oAQYfRpaGW5LRa26s5RYsCQu5ZPa/4VDOg
 0zzlzMn8hHLbVjakDWe3mC/U5uN3xrRb4oiwiCx0RJhxkoSDOCu9YElWjvnf4zA1rjs+
 Uo6XXloh5LV1r/3g86nbMHiyloYw8kSnbjMv9HYm9qVIYuhqTwfqRONh0zXVugHD9c8B
 xVgUmpqVKeGWe21EhJmkFS40pi7nx7si+LzaGP5wTv2Ve3Psb04SCMixNMqLuefm/xVD
 F8ZAGBCkd3hfRdd8CRPjKKHho4khOgo5JTjMDK0A70hSFGljB3j6I93QxxMu2LL0r0mp
 RbjQ==
X-Gm-Message-State: ACrzQf2JgaEXe082KO1sk191rGQ2uqfTPxDd+ia73xMnC6XDZIDbH0NF
 L5TiAmvfx4eedebMhA4numazCQ==
X-Google-Smtp-Source: AMsMyM5aRuEYHAZYhB4CtIVKVQSqYrn7yJq4lhAsRbAd4oco/o7qIndlXUutVG1Ojt8kCkvvEFrApg==
X-Received: by 2002:a17:907:3f87:b0:781:ee94:7f91 with SMTP id
 hr7-20020a1709073f8700b00781ee947f91mr1122904ejc.52.1663694161325; 
 Tue, 20 Sep 2022 10:16:01 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d13-20020a17090648cd00b00770880dfc4fsm200665ejt.29.2022.09.20.10.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:15:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A08811FFBA;
 Tue, 20 Sep 2022 18:15:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 19/30] gitlab-ci/custom-runners: Disable -static-pie for
 ubuntu-20.04-aarch64
Date: Tue, 20 Sep 2022 18:15:22 +0100
Message-Id: <20220920171533.1098094-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The project has reached the magic size at which we see

/usr/aarch64-linux-gnu/lib/libc.a(init-first.o): in function `__libc_init_first':
(.text+0x10): relocation truncated to fit: R_AARCH64_LD64_GOTPAGE_LO15 against \
symbol `__environ' defined in .bss section in /usr/aarch64-linux-gnu/lib/libc.a(environ.o)
/usr/bin/ld: (.text+0x10): warning: too many GOT entries for -fpic, please recompile with -fPIC

The bug has been reported upstream, but in the meantime there is
nothing we can do except build a non-pie executable.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220823210329.1969895-1-richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220914155950.804707-20-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
index 3d878914e7..3f4dee4f86 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
@@ -16,7 +16,9 @@ ubuntu-20.04-aarch64-all-linux-static:
  # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
  - mkdir build
  - cd build
- - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
+ # Disable -static-pie due to build error with system libc:
+ # https://bugs.launchpad.net/ubuntu/+source/glibc/+bug/1987438
+ - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh --disable-pie
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check V=1
-- 
2.34.1


