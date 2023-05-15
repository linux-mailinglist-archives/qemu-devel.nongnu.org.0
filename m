Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73BD70288F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 11:29:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUUr-0004vN-Hd; Mon, 15 May 2023 05:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyUUX-0004oO-L5; Mon, 15 May 2023 05:27:44 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyUUU-0002uw-63; Mon, 15 May 2023 05:27:41 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-64ac461af60so3714176b3a.3; 
 Mon, 15 May 2023 02:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684142857; x=1686734857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SnRhhqxfvd+SIcWbTi+j8dH4u+CPe/avjjrMPZ0jf08=;
 b=PC7IRPBalQUDTfIyoV6w9HWlBKntMihi/g7kcs855YoZPUs4ekjg3n/0gv9wy39uNC
 StFaNfg2FKQMA8ntJigYvCMa68fPv7/c5GTTsKeXZqMNK94TP4AES65KauoKO/Pvxn3i
 WsCLqikmKGvCH/UcUd7n2zWtgq/Bf6iAmXaxV5LBFUMbwId7GdpeeWhzMNq/MT5UHOsB
 7bcPiS0F6WR4U1Qk59V0WGbeMi8IMv/Y1vtJbuuMx2J+qjTu/uAUo/cMABuvP9Q+hwh6
 L3nb0n/g1Yp6RqRpU65l97xANKI3lD7msX5XtJWH1hMBHnEYAOqDh1/5zpngFwoN2ZoD
 Ibpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684142857; x=1686734857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SnRhhqxfvd+SIcWbTi+j8dH4u+CPe/avjjrMPZ0jf08=;
 b=kvSXH3U6DTivc8R2dzxsjdl2Y+JikvEdvsszjwH2CykkMCWr6PNOZIKFfH/7oRAW14
 Iag0k8JcyvU96Uo8vKsWdy0tMKTlMyrTRvcc4kKH1OYl9wf1/lTbwXeo1y8B7Nt7o7lO
 x1sdvz/USMF/FrCZS8xXlXOMYrNwdWMJitAJhzWh15RR1HpEj/fc9S8ilk3HkW85CuxN
 ZQHjkyANfiXcQToOrHL/uj8asZwPiVeJwK5J/lbaEOZUUiPtcq4QkjNsbb8xuYBqLMUA
 +tfHNSNJfnt9iv5ZSTOS2CG0bQS0Y5x91qfHj2Glxf9N8qKXW+Z/44yEdeGDRTynoLn4
 n9rw==
X-Gm-Message-State: AC+VfDyBceZK2csok70qNrruakd4kNpfWr/cBsQpF9zGnDAuLqtbRkA6
 SaazbaETp9n/lMh3G3M32mL1eB/TgZo=
X-Google-Smtp-Source: ACHHUZ437cIJli/ULgLdeFzPEgK95ScQm/hDhY+E7X0OFPp/8dUC4pNALOtbSHt/oLytLDwpkUoTVw==
X-Received: by 2002:a05:6a20:12c6:b0:104:f9d4:1423 with SMTP id
 v6-20020a056a2012c600b00104f9d41423mr9160203pzg.28.1684142856811; 
 Mon, 15 May 2023 02:27:36 -0700 (PDT)
Received: from wheely.local0.net ([202.168.30.146])
 by smtp.gmail.com with ESMTPSA id
 n20-20020aa79054000000b006466f0be263sm11387818pfo.73.2023.05.15.02.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 02:27:36 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 9/9] target/ppc: Better CTRL SPR implementation
Date: Mon, 15 May 2023 19:26:55 +1000
Message-Id: <20230515092655.171206-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515092655.171206-1-npiggin@gmail.com>
References: <20230515092655.171206-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

The CTRL register is able to write bit zero, and that is reflected in a
bit field in the register that reflects the state of all threads in the
core.

TCG does not implement SMT, so this just requires mirroring that bit into
the first bit of the thread state field.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v2: unchanged (moved to end of series).

 target/ppc/translate.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index c03a6bdc9a..b5b9a0bcaa 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -413,7 +413,14 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
 
 void spr_write_CTRL(DisasContext *ctx, int sprn, int gprn)
 {
-    spr_write_generic32(ctx, sprn, gprn);
+    /* This does not implement >1 thread */
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+    tcg_gen_extract_tl(t0, cpu_gpr[gprn], 0, 1); /* Extract RUN field */
+    tcg_gen_shli_tl(t1, t0, 8); /* Duplicate the bit in TS */
+    tcg_gen_or_tl(t1, t1, t0);
+    gen_store_spr(sprn, t1);
+    spr_store_dump_spr(sprn);
 
     /*
      * SPR_CTRL writes must force a new translation block,
-- 
2.40.1


