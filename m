Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D356645BA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:13:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFGJ9-0007w0-Az; Tue, 10 Jan 2023 10:12:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFGJ7-0007vT-8Z
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:12:57 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFGJ5-0002JC-Kt
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:12:56 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v2so1101441wrw.10
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 07:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V9Elq3Pte1ictUNgwaSo3zapEQwR4HWZHEsrAR06n1U=;
 b=jMRFb2Zxb6ZEUFQo5qNrMfId0mJk0vgF44CoQq+H9Ad56YsNESQTAUcEstmuaZCls4
 v6pWfcxOWSGTYosqqoVTwKog8tPtoXS6eppxVKy8vpuCWsNX4cuJL29cpLBG17Rz3Tq0
 WGXCJ7DHx8TeefPlizM+cXCwYhpQ/dhifWee1cF/kr6hI4He8hJZv8LYEbUjHezI5moy
 AAT8i6IUZbeUegjMj72MWb/Y/TodKgEehJ0/LviFb5sCYs4d4dJ44QYTaL3k61V6tHbp
 cleVS2mXQmAzGF05F9R/YGYZKwAgrdgS/39idmNdjY4pP7q72lQ9zcH7dDIWZK7/7UfT
 fK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V9Elq3Pte1ictUNgwaSo3zapEQwR4HWZHEsrAR06n1U=;
 b=LM0tesuFenSuzA4M6GzeqzfqnFaafA1kODbG0QymbJ2vQC+mLbTPg0rebDtl44ZbgW
 WoH647C1NvmCIGBADFQYmNqPv7+rxeL53WPQtme3HDNr7DUE41loGTt59pMS3y6GGagu
 2gEhJZKZ0E/0O5FEvJtj+1BLieUfNy8omG0No4oQA2/mX0MoDYidRDtqbBJUJJjQGwvz
 wUSFIauTgWZ+IJggParyKxr3zB2t14sfT5q74VO88dMoePNWnh6e+BKJcaSRcp01EuEP
 8p6ArcN8BAqy42Hbhblpt/8VtceXrsQeRrgdqvayqznbc6kybe17uTWkJ+rc1RzpRQGp
 boOg==
X-Gm-Message-State: AFqh2krQQrAQbo0i21X9GbBjiklg8JKBQllGwZKmlY4fpL8mIKe1K136
 HbQxc9PcUD++M3TUhaequmrf9jqYaJke1Pss
X-Google-Smtp-Source: AMrXdXtEAJkk7Fxcrg5mYz6vOqiC7fazvrbYDY2bsrX3C+6R67HUNL/k4G4sLhAqS0XKTIcjrstKeQ==
X-Received: by 2002:a5d:6f0f:0:b0:298:7fc:60ac with SMTP id
 ay15-20020a5d6f0f000000b0029807fc60acmr23841921wrb.59.1673363573073; 
 Tue, 10 Jan 2023 07:12:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m7-20020adffe47000000b002b880b6ef19sm11359975wrs.66.2023.01.10.07.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 07:12:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] Makefile: allow 'make uninstall'
Date: Tue, 10 Jan 2023 15:12:50 +0000
Message-Id: <20230110151250.24434-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

Meson supports an "uninstall", so we can easily allow it to work by
not suppressing the forwarding of it from Make to meson.

We originally suppressed this because Meson's 'uninstall' has a hole
in it: it will remove everything that is installed by a mechanism
meson knows about, but not things installed by "custom install
scripts", and there is no "custom uninstall script" mechanism.

For QEMU, though, the only thing that was being installed by a custom
install script was the LC_MESSAGES files handled by Meson's i18n
module, and that code was fixed in Meson commit 487d45c1e5bfff0fbdb4,
which is present in Meson 0.60.0 and later.  Since we already require
a Meson version newer than that, we're now safe to enable
'uninstall', as it will now correctly uninstall everything that was
installed.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/109
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a48103cc8a1..ce2f83a684f 100644
--- a/Makefile
+++ b/Makefile
@@ -150,7 +150,7 @@ NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
 ninja-cmd-goals = $(or $(MAKECMDGOALS), all)
 ninja-cmd-goals += $(foreach g, $(MAKECMDGOALS), $(.ninja-goals.$g))
 
-makefile-targets := build.ninja ctags TAGS cscope dist clean uninstall
+makefile-targets := build.ninja ctags TAGS cscope dist clean
 # "ninja -t targets" also lists all prerequisites.  If build system
 # files are marked as PHONY, however, Make will always try to execute
 # "ninja build.ninja".
-- 
2.34.1


