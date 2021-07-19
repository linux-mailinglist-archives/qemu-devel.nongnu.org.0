Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CD33CEE8C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:49:57 +0200 (CEST)
Received: from localhost ([::1]:45166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5b9A-0007ER-6V
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5b7n-0005tv-FD
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:48:31 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:41691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5b7m-0000af-0y
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:48:31 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 p15-20020a05600c358fb0290245467f26a4so863501wmq.0
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 14:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kbT9YM2qnDiYu1MefImT/Te/Zn63TyXdYA+A8VSke9c=;
 b=e45EDuv7LHcBwuItGp13W3+NsyQoMiiBsFbc3unLlEyaWgcEtOjhz0QYRhOr8ifNQd
 HFcg0K2XDB4cXb1UQ9TSs+X8pLl1ko3huw7es67TKEAreg8a4un0riySwhuxm0+Jz4hP
 kS85UEAblXFuuc8VCHUqp7M3FUWiP3h4GbhkTCsJqk/Q8x2yZqZp8JnZwOSKeIQUe0cC
 V2309BaGbS00WKq7bXwGSBdjoODyVXe5vwzPrvhwzCN2begtZ82YT417Jnw5bgmrD51+
 2DOA95UNN2QET2iNCUCT5VqCuH17Nss7ILxz4ICN7EC1S7mfPvcMKGOVC+4nMuYj8CKH
 W+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kbT9YM2qnDiYu1MefImT/Te/Zn63TyXdYA+A8VSke9c=;
 b=f8H8U5o0hhzAYxjNzwl/vrw3IIteVVxUliv8AEdtej0GfEzcFqo2aeWTxqjD7W9tKW
 45C9PLYn/1PP3aqKiQtykeDcYT5VWX8EvVFvrk3EUbeIu88HkVsfi/8XloGHvWMHYTkw
 8aoF8bJem7+tDKux2ItW7Kq3TZ7RoP1KsNwJtuLQsI9pyhtMfx+6nGtzqvF63Sk0zIRq
 LD4tcKy9sUvaV1ut7ptw6vHlKB41umdB5lBLRwNuN6FtwQHbvKB2/uRcnLcaYqm6VY1P
 k4M2AMmCceo5cCyLXjTYqIBixRL25ZPqq1NSZv1wnQZiJies3drN8dLEny4IYklsCbiY
 dUmg==
X-Gm-Message-State: AOAM530OMuQWRHs5I7YBwpwAA5jExTIgAYtdFo3lVLqkITuX7UUVNdB6
 oFjrRC2NAlwBR1DiAMFj1mZomw==
X-Google-Smtp-Source: ABdhPJypctmh/5eoos7B6bZt1x+6RtFILbqHtwCEAogZSaL+6olhrneZCMNfd3GwHqr0rM9OUxaoCA==
X-Received: by 2002:a1c:7410:: with SMTP id p16mr23302240wmc.6.1626731308449; 
 Mon, 19 Jul 2021 14:48:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a8sm21701703wrt.61.2021.07.19.14.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 14:48:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B645A1FF87;
 Mon, 19 Jul 2021 22:48:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 1/2] hw/tricore: fix inclusion of tricore_testboard
Date: Mon, 19 Jul 2021 22:48:24 +0100
Message-Id: <20210719214825.2264-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210719214825.2264-1-alex.bennee@linaro.org>
References: <20210719214825.2264-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We inadvertently added a symbol clash causing the build not to include
the testboard needed for check-tcg.

Fixes: f4063f9c31 ("meson: Introduce target-specific Kconfig")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configs/devices/tricore-softmmu/default.mak | 1 +
 hw/tricore/Kconfig                          | 3 +--
 hw/tricore/meson.build                      | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/devices/tricore-softmmu/default.mak b/configs/devices/tricore-softmmu/default.mak
index 5cc91cebce..724cb85de7 100644
--- a/configs/devices/tricore-softmmu/default.mak
+++ b/configs/devices/tricore-softmmu/default.mak
@@ -1 +1,2 @@
+CONFIG_TRITEST=y
 CONFIG_TRIBOARD=y
diff --git a/hw/tricore/Kconfig b/hw/tricore/Kconfig
index 506e6183c1..a1b2438d99 100644
--- a/hw/tricore/Kconfig
+++ b/hw/tricore/Kconfig
@@ -1,9 +1,8 @@
-config TRICORE
+config TRITEST
     bool
 
 config TRIBOARD
     bool
-    select TRICORE
     select TC27X_SOC
 
 config TC27X_SOC
diff --git a/hw/tricore/meson.build b/hw/tricore/meson.build
index 47e36bb077..692a4708ba 100644
--- a/hw/tricore/meson.build
+++ b/hw/tricore/meson.build
@@ -1,6 +1,6 @@
 tricore_ss = ss.source_set()
-tricore_ss.add(when: 'CONFIG_TRICORE', if_true: files('tricore_testboard.c'))
-tricore_ss.add(when: 'CONFIG_TRICORE', if_true: files('tricore_testdevice.c'))
+tricore_ss.add(when: 'CONFIG_TRITEST', if_true: files('tricore_testboard.c'))
+tricore_ss.add(when: 'CONFIG_TRITEST', if_true: files('tricore_testdevice.c'))
 tricore_ss.add(when: 'CONFIG_TRIBOARD', if_true: files('triboard.c'))
 tricore_ss.add(when: 'CONFIG_TC27X_SOC', if_true: files('tc27x_soc.c'))
 
-- 
2.32.0.264.g75ae10bc75


