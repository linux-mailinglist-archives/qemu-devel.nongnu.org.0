Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9375960D950
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:30:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVuP-0005Ix-Rw; Tue, 25 Oct 2022 22:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuO-0005Ii-0O
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:44 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuM-0001Fb-Ee
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:43 -0400
Received: by mail-pg1-x535.google.com with SMTP id f9so9052971pgj.2
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SFr4v+s6ucu43YIiJCOufRZNSesp06+hT97e7RgzJng=;
 b=yu3Fw/YS5x0hqSs3fdpcnRgvvb6zmyORqY+Y1EbOVP+etgQOsGD0HYdDMddk1PK8Qo
 qfIUNMLC4UmRIPLd9G0xh0qoKssTMwUaxxJLOqdYeUiiQfOGlv+T+6b7SJ1jqa1lFEng
 +A/mChY+XtqGOklg46Pp90JpLQAnhGiKecHYWze5gJ29+1OFJ+blbtHxSpx0900Fpmqz
 0JzMe31Zvke/P6MdjkMokc4DeAvY+qof3ia8BasRnSFpoheleLcewtrayb+JR7M6MDBt
 h/BBWovguc6LwA2z6LUMosUY0c2vtDCMXKFCRorqJNJi3+MlXVbJhQ/MIfWSvHGNj1RE
 bsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SFr4v+s6ucu43YIiJCOufRZNSesp06+hT97e7RgzJng=;
 b=HlpOg1OH+WMy8o5eFM+4XlNLapqBkk9XitK3lZUTP24mKNhBFSraU0Rs7l7DpWmmBA
 FdYcvctM2ePUOFTxqxL6SL2vlVpCUdd8JhgUoNURFDEAbngJhp+YeERf+RWdaIta6UUB
 YdoBvy14RR32Rp8afic8GvnL0/TDESX6akJVA5SisZUML7th6ayCrjIpbcOdwb6RRS/V
 mVqRUA3TfdW5/8VCT2T/JFOO+TNzta0d18jxrP+F66LwDPWC03tvvelP+CBlXbOah5fT
 wTjwcH48opbBRBV7ChVbfiHUJ4Ba3BaPvnPf/nF7o5cwhray5JRX7261fEqLl0kwOvCs
 chuQ==
X-Gm-Message-State: ACrzQf2v6oaVr9c+W0+7zShYSCMdF131fawhjMrsSsrcMoNRCf7WnAwB
 SzsHTCrMGjJMJKjZ7s+vlYPoElJsCFVBofr0
X-Google-Smtp-Source: AMsMyM4dcGIC2tqeiwNXTbst9B21C5Iqv6jCOktVq7t/dlJUm3vZ6bX0AJZzeeBBdyXFdMUYnB2jnQ==
X-Received: by 2002:a63:81c8:0:b0:462:953a:8534 with SMTP id
 t191-20020a6381c8000000b00462953a8534mr34637735pgd.69.1666750361592; 
 Tue, 25 Oct 2022 19:12:41 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 28/47] target/avr: Convert to tcg_ops restore_state_to_opc
Date: Wed, 26 Oct 2022 12:10:57 +1000
Message-Id: <20221026021116.1988449-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
 target/avr/cpu.c       | 11 +++++++++++
 target/avr/translate.c |  6 ------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 0d2861179d..c7295b488d 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -57,6 +57,16 @@ static void avr_cpu_synchronize_from_tb(CPUState *cs,
     env->pc_w = tb_pc(tb) / 2; /* internally PC points to words */
 }
 
+static void avr_restore_state_to_opc(CPUState *cs,
+                                     const TranslationBlock *tb,
+                                     const uint64_t *data)
+{
+    AVRCPU *cpu = AVR_CPU(cs);
+    CPUAVRState *env = &cpu->env;
+
+    env->pc_w = data[0];
+}
+
 static void avr_cpu_reset(DeviceState *ds)
 {
     CPUState *cs = CPU(ds);
@@ -202,6 +212,7 @@ static const struct SysemuCPUOps avr_sysemu_ops = {
 static const struct TCGCPUOps avr_tcg_ops = {
     .initialize = avr_cpu_tcg_init,
     .synchronize_from_tb = avr_cpu_synchronize_from_tb,
+    .restore_state_to_opc = avr_restore_state_to_opc,
     .cpu_exec_interrupt = avr_cpu_exec_interrupt,
     .tlb_fill = avr_cpu_tlb_fill,
     .do_interrupt = avr_cpu_do_interrupt,
diff --git a/target/avr/translate.c b/target/avr/translate.c
index e65b6008c0..2bed56f135 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -3055,9 +3055,3 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
     DisasContext dc = { };
     translator_loop(cs, tb, max_insns, pc, host_pc, &avr_tr_ops, &dc.base);
 }
-
-void restore_state_to_opc(CPUAVRState *env, TranslationBlock *tb,
-                            target_ulong *data)
-{
-    env->pc_w = data[0];
-}
-- 
2.34.1


