Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C0642A9AC
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:39:16 +0200 (CEST)
Received: from localhost ([::1]:34838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKo7-0002i3-6W
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXl-0006qQ-NG
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:21 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:41488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXh-0004BR-Sv
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:21 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so55014pjb.0
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=md7tXLcF0ecrK6xLXX0Gaf8SSiO+KoPjDXsFC2Tw3gE=;
 b=O+qkl0iOTqjJj0oQS4GPG33LtmYyJ4spxoCxPs1Ih6oalkjNKTNnMZrtiDK6PcItj/
 jUtSOtpkCpWBXho3j1issk+g5qwpkbgQIS9FR74Ur7gxqV5pqnmuogU+D48RAMwDlIl+
 PgPJDz2+U1iqVL4lQNAuxIqygcQJOiyqqlbBK1r7X5/iXLI1kFSfKD7+Hbb/FnaG6eUp
 UXZti1X4EEOJRI+I9Vdh1iWgGoSL2phv2+98z45jIwWt5Vs3AEhVBB75JLJKdH442J2x
 HxqY0IqjQKIkJIiDCZbC7RjL8g+9wxoSWxynoTKJrxKRFaNd/ztDgqZPTSrnvNTvDG+E
 F7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=md7tXLcF0ecrK6xLXX0Gaf8SSiO+KoPjDXsFC2Tw3gE=;
 b=iGUYUFs+a8vLeA/TepjQBGdRe7fPqfHrFj3uMMZrfOFfuX21wNdwCHNTEafBUSjYLP
 n5TxReUqKj+x9MHQ0Ej/uERdvP3kYLqLHvSalQoy74uCoiEbcjVir86KejpEJwcscInV
 cVwxWOcE/+PAZDmYtuWfM9qfhkNQIux1fYCGL1n/BsRGXVsWKCzYaaMnJsgFe2ceT32x
 P9F6LfZw8soT9idNpovd58Wwk7w6qWPjHYsVAMc86SF3DHODoQIqDY2DdnogBHfJ34Dy
 6cyOhJwhgovqpgiqeqDHfys2+D9kzy3UagLTbuAnxm8c/2X3uhTwaC/Oogn+sk0uSS2R
 5kFA==
X-Gm-Message-State: AOAM533Y70C3NN3d6buOHImTBc6rW1xZxte7EpLg/y8ZcoW/le8BiHug
 hBlUtYGH1TJnjo/1Jp+d99e3zCztzdmcpw==
X-Google-Smtp-Source: ABdhPJxATHwyqHDmwueLE4MC+lI1xdDT8liMaBPgEyUFwUF70Khm8Dh2Qv4SXdCJ2VkiRKuBU4VwEQ==
X-Received: by 2002:a17:902:ed0b:b0:13f:4318:491a with SMTP id
 b11-20020a170902ed0b00b0013f4318491amr9656773pld.4.1634055736555; 
 Tue, 12 Oct 2021 09:22:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/23] target/s390x: Drop check for singlestep_enabled
Date: Tue, 12 Oct 2021 09:21:56 -0700
Message-Id: <20211012162159.471406-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index f284870cd2..0cbec29f2f 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -148,7 +148,6 @@ struct DisasContext {
     uint64_t pc_tmp;
     uint32_t ilen;
     enum cc_op cc_op;
-    bool do_debug;
 };
 
 /* Information carried about a condition to be evaluated.  */
@@ -6543,7 +6542,6 @@ static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     dc->cc_op = CC_OP_DYNAMIC;
     dc->ex_value = dc->base.tb->cs_base;
-    dc->do_debug = dc->base.singlestep_enabled;
 }
 
 static void s390x_tr_tb_start(DisasContextBase *db, CPUState *cs)
@@ -6590,10 +6588,8 @@ static void s390x_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         /* FALLTHRU */
     case DISAS_PC_CC_UPDATED:
         /* Exit the TB, either by raising a debug exception or by return.  */
-        if (dc->do_debug) {
-            gen_exception(EXCP_DEBUG);
-        } else if ((dc->base.tb->flags & FLAG_MASK_PER) ||
-                   dc->base.is_jmp == DISAS_PC_STALE_NOCHAIN) {
+        if ((dc->base.tb->flags & FLAG_MASK_PER) ||
+             dc->base.is_jmp == DISAS_PC_STALE_NOCHAIN) {
             tcg_gen_exit_tb(NULL, 0);
         } else {
             tcg_gen_lookup_and_goto_ptr();
-- 
2.25.1


