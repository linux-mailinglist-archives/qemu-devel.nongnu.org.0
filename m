Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDC36149B0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 12:46:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oppi2-0006jK-0y; Tue, 01 Nov 2022 07:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opphz-0006iE-Ea
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 07:45:31 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opphx-0004KZ-76
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 07:45:30 -0400
Received: by mail-wr1-x42a.google.com with SMTP id j15so19751564wrq.3
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 04:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CPJrbsenwkc5Oq3ziyV5JTDQQsb8ALdFYEI0dEVhIPA=;
 b=zh2TqXJvEQ6SvMQ2g01dHPIhC/v5+NF59vgocHDncbEhZ32HsHyIwyPnriuTOK/tK0
 CCmaQSy0msNS8EyKOIuKXbtnKByMMGVjuKQq0zFFqrlWDg3itF3XHP4aPJYiAOc5JVl9
 sLTTq++IqQ2pnQP8qjsbUC4SUidPPvsjwCos9DbN00XpEq3BgDh5XbiPUld0HkS8VKm2
 bysTkmBXd2dikzVRrGp42Z1B1Mv2qUzEtR0TC9h6Pq+wGbFeTAKDrURo4VNLzxpbR0qg
 Yif965UjoY2uOxkoOlZluHQIJ9bYLdFg4893ZIdKd7kw014nPp9ljj3hH8bumAmTAY+o
 Uyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CPJrbsenwkc5Oq3ziyV5JTDQQsb8ALdFYEI0dEVhIPA=;
 b=19AOgXdeXLsDU5ht4sUc3Gw42jGonDLsyGFYWuXC0Cb7WpGvFBPSB5I6W29CjNNTn3
 qGajj8ssYZzVomQdFFPKQ9yOMI+zP3z+DsVH7h6jaNT1qhoitc6aiZ9DT8CDPFMejTjp
 0ak+/H31WJthixNsuCFvfx6b3zSHOze9ad5Lrb9/QxEv6qUChj1X2MEqbtw0oY+kVXkw
 Bkps2biojBI0kFoRgzRQlDCwIn7iPmXs3n9Mm5uZnWmzjMjascrHpnJc0JJ0nE4zxo+0
 nhoOaeWbw3SqHlSqHchudsn5CUZBclRa+XVTiyCrbU4sTBtRoonS+cMUqGvUhrJmN/l4
 DyxA==
X-Gm-Message-State: ACrzQf0Kgs3Ca2yu74TF0c5RQqjBfgAgXzlE2KbnBTYN4wgcbrTeJuBF
 LjGVHq+dUe17HMtdNOuosbM0kk4nZ5tGhg==
X-Google-Smtp-Source: AMsMyM4BG1w/xGSfzELg1hX870FP4cDwSywrd7Fw1biLNAyvSz85CUzAMo/FX9v8m7c0eV4BgkKxHQ==
X-Received: by 2002:a05:6000:10c6:b0:236:6613:a7bd with SMTP id
 b6-20020a05600010c600b002366613a7bdmr11749163wrx.570.1667303127339; 
 Tue, 01 Nov 2022 04:45:27 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a5d404c000000b002365254ea42sm10046997wrp.1.2022.11.01.04.45.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Nov 2022 04:45:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Petar Jovanovic <mips32r2@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 4/5] disas/nanomips: Remove headers already included by
 "qemu/osdep.h"
Date: Tue,  1 Nov 2022 12:44:57 +0100
Message-Id: <20221101114458.25756-5-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221101114458.25756-1-philmd@linaro.org>
References: <20221101114458.25756-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/disas/nanomips.c b/disas/nanomips.c
index 3f45447292..821d4f8832 100644
--- a/disas/nanomips.c
+++ b/disas/nanomips.c
@@ -30,10 +30,6 @@
 #include "qemu/osdep.h"
 #include "disas/dis-asm.h"
 
-#include <string.h>
-#include <stdio.h>
-#include <stdarg.h>
-
 typedef int64_t int64;
 typedef uint64_t uint64;
 typedef uint32_t uint32;
-- 
2.37.3


