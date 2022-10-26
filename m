Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A637160D934
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:21:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVyw-0008FW-Jb; Tue, 25 Oct 2022 22:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVyB-0007qN-Qz
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:16:42 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVy9-0001x2-QC
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:16:39 -0400
Received: by mail-pg1-x52e.google.com with SMTP id s196so13469796pgs.3
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+oSBBoEPz0C6PveutCusSV+WpNj8J88GSxwKesi4JlU=;
 b=AkNZPiDO8jFpAx8HjjbalHvLi4/flMxmim7ah3dmqkak80TJnaLCdYTpBtnCFygwFY
 BhP/PyRBZq3wJACmtOFp+KPcwwJqWaEp3R146RwcPXl12oG6D9DiTBw8Z2Deuj2G/fAl
 gZeoZe4xaPBKgCTeB0pFTDl7n9Fk2YNC2LSBG1FzjNRDU1FdGusJM2Y+hov3pw+n94Yq
 fYw7SXB0dmgpHrfKN16yyOc0bewLFgUhWGS7EGzvBVyrHCc9+8lCIAUPKS9jTTXXtlDZ
 FR7O3zdTOHAlTE3l7zRdrm8B35ptyIsK5xMZgWRHkPLrYO1R9yIMj9yVzxMhAPXlZU6n
 qy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+oSBBoEPz0C6PveutCusSV+WpNj8J88GSxwKesi4JlU=;
 b=CDoEUolWqzwkqI+2hG6CWn6Bn0z2+WojNP+Nt8u62RKC3pl5Jei3VGGCL5S8ndyHAR
 T62hDXmHua0J/UYNIjktDq2sTDq487V/snd/n/FbMaYcB5WElnKSrauW7XuwUtSRxFEX
 436d1K+jgjLKZ8Jrc2mY5v4PcNOqZzME6NGlHYyWGNSKojumU7/rufKy4cnRJ3ncIwfE
 hm83C7oJ00isiK0S/MdviR5A06C1yy8lvPRIkvasmFR803nOc8TjrR36osHOZSMdryiH
 PCvvfQp6yTioxlIcVGJp5J7BGqsix71Ym1WI5PQH9012WUcXybSAqi82MHgV9onCTbsz
 qF2A==
X-Gm-Message-State: ACrzQf1y+x97YdAZHtdb5+S4orm1BMcw3WcYl25UdYNdL6HgxNHO+dtx
 KS+TLzRJfwLm656tmLpwsD0Sw+ToNJ04VhNZ
X-Google-Smtp-Source: AMsMyM7CyDlq5xwBtfz80OCLEW6jWrT1uHC4X/jPWO86cNupzv6PbNf1btcm2hofQ1yExn44klittw==
X-Received: by 2002:a63:4384:0:b0:43a:18ce:f98a with SMTP id
 q126-20020a634384000000b0043a18cef98amr34893921pga.273.1666750596292; 
 Tue, 25 Oct 2022 19:16:36 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a17090311d200b0018123556931sm1819732plh.204.2022.10.25.19.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:16:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	Claudio Fontana <cfontana@suse.de>
Subject: [PULL 47/47] accel/tcg: Remove restore_state_to_opc function
Date: Wed, 26 Oct 2022 12:11:16 +1000
Message-Id: <20221026021116.1988449-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

All targets have been updated.  Use the tcg_ops target hook
exclusively, which allows the compat code to be removed.

Reviewed-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h   |  3 ---
 accel/tcg/translate-all.c | 16 ++--------------
 2 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 3b5e84240b..e948992a80 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -39,9 +39,6 @@ typedef ram_addr_t tb_page_addr_t;
 #define TB_PAGE_ADDR_FMT RAM_ADDR_FMT
 #endif
 
-void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
-                          target_ulong *data) __attribute__((weak));
-
 /**
  * cpu_restore_state:
  * @cpu: the vCPU state is to be restore to
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 4d8783efc7..f185356a36 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -254,7 +254,7 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
 int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
                               uintptr_t searched_pc, bool reset_icount)
 {
-    target_ulong data[TARGET_INSN_START_WORDS];
+    uint64_t data[TARGET_INSN_START_WORDS];
     uintptr_t host_pc = (uintptr_t)tb->tc.ptr;
     const uint8_t *p = tb->tc.ptr + tb->tc.size;
     int i, j, num_insns = tb->icount;
@@ -295,19 +295,7 @@ int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
         cpu_neg(cpu)->icount_decr.u16.low += num_insns - i;
     }
 
-    {
-        const struct TCGCPUOps *ops = cpu->cc->tcg_ops;
-        __typeof(ops->restore_state_to_opc) restore = ops->restore_state_to_opc;
-        if (restore) {
-            uint64_t d64[TARGET_INSN_START_WORDS];
-            for (i = 0; i < TARGET_INSN_START_WORDS; ++i) {
-                d64[i] = data[i];
-            }
-            restore(cpu, tb, d64);
-        } else {
-            restore_state_to_opc(cpu->env_ptr, tb, data);
-        }
-    }
+    cpu->cc->tcg_ops->restore_state_to_opc(cpu, tb, data);
 
 #ifdef CONFIG_PROFILER
     qatomic_set(&prof->restore_time,
-- 
2.34.1


