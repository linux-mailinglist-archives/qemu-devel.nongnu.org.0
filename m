Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E193C3F6F
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:14:47 +0200 (CEST)
Received: from localhost ([::1]:41826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gmk-0003qV-9J
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZX-00078z-RF
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:07 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:44911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZW-0000oy-4z
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:07 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 i2-20020a05600c3542b02902058529ea07so10017612wmq.3
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Efwfkq2SFl4zpYmlFU6CVRGGkXV2ciWxkgqaBGYsCY0=;
 b=netOxa/youFBqbkxas14rqSVjcWe7onidCALprMrwxV79usZrLqvuQYRDyLxpsstlL
 nSFh/pxl5Z1uqDuG03IbLffjSK7cg4XCYYlDt0YiXphUgniW6IyP8ZnAJeYPBMMeU7ri
 kwO7S8/jqkyuENPhG8YAeTxb+eaIBbX3YuNfVi7AFpLotNs1MMOpMJV88xgqGj+5lpGy
 jlX0qzxr91u+hGma3sLbz5gw46boL8CipGK4POgEfu036wlQdNHz2v/ePlIdlF/ghEgc
 0hnw0p0guxYEXleADM4hrkVU9SQI6RSP1SXc3ES+v36jNThY9V6NsWpq7K6lsaFHEHdl
 XMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Efwfkq2SFl4zpYmlFU6CVRGGkXV2ciWxkgqaBGYsCY0=;
 b=BQQY7vZrQ+qaVvP9W3OeiGLEM4f3l2vHfGB6Vk4gw3/vLgCspkfknZMznki66UCY0y
 6zdmrxO2mXaZduN836KgyBhvzJyESV+IGZNd6Dysic38f4jX3y+YBstiW8mGt/aIQDGD
 5J7hawNfxnHpTpB8P1FzOnVlVvN27knof/ziJYeCEav0EHm43hd+EPDI41uvlVi0Af9z
 STU8wTEHTnWvMeMRD7Ci3Gl+2dXno/GrW6erJff6P/NVhPl2VaBZ7e1I0QaPTDSwILB2
 yGFAiRpTnHVc31Y+w5aJIqesGodmisrKns3axu0eNqBl6NmWIjkCcuVK6p3natV9hv1V
 +OZw==
X-Gm-Message-State: AOAM53290wFcDTltMek0d3i/zanvWClPHQ/JF25+XPW42v3Us/G4QG8Q
 JfjcP8Oipj9zdqZbpWHA0/VlDsCcueNTavmz
X-Google-Smtp-Source: ABdhPJz5JT4Bodz0TINSd4GiFsT1ZOLrTVeDRJkTXiY50KtvHNFKEN5R8MZLkp3YIecIdrDiAbcGug==
X-Received: by 2002:a05:600c:2dd0:: with SMTP id
 e16mr12856742wmh.85.1626037264659; 
 Sun, 11 Jul 2021 14:01:04 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id f130sm7957156wmf.23.2021.07.11.14.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:01:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/19] target/mips/tx79: Introduce PCGT* (Parallel Compare for
 Greater Than)
Date: Sun, 11 Jul 2021 23:00:05 +0200
Message-Id: <20210711210016.2710100-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711210016.2710100-1-f4bug@amsat.org>
References: <20210711210016.2710100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the 'Parallel Compare for Greater Than' opcodes:

 - PCGTB (Parallel Compare for Greater Than Byte)
 - PCGTH (Parallel Compare for Greater Than Halfword)
 - PCGTW (Parallel Compare for Greater Than Word)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210309145653.743937-15-f4bug@amsat.org>
---
 target/mips/tcg/tx79.decode      |  3 +++
 target/mips/tcg/tx79_translate.c | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/target/mips/tcg/tx79.decode b/target/mips/tcg/tx79.decode
index cfe721755ca..63fbe9694bb 100644
--- a/target/mips/tcg/tx79.decode
+++ b/target/mips/tcg/tx79.decode
@@ -32,8 +32,11 @@ MTLO1           011100 .....  0000000000 00000 010011   @rs
 # MMI0
 
 PSUBW           011100 ..... ..... ..... 00001 001000   @rs_rt_rd
+PCGTW           011100 ..... ..... ..... 00010 001000   @rs_rt_rd
 PSUBH           011100 ..... ..... ..... 00101 001000   @rs_rt_rd
+PCGTH           011100 ..... ..... ..... 00110 001000   @rs_rt_rd
 PSUBB           011100 ..... ..... ..... 01001 001000   @rs_rt_rd
+PCGTB           011100 ..... ..... ..... 01010 001000   @rs_rt_rd
 PEXTLW          011100 ..... ..... ..... 10010 001000   @rs_rt_rd
 PEXTLH          011100 ..... ..... ..... 10110 001000   @rs_rt_rd
 PEXTLB          011100 ..... ..... ..... 11010 001000   @rs_rt_rd
diff --git a/target/mips/tcg/tx79_translate.c b/target/mips/tcg/tx79_translate.c
index 8dd510c2719..f0e3d8c0b66 100644
--- a/target/mips/tcg/tx79_translate.c
+++ b/target/mips/tcg/tx79_translate.c
@@ -285,18 +285,36 @@ static bool trans_parallel_compare(DisasContext *ctx, arg_rtype *a,
     return true;
 }
 
+/* Parallel Compare for Greater Than Byte */
+static bool trans_PCGTB(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_compare(ctx, a, TCG_COND_GE, 8);
+}
+
 /* Parallel Compare for Equal Byte */
 static bool trans_PCEQB(DisasContext *ctx, arg_rtype *a)
 {
     return trans_parallel_compare(ctx, a, TCG_COND_EQ, 8);
 }
 
+/* Parallel Compare for Greater Than Halfword */
+static bool trans_PCGTH(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_compare(ctx, a, TCG_COND_GE, 16);
+}
+
 /* Parallel Compare for Equal Halfword */
 static bool trans_PCEQH(DisasContext *ctx, arg_rtype *a)
 {
     return trans_parallel_compare(ctx, a, TCG_COND_EQ, 16);
 }
 
+/* Parallel Compare for Greater Than Word */
+static bool trans_PCGTW(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_compare(ctx, a, TCG_COND_GE, 32);
+}
+
 /* Parallel Compare for Equal Word */
 static bool trans_PCEQW(DisasContext *ctx, arg_rtype *a)
 {
-- 
2.31.1


