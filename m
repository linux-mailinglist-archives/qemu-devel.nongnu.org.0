Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4266E6149AE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 12:45:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oppha-0006LO-QU; Tue, 01 Nov 2022 07:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opphY-0006I3-DC
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 07:45:04 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opphW-00046F-Ti
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 07:45:04 -0400
Received: by mail-wr1-x431.google.com with SMTP id a14so19744605wru.5
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 04:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UXrPwFTeaE8MfL/W7wsMWWARKzwyu+oBB1wtskqRfdU=;
 b=F1I2HmC/BvWoQBQrJt7uXzpY2DOuf0FNo8XsEEABBryowxRPmlkZcBDxBgK6d1nHDX
 ayoP0sLCTP4hf6F7c819F6JSm4oRG033yriUsWTo2NxZZ/fL3Zbmo1yLVp8oZLKwDp8u
 xo2q6SuDBlndyGaz2ImioPAirYO9vmIBcgwX31xuf7Gf3R6Mqi7NFamXAi1yoLEoDvOe
 8mttYqmnDJ6CNmgHYo8uHbKSwuo3EVjHMv5+NdF75Zfd+n/WO12d7LlXbb4wg73UnXHR
 YSl0scwkQ3f4QekQsRSWPE0BnCJkqxHSUWVjy3rxTAQz3jwqqP9EInygJNPml4PUsXuo
 oV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UXrPwFTeaE8MfL/W7wsMWWARKzwyu+oBB1wtskqRfdU=;
 b=PotJJDRluBbdkhmyLe1/6WoCyib/6KbI/98NJBsBrZ13OK6w5U+fVwRX3shKAzfJGw
 7CU3/xzK2PxVFk4LwB3YC3UVvgLiIR5QvBQrl8Pk/PDT9b1Kq6TVj2VWt4twL7TM92gU
 dn9UgYjFEMWPr+59CLo5/mqQSfTpIKCS6vHuQZ6D+esS1eiAC0TFklL5u2XNoEU2wGf4
 TD1mkoWrl/ZDxBPW+IEbODt+Nj/b5SXRGUuRGIme8UeM+3OAH147mARQ9v8MpQMfJtEX
 jK2I59o20DrPnKBDdZwi8fZxxl78qmQJIxsUGJldaBKR+O3GPar67/V9jdomax2u3+D/
 pbsA==
X-Gm-Message-State: ACrzQf1LrDeJVvx7N6Y+hbPmD/6uIaOfYFaugjFQ6zqke15eKY1HPrtF
 WyVM7RFeqxsjLpxWyH9c6Kc5WLd9F3+QYw==
X-Google-Smtp-Source: AMsMyM6F2oQbm3lP6kvFeC341QakWT6ykKBdExlkezxOHM/yIv3wt0jbZQRZiuFozFkM5BG1JvSqyg==
X-Received: by 2002:a5d:47aa:0:b0:236:7a97:7dde with SMTP id
 10-20020a5d47aa000000b002367a977ddemr11218333wrb.625.1667303101137; 
 Tue, 01 Nov 2022 04:45:01 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o23-20020a05600c511700b003cf54b77bfesm10627508wms.28.2022.11.01.04.44.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Nov 2022 04:45:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Petar Jovanovic <mips32r2@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/5] disas/nanomips: Format string fixes
Date: Tue,  1 Nov 2022 12:44:53 +0100
Message-Id: <20221101114458.25756-1-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Fix invalid string formats reported by Stefan:
https://lore.kernel.org/qemu-devel/78553699-00c1-ad69-1d58-02f75a1f4fe3@weilnetz.de/

Philippe Mathieu-Daudé (5):
  disas/nanomips: Fix invalid PRId64 format calling img_format()
  disas/nanomips: Fix invalid PRIx64 format calling img_format()
  disas/nanomips: Use G_GNUC_PRINTF to avoid invalid string formats
  disas/nanomips: Remove headers already included by "qemu/osdep.h"
  MAINTAINERS: Inherit from nanoMIPS

 MAINTAINERS      |  8 +-------
 disas/nanomips.c | 44 +++++++++++++++++++++++---------------------
 2 files changed, 24 insertions(+), 28 deletions(-)

-- 
2.37.3


