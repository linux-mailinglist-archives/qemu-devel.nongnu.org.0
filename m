Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E87EB3C354F
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:45:04 +0200 (CEST)
Received: from localhost ([::1]:34670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2FA7-0007mq-WA
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exd-00061e-Ao
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:09 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:42969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exa-0002R4-Ij
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:08 -0400
Received: by mail-pf1-x430.google.com with SMTP id y4so11668025pfi.9
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S4t3A3e3be4F+i7H1Y7Otgz4LVcV6jSvJ2vc23385UI=;
 b=J9FCHdFkyH6+FNHaZmDuurlwUKG16NojZ6OW6WbFeuxzsYET+Ug4Td7tO3ECfB/WgJ
 khCjyVyawzED2edYlWOc4u0FXWdJ3n7yRXOeyk+mjjODBo9OiSvyNxr21ys+iK0kC+Rn
 v3SAzCf3wQjOM39LlZS6AaGFKLyJVJWThFxaQt9gpvbm5kKua+lgfVP6S2/OEpgZe5fA
 FIlS3eJOadWGaRAC9pVDuQTOYEabTy3H0LlsTeVSgr7ju1oKQ7IC3XEQxyJwXh9H6V5g
 ALnDDn4PGZr1l/9YDzRXBFU1z+NVwQfFlCXMExkrkLTk7eXbZ+LnjGcxYwj7UBvhTHPe
 sADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S4t3A3e3be4F+i7H1Y7Otgz4LVcV6jSvJ2vc23385UI=;
 b=HmlInYtX3QWK4j+PD4w+Dri88Q3UZoZN1AxP7Xxgj8ZgS4Zdb7F7dWwYxdYkzIyMuJ
 hKnG8TQhuqtk+Ne3LSaGUNBGYsb10QhLn1mZ0a/0GEjqab8iCG9IQxT/jjg1hkb4YPZt
 /9LV89KDAg9uQ1Bx5zXFIkvOjyyKH5aiVGIymcZs+0opGiFdzXP8jmxijC3UR0gbn8Un
 EE0BU1WvolCnqhrbAwQo2JRjZX+HHeSwVACYTIIGTJ8neAa4s3oqc8NKv5WhQmLaeqli
 x42ApO05K6GfOXldSlW4waNsCYhx51B3H26mU1J0Zyh4LG8ik0OjEhxRTe5odpBQT8KB
 5cVA==
X-Gm-Message-State: AOAM531LiyyyFbfCDR7wAK5LINkADzGispFAYBEaekRzXbMGo/LtwI73
 ogm90w8L0U9uWwDp9ZU921WVuv8uCmZREQ==
X-Google-Smtp-Source: ABdhPJzz13fJyMW66rZ27ydpn3MXrCDWEDoZMaq6rFMJ0k5krIoomEIe/7nhwWToKJQeEV/bZ2Cr8A==
X-Received: by 2002:a63:f751:: with SMTP id f17mr44089226pgk.373.1625931125198; 
 Sat, 10 Jul 2021 08:32:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:32:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 30/41] target/sparc: Use translator_use_goto_tb
Date: Sat, 10 Jul 2021 08:31:32 -0700
Message-Id: <20210710153143.1320521-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index f3fe7a0369..e530cb4aa8 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -338,23 +338,14 @@ static inline TCGv gen_dest_gpr(DisasContext *dc, int reg)
     }
 }
 
-static inline bool use_goto_tb(DisasContext *s, target_ulong pc,
-                               target_ulong npc)
+static bool use_goto_tb(DisasContext *s, target_ulong pc, target_ulong npc)
 {
-    if (unlikely(s->base.singlestep_enabled || singlestep)) {
-        return false;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    return (pc & TARGET_PAGE_MASK) == (s->base.tb->pc & TARGET_PAGE_MASK) &&
-           (npc & TARGET_PAGE_MASK) == (s->base.tb->pc & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
+    return translator_use_goto_tb(&s->base, pc) &&
+           translator_use_goto_tb(&s->base, npc);
 }
 
-static inline void gen_goto_tb(DisasContext *s, int tb_num,
-                               target_ulong pc, target_ulong npc)
+static void gen_goto_tb(DisasContext *s, int tb_num,
+                        target_ulong pc, target_ulong npc)
 {
     if (use_goto_tb(s, pc, npc))  {
         /* jump to same page: we can use a direct jump */
-- 
2.25.1


