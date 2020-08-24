Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C0224FFD5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 16:31:37 +0200 (CEST)
Received: from localhost ([::1]:43564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kADVY-0001d3-5G
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 10:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTi-00082R-9O
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 10:29:42 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTg-0002f5-J3
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 10:29:41 -0400
Received: by mail-wr1-x444.google.com with SMTP id a5so8922514wrm.6
 for <qemu-devel@nongnu.org>; Mon, 24 Aug 2020 07:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Yjq8l9AP8VWE0b57+Kx7wIfRe3G039cNjr3OLwk3JrQ=;
 b=qZsHI3GSv0JtzF/qajBmCs1di5qxcdzGRTYhbL9pgrhZ65NZHWvfLpmzvKxDXh/Lk+
 vdVEiLdBRJkq3Gri+cnfctwA/0ZwXs6Z8GigfYV7DtFeKHrbsX/tHps8YhvJf/Qi6iXw
 aOuNaQhf17ytyFwEsKfMDbPmdLqEeOAssf/D0Luy4zG1tuKNudvDqbqsr5KhWXHElzTX
 U5j5q63P4fZYt2Bd/yzqtobOYKirYx00UZ3SZN3N4otMMCDmZSIifi5iaa8nJrSv+GsT
 0XT51+2pteL4i83v0s+x5JNlKasvVwcwQv6ds4ATYAL7H4vg7ef8oZEv2WpoHHdWte3H
 gm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yjq8l9AP8VWE0b57+Kx7wIfRe3G039cNjr3OLwk3JrQ=;
 b=AqC8K00b+9oD7g9IEM2zWfTgBJ5KY4z2byLhYqmmr0oxJ1vcxIA/4uhl06/BN3ftmd
 M2ZivREVj6be2bhFFkIf2UQjqeW1mcDO3Qzrpwle6qBtPVaumqpu+HfenMrns1DUPGxS
 9RVUlXYQJ1xobt9Jn5fMMdx2dr5QhxiVeCQ4JXemm/lEJvqyT9bsadve3U6A1fpvm0X+
 4Ut5Wg+bgpR2sFf5iw+PbMaJPY5MStPYp6b9LubGLClnXcFnH63/RkCBgvTHBG/t05Zu
 kKY8IGGGp+SVGe8bBR6+Ia70h+IAEsUQsl+6ZT74bPKUDaYsLbC04gH5vSDbAfIvs3cH
 CxxA==
X-Gm-Message-State: AOAM532m8G/T/b4w4Arz96ud2bGNcLNoACyBHaAglPtJbD1DXmE7jC1X
 3Nt3mJxnwUzlLMpIZikIwg36tg==
X-Google-Smtp-Source: ABdhPJwpciWy6dCQ7MsUNYdNs9J0ru7xdrsjmK1kfofbl3TWs+NKJnKWx3Q0b+x4thle3x5BqaMWQw==
X-Received: by 2002:adf:9e90:: with SMTP id a16mr6568823wrf.40.1598279379169; 
 Mon, 24 Aug 2020 07:29:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b14sm24499091wrj.93.2020.08.24.07.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 07:29:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/22] target/arm: Use correct ID register check for
 aa32_fp16_arith
Date: Mon, 24 Aug 2020 15:29:14 +0100
Message-Id: <20200824142934.20850-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200824142934.20850-1-peter.maydell@linaro.org>
References: <20200824142934.20850-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
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

The aa32_fp16_arith feature check function currently looks at the
AArch64 ID_AA64PFR0 register. This is (as the comment notes) not
correct. The bogus check was put in mostly to allow testing of the
fp16 variants of the VCMLA instructions and it was something of
a mistake that we allowed them to exist in master.

Switch the feature check function to testing VMFR1.FPHP, which is
what it ought to be.

This will remove emulation of the VCMLA and VCADD insns from
AArch32 code running on an AArch64 '-cpu max' using system emulation.
(They were never enabled for aarch32 linux-user and system-emulation.)
Since we weren't advertising their existence via the AArch32 ID
register, well-behaved guests wouldn't have been using them anyway.

Once we have implemented all the AArch32 support for the FP16 extension
we will advertise it in the MVFR1 ID register field, which will reenable
these insns along with all the others.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I don't expect that any guests will have been using these insns,
but in any case the fp16 work will be all done before the next
QEMU release and the insns re-enabled...
---
 target/arm/cpu.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ac857bdc2c1..a1c7d8ebae5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3519,12 +3519,7 @@ static inline bool isar_feature_aa32_predinv(const ARMISARegisters *id)
 
 static inline bool isar_feature_aa32_fp16_arith(const ARMISARegisters *id)
 {
-    /*
-     * This is a placeholder for use by VCMA until the rest of
-     * the ARMv8.2-FP16 extension is implemented for aa32 mode.
-     * At which point we can properly set and check MVFR1.FPHP.
-     */
-    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, FP) == 1;
+    return FIELD_EX32(id->mvfr1, MVFR1, FPHP) >= 3;
 }
 
 static inline bool isar_feature_aa32_vfp_simd(const ARMISARegisters *id)
-- 
2.20.1


