Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1A43B4101
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:59:27 +0200 (CEST)
Received: from localhost ([::1]:46372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwicQ-0008TY-JA
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi3x-0004GV-GP
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:23:49 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi3v-0001eg-TE
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:23:49 -0400
Received: by mail-wr1-x435.google.com with SMTP id e22so9837951wrc.1
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N0fTwLIOiJMjngQmCVcuvBFg6eFc/s2QuczGmyUTGrU=;
 b=Qr7WdreUptyTS0yGSipx/KCrMtYTdYUJ+BWZEDwHoqeVAKSI/mljXuqjdCYBGs0Jkn
 hSzfz3+84o6BhrJPjhnjYtPqYluNc8j5UfiSLsM+pvnht/uIoMRCGcSIV4eGJMj1qIo7
 a0swfCTHxUMM9kxk5PhnPd8nTi/UTKyz7oNDdpDKRvPFK/nzQBVpz/rMVSGbZLgYc6gh
 MBpKhNZibwm31+TaorEp54wqbcqgsZ8rGTnvbYwtOAtJSMH8fr/MJ/fytXzq8lio4bZs
 HJ7z+v8GxxxUgg/8oL2uh4GdnbFzdeA3EV74R4GHZXwRy/6quuBGptAzkzqpvwRN+Csn
 gB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=N0fTwLIOiJMjngQmCVcuvBFg6eFc/s2QuczGmyUTGrU=;
 b=ak8cOocBJdftnX4ttzAeG40fq9hIMPtK1XFueuUoAXkjnl6SWYhWABAtqfOHFbI7m9
 IcL1L//Q8Wkj9Wfs95Z4LIQyXFM2r4ejqeS0oQ9gIKwce9d40l8/U6n313XGargU3uNb
 D2WxC0fOobs2rRMVRuNKMVA1mwHTuuOjB535gdD/+3Hg/XY/IIJ05XSGiS6TVYymz7y6
 UYj3E+icCKFaf9MXDqaQbzG5fjTzn/Nc8pvsRoLDC4eEOfOjQHEjsgnKDqPbayJj9HPB
 cI87l2asqQ07iOt8oniR9ZgrzHGxFtWmAx2nB6J8GzqhZZsEAWI71D6OLyniGQT/fldT
 GffA==
X-Gm-Message-State: AOAM531km6ANpOoRkWuRqVWHWtO6rAjP2XBPKzripc2KGuDgcatcoE81
 kRqsRyFtX/ZSr/Xm3D/S990wtYfv/B94QQ==
X-Google-Smtp-Source: ABdhPJy1+6RzYmmYwKp8bMNB3IRMGxy5hxNM3Se98BQ3g+cwyGSnJGCjPsS/qyn3dOIMd6+BDi09pQ==
X-Received: by 2002:adf:d22b:: with SMTP id k11mr9891613wrh.57.1624613026449; 
 Fri, 25 Jun 2021 02:23:46 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id y13sm5401170wmj.18.2021.06.25.02.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:23:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/15] target/mips: Fix more TCG temporary leaks in
 gen_pool32a5_nanomips_insn
Date: Fri, 25 Jun 2021 11:23:17 +0200
Message-Id: <20210625092329.1529100-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625092329.1529100-1-f4bug@amsat.org>
References: <20210625092329.1529100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix multiple TCG temporary leaks in gen_pool32a5_nanomips_insn().

Fixes: 3285a3e4445 ("target/mips: Add emulation of DSP ASE for nanoMIPS - part 1")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210617174323.2900831-3-f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 120484a6c06..09b19262c8c 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -20298,6 +20298,10 @@ static void gen_pool32a5_nanomips_insn(DisasContext *ctx, int opc,
         gen_reserved_instruction(ctx);
         break;
     }
+
+    tcg_temp_free(v2_t);
+    tcg_temp_free(v1_t);
+    tcg_temp_free(t0);
 }
 
 static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
-- 
2.31.1


