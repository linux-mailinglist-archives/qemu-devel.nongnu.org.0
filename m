Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9D36C8DAE
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 12:56:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg2UQ-0000NQ-3u; Sat, 25 Mar 2023 07:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2UO-0000N2-1l
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 07:55:16 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2UM-00009D-Kz
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 07:55:15 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-545ce8e77fcso5249807b3.1
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 04:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I3FEu/nTbPKwKvyLx5sbEt9ZFhxKMxxn+3nzIHWc9gU=;
 b=LYWKCvLHaAYuAQZxBCAMiezRvI6/e4ZAgy3ynQyhohJynXqICj2Ap2zjwf5vF6ohHy
 XNeq4mCKOWfx4DjM19n4ukYIBPlV+uFIWOUUmvAMhpH6rnItPDNdgxfI0sOuBhMZbh0s
 UXpV5vmdKmRi8n1EOIihh8+OLeMD6CLxHuyyzW3q7TOHoNrTW6BTr04T+IW3+MmGh2Rx
 2jS6C1INGrfQ4v2YG8rEKTanQCN/wWBeqZOJshraaHzw3DCNIfjNo4yCgTE6EACFWU4z
 D810bA1E9hpzTryy1L04rIdflrZiIZNhHJog6arjupDhY0M9S/OQ3t121+w/pH+rpq6W
 dv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I3FEu/nTbPKwKvyLx5sbEt9ZFhxKMxxn+3nzIHWc9gU=;
 b=5jAcJWenElUa1Djk5Q0bXo6Oq6P0SNf/DccLfRdTFTYAVWT3xPN+iuDu9/zgd3kAZJ
 h98excfNYfiBT8dMLwJ/e2JJDvO9XJdoqdJz39hClihDgPRMtWCopj2+vEw7QcYc2CtI
 PcHl4c7K3b8S+1Pse17tevYnnBFvZ7pTi+UhOYBGTVXKcyxbtqUOeu8A1Z4269Zn2eIW
 /YzWOBFl6yH7/fmQWtVkEJXUKzK2Wm4jI2zBSZMuut5OWW6jp4r2egZj0xem4+QRBkKu
 aQB010rb+l8JeusdgYjPiPySAKY2nyaGMYX7750lrmaLBlQ9Y6K31/vfW3J88fo0CfpU
 9RnQ==
X-Gm-Message-State: AAQBX9exxgqqXckPf1iru+6YPeVZbzi7PjjgJysHoN9V52w3bpn8UB67
 74GhcdwSAYt75/K6XFfe4a0ILNgdjnpLDUHrxEQ=
X-Google-Smtp-Source: AKy350YxUxBcUZoUYTeRvKW3PpZvY9cxXhwx72rX1UZALSva9WldJnq+fUDx0YUN2ra3FYjMb+o0KQ==
X-Received: by 2002:a17:90b:1d0b:b0:23f:2661:f94c with SMTP id
 on11-20020a17090b1d0b00b0023f2661f94cmr6313885pjb.47.1679741687456; 
 Sat, 25 Mar 2023 03:54:47 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 19/25] target/riscv: Hoist pbmte and hade out of the level
 loop
Date: Sat, 25 Mar 2023 03:54:23 -0700
Message-Id: <20230325105429.1142530-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

These values are constant for every level of pte lookup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 833ea6d3fa..00f70a3dd5 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -870,6 +870,14 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         return TRANSLATE_FAIL;
     }
 
+    bool pbmte = env->menvcfg & MENVCFG_PBMTE;
+    bool hade = env->menvcfg & MENVCFG_HADE;
+
+    if (first_stage && two_stage && riscv_cpu_virt_enabled(env)) {
+        pbmte = pbmte && (env->henvcfg & HENVCFG_PBMTE);
+        hade = hade && (env->henvcfg & HENVCFG_HADE);
+    }
+
     int ptshift = (levels - 1) * ptidxbits;
     int i;
 
@@ -930,14 +938,6 @@ restart:
             return TRANSLATE_FAIL;
         }
 
-        bool pbmte = env->menvcfg & MENVCFG_PBMTE;
-        bool hade = env->menvcfg & MENVCFG_HADE;
-
-        if (first_stage && two_stage && riscv_cpu_virt_enabled(env)) {
-            pbmte = pbmte && (env->henvcfg & HENVCFG_PBMTE);
-            hade = hade && (env->henvcfg & HENVCFG_HADE);
-        }
-
         if (riscv_cpu_sxl(env) == MXL_RV32) {
             ppn = pte >> PTE_PPN_SHIFT;
         } else if (pbmte || cpu->cfg.ext_svnapot) {
-- 
2.34.1


