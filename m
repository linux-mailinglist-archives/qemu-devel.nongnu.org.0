Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82556541B47
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:47:11 +0200 (CEST)
Received: from localhost ([::1]:53478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyh2c-0005we-JR
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwy-0007SV-I7
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:16 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:43954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwp-0008Ln-TP
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:16 -0400
Received: by mail-pg1-x529.google.com with SMTP id s135so1321361pgs.10
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Khgw4zesO+K18d95Nf0OQk5x631DSo+q5LDKVsiqTz0=;
 b=N9gZLZL0XzwCu+XWXFvYMP66wJtfVAkHIA8iEBlADwAqwOsUqlWMc/E8i83Hi1uirJ
 wW8q9Mt4vHtZhyMZXTCXLJzAJKyordQwIIefMScAK1qusuP0Urk71IT7KNQKpJ5OjJNA
 9MAcV8TMI0cvoFuqQO59zUzmJr1y0KLqjZSIzWmrJBiFgoPfFLw73zKPalDCqW2MZXi5
 wjjkYRwvURAaoiLuq8+GTHC5In1ye4r6OI6mhoNSMqv8TG1dUyIAx4U7zIJc70FpB0up
 RLJJJPO21n1V82aCQ7RP5g8RBofeQVrsMW6EpcZ5iHTfSeHirJ0WopZYC6VrlbHWKPKx
 xnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Khgw4zesO+K18d95Nf0OQk5x631DSo+q5LDKVsiqTz0=;
 b=B3X2vrdSFtyVdXZLx5iq8C4mY25yW4PbCMmRRhRS6/Q3PBVr+5oZ9OT/avtmGZ3sTZ
 Hp7yV/y74Hv+4eCe1uJCOX78rv7gvYMvXfmvGE4CgVVcpw87zcjs/jAtpaplhHtZD1pf
 fWrkFd6t3QKwN2t6vPo3vY1RbH6BV/4wg+loqjO0KgnAegIt/D5CHRT91dh+UUNw03BF
 tWsmdFXcOs2wIknyOfkkPk6jZnndk1oD04X2RlYa3CHyqSEmW4A5EnQBUe+m6COlewKg
 hgTDJpcKhXckWY+Zu4zBAEXE9CzDtXxD0BFqGU+nDpPiQJ7KVfdPYax5LsOI+L3CrNMV
 Z5BA==
X-Gm-Message-State: AOAM531ztl5SFPYPKtJYVwA6dCeW+F+jp39s931kSUAENQ0ss7wEGO52
 YW/+tm6MunBEX0tFmARpQQ+h+5Oqg3w9Jw==
X-Google-Smtp-Source: ABdhPJzfgWi/dB/dlLJgpKzbeEhPUMpb4l5Lo0mAoRsL5E/OB2hD81t+O8ImkoOo6pqJumW6chwdng==
X-Received: by 2002:a63:524a:0:b0:3fc:7f18:685d with SMTP id
 s10-20020a63524a000000b003fc7f18685dmr27469956pgl.387.1654634226114; 
 Tue, 07 Jun 2022 13:37:06 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:37:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 63/71] linux-user/aarch64: Do not allow duplicate or short
 sve records
Date: Tue,  7 Jun 2022 13:32:58 -0700
Message-Id: <20220607203306.657998-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In parse_user_sigframe, the kernel rejects duplicate sve records,
or records that are smaller than the header.  We were silently
allowing these cases to pass, dropping the record.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 8b352abb97..8fbe98d72f 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -318,10 +318,13 @@ static int target_restore_sigframe(CPUARMState *env,
             break;
 
         case TARGET_SVE_MAGIC:
+            if (sve || size < sizeof(struct target_sve_context)) {
+                goto err;
+            }
             if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
                 vq = sve_vq(env);
                 sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
-                if (!sve && size == sve_size) {
+                if (size == sve_size) {
                     sve = (struct target_sve_context *)ctx;
                     break;
                 }
-- 
2.34.1


