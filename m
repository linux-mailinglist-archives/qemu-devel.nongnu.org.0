Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AE73D713F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 10:32:48 +0200 (CEST)
Received: from localhost ([::1]:50772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8IW7-0006Xa-CF
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 04:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8IUD-0004NM-N6
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 04:30:51 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:45994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8IUB-0001Zf-Cw
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 04:30:49 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 l11-20020a7bcf0b0000b0290253545c2997so1732054wmg.4
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 01:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bx9rcOX35rfIqCbITWYIOrgp+fgLyxODd4hlNmjUlrw=;
 b=X6JcyK2FddbeT53nfI/jOXDZ4awiLnFk4SjqABeSt7dr2yYXCg6tpqS84HxN8BIs8T
 kVair6PB+ZaptKYrP0LfpYaBpqhtuhkAYkcVH3yuPzezEmWG+bUH5pJ4rTxCqio/YeTf
 ro20P2soRAKGeEdwXx49tiOZeLnV8qC5D/PTyBjKAAP9sCZcWpqCo2a3hTL/kT3k2YuO
 CwS7GHIGDuJfVkuEvV9iCokvjFIsfMvHZcetB8ZryVkDXDr4591KgXnFRwCHmQ+9YmZl
 npqX7FRMYCEi0OjkiNQvcP4HX2luHGdvRvjwM4hORbN1r6zXnaPoBPTM6+D8ef0RSW4V
 qKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Bx9rcOX35rfIqCbITWYIOrgp+fgLyxODd4hlNmjUlrw=;
 b=O9aDSvDe5AEXw29ii+UDgE58UKcdNqtJKE8rJki2gefkCZg2WG7Xw8udJbZ3bOIOJA
 X7ZKtZLJL7DwDN8y73Znr3EWOwY6owyIlyo6KtFW0k9lYA/2mUv9gBTP53lbEk+87EFP
 VsXq7BeCh0PLKmWHcDtlmyXvhCnzLOXMj1OUzGGoqYakxhPmCkoLFED60Co5CYTUN/wQ
 bDu3cej0be888/q42KtwoLlqS8wBmtlYPv+hoanjhI1or7qu+QdMTnxZmwwf6MWJ8IHe
 nvegwquR//14eG98zNSGtHgnCfO17y0ZiUu8baXumpPs259nILwzqv15nbzFgRqnFSzi
 5Mfg==
X-Gm-Message-State: AOAM5337OP5Mnik0l+IaPCoCDhjWPTbI2CtiQbShHOUSPtX7z7Yd0cYi
 7SGIjnbjTyti3KouD4n5GwPZGBqww+yk8w==
X-Google-Smtp-Source: ABdhPJxhSWtGleQLCcn7okxPUAfgWpVByPBeiSo9cSeR05GFkcke/r+hWnkpK3FI7NSyNwrjEqChrw==
X-Received: by 2002:a7b:c089:: with SMTP id r9mr2906081wmh.149.1627374645600; 
 Tue, 27 Jul 2021 01:30:45 -0700 (PDT)
Received: from x1w.redhat.com (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id z17sm2342943wrr.35.2021.07.27.01.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 01:30:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1] target/mips: Check nanoMIPS DSP MULT[U] accumulator
 with Release 6
Date: Tue, 27 Jul 2021 10:30:43 +0200
Message-Id: <20210727083043.1504402-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the "MIPS Architecture Extension: nanoMIPS32 DSP TRM" rev 0.04,
MULT and MULTU opcodes:

  The value of ac selects an accumulator numbered from 0 to 3.
  When ac=0, this refers to the original HI/LO register pair of the
  MIPS32 architecture.

  In Release 6 of the MIPS Architecture, accumulators are eliminated
  from MIPS32.

Ensure pre-Release 6 is restricted to HI/LO registers pair.

Fixes: 8b3698b2947 ("target/mips: Add emulation of DSP ASE for nanoMIPS - part 4")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/nanomips_translate.c.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index 09e64a69480..1275e6a495e 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -1868,6 +1868,9 @@ static void gen_pool32axf_2_nanomips_insn(DisasContext *ctx, uint32_t opc,
                 TCGv_i32 t2 = tcg_temp_new_i32();
                 TCGv_i32 t3 = tcg_temp_new_i32();
 
+                if (acc || ctx->insn_flags & ISA_MIPS_R6) {
+                    check_dsp_r2(ctx);
+                }
                 gen_load_gpr(t0, rs);
                 gen_load_gpr(t1, rt);
                 tcg_gen_trunc_tl_i32(t2, t0);
@@ -1925,6 +1928,9 @@ static void gen_pool32axf_2_nanomips_insn(DisasContext *ctx, uint32_t opc,
                 TCGv_i32 t2 = tcg_temp_new_i32();
                 TCGv_i32 t3 = tcg_temp_new_i32();
 
+                if (acc || ctx->insn_flags & ISA_MIPS_R6) {
+                    check_dsp_r2(ctx);
+                }
                 gen_load_gpr(t0, rs);
                 gen_load_gpr(t1, rt);
                 tcg_gen_trunc_tl_i32(t2, t0);
-- 
2.31.1


