Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9025FEFDC
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 16:10:04 +0200 (CEST)
Received: from localhost ([::1]:45204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojLNz-0007OX-1M
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 10:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ojLBN-0005vZ-95
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 09:57:01 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ojLBK-0003F5-4r
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 09:57:00 -0400
Received: by mail-wr1-x435.google.com with SMTP id b4so7729410wrs.1
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 06:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=395SCddiSosXlLyCkuoJ7LLyiL/H7y7bkYUAdXN0Ofo=;
 b=o4pTg3wQiBpVBXfP/Ksvnxuw4hmKh70000K12dkjDFA9JWCyItZ7rzA16xYyWwBL4B
 l/HyinMMnuhnT1SZ6tur/h/BbFbteniaUXlROKzMZMYNDlydFqr0SUo8Nyw/zpCqph4t
 8A1PCkc45+NIfIcuuqwPFpiYn+t3FkOpGXoY1gSa8Uhc2e6GxZhHlJk5yISorQNMXpw2
 6uEs2QoAuctWmdW1McrElqDr1ETlVL9uCvc0GZpMxieYqyCuj7NcA4LbIRdBQ38U7GwQ
 RVrhr9V7ohLPhtQWB5RdCQeIzQ/75Yv3ZRpCFBNtrmqul/m2WFhRC9pRhzmnvfU85xop
 ROYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=395SCddiSosXlLyCkuoJ7LLyiL/H7y7bkYUAdXN0Ofo=;
 b=5TDasD7aN+JaCMnIDhIhZnXA/e+cLEX7qHsX768uUwVE+E631W/LUesVnLQizeyoLl
 qX7k/iJNBEFK8jkjYeHvVREXcyd5/O5vGoIIMeSSEW51HriBuWYoDP6bY85rreG9vAih
 wpmrLEegNpbHzAuauhfMg3fUOLQhUmxqQcnEuFL3IOhajxL89bPOqEgwwwfTXfomiyfD
 En70CAHpEMgWcSTzE+0vRMO5lRF8RDV/Cntv1DJIe5z9Kr3D0hF+C+1jKFOy9Dzkq/+1
 XVlNzPbn5RJU5Zv/clU/iY0KKBudpLWFY13pTjSGaC3CxtxwOEq31c8bXbu0XUyrRGpQ
 BCbA==
X-Gm-Message-State: ACrzQf3V/pFwAMPqS7BjpCrObzg66vWKOjScgA6jNZyRCFTblfCazBgD
 g5MUy2+n7CTGsULiXF6HwQyGBw==
X-Google-Smtp-Source: AMsMyM6+Q0PAOHVOzOb4di98uurGKEFyLlr8k2lC+rRsoozHkE3E5leN+lhqjjUP31cOtBEp1DQCrw==
X-Received: by 2002:a5d:6d89:0:b0:22e:4af7:84a5 with SMTP id
 l9-20020a5d6d89000000b0022e4af784a5mr3611604wrs.4.1665755815824; 
 Fri, 14 Oct 2022 06:56:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b003c6bd91caa5sm2592205wmp.17.2022.10.14.06.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 06:56:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5DF1E1FFB7;
 Fri, 14 Oct 2022 14:56:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH] MAINTAINERS: add entries for the key build bits
Date: Fri, 14 Oct 2022 14:56:48 +0100
Message-Id: <20221014135648.2574797-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

Changes to the build files are a bit special in that they usually go
through other maintainer trees. However considering the build system
is the root of everything a developer is likely to do we should at
least set it out in MAINTAINERS.

I'm going to nominate Paolo for meson stuff given the conversion was
his passion project. I'm happy to cast an eye over configure stuff
considering a lot of the cross compile logic is in there anyway.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8ae2e43c83..cf7e50c195 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3764,6 +3764,20 @@ F: docs/about/deprecated.rst
 
 Build System
 ------------
+Meson
+M: Paolo Bonzini <pbonzini@redhat.com>
+S: Odd Fixes
+F: meson.build
+F: meson_options.txt
+F: scripts/meson-buildoptions.py
+
+TL Makefile and configure
+R: Paolo Bonzini <pbonzini@redhat.com>
+R: Alex Bennée <alex.bennee@linaro.org>
+S: Odd Fixes
+F: Makefile
+F: configure
+
 GIT submodules
 M: Daniel P. Berrange <berrange@redhat.com>
 S: Odd Fixes
-- 
2.34.1


