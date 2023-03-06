Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BE46AB3E5
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:47:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyyF-00041E-WC; Sun, 05 Mar 2023 19:44:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxc-0002bL-Nh
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:16 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxZ-0007Kp-Lu
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:16 -0500
Received: by mail-pf1-x431.google.com with SMTP id bd34so4725579pfb.3
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L7YOFUC2hiJYMIDXCvojpTK9WIaCvg92hV5y3AIEh3Y=;
 b=IPfekGtz0tLeQ8e2WImFLgmdKqdilg/q/rFkanm+u7ryJVsHtkSkXC+/yrPyRXZzlM
 3xpk/aPN1o9NrJgbwohwbi90fIY98pRRPB1kAhICpLPqofrHdx+BV7Yz0v25GHMbTpXB
 qnv6LnSmzGxJAsl9WJvFJU2XPIFhF0kdxv+7S+Mn/ODL0h5F9NTBjp5tsLZ34uKLSUre
 VhJg+Wvo0Tl0JwpdI4dUw6o2yoWP03+0dFNVtxdLSoLEyp18acHWHZU6AGgEOgdt+4a7
 mEv+Jac5+kn/MqFuCAzkTiAzatb8O8l34+ReKNYxMHNThOI5vUf7EsA+hhHiOf1jne+f
 3EEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L7YOFUC2hiJYMIDXCvojpTK9WIaCvg92hV5y3AIEh3Y=;
 b=r/eihJDiv9pXf/pj3eX9qi3TXo7sYEGAu4EuSVI5FK7wVIHIxWhsZR+7peijjWXJmU
 jOs4fDeL2NNa5DVgQ2RIjyXth7dUslQ+8wPg9F7XkWYm954S/os4sUkICuIlHw2nry1h
 7EaAk+cvITPQrWmezd3dhdA4PvhA8aQxloHjVOCWBBGv8wha1Xb2fVCbBT8xWOAahnGs
 MVUbcgkmuAUxGDIA4h2icDlriFkHzv2VbhCN2hzg5KKQgoF8XWNnAd6lKusodtL99Mv5
 eLl07U5xRmRXNn9/kJ07Qul3vZn46iN5BQsldvr7BT1oH290jVUwVhLuOWWiiceDp5yM
 HILg==
X-Gm-Message-State: AO0yUKWTSHPONhehJXfIyOopVEEzu7GYghts357sIih3uLiGevX//BEL
 dZTDNbNHbeL0Qn/92wzNxFdo2K97ToUmU2fcaSYnVA==
X-Google-Smtp-Source: AK7set/zYnTV0iWydeUIj24sVMsIuUxeH+hBQYfjGz8pZDqNbyiLwSf6Iw0PVi2CxLphiS+/5jvQ2Q==
X-Received: by 2002:a62:840e:0:b0:60e:950c:7a4f with SMTP id
 k14-20020a62840e000000b0060e950c7a4fmr10595074pfd.8.1678063452317; 
 Sun, 05 Mar 2023 16:44:12 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:44:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PULL 63/84] target/mips: Drop tcg_temp_free from
 mips16e_translate.c.inc
Date: Sun,  5 Mar 2023 16:39:33 -0800
Message-Id: <20230306003954.1866998-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

Translators are no longer required to free tcg temporaries.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/mips16e_translate.c.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/mips/tcg/mips16e_translate.c.inc b/target/mips/tcg/mips16e_translate.c.inc
index 918b15d55c..602f5f0c02 100644
--- a/target/mips/tcg/mips16e_translate.c.inc
+++ b/target/mips/tcg/mips16e_translate.c.inc
@@ -280,9 +280,6 @@ static void gen_mips16_save(DisasContext *ctx,
 
     tcg_gen_movi_tl(t2, -framesize);
     gen_op_addr_add(ctx, cpu_gpr[29], cpu_gpr[29], t2);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
 }
 
 static void gen_mips16_restore(DisasContext *ctx,
@@ -386,9 +383,6 @@ static void gen_mips16_restore(DisasContext *ctx,
 
     tcg_gen_movi_tl(t2, framesize);
     gen_op_addr_add(ctx, cpu_gpr[29], cpu_gpr[29], t2);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
 }
 
 #if defined(TARGET_MIPS64)
-- 
2.34.1


