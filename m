Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 089B2308811
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:09:15 +0100 (CET)
Received: from localhost ([::1]:59812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5ReM-00081Y-2X
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:09:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW7-0004XO-LX
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:43 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:40700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVw-0006zY-Qn
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:43 -0500
Received: by mail-wm1-x32b.google.com with SMTP id c127so6804291wmf.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FjD0OXwGzNNfv2GlQuSHJeUVuFbskTZTRqIPXs9Gv+I=;
 b=VUNTc6U4eNi0A2AtcDUlH1IZ9PGcg9XKbk1PVFjeoXxxnRcxQGBtUXDourtzZ2XWJD
 BcD1Q+MPOclsMb/RHyelOoxhwmqvrrF3qSTTlhtAlNmkrPz74X9XUz9dbL66CenBDako
 9tNek22IEMTaMucMRNUnC2EoIv1qPTdLfAIVqSBQ2bVUNnaqSvv4WX7TA8s95Q/6i2DX
 jLQzeSx6Ho+D9+i2J49osrKse8XxCTquU2wnbE+04q9dYF4ZI5DQdHmE7jUBobfR9W8a
 IvIqy5QEJtdgojlwlMGeINQPgoXcDok7vQ1peQCyRAH1cZwj74jJPuYwCCuY7d+Azfy1
 ffmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FjD0OXwGzNNfv2GlQuSHJeUVuFbskTZTRqIPXs9Gv+I=;
 b=YTiSaPvHCr+j1c9ixydGEaKkKBUa9ePHG958S9zl4aC2KLfnBdXFIwArSnrmUjLj8b
 tMR1R66H8qVzip/KihffVzdgAvHTBYxnT3NFJnGpEOOs88hbYBfV1N1xKrdfLWPbu923
 ZpH17O8KsVxaenDCrc18A2UKrl+ybsMxN1Wv4yTmS7KchpoEZ00Z0Xbkcq9T9KLrk8QJ
 FxW3EX7bVP+OPEKuE3swjfmWOmiUo45atAU3gXQ4yCrCesc9TGAMeOO2ZofXC8OVAhoe
 xTWsNDyZdigkOGfUgLiakaU944plhLkN6svkokOzumQaXKJNPNW0HdkVHVfaWMqnK5sp
 4h+w==
X-Gm-Message-State: AOAM530Ixi8WLUNe0Zc84wyq2IR+0rUE1z20GGpm3W1xyse1GX5UohYS
 yDoqW+7Jr7DgnFXe0Dk7K2Z2qLTqBICeMQ==
X-Google-Smtp-Source: ABdhPJz+k6paP9RFV8GkN6MBbuZmuufuuTuOD24EjGZ4U5UVXp7WsNfdJftuxz/ru43HAlJxYltsmQ==
X-Received: by 2002:a7b:cbd5:: with SMTP id n21mr3375267wmi.5.1611918029507;
 Fri, 29 Jan 2021 03:00:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/46] darwin: remove 64-bit build detection on 32-bit OS
Date: Fri, 29 Jan 2021 10:59:42 +0000
Message-Id: <20210129110012.8660-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joelle van Dyne <j@getutm.app>

A workaround added in early days of 64-bit OSX forced x86_64 if the
host machine had 64-bit support. This creates issues when cross-
compiling for ARM64. Additionally, the user can always use --cpu=* to
manually set the host CPU and therefore this workaround should be
removed.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Joelle van Dyne <j@getutm.app>
Message-id: 20210126012457.39046-12-j@getutm.app
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/configure b/configure
index 99bf6275087..dd2225010b7 100755
--- a/configure
+++ b/configure
@@ -625,13 +625,6 @@ fi
 # the correct CPU with the --cpu option.
 case $targetos in
 Darwin)
-  # on Leopard most of the system is 32-bit, so we have to ask the kernel if we can
-  # run 64-bit userspace code.
-  # If the user didn't specify a CPU explicitly and the kernel says this is
-  # 64 bit hw, then assume x86_64. Otherwise fall through to the usual detection code.
-  if test -z "$cpu" && test "$(sysctl -n hw.optional.x86_64)" = "1"; then
-    cpu="x86_64"
-  fi
   HOST_DSOSUF=".dylib"
   ;;
 SunOS)
@@ -775,10 +768,6 @@ OpenBSD)
 Darwin)
   bsd="yes"
   darwin="yes"
-  if [ "$cpu" = "x86_64" ] ; then
-    QEMU_CFLAGS="-arch x86_64 $QEMU_CFLAGS"
-    QEMU_LDFLAGS="-arch x86_64 $QEMU_LDFLAGS"
-  fi
   audio_drv_list="try-coreaudio try-sdl"
   audio_possible_drivers="coreaudio sdl"
   # Disable attempts to use ObjectiveC features in os/object.h since they
-- 
2.20.1


