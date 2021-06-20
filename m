Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1213AE0B9
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 23:36:14 +0200 (CEST)
Received: from localhost ([::1]:45382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv56z-0002D7-G7
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 17:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv53v-0002RM-1k
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:33:03 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:37388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv53q-0008Uy-74
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:33:02 -0400
Received: by mail-pg1-x52f.google.com with SMTP id t9so12517394pgn.4
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 14:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hlWx/fey2FgjFaKp9Mso1gmF59ZDXY3XC/bRgVAOonA=;
 b=v6k99CzsHwq/Tmq6lqntABxxmXfkeRmUgD3DiFuJHLDAg/1IWERWuNBzjXKFOT1MMn
 TfTC4i4JKWJibC1e++WyyeGh6XwavjY6Opjh+v5dJJrvRQdE4jO/8c9ZdkTT36X868Eh
 NQ93mX18kuke7QV9bDiRVkyOlYBFcMrZd6NYmI5W+oBxVsUXEiOq0uMyGDS6LOOLg38x
 5/1FinqD89/tIGSfVU7Ggfc1jG3nDmmnd4phqSxCsXFixLci770CLTanoLfEcMdzb9iF
 Wa/AoAOEkYPKaQ6QI0NiUr4evfEUeAHJYHfSzKzOKQzVf2xm8CiYLzDbtXAQeRM9nKR/
 yAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hlWx/fey2FgjFaKp9Mso1gmF59ZDXY3XC/bRgVAOonA=;
 b=SzxLfxV7uLegi/hHrwQKpIRlSk9sCEZaxm2rIhTHd7W19dNrYBLOKUYR98K9MTGSY0
 wPiL8t50DepojGxpdnmIRK4f9J58qjsKBGvVpGypU0ChT/vq+srFVtuRDZWx3wL2K4Qe
 QrB6qUNY88CZC/gkK7/BeR2qjiFuNHaFDFAS6Sb/yalEjMuckys6xEILkrkbX4KfduK2
 FpN9eAWTCZpb+5DYj9HcW7Eg1nBehWeyIyHPLdHwkIttFzxmzTHlUM8q/bVCOB/+YNI+
 feoxkNr93FBVCZzs5ovVjSYXQt+b3QM0TyqEH3HhiH3dvr/jig0jg/gYhkVDyQGaGWVF
 fYTw==
X-Gm-Message-State: AOAM533rmhRtfqjLGRH1+DxyhKNNmWMANaYtGMFBC2/HrAjPsRuOAP3f
 hcQMZbtExkdC2brfQWwWvp366hZBcGGGFw==
X-Google-Smtp-Source: ABdhPJyUwuItaLAuJ3CCbn1982u0r9Ae4+VqfY72HG/UR/hvnES9yn3ECVLccEnYQVRiEt50lufIJw==
X-Received: by 2002:aa7:8b0d:0:b029:2e9:857e:c1d1 with SMTP id
 f13-20020aa78b0d0000b02902e9857ec1d1mr16200305pfd.33.1624224775452; 
 Sun, 20 Jun 2021 14:32:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w21sm13608329pfq.143.2021.06.20.14.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 14:32:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/11] target/cris: Use tcg_gen_lookup_and_goto_ptr
Date: Sun, 20 Jun 2021 14:32:48 -0700
Message-Id: <20210620213249.1494274-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620213249.1494274-1-richard.henderson@linaro.org>
References: <20210620213249.1494274-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

We can use this in gen_goto_tb and for DISAS_JUMP
to indirectly chain to the next TB.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 0e925320b3..c33324b988 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -539,7 +539,7 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
         tcg_gen_exit_tb(dc->base.tb, n);
     } else {
         tcg_gen_movi_tl(env_pc, dest);
-        tcg_gen_exit_tb(NULL, 0);
+        tcg_gen_lookup_and_goto_ptr();
     }
 }
 
@@ -3331,6 +3331,8 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         gen_goto_tb(dc, 0, npc);
         break;
     case DISAS_JUMP:
+        tcg_gen_lookup_and_goto_ptr();
+        break;
     case DISAS_UPDATE:
         /* Indicate that interupts must be re-evaluated before the next TB. */
         tcg_gen_exit_tb(NULL, 0);
-- 
2.25.1


