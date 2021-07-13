Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCDB3C754D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:51:20 +0200 (CEST)
Received: from localhost ([::1]:50264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Lct-0007j3-T5
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LUB-0006rJ-NL
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:19 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:43830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LU9-0005ew-5H
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:19 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso2497066pjp.2
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TQm8Lq1Aaz3TmiNuToYyV4nWNe9sSLlo6H/vCDNuu6I=;
 b=rP73IFhbEnPMGZLtDwUK6Ki5zio/OaNH669Z03EzVn19iN2pjLGZjYyZw5O02EXDCa
 N65DfgB6b5Lmn6mXVr1XZDCJ/D39VouKFzr9jMvKf3u2fB/dYr2QOXFCV5/rNXpFfIey
 hbJerPezhBxApgI6NIkYOxbbFdtW40uSNZZFmTXnH7PSu8Yy9kRF83Ef5/ANH2gVV6h6
 6B0jaImfd8ReWLOVzXXB43nxBjUgn4gMR9oklt+nnbOV+y2K3kr+SjuczafE4dMxhsCt
 kF6Yx6dGwUYztiKBiGXTi4njbQtwT03iL7//KvgtOSOnVLigvzYhRxQp6v78WoU5B8FN
 7wHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TQm8Lq1Aaz3TmiNuToYyV4nWNe9sSLlo6H/vCDNuu6I=;
 b=JwYAHf1rWrNwmYusNn+698eOgEnaEF1l+ZKku0EpurOg7MkGlatwdel0f+TvPhpHtd
 qLxT3XPEeYCCP9BWuMOevKTqeX21O0z14bZ6R5qWRJ5gQnFph+zBn2jp1mdzZxbxGu2S
 wp0f+uRSecVy+88TtuMbDbU979Iffo9oH9heX8t/YjcQhiDDypaE1BtTfJcTEZgNQOBm
 +/XSdjfaEI9mkpSOp8tQv1gTYmGX8qdnaEUgBiwwqBBgFRmFlg11Ux7zRBmZWnfoUQ4O
 Lpcytv2YJsNCgw2TrOUGN7mhodoaghTKowCcojQ6HUY0YsLIABzIBj8EMgPCfYRISY2Z
 XKnw==
X-Gm-Message-State: AOAM533tthJ3J0W4OMs5kX7cXkEOeWVrJGxNcnlJox9DzO7oh7pAt8Dv
 S8Csj5O3S+LyivIW6Dzkc5n27dCiUClEYQ==
X-Google-Smtp-Source: ABdhPJyjJOfAQm0t1tejbZo7oePZrQwj/dQzoDroe+3jcVztFDCRUf+XhWHTvuBLDxObmaUOaWhYZg==
X-Received: by 2002:a17:90a:4884:: with SMTP id
 b4mr206230pjh.173.1626194535958; 
 Tue, 13 Jul 2021 09:42:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z13sm4947865pfn.94.2021.07.13.09.42.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 09:42:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/14] target/alpha: Use dest_sink for HW_RET temporary
Date: Tue, 13 Jul 2021 09:42:03 -0700
Message-Id: <20210713164211.1520109-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713164211.1520109-1-richard.henderson@linaro.org>
References: <20210713164211.1520109-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This temp is automatically freed, just like ctx->lit.
But we're about to remove ctx->lit, so use sink instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index b439b57a66..64c4865dda 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -2717,7 +2717,7 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             /* Pre-EV6 CPUs interpreted this as HW_REI, loading the return
                address from EXC_ADDR.  This turns out to be useful for our
                emulation PALcode, so continue to accept it.  */
-            ctx->lit = vb = tcg_temp_new();
+            vb = dest_sink(ctx);
             tcg_gen_ld_i64(vb, cpu_env, offsetof(CPUAlphaState, exc_addr));
         } else {
             vb = load_gpr(ctx, rb);
-- 
2.25.1


