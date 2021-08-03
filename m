Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD893DE4F9
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:18:21 +0200 (CEST)
Received: from localhost ([::1]:56374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAlsi-0002Wm-BR
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpP-0002Z7-SF
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:14:55 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:37506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpO-00022X-9H
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:14:55 -0400
Received: by mail-pl1-x62b.google.com with SMTP id j3so7041480plx.4
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7BoflvIiTr+DU42vLyiBwzCwJSFt/BgPyqtUymU6fAw=;
 b=V7Tt0s21VAIBYaHH+80pWxF12LMv3C3S7TRjH2gha3nsvvWDtqoom5fXQu7WI1cVO5
 JV5F5FLO7JBj8E7SfEgcKpiYRyUJTdMTUnIPQ8krwCCEhPolEUZ+u8cIrSdnMvcbSdTG
 2ku+xrnfclVTAKUdVdUeiKUnQRJSMZ48iwAvnU10s+f0F+XJTH1ywS3+Kk89IfMYV8Mu
 oXgFsWBqHoqK32PXCUP4LDDq0+48XBYmG572xv/3587z2XoVoK5IeuI5366wnnJh5ygC
 f8n0+6T5J0HaVcA70uihIl4zPYqbxhtZOKND3ZqGmVPAKQUpfvlISsG00o8lBKn4FBeW
 o+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7BoflvIiTr+DU42vLyiBwzCwJSFt/BgPyqtUymU6fAw=;
 b=GFwEHrbD2m8bteNmP9UVMLJaNfr7QavfPLOmJ64reLoY/hku0KLpMSsvfxmiXFrqMS
 sFM8BOYxw4+xDIK8KVq1Jjf4jyleKPsFyYZ2j272ykN8MO0kKAdD/6xYUYBjCb679otw
 rcoDXEqlSNPlgsXkRU3Xqjdyo7/Vy0UFbyjNi1UHnJFwSpIXvNtAZceKG7b9TfIH7MyB
 nKybNpg2YwjFmkunIBgVSrDYYTY4T7P/sPIpXAYUliBo8cYVygCnlbnOzHuSrhEQnZeN
 NWDaXCPwVSNf2tx3Z0dQtgjo3wy2P3+7YbptlcaihY2/OyezUm/lSDWcPJNgAhnIFE1x
 n1uQ==
X-Gm-Message-State: AOAM53381jv/3fWZtRputH3RCEwiJeVJQR2dJnqv3vUkqcNLh7shYR2N
 esqDhQAPSu2P7czB6o9KrGESF53i8G4Atw==
X-Google-Smtp-Source: ABdhPJygcBKCs7P2vjezzjqcXKyjVq6NDlzWLbNF8PQWJ1G53V29pS8NeTSecVQlarrUo5SAlYPOTQ==
X-Received: by 2002:a65:63c1:: with SMTP id n1mr1326207pgv.398.1627964093018; 
 Mon, 02 Aug 2021 21:14:53 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:14:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/55] target/microblaze: Do not set MO_ALIGN for user-only
Date: Mon,  2 Aug 2021 18:13:54 -1000
Message-Id: <20210803041443.55452-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kernel will fix up unaligned accesses, so emulate that
by allowing unaligned accesses to succeed.

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index a14ffed784..ef44bca2fd 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -727,6 +727,7 @@ static TCGv compute_ldst_addr_ea(DisasContext *dc, int ra, int rb)
 }
 #endif
 
+#ifndef CONFIG_USER_ONLY
 static void record_unaligned_ess(DisasContext *dc, int rd,
                                  MemOp size, bool store)
 {
@@ -739,6 +740,7 @@ static void record_unaligned_ess(DisasContext *dc, int rd,
 
     tcg_set_insn_start_param(dc->insn_start, 1, iflags);
 }
+#endif
 
 static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
                     int mem_index, bool rev)
@@ -760,12 +762,19 @@ static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
         }
     }
 
+    /*
+     * For system mode, enforce alignment if the cpu configuration
+     * requires it.  For user-mode, the Linux kernel will have fixed up
+     * any unaligned access, so emulate that by *not* setting MO_ALIGN.
+     */
+#ifndef CONFIG_USER_ONLY
     if (size > MO_8 &&
         (dc->tb_flags & MSR_EE) &&
         dc->cfg->unaligned_exceptions) {
         record_unaligned_ess(dc, rd, size, false);
         mop |= MO_ALIGN;
     }
+#endif
 
     tcg_gen_qemu_ld_i32(reg_for_write(dc, rd), addr, mem_index, mop);
 
@@ -906,12 +915,19 @@ static bool do_store(DisasContext *dc, int rd, TCGv addr, MemOp mop,
         }
     }
 
+    /*
+     * For system mode, enforce alignment if the cpu configuration
+     * requires it.  For user-mode, the Linux kernel will have fixed up
+     * any unaligned access, so emulate that by *not* setting MO_ALIGN.
+     */
+#ifndef CONFIG_USER_ONLY
     if (size > MO_8 &&
         (dc->tb_flags & MSR_EE) &&
         dc->cfg->unaligned_exceptions) {
         record_unaligned_ess(dc, rd, size, true);
         mop |= MO_ALIGN;
     }
+#endif
 
     tcg_gen_qemu_st_i32(reg_for_read(dc, rd), addr, mem_index, mop);
 
-- 
2.25.1


