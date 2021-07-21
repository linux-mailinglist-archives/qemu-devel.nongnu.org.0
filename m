Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533703D094F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 09:00:02 +0200 (CEST)
Received: from localhost ([::1]:33838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m66D3-0001xO-7f
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 03:00:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vw-0005DK-PP
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:23 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:45770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vv-0005gO-Bs
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:20 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 h6-20020a17090a6486b029017613554465so445597pjj.4
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=busu5UKD/aLT5lG+3mLQc6ZgBAZSFxZi1JDubmEFxEw=;
 b=MZKV0YGB0ov5YHY822tWA9OTZqW5CbQfmx4qY7jYguUj9D2k0Y7x9smvxrBZdTx24k
 T4g2FW9KjxfFlRmSCfhYhwBOXSsoDaK/ehnoXsrEqsH0QMtodCtz4tVbgQUc1V1gO2yz
 pb3igkv5R8+3UhZG9plQrzMYxtxjen9w7pc/xPqg8znnBRLwpCws8/1VJGlFb2ATQxYg
 eyeswEfr0q0acsPhXPW0f5OFFBKOWxrCgoiVFUwkkrmIb56h9Kl/gXXsTc1cLqMATPAu
 23d+tED7uuARthyeFAiN3rYHZUs/kfke3LBjCm6zXamUc2qYbAU2xbE5ZvvENrPEl6mB
 2h5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=busu5UKD/aLT5lG+3mLQc6ZgBAZSFxZi1JDubmEFxEw=;
 b=sT9zXCQk2IQSwriPGgl7TWZ40HgJRaOtir34zQ7ckSvxYDXvlQN6Xcxh6xngGtDbAg
 YRi4KWQFT6p3gqPQqCIoQKJobg9uMnC0CIPlu9B8n3e0wi2cq/D2U97PxUysIOoE+l9Q
 oX61/w/Rozbsd241H7fDGKG/My+9M0SGX0RyKPq+dyWVWfZsgf4fIxLbdmpoMxIM8tGu
 cXapsLO7hE7nSEh5I+ZiAtliFSnlqwauicn8yIiREUkR8xHwKj40sHZNmoWiZPVBMBxp
 RHAxKRlHL61Sow0ezP8ViZ3XDRv66GMBX9FbDcLXAL7q5xFLQHCZoF+8Ni28xlNHudyB
 SPFw==
X-Gm-Message-State: AOAM53305w+k4AJVrUyVQZKhimUjO4kJI58JkqsaybAm0u+WirRzAGo2
 djw+3CpdZB307J64riLsZTazwy8UtJOwJg==
X-Google-Smtp-Source: ABdhPJwNPONsoYZjWbL0xkauDYyL/OhP9UCKuKMp4Fttl6FqK0FAFEpdYYmwYViwSjCX9bynjSLMYg==
X-Received: by 2002:a17:902:c246:b029:129:b2e0:be90 with SMTP id
 6-20020a170902c246b0290129b2e0be90mr26835416plg.84.1626849738125; 
 Tue, 20 Jul 2021 23:42:18 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.42.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:42:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 20/23] target/s390x: Drop check for singlestep_enabled
Date: Tue, 20 Jul 2021 20:41:52 -1000
Message-Id: <20210721064155.645508-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
index 0632b0374b..1894ed7a66 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -148,7 +148,6 @@ struct DisasContext {
     uint64_t pc_tmp;
     uint32_t ilen;
     enum cc_op cc_op;
-    bool do_debug;
 };
 
 /* Information carried about a condition to be evaluated.  */
@@ -6541,7 +6540,6 @@ static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     dc->cc_op = CC_OP_DYNAMIC;
     dc->ex_value = dc->base.tb->cs_base;
-    dc->do_debug = dc->base.singlestep_enabled;
 }
 
 static void s390x_tr_tb_start(DisasContextBase *db, CPUState *cs)
@@ -6588,10 +6586,8 @@ static void s390x_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
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


