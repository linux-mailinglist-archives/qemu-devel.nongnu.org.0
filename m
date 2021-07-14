Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894643C8737
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:17:30 +0200 (CEST)
Received: from localhost ([::1]:43090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gdd-0001bD-JU
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUt-0006gG-Av
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:27 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:46863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUp-0003zB-QG
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:27 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 o30-20020a05600c511eb029022e0571d1a0so1641768wms.5
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6yU6hRbpuBSqR9M5Laxs7PUH+BSK1OBncy0W794VEpE=;
 b=u5197Kajo+qFd3Eyzg6U0K++bn9+70ynhZKcuSjakAMfunyU6zyLXqo3EJtA+S0KMa
 6uCs87dd203M2e6+UAXTx/hWqSIQvnXvPexD5Vt7b7A0x9KCUrE+jHPbwxAVOje0clq0
 d6Md8jf56L9NxrkwajAbmsoCWZPSwitetlp6ROkIPpRi12Rn/pShYwLXDGTP6Ra6QkD5
 pWLIPJMI7ZQ96a5AG6NKxEzEfRI8EOfXLh03GQc08rbhpFV3PzpHrhnC1QFKRMEM5Sgf
 9fWA1mePpYedQrQkwCjIMm+x+MMChAB9JeJJohQnFtjetLs7MGLSeYAlIbPqPH64eDPK
 8+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6yU6hRbpuBSqR9M5Laxs7PUH+BSK1OBncy0W794VEpE=;
 b=KNykGIDCyjgi/9WpawqIeRgmEfF7k0DTZaONX/fUFMQup7tIpsF6ScDodIb/YX8UnI
 Ge2ma1fOEs5Vo+A7yNL9YTEOJZEmSgVbhAejO55AljkwfzGCkqSdFPnFo7fMLWYxeKKE
 zyYOlkoybED9sA71qMzVHdiSkjgS0Dm3oOEZJOFQ29RsWyUh69XfnQeJzoh6nau6BNj0
 QTPT5s3dXjt1sm2GKNGiFer+KXXiATW0sNsm0J/6+qTDQeDmueb2OyDXJ7F+SON6DNx7
 PuOOWtcSFgFVuMsuejFwIfcTLwbZh9BgYNHaYbJoEl6uPAVO8X1Q+63N4Bv28pNYXPjK
 uNGg==
X-Gm-Message-State: AOAM530EfxWRdYQZKv7+wr3yEDfW4aL0YidEqBfcTnjK/CjAiLPNKwHU
 bWeUzmk1uMQ50hRcO67Mim965Q==
X-Google-Smtp-Source: ABdhPJy+WQ6hdgoITZ+zh0OOLt17A3pSW4Y2Gtpl9g6jHWTdq74K7sXqQfvnjgQNuB4nrSiqVFfiDA==
X-Received: by 2002:a1c:a709:: with SMTP id q9mr4592632wme.23.1626275302387;
 Wed, 14 Jul 2021 08:08:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x19sm2409759wmi.10.2021.07.14.08.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:08:15 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1A0651FFB8;
 Wed, 14 Jul 2021 16:00:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 31/44] meson.build: relax the libdl test to one for the
 function dlopen
Date: Wed, 14 Jul 2021 16:00:23 +0100
Message-Id: <20210714150036.21060-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the *BSD family dlopen is already part of libc so it's not a hard
dependency to have a libdl.so library.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210714101536.16016-1-alex.bennee@linaro.org>

diff --git a/meson.build b/meson.build
index c6dd70c400..e5de144233 100644
--- a/meson.build
+++ b/meson.build
@@ -455,7 +455,10 @@ endif
 rt = cc.find_library('rt', required: false)
 libdl = not_found
 if 'CONFIG_PLUGIN' in config_host
-  libdl = cc.find_library('dl', required: true)
+  libdl = cc.find_library('dl', required: false)
+  if not cc.has_function('dlopen', dependencies: libdl)
+    error('dlopen not found')
+  endif
 endif
 libiscsi = not_found
 if not get_option('libiscsi').auto() or have_block
-- 
2.20.1


