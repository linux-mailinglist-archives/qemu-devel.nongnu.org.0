Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 042B030E9B6
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 02:54:32 +0100 (CET)
Received: from localhost ([::1]:51360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Tqp-0005Z7-1N
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 20:54:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Ti8-0004cb-7Q
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:35 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:41213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Ti6-0003ao-2b
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:31 -0500
Received: by mail-pf1-x435.google.com with SMTP id q20so1061410pfu.8
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tnzvFG8Gmy7YN7i7Jw+CtzTgCAPtOrT7NLuSzhM8paA=;
 b=SQxCuMS0LF4ER8qQ5oRHJTfQUI1Cy4UYlY1W6qUVQUhQS8nG3TS+zJg8BaZtPv6xTu
 iWR0Q+DMzbPPdp55xFxnA3WNJablkmj4T9XdxdHutzeelq2vznmG7wLl1HE6xpug5XDZ
 pZi21GDypetOyKTA6+3OO6KlaCSw/nxDEr0/jmMgwy1M64reuD29JeNqme3fbBSMM3Ic
 zu8MaMYlzcyAPm90uCXCdl+hElkGyePAWbIYV8ZNAnJW4MCotTE2gf6R89hFqmHaZEuA
 ktu6733i5oXHs2N2KIMyqzhaTpHA2ji8YyDb1zsXTQhIKGIeyQTfHzMFzGj777DE4zQm
 5C0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tnzvFG8Gmy7YN7i7Jw+CtzTgCAPtOrT7NLuSzhM8paA=;
 b=t1TBNyH57TH1Js/LAFerUbpWV4IMM3+yJPnMfBQXLxGpu4PhJFrBtgmoZUoSlrR+2y
 jhB1i8R/Bb27EHatdzlqVOA5Uq5DW1jwC7YZkxLQoMsycNsksfhf/PFg3cefxaJ27ApS
 w5qWdhHvtgJIkpapCcNlA/D9YFDu0oAxB7AQicPMY8qw2D6PZCfwSRK3034Rcq/Tt64y
 kAv2VtYRN2jAWJ2Z5vIhCAZBZeuwWsqdMkbTRzb2H+RmLGp3l73PnwKqnkY4LDQLlprt
 Tp7ndsKO0FZRI4tVoIy0vgJxge+xLXizUjNcFCF7BS8zZL7pJwXfiS9A2jo340l9VdOX
 VbOQ==
X-Gm-Message-State: AOAM533yxaLtKR6CoO29zDicBqz913VuGlc+vpXPsBNcUii4E/n6Sjok
 stenhlq0Xetjt6d+9xIee67Zr2TlzORbByd1
X-Google-Smtp-Source: ABdhPJzLfxQVlSZpOgb9LiTsrCSZFYzf4P79/Z1lC1gPuNqQ3yFGOLJ+QGvO1fjgeFNSuQKJw/TF3w==
X-Received: by 2002:a62:ac06:0:b029:1cb:35bc:5e2c with SMTP id
 v6-20020a62ac060000b02901cb35bc5e2cmr5690416pfe.42.1612403128026; 
 Wed, 03 Feb 2021 17:45:28 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/93] tcg/tci: Implement INDEX_op_ld8s_i64
Date: Wed,  3 Feb 2021 15:43:43 -1000
Message-Id: <20210204014509.882821-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: sw@weilnetz.de, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

That TCG opcode is used by debian-buster (arm64) running ffmpeg:

    qemu-aarch64 /usr/bin/ffmpeg -i theora.mkv theora.webm

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20210128020425.2055454-1-sw@weilnetz.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 2ba97da189..c3a8511dfe 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -883,7 +883,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg8(regs, t0, *(uint8_t *)(t1 + t2));
             break;
         case INDEX_op_ld8s_i64:
-            TODO();
+            t0 = *tb_ptr++;
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_s32(&tb_ptr);
+            tci_write_reg(regs, t0, *(int8_t *)(t1 + t2));
             break;
         case INDEX_op_ld16u_i64:
             t0 = *tb_ptr++;
-- 
2.25.1


