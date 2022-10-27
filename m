Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FB761015B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:16:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7tO-0005mq-Rn; Thu, 27 Oct 2022 14:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7sI-0005UO-G2
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:45:07 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7sA-0004kz-Ly
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:45:05 -0400
Received: by mail-wr1-x431.google.com with SMTP id bk15so3682259wrb.13
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0fQMZVSuQkgsfIv+8SoB1HN8nakXZ1eazvaT9TDQCmA=;
 b=Bl1M7fkwWKMcvd9WGrJPdTeR3RprrPZmsXhDoSR0x79jiZ4XmHur+/Fw1V7eaeS01n
 tbJ/4649jRSI4slKyyk72fGfbRODJUtjXbsEEMBlw8foSpfkG4TOwP58vpK0nBXVfP5o
 /F2VQrt6K7bSQ69ES0+8sC6LOE40h9F4TgZLtYI6AEMmjQT0p1p3EmtViTGrSuYGLBIV
 RcjIm9ilssr7QU6G0BE5HwfUukEoGX5r1IRndzMyWUShiiyGRaa42f0boccEGN3f5JwB
 yz+Vccv004Lo1zM3A7oBH5sCP8Pp/r9iGe8vM8Zj1805FCVtQVAtM1iNvsEwN58Gm3yJ
 xn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0fQMZVSuQkgsfIv+8SoB1HN8nakXZ1eazvaT9TDQCmA=;
 b=Gq1gFt40WkcZ0AbIqnb7q3j+KGzcyv4qKDZCP3a0b2fp4uDB26fkMhtMvfhMErSknn
 wdP8ZjRMaSyL83uredgkM4zm7HDzUXeXxR5LA9ujux5XCbx37fHUPVdeZrqEYtfC0b9E
 ggx016MJyCGPqiRbYkXSvn1YlWa8ss3R1nCsoMZQmMXOf6ADiZEkJCAscPNQNCzPitXP
 VL0AD/wXTpmZv7Ovdc+fss0eiwQ/TGK4SNxs9pNPxenMR+8wTrPjmV7opN3134Mf10wT
 4qnHzzEsCHNLjtZUl27BjeTmbwb6en7xgrzJZapnZ1RyhF/ucFBdHFB42cthN9kLW3sw
 oeqw==
X-Gm-Message-State: ACrzQf3Ggq0tjO7HfwYKsRezSop2WZGlkjyCiY9nreemDvGgXiGaw3DE
 zvM+4FKmcudSIjrxMGqdanhQDA==
X-Google-Smtp-Source: AMsMyM7miMlHhQUy2DjOGwEv3fu0BYBtmVdgqMXRv5ep+EiKTQ8a87cfwVLKpnYh0ciEn1vBxjbTQQ==
X-Received: by 2002:a5d:6a90:0:b0:236:4835:ca94 with SMTP id
 s16-20020a5d6a90000000b002364835ca94mr25278889wru.187.1666896297180; 
 Thu, 27 Oct 2022 11:44:57 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j36-20020a05600c1c2400b003c6c2ff7f25sm2464944wms.15.2022.10.27.11.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:44:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BB9A11FFC6;
 Thu, 27 Oct 2022 19:36:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH  v4 15/30] MAINTAINERS: add entries for the key build bits
Date: Thu, 27 Oct 2022 19:36:21 +0100
Message-Id: <20221027183637.2772968-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Changes to the build files are a bit special in that they usually go
through other maintainer trees. However considering the build system
is the root of everything a developer is likely to do we should at
least set it out in MAINTAINERS.

I'm going to nominate Paolo for meson stuff given the conversion was
his passion project. I'm happy to cast an eye over configure stuff
considering a lot of the cross compile logic is in there anyway.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>

---
v2
  - s/Odd Fixes/Maintained/
  - nominate more reviewers
v3
  - moved nsis.py to win build section
  - moved entitlement.sh to Darwin section
  - added Thomas as another reviewer
  - a-b tag
---
 MAINTAINERS | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 32e495e165..f72f02d661 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -548,12 +548,14 @@ F: */*win32*
 F: include/*/*win32*
 X: qga/*win32*
 F: qemu.nsi
+F: scripts/nsis.py
 
 Darwin (macOS, iOS)
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
 S: Odd Fixes
 F: .gitlab-ci.d/cirrus/macos-*
 F: */*.m
+F: scripts/entitlement.sh
 
 Alpha Machines
 --------------
@@ -3764,6 +3766,29 @@ F: docs/about/deprecated.rst
 
 Build System
 ------------
+Meson
+M: Paolo Bonzini <pbonzini@redhat.com>
+R: Marc-André Lureau <marcandre.lureau@redhat.com>
+R: Daniel P. Berrange <berrange@redhat.com>
+R: Thomas Huth <thuth@redhat.com>
+R: Philippe Mathieu-Daudé <philmd@linaro.org>
+S: Maintained
+F: meson.build
+F: meson_options.txt
+F: scripts/meson-buildoptions.*
+F: scripts/check_sparse.py
+F: scripts/symlink-install-tree.py
+
+Top Level Makefile and configure
+M: Paolo Bonzini <pbonzini@redhat.com>
+R: Alex Bennée <alex.bennee@linaro.org>
+R: Thomas Huth <thuth@redhat.com>
+S: Maintained
+F: Makefile
+F: configure
+F: scripts/mtest2make.py
+F: tests/Makefile.include
+
 GIT submodules
 M: Daniel P. Berrange <berrange@redhat.com>
 S: Odd Fixes
-- 
2.34.1


