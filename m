Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BBB2B8267
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 17:55:19 +0100 (CET)
Received: from localhost ([::1]:60510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfQjm-0003Mn-OV
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 11:55:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kfQiK-0002Wc-Bh
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:53:48 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:41476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kfQiG-0006o0-LR
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:53:48 -0500
Received: by mail-ej1-x641.google.com with SMTP id gj5so3722478ejb.8
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 08:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sB6tGnT1uJa5RWllYEJZnnasm0xUVpRHZnbaqDYvg3k=;
 b=LFUzyVBZXE1YhwZUuz9E4UecQFDfHmUyCMMgSoE2mnfDYgMf5WuKJFv03qEMLewU0h
 tMSzxViuwVzKUKVFxU9XGYc9sJB9A5oXtfbGuEwwkOIPU+RtG8gxkRhsxkhVafFbhhQt
 HOm+tYIizw/k4u302DpddAj3bhcK0X8uPsUueFu0Xeb15PoTmRTbX5rO5SUoNvTGafKd
 p5HvQ29FU0E8JfaHp04R9Fkgt6xXMoCCJXCTUBHTXZoB3jZzAWaf2XzdotLMD6BbMcew
 aTKqt9UTRCRLE4+uCsJtx4vt8JAvUci3mcNSHlcUp2cXmKu6xh0TLaExKVwZ2n5i4ZU0
 xlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=sB6tGnT1uJa5RWllYEJZnnasm0xUVpRHZnbaqDYvg3k=;
 b=rMVSSpAAv8TlNCu8VbrFQ3PXO9/myA/39ArdEr7RvCqluO8u1a9pkEEZRHYJEYkGcE
 nFkE4GAYz0ho4u7BdsyOewXA+x5qWtoh+AeaiPl9+yrWiqZUI7g0gPhFyktYZR32+/pc
 nytH4zzcWZD3v7yLtFTK/8Ew4ibRpmDdQIggt8F0CzsHwfPbl5xykd3wnmXXkx5bNQCO
 ibu8DIC/wdpW0GprrZSRAu2GXj+k3wKos7/UKj6fnrcCrlvn6vgk38gE3jeKusPpNWPJ
 XYDvA2jcoOjPD6hBzeGbhSzlVul4WAFqDDGWS/If9mRyJf0uytXE58uoSAWnPbPpYMVp
 iFBw==
X-Gm-Message-State: AOAM532wGGP1vYzoazo3MBXfcwEDrmamTjv014oLOxhuInOY9lvih6hG
 oL0lPoXl3zGYmxSsKmLkbgvFm5K15m4=
X-Google-Smtp-Source: ABdhPJynCS+8SQeVMiDAq9rxqsfDSouRI8f5IAHvBiKCsXA8gWmC2ZWeJ6QJzL9D7Yl0bM4ZQ6NvOw==
X-Received: by 2002:a17:906:614:: with SMTP id
 s20mr12794243ejb.202.1605718421636; 
 Wed, 18 Nov 2020 08:53:41 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id fy4sm2050841ejb.91.2020.11.18.08.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 08:53:41 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] build: add "make uninstall" target
Date: Wed, 18 Nov 2020 17:53:40 +0100
Message-Id: <20201118165340.166821-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not hide the ninja "uninstall" target, so that "make uninstall" forwards
the request to "ninja uninstall".

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: https://bugs.launchpad.net/qemu/+bug/1371915
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 76dbb917f5..da01e3cd16 100644
--- a/Makefile
+++ b/Makefile
@@ -156,7 +156,7 @@ NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
 ninja-cmd-goals = $(or $(MAKECMDGOALS), all)
 ninja-cmd-goals += $(foreach t, $(.tests), $(.test.deps.$t))
 
-makefile-targets := build.ninja ctags TAGS cscope dist clean uninstall
+makefile-targets := build.ninja ctags TAGS cscope dist clean
 # "ninja -t targets" also lists all prerequisites.  If build system
 # files are marked as PHONY, however, Make will always try to execute
 # "ninja build.ninja".
-- 
2.28.0


