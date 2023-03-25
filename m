Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C7A6C8DAC
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 12:55:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg2UD-0000Jr-3m; Sat, 25 Mar 2023 07:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2U9-0000IL-Uh
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 07:55:01 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2U5-0008Fh-5V
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 07:54:59 -0400
Received: by mail-pl1-x636.google.com with SMTP id le6so4108383plb.12
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 04:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yZzGkDNKJyeVgH+y0I2Kdzln5emHM1louuJn4iuK370=;
 b=yzZ3MNI87qMvqu725hpwhf8eqGWpOxiRe5wjfWgT0pT0OCf2fbx2hV/30/7r4aVDii
 xrPuEXrMis/pMcnlIodvHgMrtZk1NScM5sU5nLF5LpKwkJuEFnikNaxdYAGCp5coh7TR
 x86NWnYVaM20+599OD6BCXLAyaj3F/AZig8Qp/cEJ2Bkifm6OznounvngGW0zU2i/AeB
 dwhyeEMvOeGejK92UDhtxU3Hx5KxxYOThnzKthkA+cJtVsH2dyXT1k7kqldsTG2FE70M
 HBT9ES/PR1zsvlvZXzEVS9UKIo4LvCXqPvUHRFxeV11C2CxrPH35v2LbVVF4pU/4erLo
 ZzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yZzGkDNKJyeVgH+y0I2Kdzln5emHM1louuJn4iuK370=;
 b=2cHtlHXxzYQjH1MMR7C98hY4tHyi7OSWgAQz0OrCscwP1HYi3cw/KXXeGzaihSIf1C
 fLXyXIM3Gi/i9qVFpDMcWfJqNkkL6wI9GaSEQ1//+4/dcHK+JD0Mkina65V/YewRbWVq
 DCoSySCgWvJTKrE3pxnpDuQgTjEg4PCkHhmPnWhAnj5D916/AdbY6/czI0f115bOZ0mB
 Sv8ibuz5e6WhcfygXLizrSVPtyoBoDmw80FA7diJPtEPyXQK5dd7YzKjIeamneXme1So
 f5yFNQij3Sem6xSEWHcB7r+jj71v4/kZjcoT1SiDx5VFF4RTzJzm1ZJysmQYZRx7rt+j
 lkPg==
X-Gm-Message-State: AAQBX9fQTnimV54xZU7nO15Uf97U3/sWOonpll/jnO7zVHL99dgseJt/
 abH6fXIyvcJ5SIFPLQ+G2R/9CkJuODuoQL+Htss=
X-Google-Smtp-Source: AKy350bsP7N35nJaG94eCYNQ7+K0szm96jbzCnBmDuHwiJprQvwPZpdF24CGaPT65CdwMU6W7Yr66w==
X-Received: by 2002:a17:90a:181:b0:23f:7c82:2468 with SMTP id
 1-20020a17090a018100b0023f7c822468mr6193690pjc.31.1679741690150; 
 Sat, 25 Mar 2023 03:54:50 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 22/25] target/riscv: Don't modify SUM with is_debug
Date: Sat, 25 Mar 2023 03:54:26 -0700
Message-Id: <20230325105429.1142530-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

If we want to give the debugger a greater view of memory than
the cpu, we should simply disable the access check entirely,
not simply for this one corner case.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b26840e46c..850817edfd 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -837,7 +837,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         }
         widened = 2;
     }
-    sum = mmuidx_sum(mmu_idx) || is_debug;
+    sum = mmuidx_sum(mmu_idx);
     switch (vm) {
     case VM_1_10_SV32:
       levels = 2; ptidxbits = 10; ptesize = 4; break;
-- 
2.34.1


