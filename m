Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B80EE6C8E50
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 13:57:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg3Qr-0006K9-8r; Sat, 25 Mar 2023 08:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg3Ql-0006K1-NH
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 08:55:35 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg3Qk-0004P2-AD
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 08:55:35 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id f23so3672666vsv.13
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 05:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679748929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WwnkfiTTd5TTKSiO/WBujmarOe5J9cJn8z3oPthnwl0=;
 b=Iq+IW3gL5mg2gXyPuz9Pb4QTHGclnsd8GqcdJ7VmkbR2iOmSpLpQajcyXWoNDfvNDz
 /PSTnWyzdWMnjl48uv8NlIPshqrsw+a9M+lha3Be1UjD5P3P192WGl9JytRBi6PM10v2
 j1L3K7MM4t2LjjuBsHz4uhCCIVHNGw5wubsm+t45MHgTmmmDh2+8gY66yIgWEVzy8U3J
 Mrb+uWmVP3Mb37CLDHp/HJMzzlaJU8rHjI2peCSPHAEkr/bGlJ5GeWv3ocEl2v4aSos/
 DO+v8MtlSHO2Y43L8+Mz8+OHHc/f9vP3esG7PWhFBH6Xl0CHpvIGGKWHcMVn7kTgarR8
 DM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679748929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WwnkfiTTd5TTKSiO/WBujmarOe5J9cJn8z3oPthnwl0=;
 b=XefI0QSBkkYMrWkUnocFo0hIQuwf6iyQSYp71CjjMKQFHqimnRCtX/LRlg7DfHUX3M
 cY9JbavpUlOu19flmx3b04Zrwa/JzSdbwJ96D8t7N9RLJYJqAiPYeZNBObsTyd8GwYKD
 sdxSw1qBuzS021mLMaEQHuX/9Q5MUo3M6cqPI4OxuOnS8P3xEHacqM1IWe5kQsT2J/Yu
 uZMln50aWgp6FPFMX57+k3hIDLKUbUcupdEXWdSevSxJrMi4Pm03VPazHe12bvjZkOCb
 weieRO+Nw0qfMmmoC5+VwHyIkYlk2tC6W9hMu/JiEQfp9WIXUAjaoILeMKzWTVGN5Fr0
 OKHA==
X-Gm-Message-State: AAQBX9dIhucUS151LzP7F7qK+KBnGUJERatzY0LcmR9F4WmmuMucbCjz
 guhKwrjM/jQNAjoDOChyqve5R/Qfx8OiiJw14UI=
X-Google-Smtp-Source: AKy350b7Y0GWSfDMf93LgRAABRVPWozNxPnS+tDz3nC603tp7+q+TP0714hu6Isil6FWSzyJ32qrIQ==
X-Received: by 2002:a17:90a:10d7:b0:234:f77:d6d2 with SMTP id
 b23-20020a17090a10d700b002340f77d6d2mr5737663pje.45.1679741689325; 
 Sat, 25 Mar 2023 03:54:49 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 21/25] target/riscv: Suppress pte update with is_debug
Date: Sat, 25 Mar 2023 03:54:25 -0700
Message-Id: <20230325105429.1142530-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe2b.google.com
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

The debugger should not modify PTE_A or PTE_D.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index ce12dcec1d..b26840e46c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1015,7 +1015,7 @@ restart:
                 (access_type == MMU_DATA_STORE ? PTE_D : 0);
 
     /* Page table updates need to be atomic with MTTCG enabled */
-    if (updated_pte != pte) {
+    if (updated_pte != pte && !is_debug) {
         if (!hade) {
             return TRANSLATE_FAIL;
         }
-- 
2.34.1


