Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96637578897
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:39:29 +0200 (CEST)
Received: from localhost ([::1]:37412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUiO-0000cR-Ea
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSw-0008Tw-0v; Mon, 18 Jul 2022 13:23:34 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:35468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSt-0001tG-4J; Mon, 18 Jul 2022 13:23:29 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-10cf9f5b500so24366028fac.2; 
 Mon, 18 Jul 2022 10:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jAiDHDP0GXofu2nX9iLl0pMKtuYOAvJsdHqETrLkGDs=;
 b=aq8VfX4a8MGSxKCes2EhYbskYpeMGk9ex91qtBzQgNXb0CZRCg0dRLVovxiDEesomv
 OdePsJPxb21g677jw2DfYayhnOnFpqcQO8zw85Cplru2iv0eo1zkmLsfX5gmkV8GDj5i
 nQ953/fDzvnLo6Hd2FP+ym5opG5Pw0Io5OKziW4AcyC7bkrcOuvHPcZuz1+59woaTRLW
 99EbXadNAxs4oVRwHrLqNq0GihHlHovArcqlrMp03TjPLCl/3xNYRIoL1LSjdSJ1y55r
 Xx0A2zxovoG65teO4NqnPqb8OzXla3c3snK+MbnFrU8dcBI9aZZbC3qikIZNiVoE7Rv8
 afuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jAiDHDP0GXofu2nX9iLl0pMKtuYOAvJsdHqETrLkGDs=;
 b=IB0cmSdqlJu3XKPinxH6Icn5n8nqy8eV/ZaGMeiQ41iJl943hA6wOOSHiE1Tj834Zs
 2aJr1ddCFUn9qCgb0TG+5WtniOvpR311+lIhdFUNpAgncyqF3d32WKbCVbACWBUkUTIM
 hMQAi96ijFW1yUjUDAuA2+TeV/z7kjCH47lyPm06Z0vlDKEsg3vh7nwZHVsSZ6M0cBIA
 l1fDQ5SqfSNhVtc1lDH5mT7t2Sqs0ZqToaZlmgX14rhl44ugKzrM5HoZeROlS9ftzB7G
 oz3t4kUo6QKh2ehC1Vv6ZOnknTAwirMaS9auSz6J8+nljzr5HCmcYte6m0gFeVnMuAWW
 QpkQ==
X-Gm-Message-State: AJIora+HrXa8Sxx0iHOnwmJeDYCOTi8Bok+dqEBbth/p6yuRryNlEcOX
 30u63S4D7voypfpqV6kj5uFsP9okcek=
X-Google-Smtp-Source: AGRyM1vYP2iiQ5Yh6gx96RKzaUhTzYICXwChW262XNtF3c8TlWdNAGAbgH79gKEOqUUhEj3TkEGDFg==
X-Received: by 2002:a05:6808:1b20:b0:33a:6c7a:d729 with SMTP id
 bx32-20020a0568081b2000b0033a6c7ad729mr4740971oib.299.1658164998026; 
 Mon, 18 Jul 2022 10:23:18 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:23:17 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PULL 26/30] target/ppc: Implement slbiag
Date: Mon, 18 Jul 2022 14:22:04 -0300
Message-Id: <20220718172208.1247624-27-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lucas Coutinho <lucas.coutinho@eldorado.org.br>

Reviewed-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
Signed-off-by: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
Message-Id: <20220701133507.740619-12-lucas.coutinho@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                          |  1 +
 target/ppc/insn32.decode                     |  4 +++
 target/ppc/mmu-hash64.c                      | 27 ++++++++++++++++++++
 target/ppc/translate/storage-ctrl-impl.c.inc | 14 ++++++++++
 4 files changed, 46 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index ef2dc30194..159b352f6e 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -681,6 +681,7 @@ DEF_HELPER_2(SLBMFEE, tl, env, tl)
 DEF_HELPER_2(SLBMFEV, tl, env, tl)
 DEF_HELPER_2(SLBFEE, tl, env, tl)
 DEF_HELPER_FLAGS_2(SLBIA, TCG_CALL_NO_RWG, void, env, i32)
