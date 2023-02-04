Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5608368AB57
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:38:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLXg-0002Vt-RJ; Sat, 04 Feb 2023 11:37:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLXV-0001vq-JL
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:37:22 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLXT-0003DK-0Y
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:37:21 -0500
Received: by mail-pl1-x62c.google.com with SMTP id v23so8182572plo.1
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QPWeTXTKWj6B/5YSw0vd9eckVw6ULhkxBcXwg2elZXg=;
 b=VlFboWBdym/tX1FZojPQMAQgeJxtllvfU481TJFx1VUOSAy6fka5OIBId7T9yMuqdY
 F4Yc+4KVS/vvEqPoFLo+Pg8BG1dBUC9+FyKeEagHMt7VEqhfBpdUqYuCePHzoGliJS4+
 Kvx4tgtGpcLRsFBA+dIoymfm9cfXRf5GpOT16/C/GcpWgW0D5ecyg+c/lsnohH0r9JvQ
 /Ho2xb5gRceRyuD37OPI+a9b8a3iKgDqxpyrSvceiY4T+Byu4WxuZlEryffTJlRtkTyX
 C5q5yycSoydOmWRkDn9B6HZpu/bfKjbWfZpZjMS7twaU+hYuXyICmk76I1t9JOopQufR
 IcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QPWeTXTKWj6B/5YSw0vd9eckVw6ULhkxBcXwg2elZXg=;
 b=N3GDEwIeOVZovIEJyyvGyVyCgMrWvjYjv3pOBanjY8zBLxgTV7J6qdQhvKUAFXM9No
 GiIN39IDC3VYcM2HomqOGxovAvyy3iGYCUJIN4IbQHC7jSfZocTO6KOiOzSQGzOuRBdU
 vS4FuYLlgqOsOkdImkL8vbBGCQQx8dOdTXPDwx75NqMwYL7ZJHckXxU6fyd5YDhW2sUl
 58uXXzJ7W/tD6NxWy5FUg2c9UHlqDgx7xO/Lfm5LJOtf5Mh2BTfMvbxvYwKcX44XN5jC
 IQ7ceSVAWzMbU/Hzw97fQsa3+aDFymPvEpgtVpwMhzqHyp0Y45ic/lzOUqABw/hpBSFF
 afDQ==
X-Gm-Message-State: AO0yUKXKB8xWM3kRMQ2cJSIu5SmRhz7BKBgjgW1qnZM5FffoYi8pY6eP
 He+ikFH8zbuqVLdqpkl8v1MrKLHwP32Z7D85
X-Google-Smtp-Source: AK7set92uAfsTGnsFqG2xvA+WQgv8hlePI/jRc6anYFG/nFsEfrqhEituFdDjPDdTAAGYYUBbv8Mwg==
X-Received: by 2002:a17:902:f14d:b0:198:dd32:f0e1 with SMTP id
 d13-20020a170902f14d00b00198dd32f0e1mr5244907plb.0.1675528637549; 
 Sat, 04 Feb 2023 08:37:17 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a170902b21200b00198ef76ce8dsm314136plr.72.2023.02.04.08.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:37:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PULL 40/40] tcg/aarch64: Fix patching of LDR in
 tb_target_set_jmp_target
Date: Sat,  4 Feb 2023 06:33:10 -1000
Message-Id: <20230204163310.815536-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

'offset' should be bits [23:5] of LDR instruction, rather than [4:0].

Fixes: d59d83a1c388 ("tcg/aarch64: Reorg goto_tb implementation")
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Reported-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index fde3b30ad1..a091326f84 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1914,7 +1914,7 @@ void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
         ptrdiff_t i_offset = i_addr - jmp_rx;
 
         /* Note that we asserted this in range in tcg_out_goto_tb. */
-        insn = deposit32(I3305_LDR | TCG_REG_TMP, 0, 5, i_offset >> 2);
+        insn = deposit32(I3305_LDR | TCG_REG_TMP, 5, 19, i_offset >> 2);
     }
     qatomic_set((uint32_t *)jmp_rw, insn);
     flush_idcache_range(jmp_rx, jmp_rw, 4);
-- 
2.34.1


