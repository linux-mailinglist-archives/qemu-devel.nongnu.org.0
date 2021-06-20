Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BA13ADC9D
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 06:25:16 +0200 (CEST)
Received: from localhost ([::1]:36004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lup1H-0004gp-2y
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 00:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luoxy-0005JK-5l
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:21:51 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:39853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luoxw-0007z9-7x
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:21:49 -0400
Received: by mail-pf1-x436.google.com with SMTP id g192so3323955pfb.6
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 21:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oqu6i/kvNHrYtHemRicmatPUkUSmc3yTCi7Ugc/TW74=;
 b=qgWXZjJaADP3CmLd8NzXADVqAXiMlMMvu1WQDACA/GxX75pw8TXzbFDx4+e/kN3NXm
 zfL39+upX6mbVI8cfhOEW2LSvhmjqn4JawBckIX/YU+zbVYDzzVQZVx+wILwRiTInfoT
 cPUgOD42ahNMZ5vlx30YhwEZS6UEeVK1hEUIC2BUIh53YR/RT1I+rORA7A1g4AzEY3GM
 gHJ9IlYNRAzpc41mvOLZWWCAuRKfkN/gfA663Dd7Msw6yJxXQR6AfLRQB7YIoevttpM8
 8CAcs15Qz4pmSoqFlZH7JWSmF627Y1V9hyZTzBBkpv2uywKy1MRSUG+jO956PhS/pDCG
 7GVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oqu6i/kvNHrYtHemRicmatPUkUSmc3yTCi7Ugc/TW74=;
 b=bQFwbG7fDK552iaXe+tE/Md0WfdRUDAIfeAFSiuMCt3l5Splc44bmuwhBAxo84TbES
 4Fg8ltjZyyojJPZq3ah5Ueu/9iAeqAaU48SgNq0hv2WTVqYZPSUMtJ7/bFXE8iU0kZlX
 JSMD2H80ZvNcE0RV7AfKtKIZE0dkTzt3GkRp0GUeiqOGzzV+IynbZEWkBxzBuJUgjtUB
 vK4AxtltUdqgn7jDHjbxY1D/rADSTvd2DzdwrLRjR3vv6vyyU0CKTuLED1IZ2lyMhiO1
 1jA8aZ7vqPpyVcg1oDVCKOqUllw/iUNfAuG8vs/hFcJDuDTuLYalaPk2/20WdIE3Npfy
 rV8w==
X-Gm-Message-State: AOAM533XETPYKXnb0Kf8Dxmsr5F1/DAPxk0C6sURfJdbGXLXXQgpVFSb
 jBNDrls4ev4pOjzUIccoPtwvpY6db1cdPA==
X-Google-Smtp-Source: ABdhPJziYnJxpPVg7qtu+28vvB4ho9kMOnPBGG27Jghhsqxx4nNOpeQqt0X08XFv25KY6kYlr7YKcA==
X-Received: by 2002:a63:2483:: with SMTP id k125mr6463747pgk.99.1624162907050; 
 Sat, 19 Jun 2021 21:21:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b6sm11923156pfv.16.2021.06.19.21.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 21:21:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] target/cris: Mark helper_raise_exception noreturn
Date: Sat, 19 Jun 2021 21:21:38 -0700
Message-Id: <20210620042141.1235541-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620042141.1235541-1-richard.henderson@linaro.org>
References: <20210620042141.1235541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/cris/helper.h b/target/cris/helper.h
index 20d21c4358..3abf608682 100644
--- a/target/cris/helper.h
+++ b/target/cris/helper.h
@@ -1,4 +1,4 @@
-DEF_HELPER_2(raise_exception, void, env, i32)
+DEF_HELPER_2(raise_exception, noreturn, env, i32)
 DEF_HELPER_2(tlb_flush_pid, void, env, i32)
 DEF_HELPER_2(spc_write, void, env, i32)
 DEF_HELPER_1(rfe, void, env)
-- 
2.25.1


