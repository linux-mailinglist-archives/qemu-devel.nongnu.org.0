Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11492F1F42
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 20:26:48 +0100 (CET)
Received: from localhost ([::1]:42780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz2pz-0002jW-OI
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 14:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rx-0006BF-V5
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:57 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:40063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rp-0006Sr-5T
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:57 -0500
Received: by mail-pl1-x62a.google.com with SMTP id q4so333558plr.7
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SwH2WDpQXh+eCC+rwEcKb2gXwbMlbSUNldc2fkveHPU=;
 b=qW+gDlLYDqnGsyqsPA4A9Bp3DQWWdCWBxOieyOV2N5jkvMlz52Se2tGd+sp4NwAV7v
 yKoLEJDcRMWTsK0A/XTkj3D0IDAHKnzSXuY/PHDVKwWGJouwKnrS/n9c8t3rQCT440JN
 J1lf7eogwmL+qUaFujvvqskTiKGDaP5GKiCdYJzje7TrS7ioWNpEoe0t4vjN8jEi+3u8
 XyaJGMFODeC0qBr/fXFBlmjQF31s1IUCDpo8XQmBgz4uxHlFQj1EXUsswGbOWTMMAmGg
 NOzu7TgQDsfq7cN2ySix73rEeKlUneZbd3svPbd3M7AHVv+p/obZ3Az5sqjg0hDCpJ5G
 5AdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SwH2WDpQXh+eCC+rwEcKb2gXwbMlbSUNldc2fkveHPU=;
 b=etr+BClKLxBEMrxCIPHZ1eNptDJ+NJv7KvKHDpZaseOETmBpy/JfK6dXusT/inCF0H
 gRrG+iVwVNA9AR+uWFRKen/6z/jNivOsfCd4GhpMNp/SpbXfR0gnSHXt8Di6GybUxVhD
 v1g7R9Nw2hr0t8COXEXqFHiSMwFY24u72ua7+4SkBSPHmVeYMJLLmmlT6nv5uGOPrNuR
 GkY9DRFgtPV5C3Fcvuc1yZiumBFBP9gM4CPY+ITmJj6N9hyI+wzAHwCiqrMOz5lmjsXp
 dXDoGQazCTtWZDdN/MPGBRZgqL7/aIXmSMuv7VGlBepNjUOuNm8TR3MBx+L93iFv8ZzF
 KHrQ==
X-Gm-Message-State: AOAM532N91KTxtAB1ZzJNa9AhCcbgWCA2g6z8bl7vJZIo2Ga/pmlAAw3
 h31TI1w+zSoGRbOkjZU5vSc0xTQ9HDsYnA==
X-Google-Smtp-Source: ABdhPJxpiNDCa7+L1Dnoe5XvOEV1BZW3Gso36ljl6oIAwCdxGX/CFpseXYoGoJSj0RhMCLUEXX4VOQ==
X-Received: by 2002:a17:90a:ead1:: with SMTP id
 ev17mr286171pjb.51.1610391704374; 
 Mon, 11 Jan 2021 11:01:44 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/30] target/arm: Enforce alignment for LDM/STM
Date: Mon, 11 Jan 2021 09:00:59 -1000
Message-Id: <20210111190113.303726-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ba68d4d7f4..dbe74e2c34 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7831,7 +7831,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
         } else {
             tmp = load_reg(s, i);
         }
-        gen_aa32_st32(s, tmp, addr, mem_idx);
+        gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
         tcg_temp_free_i32(tmp);
 
         /* No need to add after the last transfer.  */
@@ -7906,7 +7906,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
         }
 
         tmp = tcg_temp_new_i32();
-        gen_aa32_ld32u(s, tmp, addr, mem_idx);
+        gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
         if (user) {
             tmp2 = tcg_const_i32(i);
             gen_helper_set_user_reg(cpu_env, tmp2, tmp);
-- 
2.25.1


