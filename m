Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1954D6A65FB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:59:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCeg-0008Vr-R3; Tue, 28 Feb 2023 21:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeb-0008Q2-6O
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:17 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeV-000353-EN
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:14 -0500
Received: by mail-pj1-x102d.google.com with SMTP id x34so11954514pjj.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zEdQpqU9ueZEOo8eKz0oCLuTG410P44mvFlHhoCt7h0=;
 b=IZM5a17yH/sLpVf4i6uxEj4GzFnDKBRupYYFY5P9anLEJWKzX+RQTwAIf0sT3jGzsu
 T7YukuA9JWmHnbtXgpzsvDCV/jhlhjoUuY3+SuxMNGjsVjwX3ykKyffTvfdBGBnk/7/R
 trnm/qY0fd6ddrtf7dDHl2jD7va4eysAgG0el2mCPHBjo0qL34kN/2xLhQkEzL3eRHtz
 jJExoGd5wTvWOfeaV164ol+LCHDlPUva3kE4NOWRf+kw7RH3kcgbJ29rIlH+XNE+grRj
 Mph0dBN+fQqzPmcDVY5IcoFUBmIOqfbHtaYUjgeDEPMhBcR/izZS3ogNjYyxvs7nEP0k
 5O4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zEdQpqU9ueZEOo8eKz0oCLuTG410P44mvFlHhoCt7h0=;
 b=OVAVxcw8Zi3aJgz4iGzENTo06RJ7fAavGDUMrfzOiSzVYcOlPHRNX0QPIAtgxbjuo0
 1bxsE2xSR+hRZwGEDNy974ERw0l2wfVQmLH2p40C7/WIFc4LBqHfbqyccXalYqx2ccuE
 scB7SfM3HZOK9n8SEYBDpTnqVM0ytVd/mokLO9G/sV/fRikpnkvXwr64qgIKE7KRSoOr
 kgbmdZhL1I/A6vp66L/lyG+RDKslsDeuIB1NiQxwoQ/9u88d3eX0FgTxdDHM99QYHpQg
 KzGxTMGr4s9CZNE03Tz2rKG6ozpbIDlV0Lo9Yc2Mj/suDssIJ5reXiuCQ1bcj80F2K0z
 x0yA==
X-Gm-Message-State: AO0yUKUNs9KjjTFZROgVcyNuxrPfs6Nnpf0kdkya1tb+pKnjtaO0s8w6
 kL//81N0fPAS+IvA4qD4/uepY19PmHuSIqlmnX0=
X-Google-Smtp-Source: AK7set+jszi5tMxtu6Sc55NfPJBKDZjTZiThlq+v6fL/fWsBjkY2oN8OZBeEvBxws1Lsc6Iim1fGGw==
X-Received: by 2002:a17:902:da88:b0:19e:31a3:1a87 with SMTP id
 j8-20020a170902da8800b0019e31a31a87mr5472929plx.39.1677639421689; 
 Tue, 28 Feb 2023 18:57:01 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 09/62] include/exec: Replace `TARGET_TB_PCREL` with `CF_PCREL`
Date: Tue, 28 Feb 2023 16:55:50 -1000
Message-Id: <20230301025643.1227244-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230227135202.9710-6-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 1574eabac8..6af001bfde 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -506,22 +506,20 @@ struct tb_tc {
 };
 
 struct TranslationBlock {
-#if !TARGET_TB_PCREL
     /*
      * Guest PC corresponding to this block.  This must be the true
      * virtual address.  Therefore e.g. x86 stores EIP + CS_BASE, and
      * targets like Arm, MIPS, HP-PA, which reuse low bits for ISA or
      * privilege, must store those bits elsewhere.
      *
-     * If TARGET_TB_PCREL, the opcodes for the TranslationBlock are
-     * written such that the TB is associated only with the physical
-     * page and may be run in any virtual address context.  In this case,
-     * PC must always be taken from ENV in a target-specific manner.
+     * If CF_PCREL, the opcodes for the TranslationBlock are written
+     * such that the TB is associated only with the physical page and
+     * may be run in any virtual address context.  In this case, PC
+     * must always be taken from ENV in a target-specific manner.
      * Unwind information is taken as offsets from the page, to be
      * deposited into the "current" PC.
      */
     target_ulong pc;
-#endif
 
     /*
      * Target-specific data associated with the TranslationBlock, e.g.:
@@ -615,22 +613,19 @@ struct TranslationBlock {
     uintptr_t jmp_dest[2];
 };
 
-/* Hide the read to avoid ifdefs for TARGET_TB_PCREL. */
-static inline target_ulong tb_pc(const TranslationBlock *tb)
-{
-#if TARGET_TB_PCREL
-    qemu_build_not_reached();
-#else
-    return tb->pc;
-#endif
-}
-
 /* Hide the qatomic_read to make code a little easier on the eyes */
 static inline uint32_t tb_cflags(const TranslationBlock *tb)
 {
     return qatomic_read(&tb->cflags);
 }
 
+/* Hide the read to avoid ifdefs for CF_PCREL. */
+static inline target_ulong tb_pc(const TranslationBlock *tb)
+{
+    assert(!(tb_cflags(tb) & CF_PCREL));
+    return tb->pc;
+}
+
 static inline tb_page_addr_t tb_page_addr0(const TranslationBlock *tb)
 {
 #ifdef CONFIG_USER_ONLY
-- 
2.34.1


