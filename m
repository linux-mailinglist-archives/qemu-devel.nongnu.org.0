Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1A94DBE9F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:45:57 +0100 (CET)
Received: from localhost ([::1]:44448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUixQ-0000d4-Dh
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:45:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiL7-0001Wa-0d
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:22 -0400
Received: from [2607:f8b0:4864:20::52f] (port=36732
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiL4-0002JV-Kt
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:20 -0400
Received: by mail-pg1-x52f.google.com with SMTP id t14so1810367pgr.3
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3YCeMoFSIPOtuFxyHW9qCFQJFQUeLRVbZvCIxi8q4XE=;
 b=Z3mfbAngkp6lthIsRFle+fvLdwO0oYWdwkU69JflJwXh4x2nojXHguUol/KMSZdXAA
 r02EnA+hVdvPi0qwl81m+Gcy7RjC7a+gN+xsTvhmxILoOA306I/c4SifBTDK/rbCDBc4
 nOHGhfUfAOp6V9w29Ii/Yz0FVdH1SkGyWxd210DPbK7M0EETy08iBhNOr6QPYh8pJnC2
 vX9ltqfZZI6foyPk77hrfTWcqlj84iOcah0UvFCZeo8v2KJSoikCNhm3F6lOokc1ytqX
 GtKbNwcy4uLu9wZNGcftxHNJEKuKOROfU9YlnDsNo0zBitDplPK3uQUU5IXCNdwdpiBx
 CHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3YCeMoFSIPOtuFxyHW9qCFQJFQUeLRVbZvCIxi8q4XE=;
 b=YJq92nonbvhsBGcHB0JIU778NBDT/yxs6nPbPQrpVsodoe+NJI/EbUp04hGFjey6Ak
 N0GzgmibTWODvr9WcWxUfAZ6JZjoHu9EgWz3wcKYQScuXQyiAQZfaxmhqpygSnxubgGg
 Te6QeKsC+yQDwRDKRt5+x0ay0cAjkoO37dNyxLplaQCYwo0+s/sIas4xOQZzJk9E8yAt
 6snJ9XowgeMD8RnBkdMC0DuvholbQyZvFSEwhuGmrPnmkCJTVw6DWGx04nan9Q4+pYbe
 s4Waf9pdV6eHoi5mG38wFfmCqYJ2i+UxKPf0hid/c1olKpdqJcog68iQ7VwyzrypXetV
 /U7Q==
X-Gm-Message-State: AOAM530Q+QMiyHegUWmmlInGDkXPBMDf+Dg50pfmBt2lnKD/CcUejXm5
 UzzkRht2GiLvoXB83rV5mNoy2XwKDI8wOA==
X-Google-Smtp-Source: ABdhPJyGKb4RA+4xkw+3svY/J7HzzHpolGvo0USEIx1Yxm19a53bWqoc8OYzuWgIqmu3ToPH4LAB0w==
X-Received: by 2002:a63:fc5a:0:b0:381:744c:9781 with SMTP id
 r26-20020a63fc5a000000b00381744c9781mr2321191pgk.158.1647493575764; 
 Wed, 16 Mar 2022 22:06:15 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:06:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 37/51] target/nios2: Use gen_goto_tb for
 DISAS_TOO_MANY
Date: Wed, 16 Mar 2022 22:05:24 -0700
Message-Id: <20220317050538.924111-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Depending on the reason for ending the TB, we can chain
to the next TB because the PC is constant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 51907586ab..6f31b6cc50 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -834,8 +834,11 @@ static void nios2_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     /* Indicate where the next block should start */
     switch (dc->base.is_jmp) {
     case DISAS_TOO_MANY:
+        gen_goto_tb(dc, 0, dc->base.pc_next);
+        break;
+
     case DISAS_UPDATE:
-        /* Save the current PC back into the CPU register */
+        /* Save the current PC, and return to the main loop. */
         tcg_gen_movi_tl(cpu_pc, dc->base.pc_next);
         tcg_gen_exit_tb(NULL, 0);
         break;
-- 
2.25.1


