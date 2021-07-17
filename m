Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB223CC6A8
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 00:30:35 +0200 (CEST)
Received: from localhost ([::1]:37666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4spO-0004Oc-6h
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 18:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4seD-0006xk-RW
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:19:01 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:37591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4seB-0001zs-D6
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:19:01 -0400
Received: by mail-pg1-x533.google.com with SMTP id t9so14558475pgn.4
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 15:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mOMfbSr7dP2LtForXHD7QhzKF/cyMbvAW5OerGJ5K/M=;
 b=bfcl9CDi26J7MiZXUkagOXNTrZT/eYbYlWvktchcemB+3ANs0MvTFXJo4Gao4K/HqF
 /Ku8l4YfLLhUNMRo76nhWUf6ADo07jDTfQGFmUjziTxr5Bz1dHCBH+BpvybNF6HqQpiF
 glTY5iWrjzF+Klc6mOAepZp3hCd56nyeEJ6Y3HZp7RH35L4CTZY+T5fDZSEHLtMt95hy
 EmrP1lfKZ/pouLZl1iEyjEE3rjlat76A9fjEEQGNeHyzonRcIkaDtey0cypYnYn59Mtc
 pAnnq+j8exjUgrQzeG3U9/f0mlQnh681aemWRiy4yD0TZizUQVbuy4QbcBzIVhPqr3xg
 Y3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mOMfbSr7dP2LtForXHD7QhzKF/cyMbvAW5OerGJ5K/M=;
 b=gWxbQvhNl5/+LcQ0eJ5oZyJQ+CnpIlsf8agy48Lk9rWVz5Fv4JZ/DkuBUV7fC045Yu
 5Smd1RDHBINffeNV0HiQkwt3E4qD9ulOOfG3+D4j7Ujdt8qYY800V5OoFj0pR8/nzpvx
 O5E2DfnsPb4pl2qI6NUXG/gNvG826rFY/Xs2/hdk3+B4OiJgtWhtLVwxBsxiLYtuR4N1
 nQnjqI3VC/Xg5loLvB7i3zmZKd0Yg1UV84PQPXWCzxbGDnfxJdPCzb+2PNyqP1duayla
 IR4LxMvnRiojSFBQuiT7VZRZaXNH4xD7VE7GcUvXQBzv9CYv1Gl2kecNaZqadotJeENW
 +lAQ==
X-Gm-Message-State: AOAM531sW1bgAhD+kCpG/HiTJaH7zPRCzxbc00Eu225z01ig/SU5dZae
 Y94OP3osSr/glbRHCmHZItIoT5GTXNdCSg==
X-Google-Smtp-Source: ABdhPJzpyBUzg5Wm/K1FTYAvCSj/tX+bENSreupC9pGDQrwQ0E4n/PLxcJbxYeiWGrwpmxGzOXlxhw==
X-Received: by 2002:aa7:9541:0:b029:32c:cefa:123f with SMTP id
 w1-20020aa795410000b029032ccefa123fmr17171474pfq.24.1626560337756; 
 Sat, 17 Jul 2021 15:18:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id n14sm2405091pjv.34.2021.07.17.15.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 15:18:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/13] target/avr: Advance pc in avr_tr_breakpoint_check
Date: Sat, 17 Jul 2021 15:18:46 -0700
Message-Id: <20210717221851.2124573-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717221851.2124573-1-richard.henderson@linaro.org>
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since 0b00b0c1e05b, tb->size must not be zero.
Advance pc so that the breakpoint covers the insn at the bp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index 8237a03c23..d768063d65 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -2950,6 +2950,7 @@ static bool avr_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
     gen_breakpoint(ctx);
+    ctx->base.pc_next += 2; /* advance by minimum insn len so tb->size != 0 */
     return true;
 }
 
-- 
2.25.1


