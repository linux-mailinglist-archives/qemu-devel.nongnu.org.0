Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D81664BE63
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:28:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cmk-0000cr-1F; Tue, 13 Dec 2022 16:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmg-0000bf-1s
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:25:54 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cme-0003Dd-GN
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:25:53 -0500
Received: by mail-oi1-x235.google.com with SMTP id r130so1053550oih.2
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8dgmD8yUJnIF7Ep3YQaKEZ2wvp15A3Cnw31rhHlanTU=;
 b=aU+O4mvxw5bX9XZhJZU2W3+XsCtCVzbE3gkB2JYs3U8+KM7HT48o6y73sswI7DYrJ2
 IpI5JCnOK/MF+mlpvISC+qQh7I49LP4Dw7gDMq0LqzYxlkewY2h01zks1+LQKFctfNZC
 UZOKOmt0Qpvs5ztbIIKU9tYBhS5kxwNWC23HTeDbEnzowH+INfwgwIlZCfHM0kxHJVxG
 p4zv8cCRtxp5NMImzqTc4j0Y84Ak1ZvacXtYAAxhoB4m9Qe8b3S9hGwp3bqrK4/krtj9
 PWghPyXUep9Z/kWNCMpf1j1y8lUs6tsELG9N7iLP1MjglD6Tct0TPvUBtAIYlgJRtaFo
 j7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8dgmD8yUJnIF7Ep3YQaKEZ2wvp15A3Cnw31rhHlanTU=;
 b=0q7ranpKfCA/95r8Di83FKBeXnmi4P80jgcHyUdQrelzq5C9h83k6Lr4sg7X5ShoB+
 ashbe3QmteYauG/1yXtIItdF6R/ryyC1/iX4odgW97ALor5V0EhkNXDKkn6lAxZCKVwS
 DQovshZEBjpVLnbCtxeDA0pRmyllwCdhutwlJjUpPbjKzTTw6WYtpjC2RH6cqVDJO66P
 yfiWEVlbVtKxxph1iyagojn7WPep18TrFRnK8ZxVv04QgCgY/yFdHblZQepATWKox+sK
 R+pure+lksjqhTGhR4qZdiRo8ur5tqeSoz6zoOA3K4OUqk9rHJg4hz3PSs03Z5mBKDJp
 gEjA==
X-Gm-Message-State: ANoB5pnY7Bj8exmF+fCfH/9yEBOYFzKDIGZPHeZEA1wRU3vpqR/Ilg0S
 e3bvh7S+cw6kMKyIF2o2m1OwM9MXJJ6p+L6O7bM=
X-Google-Smtp-Source: AA0mqf4wndWqM+d5At1Y3IaVG33FBN5mLGUegRqYsQZYLRnPfwFV0Np8BcHnk55vXIn/16sgzfb/Ag==
X-Received: by 2002:a05:6808:1c6:b0:35e:30a7:b00a with SMTP id
 x6-20020a05680801c600b0035e30a7b00amr9728672oic.40.1670966751532; 
 Tue, 13 Dec 2022 13:25:51 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056808098700b0035c073aa0d8sm5006831oic.18.2022.12.13.13.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:25:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 08/27] tcg: Add temp_subindex to TCGTemp
Date: Tue, 13 Dec 2022 15:25:22 -0600
Message-Id: <20221213212541.1820840-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213212541.1820840-1-richard.henderson@linaro.org>
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Record the location of a TCGTemp within a larger object.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 1 +
 tcg/tcg.c         | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index d207bc47be..afa18986b1 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -456,6 +456,7 @@ typedef struct TCGTemp {
     unsigned int mem_coherent:1;
     unsigned int mem_allocated:1;
     unsigned int temp_allocated:1;
+    unsigned int temp_subindex:1;
 
     int64_t val;
     struct TCGTemp *mem_base;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 98d51e538c..0f58013a5a 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -928,6 +928,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
         ts2->mem_allocated = 1;
         ts2->mem_base = base_ts;
         ts2->mem_offset = offset + (1 - bigendian) * 4;
+        ts2->temp_subindex = 1;
         pstrcpy(buf, sizeof(buf), name);
         pstrcat(buf, sizeof(buf), "_1");
         ts2->name = strdup(buf);
@@ -974,6 +975,7 @@ TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
             ts2->base_type = TCG_TYPE_I64;
             ts2->type = TCG_TYPE_I32;
             ts2->temp_allocated = 1;
+            ts2->temp_subindex = 1;
             ts2->kind = kind;
         } else {
             ts->base_type = type;
@@ -1092,6 +1094,7 @@ TCGTemp *tcg_constant_internal(TCGType type, int64_t val)
             ts2->type = TCG_TYPE_I32;
             ts2->kind = TEMP_CONST;
             ts2->temp_allocated = 1;
+            ts2->temp_subindex = 1;
             ts2->val = val >> 32;
         } else {
             ts->base_type = type;
-- 
2.34.1


