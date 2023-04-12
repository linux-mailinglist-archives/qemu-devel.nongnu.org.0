Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7CC6DF431
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 13:49:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmYtl-0006bV-M8; Wed, 12 Apr 2023 07:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtJ-0004xb-9U
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:57 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtH-0002Nb-0g
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:57 -0400
Received: by mail-wr1-x432.google.com with SMTP id i3so1257587wrc.4
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 04:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299834; x=1683891834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YAXm4ASIFttpyWJKyvCjhM0MOstGOXoJQiE+ToyL5+M=;
 b=JQEcA83IUV8RsbqU9Jt1Ab2eJb90z0Dew09aJl+CBYZxLWseO/BOfWLdsJRDAZIifJ
 Y2gqzORdm82xcIfN3QvNmWNnfhUNVnSqVq5FCDqDxZr4dm5sntl4uH7QlI4Cypo7OuIl
 ftNBdg4dm1/FRBRkETXEWeAf6X2gKfr0mMaoHBtPahd9zu34B34uuikcBDMwZHZ/z4Ad
 eyfbFcLurDAdOJba8aKW9XEoSPcUzoLy2I2x4Xwcz3kTZnxDPvt+U/Gb1AjyCzQHONEh
 QejIVWnUoF1/w14eUNAvcS/wv6nNtiM1VUq+bSyocHDPUDg8nsQuC7fB9RSCxkOcS7sE
 EHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299834; x=1683891834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YAXm4ASIFttpyWJKyvCjhM0MOstGOXoJQiE+ToyL5+M=;
 b=Cte3Jhwq+k11P+ZFDVzD/6PDkVIm5j0qtG+P5aa9iQqmCFhs7P90bfsBt96bwaSBjC
 XuMvzbo7agdIQjjUO5Gpx9CRxQnEzm+HbWn/bvC8EDtCNawwotFp0R4uhfBnuGImAB1u
 3CLRKXuXOi5Jk18Vg2GgXAvB7rE4/kctpeZIsBTtL0aKjeBdnHYmFGnFMJ5TSidMJtaO
 z+1P7xOt2P0XrDdPQxvOWKYwSfAIP1GyFgsdxt/0dH+x/5OJDMLoPF2uStqGSgAESRDv
 O7p7n7fET2KQvYLwXhTy6W3staRr/d43nV2a//o/EeuG/iQD0ug7KTwHZNLYTIQWbnWm
 m6Mg==
X-Gm-Message-State: AAQBX9d0dTmrTPFzNJ1twBrUBzTvP6B2krkgdlmaa9NPugIkD9j2R+PD
 eJGOKUfsFulONEWZ8G2RVSOtzacd9pDhvim5G8TPlxaK
X-Google-Smtp-Source: AKy350YvIlQGifSQ7fBdXpQoq61rIGmkxDMHypVyv/Q3fHE7g2Gw/ISPnjZMuFP7kaUuE6vRhjHAcA==
X-Received: by 2002:a5d:6dd0:0:b0:2cf:9889:8428 with SMTP id
 d16-20020a5d6dd0000000b002cf98898428mr4319572wrz.35.1681299834123; 
 Wed, 12 Apr 2023 04:43:54 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 21/25] target/riscv: Suppress pte update with is_debug
Date: Wed, 12 Apr 2023 13:43:29 +0200
Message-Id: <20230412114333.118895-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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

The debugger should not modify PTE_A or PTE_D.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-22-richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index c2d083f029..6dc3fdf594 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1001,7 +1001,7 @@ restart:
                 (access_type == MMU_DATA_STORE ? PTE_D : 0);
 
     /* Page table updates need to be atomic with MTTCG enabled */
-    if (updated_pte != pte) {
+    if (updated_pte != pte && !is_debug) {
         if (!hade) {
             return TRANSLATE_FAIL;
         }
-- 
2.34.1


