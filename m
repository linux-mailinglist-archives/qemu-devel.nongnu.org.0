Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA47269D31B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:48:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB86-0005Z4-Jq; Mon, 20 Feb 2023 13:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6d-0004ew-MS
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:47 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6b-00046G-Ci
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:42 -0500
Received: by mail-pj1-x1035.google.com with SMTP id 99so2303355pjz.4
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cyCAXVLuk59H/kOzKITUKZ8TOliuBbhdnYn70YklQIk=;
 b=yeypxRVOtKU15KFfWrff21y2gbV/sOzhvCDSQ/1kHRyH9bNQTR4LNSP1zajfHbRLT7
 bpOHYIJyWVhmoS4jDK3YVCeWt0CwdEihwFmsYMD6IZgd0EfjHFtGu0zqtPketTdsHY27
 kTJMtZiUbhwqL0//DxA7Rf10m5PQWaoS9fxrCUzncUrR1mgt1FsuurwB+iSVdVslME8K
 iMKrXpht9UhRJmKaWxPDcw0HBepaYKkSoFZaR8tsOMfPiIzygNrji/Yr9/ZARZQOwMeF
 4F2wLzQnsSEQrS5U7llUqYNwf0u5AB9LYKT9EiqcuAv+5TOQ+1lYUaZyeE/6UdNA89CU
 nz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyCAXVLuk59H/kOzKITUKZ8TOliuBbhdnYn70YklQIk=;
 b=C+8WuUZt6VvZoSIj/nK0tclgnF/nT2MVb7F5R2BeekKrUTsllN7xPTU+JB06fLYmqO
 BTl8nPjhU11mW9xuyDX55xxA+JU/v4Hxpsja/LRXG31vH24GTsmGQLo8W2BELrORGELl
 gSnMSLbGx9TX2Vye3uL+SlrCAM7o55kSGWBz3k6Gpve74KWgr8wHB+NQqyiTqfJ0MyRr
 gm1I19tmTlitjuogC7O4tB8q6JTXXH0tO6bjFNK/M3bW0mbxs0w2fk6lHx/HwxUJmZq1
 5YP32FJQEexTOuiyyPLa7Nfr4+qZfeDstPJTVCY9LaONKc8v/PWH2c/des/Y4GjF8RHU
 T3ew==
X-Gm-Message-State: AO0yUKWmAp4RCW9VMKytrnXz+3m5+P1+2cy4BCz8v5nfmHMBcHq7G3Bk
 vInjpJlmrQBr3QwAN78f9eQTC07GfcfuAFNAK1M=
X-Google-Smtp-Source: AK7set+JNb+zoDodmoB2K7zfhpnTxT8M2j9UD7fPqBlItfSauzcbkiZaJENeHbACTK+qAa2Y3ulTrw==
X-Received: by 2002:a17:902:e745:b0:19a:acc2:73e4 with SMTP id
 p5-20020a170902e74500b0019aacc273e4mr3497979plf.22.1676918498211; 
 Mon, 20 Feb 2023 10:41:38 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:41:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 23/27] target/s390x: Remove PER check from use_goto_tb
Date: Mon, 20 Feb 2023 08:40:48 -1000
Message-Id: <20230220184052.163465-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220184052.163465-1-richard.henderson@linaro.org>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

While it is common for the PC update to happen in the
shadow of a goto_tb, it is not required to be there.
By moving it before the goto_tb, we can also place the
call to helper_per_branch there, and then afterward
chain to the next tb.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 8fbbbf8bbd..24d8d84727 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -669,9 +669,6 @@ static void gen_op_calc_cc(DisasContext *s)
 
 static bool use_goto_tb(DisasContext *s, uint64_t dest)
 {
-    if (per_enabled(s)) {
-        return false;
-    }
     return translator_use_goto_tb(&s->base, dest);
 }
 
@@ -1173,15 +1170,16 @@ static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
         per_branch_disp(s, disp);
         return DISAS_NEXT;
     }
+
+    update_psw_addr_disp(s, disp);
+    per_branch_dest(s, psw_addr);
+
     if (use_goto_tb(s, s->base.pc_next + disp)) {
         update_cc_op(s);
         tcg_gen_goto_tb(0);
-        update_psw_addr_disp(s, disp);
         tcg_gen_exit_tb(s->base.tb, 0);
         return DISAS_NORETURN;
     } else {
-        update_psw_addr_disp(s, disp);
-        per_branch_dest(s, psw_addr);
         return DISAS_PC_UPDATED;
     }
 }
-- 
2.34.1


