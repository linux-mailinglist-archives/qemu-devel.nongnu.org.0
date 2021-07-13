Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A44B53C7528
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:44:08 +0200 (CEST)
Received: from localhost ([::1]:56398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LVv-0001Ck-LJ
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LUD-0006tX-9d
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:21 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:37833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LU9-0005em-3A
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:21 -0400
Received: by mail-pg1-x529.google.com with SMTP id t9so22131704pgn.4
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fkcNcRIjqT1hq788GGq0h2qjDz4eiWFcxGo3OTTzr8A=;
 b=vJiFP1392DpESS/pQdf2Zsah71V4TxeDdpfLr6//jiGhwS5iAn3MMpvXf2o1AtWsjz
 drzXm5KngRm7PuT8hlRNuejkcQdftoe1dEbhBVR6xBRzqrcD9ae5V4clKVX0kz1teDWe
 SqQliezlzPZxhdiz1iRLscpDXvPaG+SiKJp2SbdQADN28/wB/mRDL+S1dt2fJpsoxk/1
 2A6dCpONwttw3GyA3aGvwAdI9PQR04zawU5vGCr67ZqpywLd0YkOLY8t6ATyhxzdqnRV
 KZK7DAOpwCuocFYlGvFeliEF+bldqDb3q6tw6DgMoR9RuqyUY9fRQp44HLsr9LjaITzg
 KUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fkcNcRIjqT1hq788GGq0h2qjDz4eiWFcxGo3OTTzr8A=;
 b=bQbGoB9THH13WmNUe+5JJb7BHmXIwsc9y8NyzkRVM2dcOY20Grds1AV01hKD0A9yWc
 D5dxyKv8mX+letuzv3FCOsOBPa4XzC2dcJT72BOY1Mxh79rO/NZi1oLxyuSdhBR9alMe
 XrHWD4AJPPX2lKPX41fAfrrzEq1djvCuBUsZUFBcULkZW2IVA/LQ57mbEqr/pR2cS0fS
 50Q9E66rIqaNHUd0E3ONP4MoVLqF1ibzoll3ZH/bsay/n6qr7D5FpjOOTQfbQha+pEVT
 04KVxFmCB1rQSkZZtCjRACK7tH+kXBkIKtZjkyutfVGVDi6KbHule3bZ1En5RVHbSMxj
 OXtw==
X-Gm-Message-State: AOAM531kXNpj2h7NzozYBXIlHEjfThaCBeF7t0HadMSdOlXXFF7hkJXk
 wi9HCxGxMHBrewYiVyEH+kfnn2MmUZpBzA==
X-Google-Smtp-Source: ABdhPJw5XOpQ1zcPBzDU4frtJgLslCLJBVZcjDaAgxQphJZrjjF+X5z46PHpG+dKv+2hz9O1pNC3wA==
X-Received: by 2002:a05:6a00:882:b029:32a:845:ebcc with SMTP id
 q2-20020a056a000882b029032a0845ebccmr5398332pfj.15.1626194535481; 
 Tue, 13 Jul 2021 09:42:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z13sm4947865pfn.94.2021.07.13.09.42.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 09:42:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/14] target/alpha: Store set into rx flag
Date: Tue, 13 Jul 2021 09:42:02 -0700
Message-Id: <20210713164211.1520109-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713164211.1520109-1-richard.henderson@linaro.org>
References: <20210713164211.1520109-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

A paste-o meant that we wrote back the existing value
of the RX flag rather than changing it to TMP.

Use tcg_constant_i64 while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 833d3baa7b..b439b57a66 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -1084,15 +1084,11 @@ static void gen_msk_l(DisasContext *ctx, TCGv vc, TCGv va, int rb, bool islit,
 
 static void gen_rx(DisasContext *ctx, int ra, int set)
 {
-    TCGv tmp;
-
     if (ra != 31) {
         ld_flag_byte(ctx->ir[ra], ENV_FLAG_RX_SHIFT);
     }
 
-    tmp = tcg_const_i64(set);
-    st_flag_byte(ctx->ir[ra], ENV_FLAG_RX_SHIFT);
-    tcg_temp_free(tmp);
+    st_flag_byte(tcg_constant_i64(set), ENV_FLAG_RX_SHIFT);
 }
 
 static DisasJumpType gen_call_pal(DisasContext *ctx, int palcode)
-- 
2.25.1


