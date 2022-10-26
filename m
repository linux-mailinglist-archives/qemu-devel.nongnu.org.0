Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D84E60D948
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:29:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVxv-0007Xi-PQ; Tue, 25 Oct 2022 22:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVxs-0007Th-3i
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:16:20 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVxq-0001rx-Iv
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:16:19 -0400
Received: by mail-pj1-x1036.google.com with SMTP id h14so12694010pjv.4
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i7vVd4Q5V6HW/R+ICEMk6aJDNyn3ol3YXdsq0hzOo+k=;
 b=aysdxu/6VQOIo/oAwqtR0/oWYhF4dAw4yoV83SA9pjALgrE65na+qK3HCYrjTwcL1o
 EX+jrg6B452xYmpF5Dg6SZvDjL9LFE8HElRavuZMUpb5eEgJjtZt7mcNM1e2L/TPD/Kq
 bli2Wa4EJcS2kjmU0ETIAz9n9nX8y9ToSrjiYwWzi3y/3hk2wrLpOuulK1fzthXpyZ+C
 JvDvCDjiUeLhdhUW4kW2hoSVCH8pPnaDl3cFYSFdsluaTfI4ZkzDcPtPAx+3o4MCGgb4
 +DWW/hP2RoZTCiWijlWkyRshb5yv0NqQugnX7kbM77cAJCLnYsSUDowq0oU4AtRpbKRf
 mRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i7vVd4Q5V6HW/R+ICEMk6aJDNyn3ol3YXdsq0hzOo+k=;
 b=muIis0cYwKJ+gXK0DzI3K1wgfeToZcIMPepfxql/PUEd4AxpVxqtqZCyZALSsXsDiD
 M/O45a3jlhReGJ7A3oqutK4WkZkBpk5md0RqhUGcpLutnSmFzioI3Krq0KoWDQ6smtWc
 yf0vb0DwWVKeCtdFIs+Ob5CajBnhfAlFDBaT2382QR1K3fztMW1WWrkUk2fPHmyAmcRo
 AOrs8ahBlb0wHg1DxIWeGqVXjAmeKxTX+iIuD9sne8G45/HVza6bYR9Uz6R4HRBRtdwx
 3RKfcJXOKEUx8iZRTmRh4UpanrT2CdK9ReRU4NEfRdHX6r/Xz/NTwBAUcy5fE8kEewgM
 3vIg==
X-Gm-Message-State: ACrzQf20l6oNBfZc2TJacIBr+qhYODqCMsgNkItOA8eWOKOpBbRtD8JR
 KvAl4XKGd/izRaJLppgno3YrV/X7YGiqt9ho
X-Google-Smtp-Source: AMsMyM5EReC05zmxCO+mkyU/TPRrcYn4TBfiyNHxy3yUp65sii2RLiHDQhH4Q9c1fwS8uFms5FVfQA==
X-Received: by 2002:a17:90a:8b93:b0:20a:bd84:5182 with SMTP id
 z19-20020a17090a8b9300b0020abd845182mr1542923pjn.161.1666750577396; 
 Tue, 25 Oct 2022 19:16:17 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a17090311d200b0018123556931sm1819732plh.204.2022.10.25.19.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:16:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 40/47] target/riscv: Convert to tcg_ops restore_state_to_opc
Date: Wed, 26 Oct 2022 12:11:09 +1000
Message-Id: <20221026021116.1988449-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e6d9c706bb..d14e95c9dc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -503,10 +503,14 @@ static bool riscv_cpu_has_work(CPUState *cs)
 #endif
 }
 
-void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
-                          target_ulong *data)
+static void riscv_restore_state_to_opc(CPUState *cs,
+                                       const TranslationBlock *tb,
+                                       const uint64_t *data)
 {
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
     RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
+
     if (xl == MXL_RV32) {
         env->pc = (int32_t)data[0];
     } else {
@@ -1138,6 +1142,7 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
 static const struct TCGCPUOps riscv_tcg_ops = {
     .initialize = riscv_translate_init,
     .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
+    .restore_state_to_opc = riscv_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = riscv_cpu_tlb_fill,
-- 
2.34.1


