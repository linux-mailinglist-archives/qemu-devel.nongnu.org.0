Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7403929408A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 18:31:35 +0200 (CEST)
Received: from localhost ([::1]:48260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUuXu-0007Su-Ev
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 12:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUu1F-0005VT-J8
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 11:57:50 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:50248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUu1B-0003x7-LN
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 11:57:49 -0400
Received: by mail-wm1-x334.google.com with SMTP id 13so2340673wmf.0
 for <qemu-devel@nongnu.org>; Tue, 20 Oct 2020 08:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Gsl0pskRk7KVMoTzUTHvyTGRlhYkpRENSDWVHkehmtc=;
 b=m73dAuA1JZ5oC/Y422H3e6Rk5ZBmkNMz4sMcY0MC5dWSCslKWfbnQQtzX9hDvY2F2/
 C9/xiGkJYw60eRuA0RzDP/M9i1MC+b5woh7CQ6y9UTX949yMB0/zcTqQtv3P0VQ5w6Ak
 i8CutoqYIW/kxo8YcbBOVwW/6EnmZ/PNYHt1Sip0pnwODXXmlqg6rIBY0+TnRPBLCHbB
 o0qJrPmpG8T6+nl+K5ZgpQNUWpW7ykGp5QYKJ5ldwPb1b1V+4XHaXfxV1BaePJredD1m
 8zAu83+OKnnG+dux4U+kPT1MsxIPkfQQ/5PXmrqql8Y7f5L+ahe0BYpFIyUqYdAxbDYH
 RDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gsl0pskRk7KVMoTzUTHvyTGRlhYkpRENSDWVHkehmtc=;
 b=f5f6dHwU5qqcBPz84u/G/YEz7RUstZU3H6mUAcsiwXOv68MOTkabtQL5FfKotLpZ5h
 tnAUTJpcVBmNCl5bu7Y7wwKLIUtNs1zko/Znl5rxIh58WW+s/o+mzbLj0FMzxFrT3kss
 PNppzyY4FQNSCZl3+1Xa/k/YC1dy60GaT17uI6ZShBv28RuTg93QP/XYWnbO5VKX1ezW
 fCbJkp8LYnyq03ZPuRCdw6DIEtwQpaaSZvfsJpjpPO75NMxR68eDSxLjxWzfj3ZR76Kl
 CM081NDnUzlcf/URAobSMvcreqxXw7kEtoCUuW4TNPuFmKj7nmtSbej5deBCl0PgEMGZ
 GciQ==
X-Gm-Message-State: AOAM530mjR0LVLVoQUFr2owdjdDauENPS9Y/A5bre+YNb8bOjNHe20UW
 WmeRB0r2KrwzOXF60bmoM3fYRo8y0KDxGg==
X-Google-Smtp-Source: ABdhPJy2AbGgFOhJoA08OHIBZHGZpfZyzw6iLTCdbZ69rkSXV4fUkwWScINli6CVCPhuMrx3fn4HKw==
X-Received: by 2002:a7b:c189:: with SMTP id y9mr3436297wmi.141.1603209463092; 
 Tue, 20 Oct 2020 08:57:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v6sm3780205wrp.69.2020.10.20.08.57.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 08:57:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/41] target/arm: Implement FPSCR.LTPSIZE for M-profile LOB
 extension
Date: Tue, 20 Oct 2020 16:56:44 +0100
Message-Id: <20201020155656.8045-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201020155656.8045-1-peter.maydell@linaro.org>
References: <20201020155656.8045-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the M-profile low-overhead-branch extension is implemented, FPSCR
bits [18:16] are a new field LTPSIZE.  If MVE is not implemented
(currently always true for us) then this field always reads as 4 and
ignores writes.

These bits used to be the vector-length field for the old
short-vector extension, so we need to take care that they are not
misinterpreted as setting vec_len. We do this with a rearrangement
of the vfp_set_fpscr() code that deals with vec_len, vec_stride
and also the QC bit; this obviates the need for the M-profile
only masking step that we used to have at the start of the function.

We provide a new field in CPUState for LTPSIZE, even though this
will always be 4, in preparation for MVE, so we don't have to
come back later and split it out of the vfp.xregs[FPSCR] value.
(This state struct field will be saved and restored as part of
the FPSCR value via the vmstate_fpscr in machine.c.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201019151301.2046-11-peter.maydell@linaro.org
---
 target/arm/cpu.h        | 1 +
 target/arm/cpu.c        | 9 +++++++++
 target/arm/vfp_helper.c | 6 ++++++
 3 files changed, 16 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a432f301f11..49cd5cabcf2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -549,6 +549,7 @@ typedef struct CPUARMState {
         uint32_t fpdscr[M_REG_NUM_BANKS];
         uint32_t cpacr[M_REG_NUM_BANKS];
         uint32_t nsacr;
+        int ltpsize;
     } v7m;
 
     /* Information associated with an exception about to be taken:
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 186ee621a65..07492e9f9a4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -255,6 +255,15 @@ static void arm_cpu_reset(DeviceState *dev)
         uint8_t *rom;
         uint32_t vecbase;
 
+        if (cpu_isar_feature(aa32_lob, cpu)) {
+            /*
+             * LTPSIZE is constant 4 if MVE not implemented, and resets
+             * to an UNKNOWN value if MVE is implemented. We choose to
+             * always reset to 4.
+             */
+            env->v7m.ltpsize = 4;
+        }
+
         if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
             env->v7m.secure = true;
         } else {
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 364856498c4..01b9d8557f7 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -174,6 +174,12 @@ uint32_t HELPER(vfp_get_fpscr)(CPUARMState *env)
             | (env->vfp.vec_len << 16)
             | (env->vfp.vec_stride << 20);
 
+    /*
+     * M-profile LTPSIZE overlaps A-profile Stride; whichever of the
+     * two is not applicable to this CPU will always be zero.
+     */
+    fpscr |= env->v7m.ltpsize << 16;
+
     fpscr |= vfp_get_fpscr_from_host(env);
 
     i = env->vfp.qc[0] | env->vfp.qc[1] | env->vfp.qc[2] | env->vfp.qc[3];
-- 
2.20.1


