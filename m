Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326506FED86
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:07:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Ib-0006Oi-57; Thu, 11 May 2023 04:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IV-0006Ke-4u
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:12 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IK-0000x5-1j
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:08 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50bcb4a81ceso14613170a12.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792298; x=1686384298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I/9c63Radhgc81C1RKjpHc6zkE/Zkh0JPyRZzb2Zqao=;
 b=g1BwYUTGIhvh9p+PL7x55z/Y8A0wXqfW1tG34hFXhn8PGSLQ1HnKpS7tT3da3jdRnD
 aJEVUjKTs1HlSVaaVwipq0eUQL+lXLj3JeLJ18ZQuGkc+32/1gDiY7oOLFweyxBPTmJ/
 WPRe9pR+4rMJb6UxbNUMjazUYTNll7+/G7qXxTfL19xnt6brk8P1h8LAguQVqbKQm/AS
 u3mfDneNjvji6Pzb5K5MSaSdqSrWTXgqRgN/qFz9wcyBzPEmccYewXcbLi8PsauLb6Pf
 eoE8HWJxytYkPXlvlc/a5Qa5RfCIrfaZzTWKJj9O0r+68oRdcaK0CopESosAhXWPdQJd
 5YUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792298; x=1686384298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I/9c63Radhgc81C1RKjpHc6zkE/Zkh0JPyRZzb2Zqao=;
 b=G+MPpQg7vvdJCjTcWbbTvcZfGByE07Rcax3S9IkmBv0xeIWJ0fKtnLNGcVa19Yvuxr
 9G3kCfuI6FIfxPyUD+w3ZksZiU5hgY++GvOkU2XwczBlnS+YzZUlWetlMywCJ9t1RtKY
 MqCwRv8jlRUQDwUfpTzFm9BPZsdXUqA9ib6/Uq28ZOVHmfm8KAOiLQPACRYkuEe5ZTYf
 zYk8k4UUVIrg7T7ypRB8IVbmX5H6eVLou9SrIUu8h4PezIVOl27qxI5jzlCS/7AWLAZc
 NQ8WWUpOqOx4Kkj8LbBVQMM4xuHLHENfiIpbiN1e+Epz+mHc5/r4pmEP7UU2yeDxvN0I
 Xd3A==
X-Gm-Message-State: AC+VfDx+VLzBe6HAOKcUsXT9QTsmNvv+FOlRQw5wvzHXHnDXM+GTT1hW
 plxsIbsy119F3Xvwwj4wycSALam6PrTNj9oYJ7RH5A==
X-Google-Smtp-Source: ACHHUZ6PiHNpNXH7OFDH+aDPQVW1OqBtJg1LbvgQDqljyKlurOxOVcke1j+GLDpTNlhNPHOjQwl7uw==
X-Received: by 2002:aa7:d88f:0:b0:50b:c1e3:6f02 with SMTP id
 u15-20020aa7d88f000000b0050bc1e36f02mr16981690edq.21.1683792297923; 
 Thu, 11 May 2023 01:04:57 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:04:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PULL 08/53] disas: Move disas.c into the target-independent source
 set
Date: Thu, 11 May 2023 09:04:05 +0100
Message-Id: <20230511080450.860923-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Thomas Huth <thuth@redhat.com>

By using target_words_bigendian() instead of an ifdef,
we can build this code once.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230508133745.109463-3-thuth@redhat.com>
[rth: Type change done in a separate patch]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/disas.c     | 10 +++++-----
 disas/meson.build |  3 ++-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/disas/disas.c b/disas/disas.c
index 45614af02d..f405f4762a 100644
--- a/disas/disas.c
+++ b/disas/disas.c
@@ -122,11 +122,11 @@ void disas_initialize_debug_target(CPUDebug *s, CPUState *cpu)
     s->cpu = cpu;
     s->info.read_memory_func = target_read_memory;
     s->info.print_address_func = print_address;
-#if TARGET_BIG_ENDIAN
-    s->info.endian = BFD_ENDIAN_BIG;
-#else
-    s->info.endian = BFD_ENDIAN_LITTLE;
-#endif
+    if (target_words_bigendian()) {
+        s->info.endian = BFD_ENDIAN_BIG;
+    } else {
+        s->info.endian =  BFD_ENDIAN_LITTLE;
+    }
 
     CPUClass *cc = CPU_GET_CLASS(cpu);
     if (cc->disas_set_info) {
diff --git a/disas/meson.build b/disas/meson.build
index f40230c58f..832727e4b3 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -11,6 +11,7 @@ common_ss.add(when: 'CONFIG_SH4_DIS', if_true: files('sh4.c'))
 common_ss.add(when: 'CONFIG_SPARC_DIS', if_true: files('sparc.c'))
 common_ss.add(when: 'CONFIG_XTENSA_DIS', if_true: files('xtensa.c'))
 common_ss.add(when: capstone, if_true: [files('capstone.c'), capstone])
+common_ss.add(files('disas.c'))
 
 softmmu_ss.add(files('disas-mon.c'))
-specific_ss.add(files('disas.c'), capstone)
+specific_ss.add(capstone)
-- 
2.34.1


