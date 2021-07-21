Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5BC3D0926
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:48:01 +0200 (CEST)
Received: from localhost ([::1]:56592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m661Q-0004D4-KA
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vf-0004yJ-Bd
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:03 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:40674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vd-0005LW-OU
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:03 -0400
Received: by mail-pl1-x62d.google.com with SMTP id j3so479804plx.7
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QqOz2OAJuUMwPzqIuUXnZ3o9P6oZ5KjPCS5w95lKMNU=;
 b=kfNC2JA5o1/emXw5GG78iOojJqrt6yiF/8TD0WH9echZeWbSGXmDQaka6uTZJd8nP9
 4GImG3AOQJt7V369ZPq7oNK8KpLQ3yFWkI0no4OdbIiPNbjUMtVZX68VHvj87Og/sVE1
 PTQ5S/N6d4Oi05V9rx7IuYAU6DBvm+jmKOWtwutLLvvUNV8yxyKsvHUM7Xt+3uB32iy6
 4x60a89UGfUyOPz6PLayiwo+LzfQKJh9D5F2lpY2GWKmbYC+kgNhrvtJunAcJzfOXjr9
 PZVyAUzxjFLAgNRrcJ5klUG1nrHTZ7aIyzw/qqrIncu/Ln+8yA9rHYra83oveGpYZ313
 ZiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QqOz2OAJuUMwPzqIuUXnZ3o9P6oZ5KjPCS5w95lKMNU=;
 b=PYsAhPZU20VYHd7MtUQnzjpC0N7HHZd1kr2HQDDf/nsiBxCJVyrzAUvpTToANp1kSD
 0jUbsgAyK+T49htZYCbnL65yOE2eo7KUjfdgjR5WtZAPKCeOSjhCO25/kiaJKa87XTqN
 Y5VY8fs2EIPizZtyFbla7L5D9b3leJ2dAeaJnA1+HTckVsEP99NbwUQw7daS0gcnP3CI
 aVVEbzI/U3S4gvxa9l9GebKAPaAbuwV9dYOR/6v0bbkySuZ/UV73i7qKiEpOF7Nbht+n
 wmgL72FkcB5t4i/yV96eMzIlv+JSSWxdzX9K2cemi7Pg4qjvjaTXZWFxLXScR/d0CQ/O
 +foA==
X-Gm-Message-State: AOAM531/pzTJE9xNkW5DusrDWc++vo28wugAl7REbMYqrLt+wdU/0khi
 lGuakPFxY7Y7y7KpR3jJCC/0dphC9mTy3w==
X-Google-Smtp-Source: ABdhPJzAfIrOfinsv9A2gg3ohweVRnVoHIjNXhspNxZLWT0vkY2P93sq0tixXqWRbIImMmer9b4P1g==
X-Received: by 2002:a17:90a:e612:: with SMTP id
 j18mr2430499pjy.196.1626849720534; 
 Tue, 20 Jul 2021 23:42:00 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.41.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:42:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 02/23] target/alpha: Drop checks for singlestep_enabled
Date: Tue, 20 Jul 2021 20:41:34 -1000
Message-Id: <20210721064155.645508-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
 target/alpha/translate.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index de6c0a8439..cfb0c3d675 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -2998,17 +2998,10 @@ static void alpha_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         tcg_gen_movi_i64(cpu_pc, ctx->base.pc_next);
         /* FALLTHRU */
     case DISAS_PC_UPDATED:
-        if (!ctx->base.singlestep_enabled) {
-            tcg_gen_lookup_and_goto_ptr();
-            break;
-        }
-        /* FALLTHRU */
+        tcg_gen_lookup_and_goto_ptr();
+        break;
     case DISAS_PC_UPDATED_NOCHAIN:
-        if (ctx->base.singlestep_enabled) {
-            gen_excp_1(EXCP_DEBUG, 0);
-        } else {
-            tcg_gen_exit_tb(NULL, 0);
-        }
+        tcg_gen_exit_tb(NULL, 0);
         break;
     default:
         g_assert_not_reached();
-- 
2.25.1


