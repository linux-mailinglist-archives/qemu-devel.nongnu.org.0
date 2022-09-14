Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BE55B8D43
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:41:36 +0200 (CEST)
Received: from localhost ([::1]:54448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVSB-0002QL-6O
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUo2-0006hN-10
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:00:06 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUo0-0002nV-4A
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:00:05 -0400
Received: by mail-wr1-x436.google.com with SMTP id h8so19454639wrf.3
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=YtututB/HwLz66Zj57eTsQrfGdUZAAhyrcZh+dfp8lg=;
 b=e8qhptXImSiQk2ZYA5+GRlLCbCis/0FE6wzCTwKUP3zbP6KAx0a5/pyXajefFkz9Id
 iGc4zDZRYcqQhcKEXm9bfH41iGMSZdQEAuRwNUTfXbgdF7+kBSoc//8wB/wihYq314HA
 uG5DNmMoQXbwd4L1NGnrSvIrhyWScPQfUTOMTm7lFMDkbhxXeSdFBcMyhKKxmA1XFGHq
 t/bjET61OamWRdk6yemgle4FNB8suQdC5ks8JZLBizavgnf/p/OkSqj1rAK5QpjlUxcx
 8vygf3Y5sW0ywCu3MdganqTqsB0NfYcDokbna+8gYFNb5H3tPlXX2Dl9pix/dmMCH5Vs
 GjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YtututB/HwLz66Zj57eTsQrfGdUZAAhyrcZh+dfp8lg=;
 b=qoXAwBs0dhbUw48oO2qrASEAUWdR5WFt57ojZNETDWZ+QmaSdXYl22iENCSFuKOxy0
 4M84VK/0DvxiFoC4rPksSQIpyKurU6S4I+xa4iHogwPfbVJnayX7irLNPJAW+xsa79b4
 COVzACixQy7KUSe/5D3cPQ0mV478qnFE+4Erbz7VKb5Keh5dwLeDdHZogNjllXYXtfb2
 ZmSVO3PvpjnF2m8/dKGaMJTfSQM0TXhIgIHf7/J8WgU1mcDnOStiqfh0U+4OZsdh2Dou
 hFxlUSxQ/rpR9TCTiNqj/WsrI0HVzp9ttECJJsBrSKicfvYhyCNSY0RkuCoj1cqCbJNS
 /NRQ==
X-Gm-Message-State: ACgBeo3JC3OTyNGSyxcuIQlOQYID2vfDQm1G3AgXp6aj8NsmPC9uLgZe
 fP0vR5yQ6PPJXMdWCsduAbJReg==
X-Google-Smtp-Source: AA6agR7V7tmg5hGb7PteHkdy3a1alL+pTDI4+nuW0rpi2Aimv7JbZGcM3Bo51QtaNsP7M/SqIeSpKQ==
X-Received: by 2002:adf:fd47:0:b0:228:dbab:8f5d with SMTP id
 h7-20020adffd47000000b00228dbab8f5dmr21311729wrs.524.1663171203325; 
 Wed, 14 Sep 2022 09:00:03 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 az8-20020a05600c600800b003b27f644488sm17858772wmb.29.2022.09.14.08.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 09:00:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 05EE01FFCB;
 Wed, 14 Sep 2022 16:59:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 19/30] gitlab-ci/custom-runners: Disable -static-pie for
 ubuntu-20.04-aarch64
Date: Wed, 14 Sep 2022 16:59:39 +0100
Message-Id: <20220914155950.804707-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Message-Id: <20220826172128.353798-14-alex.bennee@linaro.org>

---
v2
  - rm --extra-cflags workaround (now in configure)
---
 .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

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


