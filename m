Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E8E62045D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:59:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osC1H-0004To-Tz; Mon, 07 Nov 2022 18:59:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC1G-0004Sd-LH
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:59:10 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC1F-0001zX-40
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:59:10 -0500
Received: by mail-wr1-x434.google.com with SMTP id j15so18519789wrq.3
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BHGUw9V+i2qyUmbjCMdXohlOB9Fe68LfGfKROHE4T0s=;
 b=pgjTJ8IDSL9MUig1HfEjrxIbjFuwWuQDwrhHkyhtoaw6wl98hHOUU6gidC2JSx7qqU
 xnTvp4wFLRA+lh8IK6c0LVvG1NIt1B4UL+k5F1CkT5EB+9TWFegCtD6lMLNjMXOTJhX8
 1xBmbYsCwUxRREKD0BU0cncTe6IuCjgyVXfvzyeYxpw4FT/S7powC1YawOuctoTAsSTr
 BcNip1PUtAc1fbxtgmB3D7FTzFYek6GJ4k7r+yeKsT+h8u4/TNJEWM4WvoZsPncH7tS7
 TjztZ5vhMiHNs4AawTIogqtxh+lxp7WYQ2HkOAExHIk33Ck5OisCyU6T8OilcWJ2Oaaf
 Bpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BHGUw9V+i2qyUmbjCMdXohlOB9Fe68LfGfKROHE4T0s=;
 b=LWY7wnkNMfoJa3rsvaStDlLazxfn5kaXXPKhGu8o/URgVBrgwvE8Cd7jnItQ03czCR
 T8WXbgnNdS75z3GtJieT+pUCLvlJJmHMgkwWU9uZnD4/k/SZ7kyaLShT4Wmk1BXDpO/R
 9eWyKlo8U3//uq+dXLEH2AYtpV97y/nUd5b0LLSjr9xMNiLqUmUaljwHbQwOfvPKiQPr
 GbIRm8bBtEnzATscMs3mWgJK9vclH2Yyt0j5fo2xX62LpL6BED5wVSHtI1O7KxT0o5qs
 NzusBCpUY2M2Th2kqP6JTC7j5FhISWyW7eKHIgUEn6ELv/RYZD3VmhcByxgMT0mxNlrk
 TZNA==
X-Gm-Message-State: ANoB5pksTH17yh3uliu/Ib80B/2Yu4Bp2N2WBpgZ6Xh9csBkrHmM19uU
 q/d/uEKQEJaPHr5059K/+RSKu1xc0GqrQg==
X-Google-Smtp-Source: AA0mqf5+7OnTh1uYD5/RY8Zt99yEiicJOfNP3IeavktFP6rRWOvuS0PZWxusXcNRH09waSuoJ7Py8g==
X-Received: by 2002:a5d:6392:0:b0:23b:4b0d:4591 with SMTP id
 p18-20020a5d6392000000b0023b4b0d4591mr12355655wru.635.1667865548350; 
 Mon, 07 Nov 2022 15:59:08 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a1c7c0f000000b003cf537ec2efsm9384066wmc.36.2022.11.07.15.59.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Nov 2022 15:59:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Stefan Weil <sw@weilnetz.de>
Subject: [PULL 09/14] disas/nanomips: Remove headers already included by
 "qemu/osdep.h"
Date: Tue,  8 Nov 2022 00:58:17 +0100
Message-Id: <20221107235822.71458-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235822.71458-1-philmd@linaro.org>
References: <20221107235822.71458-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221101114458.25756-5-philmd@linaro.org>
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
2.38.1


