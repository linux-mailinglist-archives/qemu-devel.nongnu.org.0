Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21868320B35
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 16:02:15 +0100 (CET)
Received: from localhost ([::1]:44748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDqFS-0005jJ-2m
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 10:02:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpr6-0007y7-9F
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:04 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpqs-0003Fn-C1
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:02 -0500
Received: by mail-wr1-x433.google.com with SMTP id h98so11534481wrh.11
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uo9pUZwSgpzkENxQpsju87CnRF4+oGdspcjkbGETK70=;
 b=OuVp1mYso22zPYoV0Qh8/0ZtZqJTXrEduxyq0u/JZl+KOguAD19JGDKmFKZ51zUFU2
 RpOviGg4Cqb06gQJt7H5f7QytXYMsE31jq5GgRYJFSfc9pfOAmHAPTwvAuqbFhjfMBtx
 qwD8nPNMsR2n2rRfHYHekP598IEXKLdV1Mf3FCDKK/BOb+IVxWKlsncIZGVt4Cq7/UUj
 ryh/L/xYS7f5wrbLiooykGt52kukpmuGJVWGfoWIvI01fv0YSUPsw/yUwcDAaOfD/d6m
 xAjTYgKhDcu7qGRcCEGJaxxgHBkcA8ehwjCBRnwbM5AvvE892jJH8LvrrN+aMTGQsRGJ
 rFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uo9pUZwSgpzkENxQpsju87CnRF4+oGdspcjkbGETK70=;
 b=Jxpb9rtdc8z8lbQa6P2r4ob/WvgUsV4QTxj92j8vCSiu1lkPpv8x2Igc6vW3qz4fzB
 QwrxypPn/RJwfiP6SZSuRRC10ooDrELDw9Ix8CXrxdNL9a8A0WdPgohoI1GzerHenysg
 TGMG5CkbZgnFFbvsmXwT7rFSxCVOlTp34tLxiNDc1nJbJwY20cZgn1Nd+SzwWOoMmLkw
 yQdFbBHVRML6Nuy7Ra/VbQSjAgfRCPIdafkwCZe4hf9qHblonCrAuoB+Csbqd++41hnx
 CjAwHoRcrLvi0xjo2iQX3JkGWcuiIwWIVlJntzB55xqN4AE+pQUNwTdBZLaug0KVLNy4
 pa7g==
X-Gm-Message-State: AOAM531CRB4E8PpuGXNnOE3V7wCEvwi4us9V4OPvFIcQoWZ7dsvIDZRH
 gH4M99j8w6cu8hBWrCj01wJwpeoCTAc=
X-Google-Smtp-Source: ABdhPJyLL4YvKWg/mWBT43pEhvYkoh7k+af8hj53nUv537Glt/uomPtExgoAz1K73CtUac48EEpEIw==
X-Received: by 2002:adf:ce06:: with SMTP id p6mr16194736wrn.406.1613918208746; 
 Sun, 21 Feb 2021 06:36:48 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o13sm27300043wro.15.2021.02.21.06.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:36:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/43] target/mips: Use GPR move functions in gen_HILO1_tx79()
Date: Sun, 21 Feb 2021 15:34:16 +0100
Message-Id: <20210221143432.2468220-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have handy functions to access GPR. Use gen_store_gpr() for
Move From HI/LO Register and gen_load_gpr() for Move To opcodes.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-8-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index a303c36be3f..70891c37cdd 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -4126,31 +4126,18 @@ static void gen_shift(DisasContext *ctx, uint32_t opc,
 /* Copy GPR to and from TX79 HI1/LO1 register. */
 static void gen_HILO1_tx79(DisasContext *ctx, uint32_t opc, int reg)
 {
-    if (reg == 0 && (opc == MMI_OPC_MFHI1 || opc == MMI_OPC_MFLO1)) {
-        /* Treat as NOP. */
-        return;
-    }
-
     switch (opc) {
     case MMI_OPC_MFHI1:
-        tcg_gen_mov_tl(cpu_gpr[reg], cpu_HI[1]);
+        gen_store_gpr(cpu_HI[1], reg);
         break;
     case MMI_OPC_MFLO1:
-        tcg_gen_mov_tl(cpu_gpr[reg], cpu_LO[1]);
+        gen_store_gpr(cpu_LO[1], reg);
         break;
     case MMI_OPC_MTHI1:
-        if (reg != 0) {
-            tcg_gen_mov_tl(cpu_HI[1], cpu_gpr[reg]);
-        } else {
-            tcg_gen_movi_tl(cpu_HI[1], 0);
-        }
+        gen_load_gpr(cpu_HI[1], reg);
         break;
     case MMI_OPC_MTLO1:
-        if (reg != 0) {
-            tcg_gen_mov_tl(cpu_LO[1], cpu_gpr[reg]);
-        } else {
-            tcg_gen_movi_tl(cpu_LO[1], 0);
-        }
+        gen_load_gpr(cpu_LO[1], reg);
         break;
     default:
         MIPS_INVAL("mfthilo1 TX79");
-- 
2.26.2


