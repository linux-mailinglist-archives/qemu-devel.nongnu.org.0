Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7FB6F4806
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:10:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsYu-0002pI-Ag; Tue, 02 May 2023 12:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYi-0002m2-9I
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:09:03 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYg-0000hO-HD
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:08:55 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-2f27a9c7970so3727265f8f.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 09:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683043733; x=1685635733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+izzL5UeSD6JbwL0jozvlCRqZk7eiF+iQRw2O4DosRA=;
 b=UNcSYt73qobgQt2odKyfqeUkozBgka/I3U6xeaFNaSvtBTimPVbDXDTT5xAesnT05v
 dIXYJs1tsiNdJUfuOy9TaYqmRoNM2971cLEdZ+3B1k0/ZZY07fAmDZGEXomeXWf8Uxq9
 afmLBs+2+IIyh/gkICr+69UXbn3Aznh7kdJiJp0NlkwolqdV1+Rx0M9mn+cX0gZ1nJca
 C7aszYtN92V8I48IeN/mNPc5B4dDR6XVO89X4uH5El8uem2Z+ygxXF060cvVO9oRYjz4
 /0Pd5y3GfnBiSei3x2Q+br2W4cYXxSwo+t6L8FXh+SMmWMgGRqT3ULm/qn0n+6RfVHxk
 iYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683043733; x=1685635733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+izzL5UeSD6JbwL0jozvlCRqZk7eiF+iQRw2O4DosRA=;
 b=EBIE6KzH0D2y45bl0cH1UWxvBEZ2Smass8zPFo2kWHhaBh/qk1n9ewewrf3hCujF0Z
 VPwvsxsb51n6pkgvDOVLMtmeKWkeBjaBJq9mxXLugOQa05/G21+4WNb5OQLYvRkZFNss
 nJwW3g0/Xke22iXoOzJefn+LoYhNWQ51x4Y2gfMFdOFjoXzVg0z4IAo4SGKuSzFmW6Ft
 hDZTZBKJn/ETL2RWTOkzW0G2NqthLOVMenb6ywi8m8eWXx6LLnZl+KprqTJ3xW2ejaIf
 eDd+4YzguhhrVQvOG1rCtxgGHykD0/TryoM6IfLYjdWp5uoUvbr1pQwl63uFFe6kfM5d
 dx/w==
X-Gm-Message-State: AC+VfDxVVR0wn5tqzXO4B2fugrNlTmvti3544UfCRv2944ndbwuco/LK
 U0y3/fVkRwUbJAGOazBMLBCnDaVHKjIpyneMMuOfLQ==
X-Google-Smtp-Source: ACHHUZ6i0I7RWjBeqqw+0nY9loi4+KeS5MnrMTCJhQOEoIuH5MAiEIw977iZe8WgM6u5O2tmVgcaig==
X-Received: by 2002:a05:6000:182:b0:2fa:55f3:4ea2 with SMTP id
 p2-20020a056000018200b002fa55f34ea2mr11663241wrx.5.1683043733064; 
 Tue, 02 May 2023 09:08:53 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003ede3f5c81fsm39918471wmo.41.2023.05.02.09.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 09:08:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jiaxun.yang@flygoat.com, crwulff@gmail.com,
 marex@denx.de, ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
Subject: [PATCH 08/16] target/mips: Use MO_ALIGN instead of 0
Date: Tue,  2 May 2023 17:08:38 +0100
Message-Id: <20230502160846.1289975-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502160846.1289975-1-richard.henderson@linaro.org>
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The opposite of MO_UNALN is MO_ALIGN.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/nanomips_translate.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index b96dcd2ae9..a98dde0d2e 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -4305,7 +4305,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                     TCGv va = tcg_temp_new();
                     TCGv t1 = tcg_temp_new();
                     MemOp memop = (extract32(ctx->opcode, 8, 3)) ==
-                                      NM_P_LS_UAWM ? MO_UNALN : 0;
+                                      NM_P_LS_UAWM ? MO_UNALN : MO_ALIGN;
 
                     count = (count == 0) ? 8 : count;
                     while (counter != count) {
-- 
2.34.1


