Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3AD337642
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:56:53 +0100 (CET)
Received: from localhost ([::1]:35698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMk7-0000Dt-4O
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUO-0003eh-1P
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:36 -0500
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:41577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUL-0006Vw-PU
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:35 -0500
Received: by mail-qk1-x732.google.com with SMTP id x10so20776230qkm.8
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LAWykP8xawhD0n2LEjnvxt6U+It9ZnMCGaTxxtC6jn0=;
 b=oNlNtMSCDmzuODVHYxXWDmhLsQ5EpnXZaj/Q5XduNTVYHm1J7xS6wNnDXvXkqt3Uwa
 JN9FL4Nueyr9AiMp/+ZLY3N3tjo0dxavsse5YGaPyVIJzJZ+47OIQR5ckLVQvcKf25R+
 kaxKYcAd9PtNZ1qlU8pxq8jcg5gkTAM64CwZOMawkJIGm5UMJrHFp48GsY2b7IZwYKva
 BwGcb8J/N1nU4I0wTHP/Zz2zFJ4KpH9+UEwqsUDaVpxRsS03ghX1j3IAdd6Vm7d6M+1U
 QBTO1sF5dTMH9mEl8py20S9SQM3EoyfpY2jDSFtUmMOXAKD5ERGih2oRc4AZ7TjBAXQ9
 MzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LAWykP8xawhD0n2LEjnvxt6U+It9ZnMCGaTxxtC6jn0=;
 b=ZAcVz0xT8q5YLEyVL2wTmIg4XcDwDoJd03X6A/93olprJ0HyTl1FNy5+xwj3iU1G3d
 PCsEAvadSvDRxv8b8Vh2Xg2tqfdlwCcjLVZZd6M77R6erTbQD9OqCo6HmZGE0QCa2gf8
 tt5x5Yo5WF6K7GzEavu5V4M1RXyP8+ULsGUz5gUvqusPbixcTFBLm+MrRn26udxMb+41
 d82y0uG3TpyjW+SWGmbYABzQ+AuNuw0Iy1EzzWY4zraSQt6G2GGEHnApV6byb5LDKK9p
 b/Hdqa0om0StbmC8lamUTZ0FHp7hSqzZ/hPGxILtTCqRMJqmBeh6tcTA2J8JZWsDaumV
 0iOg==
X-Gm-Message-State: AOAM531+DCriCviLuK9pbJM7cEll+vGpMIZlx3VhP1klqytGHVY968Mo
 xbUxp5DlUKJMF5uLhW8SwIm7jd1rlqkBQQ9R
X-Google-Smtp-Source: ABdhPJxylS51BSaE7IXSkyvupk1M7UpkZ4Z5DnsTjJgge79dPuoKyLlbgfLqY41ZZLm6nEyBqN0NEg==
X-Received: by 2002:a37:8703:: with SMTP id j3mr7631455qkd.308.1615473631433; 
 Thu, 11 Mar 2021 06:40:31 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 25/57] tcg/tci: Move call-return regs to end of
 tcg_target_reg_alloc_order
Date: Thu, 11 Mar 2021 08:39:26 -0600
Message-Id: <20210311143958.562625-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the only call-clobbered regs for TCI, these should
receive the least priority.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 4dae09deda..53edc50a3b 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -170,8 +170,6 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 }
 
 static const int tcg_target_reg_alloc_order[] = {
-    TCG_REG_R0,
-    TCG_REG_R1,
     TCG_REG_R2,
     TCG_REG_R3,
     TCG_REG_R4,
@@ -186,6 +184,8 @@ static const int tcg_target_reg_alloc_order[] = {
     TCG_REG_R13,
     TCG_REG_R14,
     TCG_REG_R15,
+    TCG_REG_R1,
+    TCG_REG_R0,
 };
 
 #if MAX_OPC_PARAM_IARGS != 6
-- 
2.25.1


