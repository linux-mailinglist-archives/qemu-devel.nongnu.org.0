Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54074574F2C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 15:31:08 +0200 (CEST)
Received: from localhost ([::1]:43024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oByvr-00014y-Ew
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 09:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oByoC-0002FT-9I
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:23:12 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oByoA-0004op-Kc
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:23:11 -0400
Received: by mail-wr1-x435.google.com with SMTP id d16so2533608wrv.10
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bMOS0wQ3/jAb1bU1b2bDXRVo7/duCbF4KRhimcopz70=;
 b=E1Ogb8ATOmPtoZcZwHIWyu8jm4DPdWr54lFLGgTjP803agCv+IcXOPBNhVxfx/FDcv
 v4PJfuZQHfTO5s2JdcgTv2SEUmCjepkYyTzMLTgdL2qM49tQ11sgB9X3Z5Fu54Akhs6z
 4qFmWrlwa8kp7hoTJE7XKF7MGHYpw4P/frJEv4kDvjC/7yeY5kxfqClRLx0VSPP76JVn
 486VDT5WES7g4z+rXCfI7q5n2IZFp1yQhD/pRAYWfIaX/m3kFK0Hy6+GhNPb9crq1zBB
 FMsBYv+Jf9fS9f+PhzFuV1h7dVIuJVh67lhJ2TG+2DzZ247jt34i1E8VluUrtYnEbaXX
 Orjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bMOS0wQ3/jAb1bU1b2bDXRVo7/duCbF4KRhimcopz70=;
 b=Ps6E2W1lg1+80BLjbavDjT2WkbSRGvhaJQx2VDuqvCWprk90oL0cikyHeYHTOPz+Ps
 UPk7wf+B2HGFK7vrorS5QCCFGKcemHqJu9FPYizdNsSArnizYbhWxB+JySUs7B3snLVI
 tNlbqmfuh2IsMC8hacg8SZpLh4eIZio9XLC/B/93sZibBdcCsDo9cg4alWzKL8+EVG9b
 8EZl9InjCsbew6QOKpR4D/g/M57LYKx0DAF7PxMZukbmJWE7ujQ5oOLFX4bPw2br5cmi
 dRL0tGpy9UqZ0sIl7taPsEeMU3DoAFLXbhAAy29CPwLkmlUW/fbiAvLcQLLx/e7BZKO+
 xSwA==
X-Gm-Message-State: AJIora9x3OJ37ET0awaQWYtGbkEiu5q/ckPqaNO+Ca1EP2u5kk6CbPhF
 fgtApa3bBn7Bs0XRV1q/y6h5MA==
X-Google-Smtp-Source: AGRyM1sHUmFUaFMMTUv7l0CE31BNm26voGUsqpKgnNnFgfSVkKGKCtuSZZQEUFs81eZiRmeTkQ1qag==
X-Received: by 2002:a05:6000:1cc:b0:21d:a352:116b with SMTP id
 t12-20020a05600001cc00b0021da352116bmr7944120wrx.418.1657804989372; 
 Thu, 14 Jul 2022 06:23:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a7bc40b000000b0039c5cecf206sm1925079wmi.4.2022.07.14.06.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 06:23:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PATCH 4/7] target/arm: Fix big-endian host handling of VTCR
Date: Thu, 14 Jul 2022 14:23:00 +0100
Message-Id: <20220714132303.1287193-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714132303.1287193-1-peter.maydell@linaro.org>
References: <20220714132303.1287193-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have a bug in our handling of accesses to the AArch32 VTCR
register on big-endian hosts: we were not adjusting the part of the
uint64_t field within TCR that the generated code would access.  That
can be done with offsetoflow32(), by using an ARM_CP_STATE_BOTH cpreg
struct, or by defining a full set of read/write/reset functions --
the various other TCR cpreg structs used one or another of those
strategies, but for VTCR we did not, so on a big-endian host VTCR
accesses would touch the wrong half of the register.

Use offsetoflow32() in the VTCR register struct.  This works even
though the field in the CPU struct is currently a struct TCR, because
the first field in that struct is the uint64_t raw_tcr.

None of the other TCR registers have this bug -- either they are
AArch64 only, or else they define resetfn, writefn, etc, and
expect to be passed the full struct pointer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Actually I'm not 100% sure that TTBCR is handled correctly for
big-endian hosts. But it's going to go away shortly anyway.
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3d4317c4c85..7eee2007a0e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5409,7 +5409,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .cp = 15, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
       .type = ARM_CP_ALIAS,
       .access = PL2_RW, .accessfn = access_el3_aa32ns,
-      .fieldoffset = offsetof(CPUARMState, cp15.vtcr_el2) },
+      .fieldoffset = offsetoflow32(CPUARMState, cp15.vtcr_el2) },
     { .name = "VTCR_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
       .access = PL2_RW,
-- 
2.25.1


