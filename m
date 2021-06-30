Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504B53B889A
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:39:41 +0200 (CEST)
Received: from localhost ([::1]:49440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyf7c-0005SD-Ch
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0q-0005NZ-SK
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:40 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:35451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0m-00021v-1V
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:40 -0400
Received: by mail-pg1-x52d.google.com with SMTP id v7so3207713pgl.2
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pZJo4XGYgbkEYhOyx8VRv2KPcpMmqSnPo9gCdL2MX1E=;
 b=YezUgflhWFt0Qe4stCT2eaMShNkYH7l1CHtm16KxDiXgO3YzbIPVVxzoeOD3CtanzO
 eaw4UuGL4u5d1Gec1+YjRBRcjoov9SUl7IQN4QKiLiVdjBRiK9+TG033GrvcZ9N1ipB7
 8PeSVbwDU2zRg7z581oYPFmojor00jDmsr55oIIFTZJXfEd7CKnwWNHmhlRE6Bp4r3b6
 52DzD9aWGXBUgYM5tBAoHqMg5u0aVfxg3fLqnpqhH4YxmD722Qz4dNIa9KLcK3emmKN8
 daQfhGWfeLJz5Yn6dGcAccDIsfaqUGsTbBvj303ilCxhoo2vhrL+LFIExq8HguEUJD5x
 1p5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pZJo4XGYgbkEYhOyx8VRv2KPcpMmqSnPo9gCdL2MX1E=;
 b=cd8m3dAuTmLM1FbpJwa4JpK2t5GXVkrl8XkHFBSd+urokw1pZ9a4EuOJ+fSC18dkkD
 pQ/AERH4aA7UlbH+jS8P1jOTuMjI4Jih5PGu7pfciM0HudoUfas+kF+n88c5N1cllaBu
 7ms3x3QsExJgO6ZejjarBetSeK4I5q+WpAWj7uHkxn7+bFC2Aq2q8uMTThd/l+N22iHV
 pMmWrnu0TUviKiNeJJ5h1g4kOIxJEGp+MjLSujf8MkGqP0BjB8raKy05l7CqtldxHSvc
 4Oi25Ai2O95F/cZuI4VcaIevLEkL/GIgjSctSPJq9RBDE9z0Eo6HtOVX4Ns9CMrXfjQV
 h2NA==
X-Gm-Message-State: AOAM533+bF8tZM7a1DT1V8BgTJkLV9fK3ebLSnNtZVxuv6KEMkdHIHuB
 P/Li4ciNPaAW2waCj5VUV5HxPI7rM0139w==
X-Google-Smtp-Source: ABdhPJzt42rdOz+OAJF+muvXO03NkQfsoqo3HZ+YTZazvyV1Q3HKMZhmUlQmMb3HY6g004C2s3TeDw==
X-Received: by 2002:aa7:99ce:0:b029:30f:7bf3:594a with SMTP id
 v14-20020aa799ce0000b029030f7bf3594amr6020906pfi.34.1625077954842; 
 Wed, 30 Jun 2021 11:32:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/28] target/i386: Use translator_use_goto_tb
Date: Wed, 30 Jun 2021 11:32:10 -0700
Message-Id: <20210630183226.3290849-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b21873ed23..eb9ee0296f 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2314,21 +2314,11 @@ static inline int insn_const_size(MemOp ot)
     }
 }
 
-static inline bool use_goto_tb(DisasContext *s, target_ulong pc)
-{
-#ifndef CONFIG_USER_ONLY
-    return (pc & TARGET_PAGE_MASK) == (s->base.tb->pc & TARGET_PAGE_MASK) ||
-           (pc & TARGET_PAGE_MASK) == (s->pc_start & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
-static inline void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
+static void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
 {
     target_ulong pc = s->cs_base + eip;
 
-    if (use_goto_tb(s, pc))  {
+    if (translator_use_goto_tb(&s->base, pc))  {
         /* jump to same page: we can use a direct jump */
         tcg_gen_goto_tb(tb_num);
         gen_jmp_im(s, eip);
-- 
2.25.1


