Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF81A332AD6
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:44:58 +0100 (CET)
Received: from localhost ([::1]:57542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeXZ-0002eJ-VB
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:44:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdoS-0005ST-NF
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:58:20 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:39561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdoQ-0002oF-OR
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:58:19 -0500
Received: by mail-ed1-x532.google.com with SMTP id h10so20740332edl.6
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OxqjLVKnzec0kFVuN+C9Om0vprT+bKPUVJ8CMXW3FNM=;
 b=QpKNjGXe911Mi+x/3irf3KSKDIkD7PyKAn2b2CeXsZ9edk1zkBZCDFPnfSGaHt006E
 wcFyW4GN7Mv7avUJDZuuB6qcIYhVDacCkvWH6/yMuVO2pkYfGaO9pNk6e9i6OZ9+WsPw
 uNmrLpZhfSCIRPycLxD88woCkqmQ7crnCopO98veMLydru/kZMf2B9FbLcit7aGTcoFe
 uYoAMbnN2pHJvJfKl8TY0ZQN6ME1mG1mLQiRWqUr7Pr/dwNoHeY8Mb1fDYYpbnOcY4Sq
 XEghP9581LQHowvZqmnU1qqkkmTxJxJFaeThkZ+9KWN9qtemgI0bdiVKMM+h1keWQvAU
 GMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OxqjLVKnzec0kFVuN+C9Om0vprT+bKPUVJ8CMXW3FNM=;
 b=D4pRd3Nw+lKJf5e7q4bKUSUR8upg3CJoADhFDaNtpc1SdIJ6DCEzen0sAEkxy7i9Md
 WHTetri6SQs05qVMuR4B4R/IEQSchZUKtu8eFNno4r6D93/17GnJSvubPbc4CwsqOeCz
 iE55+DxmtMOMdVxH5TV+DUlleYzAfc3zqRaPHqdAMN1W+EhHgA+VHEAdTonoSgwOY4Ck
 bkdfgKbb9OduBsu9Kz5R1YGwf9jmQvFJOp1+XQxxx14/gCsSmEDhqzWOPHmxFmBzbMZX
 fOAuwoqlcN0wgIky7GSIYPvYD12iVvGYjH03qzMWDAmgH+D+kUhYFhKK6XbZ7HED7icx
 qjLQ==
X-Gm-Message-State: AOAM530Zn0/RYm4Uv/HZKQYTHL5B2MiUGJ1uggVxUsAi4Slby8mJLQKN
 Hv7DVtrUKnU2BZmFStZEWoouiEy7dbk=
X-Google-Smtp-Source: ABdhPJyqlaMVWKk+R5+wuhITC+yE1uA8+K3aHDLDzwE1yHmrAxpkjOCEpeWGSa2PSUA70tK4dQze5A==
X-Received: by 2002:aa7:d9c8:: with SMTP id v8mr4471222eds.9.1615301897257;
 Tue, 09 Mar 2021 06:58:17 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id si3sm8380527ejb.90.2021.03.09.06.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:58:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 16/22] target/mips/tx79: Introduce PINTEH (Parallel
 Interleave Even Halfword)
Date: Tue,  9 Mar 2021 15:56:47 +0100
Message-Id: <20210309145653.743937-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309145653.743937-1-f4bug@amsat.org>
References: <20210309145653.743937-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
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

Introduce the PINTEH opcode (Parallel Interleave Even Halfword).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2:
Use trans_parallel_arith (rth)
---
 target/mips/tx79.decode      |  1 +
 target/mips/tx79_translate.c | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index 653910371d2..fbd2be569ad 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -57,6 +57,7 @@ PXOR            011100 ..... ..... ..... 10011 001001   @rs_rt_rd
 
 # MMI3
 
+PINTEH          011100 ..... ..... ..... 01010 101001   @rs_rt_rd
 PCPYUD          011100 ..... ..... ..... 01110 101001   @rs_rt_rd
 POR             011100 ..... ..... ..... 10010 101001   @rs_rt_rd
 PNOR            011100 ..... ..... ..... 10011 101001   @rs_rt_rd
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index 90c33d26a9f..7c7879face0 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -593,3 +593,25 @@ static bool trans_PCPYUD(DisasContext *s, arg_rtype *a)
 
     return true;
 }
+
+static void gen_vec_pinteh(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 x, y, mask = tcg_constant_i64(0x0000ffff0000ffffull);
+
+    x = tcg_temp_new_i64();
+    y = tcg_temp_new_i64();
+
+    tcg_gen_shli_i64(x, a, 8);
+    tcg_gen_and_i64(x, x, mask);
+    tcg_gen_and_i64(y, b, mask);
+    tcg_gen_or_i64(d, x, y);
+
+    tcg_temp_free(y);
+    tcg_temp_free(x);
+}
+
+/* Parallel Interleave Even Halfword */
+static bool trans_PINTEH(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_arith(ctx, a, gen_vec_pinteh);
+}
-- 
2.26.2


