Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDC660FA1B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 16:08:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo3Sb-0007CF-PX; Thu, 27 Oct 2022 10:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oo3SZ-000724-Ow
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:02:15 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oo3SY-0004yT-33
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:02:15 -0400
Received: by mail-wr1-x42d.google.com with SMTP id bp11so2329604wrb.9
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 07:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sxsG7XqK7FJahGsD3iXOduO+aSm9dtXBlxQk+S7kf6c=;
 b=EoWnqlcGZ1p78F9o1k8id8l/ID8lh4gkC1Zdd+IdaHlBt1BerGUgU9++BcfBBiemuC
 7RtxZ7omJWdvs9LSSyIHeuPOQpc/H8hmKueGFr6+fn9MYvyrAZ/+kI2xpmxsv29sXQpy
 4Xpfk6PsWTEzdEDppG3RUKyuZc9rPEQDufk7aPUWBmcsZkd/haJts4Q6VS5vZPj3YfIK
 nNDEPz5FjUFnmVamBHC5jGMxjTOoiquXxeBlBw07uKSPbxLTvtLGlJNhGARB7dJeDtiR
 krTtNXNl3Mqs56BWs/zw9a4W+fuCROV/L+4dw9X9D/r9NkLMhvkEDmJbS5Vh7qBZQzAs
 SBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sxsG7XqK7FJahGsD3iXOduO+aSm9dtXBlxQk+S7kf6c=;
 b=tTsYx27IwN4NV7EkTYQm3fqeaHGRjccym16u36IOV+pQr2HpbRaP8OIEhthTRRfSRR
 tX2899+IDdPlYiVH5qxoxQ6MJ1CjOw+uCI+IXUGEE4/V6fUPtUPzGcLOmfc19W449AJE
 vqFse3dVDOtYYB2hirdSTNQZ3SwegCQwA6leDMljSG5MjHAewwuYOzaUJnq2q/w5aQeP
 N/3X8aipasjvxdrKr8y8UOD+vr8Tc0Q6+R9mp2GFb5t4INiQgOnXVG0GNkbSDUObSJz/
 kmck6Jw02MsCAo14CFNxbJKN8C7ADoAoRx+FQmcsE4cdDweBGvYW65Cp8PXxVRt4CKCA
 eCGg==
X-Gm-Message-State: ACrzQf1YiIFJ7jAyY3pogRrhZ95Bxn06Tl0tOIOdsKVpk01Vt+y0uW5n
 8ur6UvEPh0251YXBHZAzB4bfxA==
X-Google-Smtp-Source: AMsMyM6mY99jgazA2pFIHizYU6Qu1QeYRJMHZE699M1Cgg+i3Iow/BmMYOOH0Y8fenOpbfW+yNX/PQ==
X-Received: by 2002:adf:e195:0:b0:22f:6117:a932 with SMTP id
 az21-20020adfe195000000b0022f6117a932mr32671859wrb.572.1666879332039; 
 Thu, 27 Oct 2022 07:02:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp6-20020a5d5a86000000b00228a6ce17b4sm1301236wrb.37.2022.10.27.07.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 07:02:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jerome Forissier <jerome.forissier@linaro.org>
Subject: [PATCH 1/2] hw/arm/boot: Set SME and SVE EL3 vector lengths when
 booting kernel
Date: Thu, 27 Oct 2022 15:02:06 +0100
Message-Id: <20221027140207.413084-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027140207.413084-1-peter.maydell@linaro.org>
References: <20221027140207.413084-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When we direct boot a kernel on a CPU which emulates EL3, we need
to set up the EL3 system registers as the Linux kernel documentation
specifies:
 https://www.kernel.org/doc/Documentation/arm64/booting.rst

For SVE and SME this includes:
    - ZCR_EL3.LEN must be initialised to the same value for all CPUs the
      kernel is executed on.
    - SMCR_EL3.LEN must be initialised to the same value for all CPUs the
      kernel will execute on.

Although we are technically compliant with this, the "same value" we
currently use by default is the reset value of 0.  This will end up
forcing the guest kernel's SVE and SME vector length to be only the
smallest supported length.

Initialize the vector length fields to their maximum possible value,
which is 0xf. If the implementation doesn't actually support that
vector length then the effective vector length will be constrained
down to the maximum supported value at point of use.

This allows the guest to use all the vector lengths the emulated CPU
supports (by programming the _EL2 and _EL1 versions of these
registers.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b0b92af1889..0e4d1e5a816 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -762,10 +762,12 @@ static void do_cpu_reset(void *opaque)
                     }
                     if (cpu_isar_feature(aa64_sve, cpu)) {
                         env->cp15.cptr_el[3] |= R_CPTR_EL3_EZ_MASK;
+                        env->vfp.zcr_el[3] = 0xf;
                     }
                     if (cpu_isar_feature(aa64_sme, cpu)) {
                         env->cp15.cptr_el[3] |= R_CPTR_EL3_ESM_MASK;
                         env->cp15.scr_el3 |= SCR_ENTP2;
+                        env->vfp.smcr_el[3] = 0xf;
                     }
                     /* AArch64 kernels never boot in secure mode */
                     assert(!info->secure_boot);
-- 
2.25.1


