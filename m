Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C29D354343
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 17:18:40 +0200 (CEST)
Received: from localhost ([::1]:36474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTQzv-0007j8-GP
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 11:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQP6-00086t-Bo
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:40:37 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:54265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQOu-000656-Fb
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:40:36 -0400
Received: by mail-pj1-x1035.google.com with SMTP id t23so2950962pjy.3
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dTsPV4XPxjrQUOgxsRHz250RxZ1fUey0SqTSTKo2NTE=;
 b=t8ugGnsYnxGJ1JoTs8t+ERXmjPKji2vD3CqRcSDcJSJ5u0s05dJ2RK4AyNdMaghjm7
 VMzniIbAs0Jx5qvv+YQ60uIX0gsPK6JwVNCVI160DcMnaS7yO5J1OrrrvQ7UC93oBBqr
 ZraEwD0DnmE3TdwgCRHnyPKt3i8ZaGnGBWLozcf9HmYjxFW2BrsjXrPo6WvNy2YOwJFf
 jBc/+wJmrhylOHmKBIWYQdzoNHivksDlK0mxcRsR3nH29VO9Ru1nG5cbTSTCGXDyS69R
 PXJf6FgRRDKxIZ/fujthD38CsDWTLmg0XfT1T+XMktrpCtmo4ZRloseQg5Wd3cxcwTQ4
 ztew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dTsPV4XPxjrQUOgxsRHz250RxZ1fUey0SqTSTKo2NTE=;
 b=Qjlvp4J0w+WmOlwI9EcLtXMDttiY1eoWA0tpwyMks8Fe9jHnO/efxc6qhFK8Pnfacv
 CYLq7y2NTZ4hi0QvPi/knnT70yv2PRogdR6UmLBAiNYX+KSTiM6Ze8f4yNRsCB6/fhU+
 zSOXtVppFnbrXO51tMRnF1wCEnlkMTLAmAo5pJciv1lT6TPHgQwa3f7JldX6pJ3SFRFw
 t82KMXXxNidcbWPH9HwXha0iYsQ/OeHFUXRaBTsQ+iiwXgV9/YoLRxhq57hjjUJYudiw
 Vzx+YO2GbBw1KuEhNDZxSd91UArpPoqbSwVKEzBWRljloyFky2PKqKDMfZd0rRITayx1
 rlbQ==
X-Gm-Message-State: AOAM533S0AuOrcmruVM5xDv6akdAtGNRvdsAF8y3aYuzK6TKTmTEGmD8
 JL5XDBywk1PYqhxHWSuVZcXVNLyTaN8P3A==
X-Google-Smtp-Source: ABdhPJw9rgZiBnwxgrvHN0Qm9EZOxLVS0CfZbp1mvcV7CSRDEkxnOaPPfAU4mpoSUb+uHNF/N6pSFw==
X-Received: by 2002:a17:90a:868c:: with SMTP id
 p12mr26135809pjn.82.1617633623281; 
 Mon, 05 Apr 2021 07:40:23 -0700 (PDT)
Received: from localhost.localdomain
 (50-200-230-211-static.hfc.comcastbusiness.net. [50.200.230.211])
 by smtp.gmail.com with ESMTPSA id q5sm15752999pfk.219.2021.04.05.07.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:40:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.0 2/2] target/alpha: fix icount handling for timer
 instructions
Date: Mon,  5 Apr 2021 07:40:17 -0700
Message-Id: <20210405144017.20193-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405144017.20193-1-richard.henderson@linaro.org>
References: <20210405144017.20193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: peter.maydell@linaro.org, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch handles icount mode for timer read/write instructions,
because it is required to call gen_io_start in such cases.

Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <161700373035.1135822.16451510827008616793.stgit@pasha-ThinkPad-X280>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index a02b4e70b7..f454adea5e 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -1330,7 +1330,7 @@ static DisasJumpType gen_mfpr(DisasContext *ctx, TCGv va, int regno)
     case 249: /* VMTIME */
         helper = gen_helper_get_vmtime;
     do_helper:
-        if (icount_enabled()) {
+        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
             helper(va);
             return DISAS_PC_STALE;
@@ -1366,6 +1366,7 @@ static DisasJumpType gen_mfpr(DisasContext *ctx, TCGv va, int regno)
 static DisasJumpType gen_mtpr(DisasContext *ctx, TCGv vb, int regno)
 {
     int data;
+    DisasJumpType ret = DISAS_NEXT;
 
     switch (regno) {
     case 255:
@@ -1395,6 +1396,10 @@ static DisasJumpType gen_mtpr(DisasContext *ctx, TCGv vb, int regno)
 
     case 251:
         /* ALARM */
+        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+            gen_io_start();
+            ret = DISAS_PC_STALE;
+        }
         gen_helper_set_alarm(cpu_env, vb);
         break;
 
@@ -1434,7 +1439,7 @@ static DisasJumpType gen_mtpr(DisasContext *ctx, TCGv vb, int regno)
         break;
     }
 
-    return DISAS_NEXT;
+    return ret;
 }
 #endif /* !USER_ONLY*/
 
-- 
2.25.1


