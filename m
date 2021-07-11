Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8125F3C3F6D
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:13:16 +0200 (CEST)
Received: from localhost ([::1]:36896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2glH-0000aB-IX
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZG-0006WV-BF
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:00:54 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:56139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZD-0000dE-KX
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:00:50 -0400
Received: by mail-wm1-x32e.google.com with SMTP id j34so9954540wms.5
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=viZvhtQVx52mUJR9Wb2zu95/w2DAOaJIT3+YevgQ4qA=;
 b=JsgUtK1S8jcAGv8SHbedhJolyKKz9jve2vG8mAfHNdnQGXXweP5fzCbgM7gJavNYJc
 iGS4FRtk+jfLrKY/L15jh78ciIh/aJpeut4Up4Yu9AEoPGTpfNOI2Y+U8an+x305DHUd
 wQNVJ6Aekr9cbPWM8tUR8uQ9Seax2+K3cTM3j59Jrb1KqWdAyQK/BtfGPvBH9NeQuLX2
 zVyZdvq1bcQTl3npd9SbrkVisI790bXFIhSFbduUQjO4SsZZ7fbFIamHLktj3HuxXqg3
 vh8wTjPwI5fTFLDufMw49r3df/Jk8hC74pB972CPkWVvPMS9f5FqWPC9obIDJC6T+YPy
 tG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=viZvhtQVx52mUJR9Wb2zu95/w2DAOaJIT3+YevgQ4qA=;
 b=AIeySv/l+my1QGg60ItlupJd1JlTT0KfsDg6EndyN8FfWPfmvRXsbcFwwgFhNnQih4
 AYVzEHXcc62fdFGjKgLDz6Rhj4mg/Hp9XbSJoz63MFdDaUYHW4/Ri8TuguJ/KTs7JSG+
 XD+nctEH4DmIS4L7Wkd6PTXxYbtipY6XWINP4OfF8qIRjWHjKs/DoAReDAYhV4ctnFfP
 k8CU67vVrzpwDu7RvYNYuOfK/FEG+jxWBtwrcBLXz0N1vjncPxDDukNFqnIJoTmkMfot
 BNGCVl6EfzDrZ/GUenItm8MIFv4pRPqy99NYvODzUIDOizYoAzRtGrHoFmshv8OwBUtu
 PQ0g==
X-Gm-Message-State: AOAM5306L6Y3C7JmB68oSKvmXNd30MBWCHH5Bjs/Ux0JdWOsX3ooTdh2
 fANhy/dNTAjbpsnOCba5SlTW2E7DhmZwDxJ3
X-Google-Smtp-Source: ABdhPJy4g0+IuQNtefPuZ1L9k6LX8mTK9Um8JKlgo0ANxcBr+nlHPYQHqqrsshlEj2bg9mVCP+NHng==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr10809146wmh.69.1626037245207; 
 Sun, 11 Jul 2021 14:00:45 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id u12sm12342714wrt.50.2021.07.11.14.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:00:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/19] target/mips/tx79: Introduce PSUB* opcodes (Parallel
 Subtract)
Date: Sun, 11 Jul 2021 23:00:01 +0200
Message-Id: <20210711210016.2710100-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711210016.2710100-1-f4bug@amsat.org>
References: <20210711210016.2710100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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

Introduce the 'Parallel Subtract' opcodes:

 - PSUBB (Parallel Subtract Byte)
 - PSUBH (Parallel Subtract Halfword)
 - PSUBW (Parallel Subtract Word)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <820210309145653.743937-11-f4bug@amsat.org>
---
 target/mips/tcg/tx79.decode      |  6 ++++++
 target/mips/tcg/tx79_translate.c | 19 +++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/target/mips/tcg/tx79.decode b/target/mips/tcg/tx79.decode
index 26c80b9bce5..d1c07c7d901 100644
--- a/target/mips/tcg/tx79.decode
+++ b/target/mips/tcg/tx79.decode
@@ -29,6 +29,12 @@ MTHI1           011100 .....  0000000000 00000 010001   @rs
 MFLO1           011100 0000000000  ..... 00000 010010   @rd
 MTLO1           011100 .....  0000000000 00000 010011   @rs
 
+# MMI0
+
+PSUBW           011100 ..... ..... ..... 00001 001000   @rs_rt_rd
+PSUBH           011100 ..... ..... ..... 00101 001000   @rs_rt_rd
+PSUBB           011100 ..... ..... ..... 01001 001000   @rs_rt_rd
+
 # MMI2
 
 PCPYLD          011100 ..... ..... ..... 01110 001001   @rs_rt_rd
diff --git a/target/mips/tcg/tx79_translate.c b/target/mips/tcg/tx79_translate.c
index 00364f10d47..3abd1d92e70 100644
--- a/target/mips/tcg/tx79_translate.c
+++ b/target/mips/tcg/tx79_translate.c
@@ -9,6 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "tcg/tcg-op.h"
+#include "tcg/tcg-op-gvec.h"
 #include "exec/helper-gen.h"
 #include "translate.h"
 
@@ -144,6 +145,24 @@ static bool trans_parallel_arith(DisasContext *ctx, arg_rtype *a,
     return true;
 }
 
+/* Parallel Subtract Byte */
+static bool trans_PSUBB(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_arith(ctx, a, tcg_gen_vec_sub8_i64);
+}
+
+/* Parallel Subtract Halfword */
+static bool trans_PSUBH(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_arith(ctx, a, tcg_gen_vec_sub16_i64);
+}
+
+/* Parallel Subtract Word */
+static bool trans_PSUBW(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_arith(ctx, a, tcg_gen_vec_sub32_i64);
+}
+
 /*
  *     Min/Max (4 instructions)
  *     ------------------------
-- 
2.31.1


