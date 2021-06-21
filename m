Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB243AE18C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:50:43 +0200 (CEST)
Received: from localhost ([::1]:54092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv95G-0002AY-Re
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8qC-00041R-Ch
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:08 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8pw-0005Cz-5G
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:07 -0400
Received: by mail-pf1-x42c.google.com with SMTP id y4so5415847pfi.9
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zAnCrHtff6jPTMINAA/XQ8amtOalFE7ZmPKzxH7D+ug=;
 b=DQX6H5NH4cdN8kyse3Yo0cyN0dcwF7TEuK4vsiLjL46JHZkD6OuwtGEq1qnMQDeZGW
 SFvRGpZdgc44acLwZMrkVlUBQG4+nA8dFo76b/GmPqcm16xqbf2ihM+m8ZUqEuaQURGP
 0FPCme85EE6jeq9gpndi990EUydGqkK+ZXGu6WIfbGfAi/XQeaNQbo5isBDCGqFSzanL
 l9K8fxV+35mGlTfuU3FQDDmpidSDFyEc6KBUY8KL6db3v/MbsEaSmoMyITJp6lGIKUKR
 6xIJFW4Jf30+b+Y9HdVGpmuYtEmTnwq4l9kT7h9oe/WjPb0jsMDhfhrq+f+856dYEsL2
 wXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zAnCrHtff6jPTMINAA/XQ8amtOalFE7ZmPKzxH7D+ug=;
 b=mTxznlGGOyLCCPpPhr5Wzb+YJs8TVeZwFW0x2+FQgznj+GyY0WQB/OLat6a+LDXTBF
 cxs2ToehLPP6a6HcP/YbTyvI2QVy6NnBy959ZZ9mJFRJOtf7onPyTqQKt9gNHMBQIIzU
 rDtNeoDqnuj6zB9JC1LRNJKlx9DsivsMQHSmgGLQDmyeHBcb4CHJSQXNpkJJRbZAHqco
 b47mg84lf48B7+wjHUsBCrW0MC40SgCREMgW7GrZGndVHiVH4DpHac9FoS2rV2oQgGVk
 qXaIc5BB93okEIgRb144hVlzmu/j+L5C7Pfb5VY/KL6TsDcxOAqcJNGsqs6skexZRkSc
 /fTQ==
X-Gm-Message-State: AOAM531uG9wLeT1nvSFszdDfYm3jTetlub/19AhtZY06XYVU5AuwTITO
 Eg41CvN47P1YwpRW0/c4PUm2KYqNW8BkqA==
X-Google-Smtp-Source: ABdhPJwgLG5kfumbUJv3RTjxnmWt7fd+KB7JJfujuil9qm/yGmmzkAohK0fhyoT87ypvrAKSXza+Wg==
X-Received: by 2002:a62:9203:0:b029:2f1:e21a:c545 with SMTP id
 o3-20020a6292030000b02902f1e21ac545mr16815929pfd.60.1624239290347; 
 Sun, 20 Jun 2021 18:34:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/26] target/openrisc: Use translator_use_goto_tb
Date: Sun, 20 Jun 2021 18:34:29 -0700
Message-Id: <20210621013439.1791385-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stafford Horne <shorne@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reorder the cases in openrisc_tr_tb_stop to make this easier to read.

Cc: Stafford Horne <shorne@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/translate.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index a9c81f8bd5..2d142d8577 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -1720,16 +1720,17 @@ static void openrisc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         /* fallthru */
 
     case DISAS_TOO_MANY:
-        if (unlikely(dc->base.singlestep_enabled)) {
-            tcg_gen_movi_tl(cpu_pc, jmp_dest);
-            gen_exception(dc, EXCP_DEBUG);
-        } else if ((dc->base.pc_first ^ jmp_dest) & TARGET_PAGE_MASK) {
-            tcg_gen_movi_tl(cpu_pc, jmp_dest);
-            tcg_gen_lookup_and_goto_ptr();
-        } else {
+        if (translator_use_goto_tb(&dc->base, jmp_dest)) {
             tcg_gen_goto_tb(0);
             tcg_gen_movi_tl(cpu_pc, jmp_dest);
             tcg_gen_exit_tb(dc->base.tb, 0);
+            break;
+        }
+        tcg_gen_movi_tl(cpu_pc, jmp_dest);
+        if (unlikely(dc->base.singlestep_enabled)) {
+            gen_exception(dc, EXCP_DEBUG);
+        } else {
+            tcg_gen_lookup_and_goto_ptr();
         }
         break;
 
-- 
2.25.1


