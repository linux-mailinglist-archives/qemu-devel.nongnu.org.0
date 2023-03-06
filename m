Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985296AB3E3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:47:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyxd-0002L0-Pk; Sun, 05 Mar 2023 19:44:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxC-00011G-Oq
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:43:55 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxB-0007Hy-5w
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:43:50 -0500
Received: by mail-pf1-x42c.google.com with SMTP id fa28so4695015pfb.12
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X9KIPxCrunV2S78W8FPPVPGXh4a3tckfVvKKq9miWb8=;
 b=RQY5pofEM22Yc7mndrBU7wCuMCPV+DdnfJ2av5OErf+/2KDvgbqSKZDxd5Na7HbEP6
 wJDr+aRuy6d3kys2Yk0xpnuQVPW6yJTVxoTIagflUfi4ngX4QGsEwV88gHjwbfKmPozC
 skstaecFnJAi0pBsVVzCJ6qWCIF1yJT2EujOfPt/HkHsEGEVw+L5MBD/Tjm3kP50MXCW
 iSF8ov2QZFg3gXWHHY/4imMWJh64adgxMsvC4ncD7gwgtggz2+8TlkeEb5QjEzgRRty1
 1joJeaTussy7oQ0lb+PSWfPDmWdwIqzGbwFbJrYtfzJHNUNwMKUtZj+rrpgz9QLpAcJn
 w4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X9KIPxCrunV2S78W8FPPVPGXh4a3tckfVvKKq9miWb8=;
 b=mYj1yoiisXkOeK0s+foRw1bVTSxDvykrjo1W2exP8meDpOItCiootGfwActjOQLwre
 1CbdQOnk3G1dR04DbSk/g5yQ1y2mhrVPNrPjh1bKd6M2PqjJvYaAwJDtgNoxdGvSyjye
 TZMagvtdtPd0YxB8dszD3oWcWgrMb2zxKzdCMBwItLGY9dKVTFWHpetfH4iNWtWvyUe8
 PTVCt6dVdBvVqRD1+16Kimh+7yPDBWu3h9rkjHAoNCupkVjb0DiEing04LLI1HlLsxhW
 jB3Vz/FLcDW9KhHOC510NMjHYs+I693VSkJ5Ztx++mWTsGwT1qJt1eRRdrp3lNrRvY3B
 Z2eg==
X-Gm-Message-State: AO0yUKUaN1buk54Nt/VfAxGxH42iY2oLlwdm4gmL7ZB2O8fGlla0JDKj
 tEGhVbaTasWdHTwCtvkT6haHi1ZRgNe8zpZKU/GaBg==
X-Google-Smtp-Source: AK7set+3ezabI+hS/qacAewfvB1HWB8P6JRDHg6VjI8W2/Mo1Cvl3cQvwolcurKcv+gnjPGVQG/yUw==
X-Received: by 2002:a62:7905:0:b0:5a9:c75f:bcc4 with SMTP id
 u5-20020a627905000000b005a9c75fbcc4mr10928901pfc.25.1678063427182; 
 Sun, 05 Mar 2023 16:43:47 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:43:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 57/84] target/sparc: Remove egress label in disas_sparc_context
Date: Sun,  5 Mar 2023 16:39:27 -0800
Message-Id: <20230306003954.1866998-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index a20426202e..560fb32e28 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -5727,32 +5727,31 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
         dc->npc = dc->npc + 4;
     }
  jmp_insn:
-    goto egress;
+    return;
  illegal_insn:
     gen_exception(dc, TT_ILL_INSN);
-    goto egress;
+    return;
  unimp_flush:
     gen_exception(dc, TT_UNIMP_FLUSH);
-    goto egress;
+    return;
 #if !defined(CONFIG_USER_ONLY)
  priv_insn:
     gen_exception(dc, TT_PRIV_INSN);
-    goto egress;
+    return;
 #endif
  nfpu_insn:
     gen_op_fpexception_im(dc, FSR_FTT_UNIMPFPOP);
-    goto egress;
+    return;
 #if !defined(CONFIG_USER_ONLY) && !defined(TARGET_SPARC64)
  nfq_insn:
     gen_op_fpexception_im(dc, FSR_FTT_SEQ_ERROR);
-    goto egress;
+    return;
 #endif
 #ifndef TARGET_SPARC64
  ncp_insn:
     gen_exception(dc, TT_NCP_INSN);
-    goto egress;
+    return;
 #endif
- egress:
 }
 
 static void sparc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
-- 
2.34.1


