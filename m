Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEA53CF94A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 14:01:59 +0200 (CEST)
Received: from localhost ([::1]:47814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oRi-0004bl-Lc
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 08:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5o7S-0005M8-GJ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:41:02 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5o7Q-0008Ce-PI
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:41:02 -0400
Received: by mail-wr1-x434.google.com with SMTP id m2so25679847wrq.2
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 04:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wkNQQ20XngujXOPbEcV2yi1EM3N0Z3ZePdpIQQkCKpc=;
 b=hKDBLUKMgsYsdYp+PFvbYslYu3CkZ2bJLCVGyAk3DGPvoJuGr4YdBpWc2jBH4QT7lZ
 wR7H14bzvzvNSj/4EjtYJWb4J+b0FFeKcLppeaYnaE80Gc6/oJsDuQHD+/Aay5cloBse
 q1UAqLwDpRL/qoomhcsHPzp6g1ElKsr+EgrOi9kuOMK6vPTO2vKEqwPtREdy6yKGZvFL
 x1qZJXawzt7hBSAwQnEA4f/xhD0/AomOvBAP+h3TcStQhkECjILysK/MnxE8nTSEpefM
 Hrx/Juwy3cymmZRERTbYfBoveKwp/ZXOcsamFTbX1UHaM7/1qjsXXGkY7zmZdkSKyB/J
 qJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wkNQQ20XngujXOPbEcV2yi1EM3N0Z3ZePdpIQQkCKpc=;
 b=TWZ7YpmTL+iCT3DYHBfIFcaPv5y2I20qZPZ/RobIXBqdvf0X0X/XAj9wap9enEm+0F
 IqL+ORIQXzTQgUe8f0JVDX7vGWOX19xd1c5pQ+2zmZIouIBlEuUFBfCXu4V8pogHzhEQ
 Cpc+mN59M3lyxe3RSlfmODrzQP2Ij0vNWQjxDjg1s3b2CUmdDKPDSv3UWQsVzvRsDjdP
 KcUJwz8I4VfiFJQtaXw3nTgusBtCvwKMLcdWc2H/jloRYyl/ZPhX3CnOXiy8hNUh5ZBk
 t/0hKB1tceDwTCojSLmGqk3ywS4K7yCyQGeIfoniqi2H5y8sKtllUCE1vWNr+zRZWfTl
 4rNw==
X-Gm-Message-State: AOAM533r5yBYl+1SvngoT00qVB3hu58cZi9PE/xo5gtXtXvcND62Bdev
 6RXN7ARQSS2S3IpCL3N6SE0BBA==
X-Google-Smtp-Source: ABdhPJxtLkXoQ242Yk1PczGjYTr4SVCbqQ4/5vRmIXVLV8N7sa4slklMCoTiqSHSCr+i5UIxuGwLVA==
X-Received: by 2002:adf:f6c9:: with SMTP id y9mr1825994wrp.265.1626781258810; 
 Tue, 20 Jul 2021 04:40:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y3sm23723340wrh.16.2021.07.20.04.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 04:40:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7EE7E1FF87;
 Tue, 20 Jul 2021 12:40:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 1/3] hw/tricore: fix inclusion of tricore_testboard
Date: Tue, 20 Jul 2021 12:40:55 +0100
Message-Id: <20210720114057.32053-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720114057.32053-1-alex.bennee@linaro.org>
References: <20210720114057.32053-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We inadvertently added a symbol clash causing the build not to include
the testboard needed for check-tcg.

Fixes: f4063f9c31 ("meson: Introduce target-specific Kconfig")
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - rename to CONFIG_TRICORE_TESTBOARD
---
 configs/devices/tricore-softmmu/default.mak | 1 +
 hw/tricore/Kconfig                          | 3 +--
 hw/tricore/meson.build                      | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/devices/tricore-softmmu/default.mak b/configs/devices/tricore-softmmu/default.mak
index 5cc91cebce..cb8fc286eb 100644
--- a/configs/devices/tricore-softmmu/default.mak
+++ b/configs/devices/tricore-softmmu/default.mak
@@ -1 +1,2 @@
+CONFIG_TRICORE_TESTBOARD=y
 CONFIG_TRIBOARD=y
diff --git a/hw/tricore/Kconfig b/hw/tricore/Kconfig
index 506e6183c1..33c1e852c3 100644
--- a/hw/tricore/Kconfig
+++ b/hw/tricore/Kconfig
@@ -1,9 +1,8 @@
-config TRICORE
+config TRICORE_TESTBOARD
     bool
 
 config TRIBOARD
     bool
-    select TRICORE
     select TC27X_SOC
 
 config TC27X_SOC
diff --git a/hw/tricore/meson.build b/hw/tricore/meson.build
index 47e36bb077..7e3585daf8 100644
--- a/hw/tricore/meson.build
+++ b/hw/tricore/meson.build
@@ -1,6 +1,6 @@
 tricore_ss = ss.source_set()
-tricore_ss.add(when: 'CONFIG_TRICORE', if_true: files('tricore_testboard.c'))
-tricore_ss.add(when: 'CONFIG_TRICORE', if_true: files('tricore_testdevice.c'))
+tricore_ss.add(when: 'CONFIG_TRICORE_TESTBOARD', if_true: files('tricore_testboard.c'))
+tricore_ss.add(when: 'CONFIG_TRICORE_TESTBOARD', if_true: files('tricore_testdevice.c'))
 tricore_ss.add(when: 'CONFIG_TRIBOARD', if_true: files('triboard.c'))
 tricore_ss.add(when: 'CONFIG_TC27X_SOC', if_true: files('tc27x_soc.c'))
 
-- 
2.32.0.264.g75ae10bc75


