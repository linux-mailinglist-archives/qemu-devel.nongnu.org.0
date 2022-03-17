Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C03E14DBE61
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:31:11 +0100 (CET)
Received: from localhost ([::1]:47082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUij8-0008Ao-R2
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:31:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiL7-0001Wo-4O
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:22 -0400
Received: from [2607:f8b0:4864:20::431] (port=42522
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiL4-0002Jc-Lu
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:20 -0400
Received: by mail-pf1-x431.google.com with SMTP id g19so5880030pfc.9
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QMOimEYkivNn0EOtJQFRq+oOiueoNqaCGaU7AEWQQss=;
 b=w8cHfXuZ59m/J9vdSO3pNTSArWiIyPaob0kRWyOu0faeophNEkWkabVs+LkY2n6Phn
 XLRt50mFA3Lir7Sxu/nM+Kv+PYV2LtHFoz7zO0gRzmTy9LbjY20p1xdKD/Axi2NRz3A1
 MnF+SjOCCYNrH3PgrNYkQkwlL+tBslmCOSq/C+itubHlr9zi9xjyHc57uix69J5UVxkW
 QSYTDjCmZ5VGqWONCJ3iBneHx/Gy448CUJfqgy8frG0IpP7AKqWXCd0LgaSJ3vwRxzou
 B4kEy0vrv+9+7j0+vst/7YzHbXLlEDUgfNjC83cGJgoIeGMxElTUaUvvp4cIQj2C/cPa
 or5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QMOimEYkivNn0EOtJQFRq+oOiueoNqaCGaU7AEWQQss=;
 b=jOu267CptxfZR3RilyQgF8+5EfRyJpQj0bpkYnRRVtvGjKcikxJ1MxiFf1ZZxh3vFB
 KLI1LZFDYGSL7VK+7BIVXqtEDlw3L3NMLwE3/BDF7+4YZnz/s6k8vAQS8e+jhvqMEQD4
 /fZWaQZhePx1DCrGaBIVcIsheSD33HYvflZxACo4mOZwtDJRPeDq0Rqwq7Vut/y79oS1
 P1wJx3ofKae/yVYDFhPpW8hPWZd6uYzOcHqXyK8ukEA9uPd6scBsP9v2AbntDpt8c86u
 xTzeZnN3vKEpQ3frDBVf0AulCmN1/JV8RUQiIzZMInAG+GPaPbm/9h8qcoxYtEClXxNU
 gx5w==
X-Gm-Message-State: AOAM533LAyJcq8G99cq96ig+v3jaeUg2NhGQoJ+0RjxKSmufr75CEkH1
 BSkwBhXa2bZb91miLaNw2W9rm8wsnnlM4A==
X-Google-Smtp-Source: ABdhPJy0PLP3RxWS9ML3MzhtDHERF112ZBwFE3zK/BGkJxRwfrrdD9GL2os7AQNV2Z226JraYVY8bQ==
X-Received: by 2002:a63:7b49:0:b0:37f:ed43:4fc4 with SMTP id
 k9-20020a637b49000000b0037fed434fc4mr2266518pgn.387.1647493576538; 
 Wed, 16 Mar 2022 22:06:16 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:06:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 38/51] target/nios2: Use tcg_gen_lookup_and_goto_ptr
Date: Wed, 16 Mar 2022 22:05:25 -0700
Message-Id: <20220317050538.924111-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use lookup_and_goto_ptr for indirect chaining between TBs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 6f31b6cc50..f7bab0908b 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -163,7 +163,7 @@ static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
         tcg_gen_exit_tb(tb, n);
     } else {
         tcg_gen_movi_tl(cpu_pc, dest);
-        tcg_gen_exit_tb(NULL, 0);
+        tcg_gen_lookup_and_goto_ptr();
     }
     dc->base.is_jmp = DISAS_NORETURN;
 }
@@ -174,7 +174,7 @@ static void gen_jumpr(DisasContext *dc, int regno, bool is_call)
     if (is_call) {
         tcg_gen_movi_tl(dest_gpr(dc, R_RA), dc->base.pc_next);
     }
-    tcg_gen_exit_tb(NULL, 0);
+    tcg_gen_lookup_and_goto_ptr();
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.25.1


