Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A182332A4B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:23:18 +0100 (CET)
Received: from localhost ([::1]:48310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeCb-0000Ik-JK
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:23:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdo0-00051O-QO
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:57:52 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:45907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdny-0002dC-WE
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:57:52 -0500
Received: by mail-ej1-x629.google.com with SMTP id mm21so28412778ejb.12
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B4jnrnWCbwEDPd6F+heQm5VZrEK8h7r64BqI+CzIkH4=;
 b=gPdyh+avMoxRy586FFNUirY4PrN7BW6Ksf9c+SYbMw1t9XobUAlvo0MZzLIB3lIW7C
 0JseDMSOZh6fl43mjaZspxyhTxxlpZ1gWE4mTtLe7Q3pmSv1nEbVd/VhuyqhG1dgpSE7
 Ih++NGzCDvIFD1P43OKTVGeytTI8MVRlG2Bwhbj7eKxW8tLIIik8jcU3JPSMjBa2AGC4
 XR+RhwzqZybw8caufgtnhIgBjCC+PfC+gjy6OyBGnHcFuGfDEiIeBkSO6M3TciaML/KE
 CepkrKQqPXzzNnNFJcGl0TN84rvE3qusKtQE4qVtOXWLH10GiNmI3V9TFLca0eYDN2s7
 O3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=B4jnrnWCbwEDPd6F+heQm5VZrEK8h7r64BqI+CzIkH4=;
 b=AeEkkXUhRjRA27Gnr193kJaUv+muDgYygPWNO2l4SGkYHi83gjcPasHQqxSOCLyRc7
 Th9IO3nIfYWLCiPSDjK4znleh/vwywYOWb9+moAzF8RJi9Q+Ubhan58ubZJtb/Hba70E
 53esrRL243wWHZT0WRX7UfUjz5Ut7ikDb+HNPSpzYLBG0/4ebdftsrhy2P2Om+g4m0qf
 9q1ebModPvbX05sHjiDEzoc2X7E/NA9MzwBtupliYw8KvxTADLW3nkaSnWx7SkIX+Vn+
 teYvrNzhVKjgy7ElNOoggL6bdx2GL/NNT2+PLx9oNQHC2ulGWvZMF9tCgAz6EPszRDSQ
 46VA==
X-Gm-Message-State: AOAM532AiWgYowmy4qwKGES6oi9njFfgPAochCDh9QBUfG4bkca6NGhb
 zVKCscAQzcRhS32d58qhgaeCnCt2S2A=
X-Google-Smtp-Source: ABdhPJy8wj+XWW/il8WqozFQpHNRNjqO4KwKo38LM6o//v//4WKn0F6CsCCOfxcVwF+HT8/PT0r9mQ==
X-Received: by 2002:a17:906:2551:: with SMTP id
 j17mr20745126ejb.441.1615301866533; 
 Tue, 09 Mar 2021 06:57:46 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f3sm8648351ejd.42.2021.03.09.06.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:57:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 10/22] target/mips/tx79: Introduce PSUB* opcodes
 (Parallel Subtract)
Date: Tue,  9 Mar 2021 15:56:41 +0100
Message-Id: <20210309145653.743937-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309145653.743937-1-f4bug@amsat.org>
References: <20210309145653.743937-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x629.google.com
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
 Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the 'Parallel Subtract' opcodes:

 - PSUBB (Parallel Subtract Byte)
 - PSUBH (Parallel Subtract Halfword)
 - PSUBW (Parallel Subtract Word)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Uses tcg_gen_vec_sub{8,16,32}_i64 from tcg/tcg-op-gvec.h (rth)
---
 target/mips/tx79.decode      |  6 ++++++
 target/mips/tx79_translate.c | 19 +++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index 26c80b9bce5..d1c07c7d901 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
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
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index 00364f10d47..3abd1d92e70 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
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
2.26.2


