Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FDB4FAC37
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Apr 2022 08:07:40 +0200 (CEST)
Received: from localhost ([::1]:50568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndQjb-0001bi-P1
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 02:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZq-00021w-Jy
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 01:57:34 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:34244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZo-0002zk-Lt
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 01:57:34 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 g12-20020a17090a640c00b001cb59d7a57cso2831728pjj.1
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 22:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rAFoHiqfdDsz3JpAFNFs8ScJcRhTKGmndskIyyVL2JU=;
 b=lf8zMwjJEGaqYKtmwUqtiK2cvkLZnkbiNcBs+jqSskJYa39Qt1uy0NtOjr2O2Wmutl
 2CkuZ8R2UVcglg2DWBAW+/HcvIiZbhxMONOYhEsppAG8K8kfhdRKIWnSsJEarnk4AO7y
 q8rMrmb83SafpvQ8CimD1yAsI6bUTjcdPOzYQfJfVQcu1FJO9eXvSlyCAfkJWMZc8Nu/
 v4YuLdosso/Gh5T7HnDj1zjeVuUeIT2yFuj1QJxpfAO+nrWNiDrHNxVVfyPzvTEcVSqr
 SWyVBhrZ57IjAixIpg2PJdjWtNYpk/wUtOuZxbfsypFPmdPva5wO8PRHoeIuTHR8kxZU
 mqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rAFoHiqfdDsz3JpAFNFs8ScJcRhTKGmndskIyyVL2JU=;
 b=HmfJ6lYsb2x449pzTGZndZ5iZPl6ONIJ7/fmlk6CVtkq5MenWs6kXh0ubM0JqDicJI
 dEsFatk9KlRXzlWRokJZJ0agn0JVptUrrPrVl72jof6+XtUiTuKHmZDIY/f2mIZ43vUP
 IwNCxhoRbPJHZUwJLSB/0D9K04mn+gUm3zneRWUtvIAKvDw+iQV+wve6iCEbgqiE4hhZ
 4p4pSvTFhoLnR62apB5IGhNxBZHnve2I0Uyso32mh72x3SQxFjmCRpPlQd/tAREwzNSr
 HVLFysh0cbTJLWPUW+mfBWaEsOAvttUxnchJtyhryqQwJ0CNGKRpMbkX7tFxxvRBVcNd
 92Dw==
X-Gm-Message-State: AOAM532ynvlAHK3U4EMXesU8vO6jNWsfbQu+Sz++Z6eI2ybpuNXDyG/3
 iD7SLz3jt0/5UUmNXPm+9mEX7qpWjKzEGQ==
X-Google-Smtp-Source: ABdhPJwhNcOM4wT/nwDrluF52LWUq/Xy6e1lQTNsn9ZWIZx5OqZ3yB2g8v41ddFZwoSbL6zZbG9ZYQ==
X-Received: by 2002:a17:90b:350f:b0:1c7:7769:3cc6 with SMTP id
 ls15-20020a17090b350f00b001c777693cc6mr29966948pjb.120.1649570251214; 
 Sat, 09 Apr 2022 22:57:31 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 l18-20020a056a00141200b004f75395b2cesm30481862pfu.150.2022.04.09.22.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 22:57:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] target/arm: Enable FEAT_DGH for -cpu max
Date: Sat,  9 Apr 2022 22:57:23 -0700
Message-Id: <20220410055725.380246-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220410055725.380246-1-richard.henderson@linaro.org>
References: <20220410055725.380246-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This extension concerns not merging memory access, which TCG does
not implement.  Thus we can trivially enable this feature.
Add a comment to handle_hint for the DGH instruction, but no code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c         | 1 +
 target/arm/translate-a64.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index a0429538cc..199ca437a0 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -795,6 +795,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);       /* FEAT_SB */
     t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);  /* FEAT_SPECRES */
     t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);     /* FEAT_BF16 */
+    t = FIELD_DP64(t, ID_AA64ISAR1, DGH, 1);      /* FEAT_DGH */
     t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);     /* FEAT_I8MM */
     cpu->isar.id_aa64isar1 = t;
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index cc54dff83c..c3c1a19dea 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1442,6 +1442,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
         break;
     case 0b00100: /* SEV */
     case 0b00101: /* SEVL */
+    case 0b00110: /* DGH */
         /* we treat all as NOP at least for now */
         break;
     case 0b00111: /* XPACLRI */
-- 
2.25.1


