Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0077C2C37E5
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 05:08:52 +0100 (CET)
Received: from localhost ([::1]:48630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khm6t-0006br-2I
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 23:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4z-0004lZ-4z
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:53 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:40005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4x-00062T-Om
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:52 -0500
Received: by mail-pf1-x443.google.com with SMTP id b6so1087784pfp.7
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 20:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y78iUWT/hOzRMHIOoD0erIhCqyR5Mxb52awjOekSD+Q=;
 b=bC2RLLNcAclmhM3NQj+ZQwLRNUosmXiAPMpXDQI7MDU+mk9yI+25CcgC7pfmmcSN+k
 L0dtygWruuvqMcy2vama8ceJLHZwDrsWHTAlm5cuvrwuefhl1Fkiezv2JQZ7HrjXsAmP
 8yBg4q4MO2ygWD7R+WM4dPuxwRuVhHrWiS+EDEPuOOBxy/MPH4l21BZ7zLBen1sbDj+1
 bZsCfoi1y3J4m9ncRSVOjYBOZz1WcHrg4RcNLsGwe4nf9BcfaHpkPxaw0anqeqqwO2o4
 c9rDNmY9r6oXSUQxWy6Dh2u+EVq0WJ+QWGOmlCUvDlOHdXIoTHLOgSZmrfiyozERbcXz
 6fnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y78iUWT/hOzRMHIOoD0erIhCqyR5Mxb52awjOekSD+Q=;
 b=MF3WzvO8TpOGeKliF8J7Wwua0VNtBeiOnJh0xp76fCmpYiBhOewo1ZPQ0bYqmR62QV
 G56qTgZj3txGE1z6nlP4s0yrf2dpjiq0X/bI/0QgjUSVEVwa0zoZ0jX86M4miMJQsF2u
 DJ3vw6SYBQkXI0H22Q8bgurT0J8PLh8FWY4I7utTxSd4p+ENbxakWnLBTgACLftmxXNc
 0M0YPl29O31DCjyFQCFlmZfS8Eeqoa0lf7e07o192aAa8z1K/qqN7hVfxG9aOiIQKaRU
 WYEIv8zzD2ILR9xxNFNo7LiihuhP1XZY1Gb2YlcXL8/qKFG0nuqmrhUp6uT9hDk9e1xF
 kHgQ==
X-Gm-Message-State: AOAM532QJTy9BFvzD3VDOXGApHcGt6FNzUlyJ1GO6WujVU06yhRl5Fkc
 3iHXrjAh/Cy5Q3eotpAPSWEAyFb1re1rJw==
X-Google-Smtp-Source: ABdhPJzaFlNrGd4qhFit+0+Kh5r8nOgEeMhFEbZ3ZBH3D4kgdLV39Yp7lPS4uo9Ju00erda88uZrIw==
X-Received: by 2002:a17:90a:fb41:: with SMTP id
 iq1mr1860037pjb.140.1606277210180; 
 Tue, 24 Nov 2020 20:06:50 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/11] target/arm: Enforce alignment for RFE
Date: Tue, 24 Nov 2020 20:06:35 -0800
Message-Id: <20201125040642.2339476-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index fe4400fa6c..4406f6a67c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8250,10 +8250,12 @@ static bool trans_RFE(DisasContext *s, arg_RFE *a)
 
     /* Load PC into tmp and CPSR into tmp2.  */
     t1 = tcg_temp_new_i32();
-    gen_aa32_ld32u(s, t1, addr, get_mem_index(s));
+    gen_aa32_ld_i32(s, t1, addr, get_mem_index(s),
+                    MO_UL | MO_ALIGN | s->be_data);
     tcg_gen_addi_i32(addr, addr, 4);
     t2 = tcg_temp_new_i32();
-    gen_aa32_ld32u(s, t2, addr, get_mem_index(s));
+    gen_aa32_ld_i32(s, t2, addr, get_mem_index(s),
+                    MO_UL | MO_ALIGN | s->be_data);
 
     if (a->w) {
         /* Base writeback.  */
-- 
2.25.1


