Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE3541C5DD
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:41:18 +0200 (CEST)
Received: from localhost ([::1]:56134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZpl-0003eX-6P
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZIW-0007i0-3F
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:56 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:37494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZIT-0006VT-C5
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:55 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 r43-20020a05683044ab00b0054716b40005so2763261otv.4
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m3BaOtd2sKvGGMkwsWvzzoYXWYcfmOr52yRDlczbFYY=;
 b=sT3LLVRhNX954F2bKCK9Gwz++/g1bVRgNSHr3SMmnkq2eBgb3uBVXcTInyt0Cf37Y7
 +8cV+WL5U/SMomdxCMfd7KUKudHk32h3R25i+lC++fyISjSnggUHquar6hnuinqU6rel
 dSPM0dy+h3nuBnp68746dJyHCjaaBdc6Yuihn59HJM17x7g2fMrbDC05Kxvi4/OgcpzQ
 MmeMTflB9Ns/UXTWumshnVGNrjZMIya/iDe5BN3O4DACOGGDnY3s5c30gM2g16AmR01v
 /PbUjEufbJ4pb7oVxlbFTyP3mveZ46sYwvwUjhpHQgADII0VXBIoat+542AEzGu6fspD
 q90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m3BaOtd2sKvGGMkwsWvzzoYXWYcfmOr52yRDlczbFYY=;
 b=J3jKTyd7x9lAY8tz9MtR486FIUnAzzUpcKZYtVmJi/+6h1kG5CU0InzGShImZgftGI
 6h8Mx5Ky6by1WO9K9etSF928MSHoLwItmz029064V+S06rWNWUkgfiMryzqcVVS7vZ3J
 sJBH72G+nJfkJdp1nOpOpmMfMrygy629JDySQL632hFnxbhhXrmKEop1OBTHGYO1QzTX
 Nu1IhayY1D8mN/fY673hu1vCagP7o+210BSKHQNoAIEkvblG9WM4RcHJzcMeZPs8MODE
 HS8m6V0dMC5hbXbvGxVyapkr9gSCbThHiJuSfeDBrZklE8LyTepm7MZSXKvV8Ns95dGS
 mxuQ==
X-Gm-Message-State: AOAM533qE32gO8kN40kiiULhKH4knkwOs2kl5Y+qZ/Rc2nc9FFunVbdz
 2iwmfI9Omace+eZtjRDak+GAM8G/oc7QmQ==
X-Google-Smtp-Source: ABdhPJzlKuhMScRMqKUg2c1riIwTtDFnwC/GIMX5Hn15qlFpzS6DNA8bR9nNRMQojPTZZ+w49z5qog==
X-Received: by 2002:a9d:7b48:: with SMTP id f8mr10246792oto.112.1632920812381; 
 Wed, 29 Sep 2021 06:06:52 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id w1sm442823ote.41.2021.09.29.06.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:06:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 25/26] linux-user: Remove default for
 TARGET_ARCH_HAS_SIGTRAMP_PAGE
Date: Wed, 29 Sep 2021 09:05:52 -0400
Message-Id: <20210929130553.121567-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929130553.121567-1-richard.henderson@linaro.org>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All targets now define TARGET_ARCH_HAS_SIGTRAMP_PAGE.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 459a26ef1d..2404d482ba 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -30,10 +30,6 @@
 #undef ELF_ARCH
 #endif
 
-#ifndef TARGET_ARCH_HAS_SIGTRAMP_PAGE
-#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
-#endif
-
 #define ELF_OSABI   ELFOSABI_SYSV
 
 /* from personality.h */
-- 
2.25.1


