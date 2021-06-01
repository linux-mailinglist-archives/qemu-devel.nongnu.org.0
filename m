Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A78639769F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:27:30 +0200 (CEST)
Received: from localhost ([::1]:35048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6Ij-0000jl-Gg
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5u4-0002gG-F7
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:02:00 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:45596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tp-0002mX-KZ
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:02:00 -0400
Received: by mail-il1-x135.google.com with SMTP id b5so13186530ilc.12
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rzzhd3G9gggZHKxSJPBjAf0PSVR7TzU18yU4esksHrE=;
 b=A1+zvphQhvHm+SVBOvbCMqjIJcv/b0qsl+FlTQv+uqZ5P0wbe2jx7s6CuDCAyHXmnh
 bJFGfg8KIMdDyDceQZeiOG+ODBgl2LmY7jLMXklauXefiieD6axqbfsOw9ePXR5hUJLS
 ycNk+D7hxxxbxXvOg/Qa0zl8rTEQ8l8Crpzt8JOy1l/8nXjfoab9NrTOmfUE4etgoMuN
 wgF6MF5yKBIQccBwDGNqr+CnWSBgDlmy5ewdZgfAhsRxBcPThSQkojzRotNVWuUyy8K1
 C5Hz4x0I7nBqGLE7NgxbUTcLvA5bdnQyt7ItjVumo1VUOkvJgOgsId7pt53YQGc/5RTr
 OeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rzzhd3G9gggZHKxSJPBjAf0PSVR7TzU18yU4esksHrE=;
 b=Qwo1MB4gwCVfBzkRQgrumvUbFOQt5iCs8GwB9xQ8ioVsj4KY6y49ED7Zb7DhARohR3
 5J8MKrXAABorM96RCp1gQPviZMDR9OJ9vkIbmnkRPEgoQx0xgFavXhQGeuPINrOD6mnb
 1NIXcztKpirUNyfCQN1liHTQpp8IKQVsEry3ER6jwB41QU1gcLyXucuGpGREo55nE3BH
 PeBWrTVwsAMtN9CD8Q3hNZ6iDXi7Hj9VJPI/Xy6kUE7tgboofyB6nM0Bk4RrNPKQH0Nz
 OlkaS3KcR+lknHpjcYi6mg7gbEnIgX449b2bcnPeQQGdK/VuEAU+k/knSRjE5c5oOP/5
 kDuw==
X-Gm-Message-State: AOAM531dnu5rP+tbMS5/jwRPa1Lus2D7ykPME/TcrEujecK0UQOP+0S0
 rk5bN5wuhg7sUGk5caWmfBTeJY/Mc6WeOoVB
X-Google-Smtp-Source: ABdhPJyARgUrJ5MhWsNX7sSIw4AURcme/nUKuA5LMZ1eVrMIQDYStbDH9SOraN+hBVdVfs7F/xQOZQ==
X-Received: by 2002:a05:6e02:1111:: with SMTP id
 u17mr10371868ilk.307.1622559704271; 
 Tue, 01 Jun 2021 08:01:44 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 27/27] tests/tcg: Increase timeout for TCI
Date: Tue,  1 Jun 2021 08:01:06 -0700
Message-Id: <20210601150106.12761-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x135.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The longest test at the moment seems to be a (slower)
aarch64 host, for which test-mmap takes 64 seconds.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure                 | 3 +++
 tests/tcg/Makefile.target | 6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 90c0807347..69091ff8ba 100755
--- a/configure
+++ b/configure
@@ -5846,6 +5846,9 @@ fi
 if test "$optreset" = "yes" ; then
   echo "HAVE_OPTRESET=y" >> $config_host_mak
 fi
+if test "$tcg" = "enabled" -a "$tcg_interpreter" = "true" ; then
+  echo "CONFIG_TCG_INTERPRETER=y" >> $config_host_mak
+fi
 if test "$fdatasync" = "yes" ; then
   echo "CONFIG_FDATASYNC=y" >> $config_host_mak
 fi
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index b29fae4630..63cf1b2573 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -81,8 +81,10 @@ LDFLAGS=
 QEMU_OPTS=
 
 
-# If TCG debugging is enabled things are a lot slower
-ifeq ($(CONFIG_DEBUG_TCG),y)
+# If TCG debugging, or TCI is enabled things are a lot slower
+ifneq ($(CONFIG_TCG_INTERPRETER),)
+TIMEOUT=90
+else ifneq ($(CONFIG_DEBUG_TCG),)
 TIMEOUT=60
 else
 TIMEOUT=15
-- 
2.25.1


