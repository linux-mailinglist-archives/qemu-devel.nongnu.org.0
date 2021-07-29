Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E483DA0E7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 12:14:21 +0200 (CEST)
Received: from localhost ([::1]:51920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m933U-0005zi-Ti
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 06:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m932W-0005JU-Gl
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 06:13:20 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m932U-0006fk-OL
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 06:13:20 -0400
Received: by mail-wm1-x333.google.com with SMTP id u15so3359515wmj.1
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 03:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7kXTJJbf5BiRHd7aGvyKgCIcgX8lAsnAcwSZ9DrqAKg=;
 b=rKiwSESVurxVOuY4UYVrrxg7e7h/XM9oOrsHewCusi0LbndQmZT3KsnoyLq6pQaHTM
 2Xtb7fsYsElA5oZPSJ2HeohRne0caduV+5K1TH9fe7fMcPm4c8FuYbUqW7SOJzXiZMxI
 FsUgzYuZdMIIBbaJCzLdGqtrqxzj3GedrQ11BJV2Cb/87xzqThtD5ozP1xz3DlssUOuX
 aKP7YEYmR6X2WomMDmBfHguPTgUpMoxwBsPTZyCCa3cZ7j4i2W3sSSjnGdAnnQO1tLZJ
 QVE1NvwCdP7gdm3WWDdkMfLw56/PjQyiaqiQnNcTvwyd7KMgX4IHHx80jJ8K7rDqx8Zn
 lbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=7kXTJJbf5BiRHd7aGvyKgCIcgX8lAsnAcwSZ9DrqAKg=;
 b=uQ372NAkp5K+q8YAnLal9hJoqbeWSTyRdEMsQxNoIrJ4MZIeYCfEEBLOjNI2oRVg79
 XdJHlbq/Lyvn4sCebCPjT0IR5vSsfZ3rlPhWBia9FT9ZHeHSr98KEHLaRSoq+eOwJwt/
 ydsBahFlFwszcFMpZoVAOXjJYGWibPY4IUQ1a5/QByfAd3rixl79COQdEwAQrWSgEFAk
 cjFaTmqF8bbydFZtjTfrD7Q6/noEj+yrxkDSRZHOHEYXTQuJTfFuZ1kFUAKX8w/ktV6v
 qKK4aHvQuz3GzzGPd6c0BqR219+RY/sZsHdwz8SWY5mWd3E8Lmw9IYIPikSQR8lWxgM3
 rtug==
X-Gm-Message-State: AOAM532YvIpkZcebreZUXcFOYL+zk0dwWeJhp7I2H5qnHd/Tcmf99BZa
 OPInxybe/BSketWG3cgKqXBT0hpG+6bHuQ==
X-Google-Smtp-Source: ABdhPJw0FGw+Rm1w3m+WylNUME7BfUOGsjozIJBbFPnA9o7T5FlKpxahIV4zw2KepJtprceFBr8eLQ==
X-Received: by 2002:a05:600c:154a:: with SMTP id
 f10mr3789951wmg.183.1627553597191; 
 Thu, 29 Jul 2021 03:13:17 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 f7sm3512506wrr.54.2021.07.29.03.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 03:13:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1? v2] target/nios2: Mark raise_exception() as noreturn
Date: Thu, 29 Jul 2021 12:13:15 +0200
Message-Id: <20210729101315.2318714-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Marek Vasut <marex@denx.de>, Jeff Da Silva <jdasilva@altera.com>,
 Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sandra Loosemore <sandra@codesourcery.com>,
 Yves Vandervennet <yvanderv@altera.com>, Ley Foon Tan <lftan@altera.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Raised exceptions don't return, so mark the helper with
noreturn.

Fixes: 032c76bc6f9 ("nios2: Add architecture emulation support")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: use TCG_CALL_NO_WG instead of noreturn (rth)

Probably too late for 6.1, sorry I simply forgot to resend this patch
(and remember about it reviewing "Unaligned accesses for user-only"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg826977.html)
---
 target/nios2/helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/nios2/helper.h b/target/nios2/helper.h
index b0cb9146a5f..6c8f0b5b356 100644
--- a/target/nios2/helper.h
+++ b/target/nios2/helper.h
@@ -18,7 +18,7 @@
  * <http://www.gnu.org/licenses/lgpl-2.1.html>
  */
 
-DEF_HELPER_2(raise_exception, void, env, i32)
+DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, i32)
 
 #if !defined(CONFIG_USER_ONLY)
 DEF_HELPER_2(mmu_read_debug, void, env, i32)
-- 
2.31.1


