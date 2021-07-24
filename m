Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6083D47F8
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 15:53:28 +0200 (CEST)
Received: from localhost ([::1]:38718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7I5n-0000FT-Rw
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 09:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7I1d-00053Y-Ta
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 09:49:09 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7I1b-0000kZ-K8
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 09:49:09 -0400
Received: by mail-wm1-x32d.google.com with SMTP id o3so2436461wms.1
 for <qemu-devel@nongnu.org>; Sat, 24 Jul 2021 06:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mytq3FrMkJT4bae7M6CVd7ijJpQEo6Jjbs+BMV7IiMY=;
 b=CQCbLcNbRjlBmNOIvrysla2/eEtJs9KuJ9Wf+KaRQc2JXyBASsOO1jZhmVJOlXKkIw
 gbEMphjyCPWpguqOz02HxFf2Mh3kLy8KzCibZs4fCsi2wMloLzpljXzcKB0Z2ABYSSSn
 of+lIJTbELyQJ/40BiGkp1MNz6vgmdJfEaaVCgwuRMR+MlSp5D4vGLmaR9ZCZUgDLOPe
 IoYCrnaIn9IEyY7DDrPZhiHXyOmP+rFlXywSnltqXnNC6J1PwcDdPDtBZUfr7yvanpLh
 KVH1qv1UIx2w2Ek9NtijuO8i3zUjybwaWrHe+IExR7nrGARtPN6HBzldY+aulb2/4KEe
 HGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mytq3FrMkJT4bae7M6CVd7ijJpQEo6Jjbs+BMV7IiMY=;
 b=scLwzdssjeMchtMDsBFCoL4CG0umhhO9MtktqYw1AaYD1+WyTZ1MLZon/2rYERs0xT
 2a+clQ9OqtmelUf+HiSwRx32fa7hBrtWdozI7FUA5M5LiHPf0M5FePCSQQRT2bnbTW6k
 TdH+/bl0s7SwACCGO1ARa4JiflybbIggWYTWHNLTECtzi75P4l4DtiPzI4IXdJcKAhn/
 FMBQhDPE0+EW5NixkA8gFew1U8gTec3A4O8yaMQ3D+gpthXK76xLGQfJGDFoDf7nN9aT
 rs/vSTBBZRuKu2NmQ/yOdWGUvj/StDkng7xlPHPE+/z+YUees8OPrTt/WYoxM4FpY74p
 MeQQ==
X-Gm-Message-State: AOAM532PqpbeNdYjex0dCwnt3pRmmIR+DRhKGvgmt4Pd/+2sExnj/3nv
 pXsq6Y5E9SpMw+/m/x8fTK5/Ni66lcg5QQ==
X-Google-Smtp-Source: ABdhPJxftIf9RUsWxIYAdemyTk8dLdWuxGYQNMxA8HB9kGvYE9g+ltRVQpNbc9iEycTuS61KiiFcig==
X-Received: by 2002:a7b:c5c8:: with SMTP id n8mr18715359wmk.124.1627134546311; 
 Sat, 24 Jul 2021 06:49:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n5sm34690344wri.31.2021.07.24.06.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 06:49:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 2/2] tcg: Drop gen_io_end()
Date: Sat, 24 Jul 2021 14:49:02 +0100
Message-Id: <20210724134902.7785-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210724134902.7785-1-peter.maydell@linaro.org>
References: <20210724134902.7785-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now we have removed all the uses of gen_io_end() from target frontends,
the only callsite is inside gen_tb_start(). Inline the code there,
and remove the reference to it from the documentation.

While we are inlining the code, switch it to use tcg_constant_i32()
so we don't have to manually create and destroy a TCG temporary.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/tcg-icount.rst |  3 ---
 include/exec/gen-icount.h | 27 ++++++++++-----------------
 2 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/docs/devel/tcg-icount.rst b/docs/devel/tcg-icount.rst
index 8d67b6c076a..50c8e8dabc1 100644
--- a/docs/devel/tcg-icount.rst
+++ b/docs/devel/tcg-icount.rst
@@ -92,6 +92,3 @@ When the translator is handling an instruction of this kind:
     }
 
 * it must end the TB immediately after this instruction
-
-Note that some older front-ends call a "gen_io_end()" function:
-this is obsolete and should not be used.
diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index 467529d84c5..610cba58feb 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -17,22 +17,6 @@ static inline void gen_io_start(void)
     tcg_temp_free_i32(tmp);
 }
 
-/*
- * cpu->can_do_io is cleared automatically at the beginning of
- * each translation block.  The cost is minimal and only paid
- * for -icount, plus it would be very easy to forget doing it
- * in the translator.  Therefore, backends only need to call
- * gen_io_start.
- */
-static inline void gen_io_end(void)
-{
-    TCGv_i32 tmp = tcg_const_i32(0);
-    tcg_gen_st_i32(tmp, cpu_env,
-                   offsetof(ArchCPU, parent_obj.can_do_io) -
-                   offsetof(ArchCPU, env));
-    tcg_temp_free_i32(tmp);
-}
-
 static inline void gen_tb_start(const TranslationBlock *tb)
 {
     TCGv_i32 count;
@@ -64,7 +48,16 @@ static inline void gen_tb_start(const TranslationBlock *tb)
         tcg_gen_st16_i32(count, cpu_env,
                          offsetof(ArchCPU, neg.icount_decr.u16.low) -
                          offsetof(ArchCPU, env));
-        gen_io_end();
+        /*
+         * cpu->can_do_io is cleared automatically here at the beginning of
+         * each translation block.  The cost is minimal and only paid for
+         * -icount, plus it would be very easy to forget doing it in the
+         * translator. Doing it here means we don't need a gen_io_end() to
+         * go with gen_io_start().
+         */
+        tcg_gen_st_i32(tcg_constant_i32(0), cpu_env,
+                       offsetof(ArchCPU, parent_obj.can_do_io) -
+                       offsetof(ArchCPU, env));
     }
 
     tcg_temp_free_i32(count);
-- 
2.20.1


