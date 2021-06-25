Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D90B3B4126
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 12:10:06 +0200 (CEST)
Received: from localhost ([::1]:44102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwimj-00015x-7A
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 06:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi49-0004jM-Ls
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:24:01 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:55145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi45-0001lS-Oj
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:23:58 -0400
Received: by mail-wm1-x32c.google.com with SMTP id u20so629737wmq.4
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WwdNN5kZV6nSH6AN6jmAvVVXJTDQlT1EEV5IustrciY=;
 b=Z4nJYjhuwtboGaNEHTYeeVwyneAGl4JaXan5YccRBwcmRZy3EhHdw/oVuTYcjZ0eM9
 NOzRMeOys5XZD70MnQH404fdY5x5rnBdtmQzUzjTLQiUEjO3SAt+J3fLcxXkzlODkUsw
 XF9BLLNDrfhgzShSmGoLdc8YSnvswXdEzOV8uBRMvfYoED3+BpviDTrm4JNaTdr4vDN3
 XhG05hsevSI7qGlF6yMI+fviQzduf3emOp8csqV6JvGiRXJ1cEYxGLJZjKCv25Hr2TxV
 e6jbcJEwwksL6KORCHGMam82ftXZGkAQoBdRyhhTuj8GF2jIvGOxT0EqBXad/FkjSTp6
 knlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WwdNN5kZV6nSH6AN6jmAvVVXJTDQlT1EEV5IustrciY=;
 b=Cqbh2pThM4UGK518n3pfON8d84NF9jWTKgQPtSKYBTVo6mWe4ZtPhjVR9upRUcprtF
 rJkFQ5n26BNph/q6Hi35oBe7zawerdghnwJidBZzpzXd9FlrrR7dDrCbzqXAx7Q1fDav
 tCmwv5krMAW1JU/+WA3Ble8GmHOEmPwFYiGD+nHHQvNfLZxpc/9+IT9DULdjxHj3ZRur
 61pZu/qsaxEkCcbiorF6AizWXp3MNNkTBMj0mIsv7PHTcQCDBs386Ss5XyMNAWOxCGIU
 kjbkQ+ByLUxmAxCjVtrrSAY4g5vrrMaT4xfo9BB6/t5sngVyJkKCOCl76JGBJqRPiCB2
 lKAQ==
X-Gm-Message-State: AOAM533TN3fM/53rSf4CgOIH180TvcylinP6d9aXbLi+j94oMlm+2r6R
 XR1nt2VCmTHo1EoA0oiTCRsu0CO8EXj2/A==
X-Google-Smtp-Source: ABdhPJyrWsp/NIkdhZK5ZdI4acH0v61Ub743RzxxNuwgrdIJ7mQC6EpEwe6H5ELUwWuD50LJ2GpwxA==
X-Received: by 2002:a1c:1f54:: with SMTP id f81mr9250063wmf.121.1624613036258; 
 Fri, 25 Jun 2021 02:23:56 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l20sm5193943wmq.3.2021.06.25.02.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:23:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/15] target/mips: Do not abort on invalid instruction
Date: Fri, 25 Jun 2021 11:23:19 +0200
Message-Id: <20210625092329.1529100-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625092329.1529100-1-f4bug@amsat.org>
References: <20210625092329.1529100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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

On real hardware an invalid instruction doesn't halt the world,
but usually triggers a RESERVED INSTRUCTION exception.
TCG guest code shouldn't abort QEMU anyway.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210617174323.2900831-2-f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 3fd0c48d772..4b7229a868a 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -12151,8 +12151,8 @@ static void gen_branch(DisasContext *ctx, int insn_bytes)
             tcg_gen_lookup_and_goto_ptr();
             break;
         default:
-            fprintf(stderr, "unknown branch 0x%x\n", proc_hflags);
-            abort();
+            LOG_DISAS("unknown branch 0x%x\n", proc_hflags);
+            gen_reserved_instruction(ctx);
         }
     }
 }
-- 
2.31.1


