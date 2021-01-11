Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AC52F1F8B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 20:34:19 +0100 (CET)
Received: from localhost ([::1]:58084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz2xG-0000kQ-5J
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 14:34:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2SH-0006VE-IJ
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:18 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2SA-0006Yu-Lo
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:17 -0500
Received: by mail-pg1-x52b.google.com with SMTP id q7so271529pgm.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4UQ2EbntzblTY+Cr/OZTR2n9Wiol6cqQRRjRkzPpLXE=;
 b=DqjI/wiA63h9Z7VIF6PcWjfh5XEff8lw2NSEp5sKkS/kn3Ywcd58Q1bw7A0U51HJkX
 61cG3Cl1pnRSyeLyn57ryvbpQpyu9/DrcKUUwLQCZELnvGBuDSfe5G1v6Ctgmup9ECFh
 MOQ3cjUY2LDd+TGHz0cMEVmgp6dgpDNX7yLkSQl7Ckgu6GTtWYkA6V83PKxNHsooQgMe
 9qeGTC3w9uguFz+jL7KKbSYjsiFRAQ3G56X3QtTNisSCMlZTXfthqqit5XYTQoE/JvKd
 TGsiv8gVgwZBZjcnQBhJ45jaxZ/DJn0w1yiRsBkpg5X+jgyivo6m24O211cuBWAttV8+
 0Okg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4UQ2EbntzblTY+Cr/OZTR2n9Wiol6cqQRRjRkzPpLXE=;
 b=CGQHRxyJgQmMy8cHldftY8qXtozV8ZoJGLTCGUXybAR8wrgyfuy92dUhNMRyxo6EeV
 ElYmNL9uJ62y2j6XRnXirO7oU+5CjmS6n6wPlK9B4p2Nkirx5macwZF68zCpBC4wCljI
 6K5M4XBcHGILRKzpxLNsBMX0kz6YINrsIV7a9rQbbXg596N+IEByQkWWi7yuL320Q5tO
 Pxw/KXAnjIkuSSIOPH3MXX3VL45YDkKS/EO6E7mjcjPspb2jLUJRWfQBLZig/HFDYqwi
 kM9w7JgOE8OfufmCnz6yJqFYBnyDjsNElJHauyi9FkY/meJyfs1yb0CbJEWZgKHeQ8hC
 o3Sg==
X-Gm-Message-State: AOAM531F4uanztTJXKlkr6bOYeYSuwNWyuQ/w5NWAUPsJ+PUF4jfOzOT
 A5rW1EYgOChx9zuv+R6YXN1zR5P6uhjwMg==
X-Google-Smtp-Source: ABdhPJx2kl3w5Bxvn7uh7lES/vewZZFIucWViFUaxUPP7woldNaWc4JlMyiLiI3xjkY6Uc7EfC3hSg==
X-Received: by 2002:a62:b50f:0:b029:19e:2974:b7a4 with SMTP id
 y15-20020a62b50f0000b029019e2974b7a4mr1010303pfe.61.1610391729154; 
 Mon, 11 Jan 2021 11:02:09 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:02:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 30/30] target/arm: Enforce alignment for sve LD1R
Date: Mon, 11 Jan 2021 09:01:13 -1000
Message-Id: <20210111190113.303726-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0c3a6d2121..6125e734af 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5011,7 +5011,7 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
     clean_addr = gen_mte_check1(s, temp, false, true, msz);
 
     tcg_gen_qemu_ld_i64(temp, clean_addr, get_mem_index(s),
-                        s->be_data | dtype_mop[a->dtype]);
+                        finalize_memop(s, dtype_mop[a->dtype]));
 
     /* Broadcast to *all* elements.  */
     tcg_gen_gvec_dup_i64(esz, vec_full_reg_offset(s, a->rd),
-- 
2.25.1


