Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D8B6F4815
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:11:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsZ3-0002u9-U8; Tue, 02 May 2023 12:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYr-0002ow-Pn
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:09:07 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYn-0000lJ-JM
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:09:05 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-30639daee76so605356f8f.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 09:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683043737; x=1685635737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZCshE9IafXKgT2vV4eAlemBF7e2BqlY02AfvfYW7tmM=;
 b=CT/VUoNq1F9GVkXN0bN4HQIBPxrRwjbbgkqSpCxXny61zy03jgsJM0sUfsVsvlwaiT
 iqqXQGW/oIN0pqOUogKy/wLfFOmidEBzBzPLyMz+0vLkVXj0pBq2RFP+nZS71c1brtaB
 rczH8ZmajREHAsGrKSGy/dVy8T0WfwS3XbXAyOQWclMn8jWTzEKMdYcpO56v3pBAqIzm
 ha0gKLZWRhhXrxanvr3XlyIhiEgflVSCcurTY+4/RuFvRpAqwZzikmwGHIiwVcx6lr3I
 ub6sAhGRxPQmcPoqV/XHcNuR/KCghbEIqF6vrldb+d/arblx5PIcnspklN5G8EhfQ9rM
 N4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683043737; x=1685635737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZCshE9IafXKgT2vV4eAlemBF7e2BqlY02AfvfYW7tmM=;
 b=Sk3RVZFXKiajE1jBOGgJktc9TPOe+c6+X2yXA1wRTw2whTmsaBEAqYd94AC46BUe58
 AmndMSXWcF0tFGimcBpG1gA/mS08zfRjqm/RiIQgVU6Y2CQO01esNiGShmKQ2/JdT4CO
 ONzq/mmZ4rDysQr9UjtcmS9c5bYqgYR762HhrflLJ0PjZTxJ4HdhZHGVtl177yghV+o4
 GxXHSeHt657pK5Y19i4DSTiI+VTa5ObVYMVFMnvhK/BCwNuIuUeOdz3h7Put/JZd6XaI
 QSf8k16vo1pvsxNhCA6EgjAYp4hKOjq2NO+pzPBV7+2ySoSrer+ioWub0sLTuWwTy5dT
 RWTA==
X-Gm-Message-State: AC+VfDzsHXdl6X1fVBdxSllR35zoM2nwITpf41K/OuPNGr6M5TPL29RL
 HwcmOPC42lLIo5HoGHTe2vwgaylxb8X64nKum0M81Q==
X-Google-Smtp-Source: ACHHUZ4cfkORRhy5FX/Gk7ypAC7hxHCO2LdiyekYKhRAC3ViWKkFyerszJ89Mlj4jU+CMj7ysG3GGQ==
X-Received: by 2002:a5d:6d47:0:b0:306:339b:684 with SMTP id
 k7-20020a5d6d47000000b00306339b0684mr3311452wri.65.1683043737406; 
 Tue, 02 May 2023 09:08:57 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003ede3f5c81fsm39918471wmo.41.2023.05.02.09.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 09:08:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jiaxun.yang@flygoat.com, crwulff@gmail.com,
 marex@denx.de, ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
Subject: [PATCH 14/16] target/sparc: Use cpu_ld*_code_mmu
Date: Tue,  2 May 2023 17:08:44 +0100
Message-Id: <20230502160846.1289975-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502160846.1289975-1-richard.henderson@linaro.org>
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This passes on the memop as given as argument to
helper_ld_asi to the ultimate load primitive.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/ldst_helper.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index a53580d9e4..7972d56a72 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -593,6 +593,7 @@ uint64_t helper_ld_asi(CPUSPARCState *env, target_ulong addr,
 #if defined(DEBUG_MXCC) || defined(DEBUG_ASI)
     uint32_t last_addr = addr;
 #endif
+    MemOpIdx oi;
 
     do_check_align(env, addr, size - 1, GETPC());
     switch (asi) {
@@ -692,19 +693,20 @@ uint64_t helper_ld_asi(CPUSPARCState *env, target_ulong addr,
     case ASI_M_IODIAG:  /* Turbosparc IOTLB Diagnostic */
         break;
     case ASI_KERNELTXT: /* Supervisor code access */
+        oi = make_memop_idx(memop, cpu_mmu_index(env, true));
         switch (size) {
         case 1:
-            ret = cpu_ldub_code(env, addr);
+            ret = cpu_ldb_code_mmu(env, addr, oi, GETPC());
             break;
         case 2:
-            ret = cpu_lduw_code(env, addr);
+            ret = cpu_ldw_code_mmu(env, addr, oi, GETPC());
             break;
         default:
         case 4:
-            ret = cpu_ldl_code(env, addr);
+            ret = cpu_ldl_code_mmu(env, addr, oi, GETPC());
             break;
         case 8:
-            ret = cpu_ldq_code(env, addr);
+            ret = cpu_ldq_code_mmu(env, addr, oi, GETPC());
             break;
         }
         break;
-- 
2.34.1