+DEF_HELPER_FLAGS_3(SLBIAG, TCG_CALL_NO_RWG, void, env, tl, i32)
 DEF_HELPER_FLAGS_2(SLBIE, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(SLBIEG, TCG_CALL_NO_RWG, void, env, tl)
 #endif
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 781051e993..eb41efc100 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -152,6 +152,9 @@
 &X_rb           rb
 @X_rb           ...... ..... ..... rb:5 .......... .            &X_rb
 
+&X_rs_l         rs l:bool
+@X_rs_l         ...... rs:5 .... l:1 ..... .......... .         &X_rs_l
+
 &X_uim5         xt uim:uint8_t
 @X_uim5         ...... ..... ..... uim:5 .......... .           &X_uim5 xt=%x_xt
 
@@ -869,6 +872,7 @@ SLBIE           011111 ----- ----- ..... 0110110010 -   @X_rb
 SLBIEG          011111 ..... ----- ..... 0111010010 -   @X_tb
 
 SLBIA           011111 --... ----- ----- 0111110010 -   @X_ih
+SLBIAG          011111 ..... ----. ----- 1101010010 -   @X_rs_l
 
 SLBMTE          011111 ..... ----- ..... 0110010010 -   @X_tb
 
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 7ec7a67a78..b9b31fd276 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -173,6 +173,33 @@ void helper_SLBIA(CPUPPCState *env, uint32_t ih)
     }
 }
 
+#if defined(TARGET_PPC64)
+void helper_SLBIAG(CPUPPCState *env, target_ulong rs, uint32_t l)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+    int n;
+
+    /*
+     * slbiag must always flush all TLB (which is equivalent to ERAT in ppc
+     * architecture). Matching on SLB_ESID_V is not good enough, because slbmte
+     * can overwrite a valid SLB without flushing its lookaside information.
+     *
+     * It would be possible to keep the TLB in synch with the SLB by flushing
+     * when a valid entry is overwritten by slbmte, and therefore slbiag would
+     * not have to flush unless it evicts a valid SLB entry. However it is
+     * expected that slbmte is more common than slbiag, and slbiag is usually
+     * going to evict valid SLB entries, so that tradeoff is unlikely to be a
+     * good one.
+     */
+    env->tlb_need_flush |= TLB_NEED_LOCAL_FLUSH;
+
+    for (n = 0; n < cpu->hash64_opts->slb_size; n++) {
+        ppc_slb_t *slb = &env->slb[n];
+        slb->esid &= ~SLB_ESID_V;
+    }
+}
+#endif
+
 static void __helper_slbie(CPUPPCState *env, target_ulong addr,
                            target_ulong global)
 {
diff --git a/target/ppc/translate/storage-ctrl-impl.c.inc b/target/ppc/translate/storage-ctrl-impl.c.inc
index 5c569a3c75..6ea1d22ef9 100644
--- a/target/ppc/translate/storage-ctrl-impl.c.inc
+++ b/target/ppc/translate/storage-ctrl-impl.c.inc
@@ -65,6 +65,20 @@ static bool trans_SLBIA(DisasContext *ctx, arg_SLBIA *a)
     return true;
 }
 
+static bool trans_SLBIAG(DisasContext *ctx, arg_SLBIAG *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_SV(ctx);
+
+#if !defined(CONFIG_USER_ONLY) && defined(TARGET_PPC64)
+    gen_helper_SLBIAG(cpu_env, cpu_gpr[a->rs], tcg_constant_i32(a->l));
+#else
+    qemu_build_not_reached();
+#endif
+    return true;
+}
+
 static bool trans_SLBMTE(DisasContext *ctx, arg_SLBMTE *a)
 {
     REQUIRE_64BIT(ctx);
-- 
2.36.1


