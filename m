Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6413599A77
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 13:18:14 +0200 (CEST)
Received: from localhost ([::1]:51722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP00y-0004rR-9z
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 07:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkP-0002Dh-Jc
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 07:01:07 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkJ-0001Qu-Od
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 07:01:05 -0400
Received: by mail-wr1-x42a.google.com with SMTP id n7so4763494wrv.4
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 04:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=T2d6RVLzyzWzf/spKdraeHdOh9Hi3cYnCCfjXRwnKAY=;
 b=pB3Rw7JHLxETXLhhQKkoqOxrSCKbQO5QRkNaCMeTh3O1z5NGfzSwSqUG8szYxOsBkE
 HJ7NtJBPucCCfKNK7IasaTWHoFoF4myWOagjqgj0DsWq3tFqz1WVez6ttfZ7H23pw85J
 92zMJJhZfoNcxuxKx1PnvAv8xPsgqlaH7/JFOrObjkYX/KBU9Sz9T0mFaoyTD6UUHVft
 Qh/R2L9RzuRjGFthi0NmxHjZ8h0LQpIoRGFAsOMUiYETvScxQxb5Mwld6ZispScZFPSq
 S45cACxcuFMAuxm6cWwCHccmUNC4GgGC2rymQMR6xbfSD7FSBVsAHlgRxYnLUiu49vdz
 65Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=T2d6RVLzyzWzf/spKdraeHdOh9Hi3cYnCCfjXRwnKAY=;
 b=e8gaGXuCcDJ6oKBeFgYNMuLaBo5jVeLuDIAx5l2cPc7ZRrrUaRxpWqKz4eJ7p1rDPE
 yM+ha8RKR3hRJoH1WcpzWBLHezKwgYik2tZJOJ7elfYqnnNKFeqNR03AS4F6I4enzaAf
 3zlzdk/0wI4WHy9Yoeffn19iSEsWz2VQhdI6H9tvxWf7CM/foy5cYLZOW2d87hy3D1ce
 DiIybKVv+0EQO5L3A9n1Ahi1YkTYUXdgWRPt1i4gfdkQN0rb+e/l/CzRpFBkLTbbEbTU
 tagwObCoFz21A+KWWTaG71uyv0cnTj29kH7U7x2i1g6SSj4xEI+2+VVbbINyUUycgzKh
 hFKg==
X-Gm-Message-State: ACgBeo3t+hjW5Scr0LGGDUUIvcQcS0JqPw2Cl0PNZ+kSj6GXQVvnpbHr
 sF8NWrNLdmK+l7SZAUvyO7LUUmyXzmdHTA==
X-Google-Smtp-Source: AA6agR6NF44+rgUN0Tz/yLqC4Ug1rH/DrRZlDv/yjeOMdf6pVjSp8KFb2MdGEirQdcBvOUTP200jNg==
X-Received: by 2002:a05:6000:1549:b0:220:7199:bd4 with SMTP id
 9-20020a056000154900b0022071990bd4mr4157147wry.673.1660906858347; 
 Fri, 19 Aug 2022 04:00:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a7bcc96000000b003a52969e89csm8154985wma.4.2022.08.19.04.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 04:00:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/6] target/arm: Advertise FEAT_ETS for '-cpu max'
Date: Fri, 19 Aug 2022 12:00:51 +0100
Message-Id: <20220819110052.2942289-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819110052.2942289-1-peter.maydell@linaro.org>
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The architectural feature FEAT_ETS (Enhanced Translation
Synchronization) is a set of tightened guarantees about memory
ordering involving translation table walks:

 * if memory access RW1 is ordered-before memory access RW2 then it
   is also ordered-before any translation table walk generated by RW2
   that generates a translation fault, address size fault or access
   fault

 * TLB maintenance on non-exec-permission translations is guaranteed
   complete after a DSB (ie it does not need the context
   synchronization event that you have to have if you don’t have
   FEAT_ETS)

For QEMU’s implementation we don’t reorder translation table walk
accesses, and we guarantee to finish the TLB maintenance as soon as
the TLB op is done (the tlb_flush functions will complete at the end
of the TLB, and TLB ops always end the TB because they’re sysreg
writes).

So we’re already compliant and all we need to do is say so in the ID
registers for the 'max' CPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 4 ++++
 3 files changed, 6 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 8e494c8bea5..811358fd0a0 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -24,6 +24,7 @@ the following architecture extensions:
 - FEAT_Debugv8p4 (Debug changes for v8.4)
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_DoubleFault (Double Fault Extension)
+- FEAT_ETS (Enhanced Translation Synchronization)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
 - FEAT_FP16 (Half-precision floating-point data processing)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 78e27f778ac..6d65248f29c 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1043,6 +1043,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);       /* FEAT_LOR */
     t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 2);      /* FEAT_PAN2 */
     t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1);      /* FEAT_XNX */
+    t = FIELD_DP64(t, ID_AA64MMFR1, ETS, 1);      /* FEAT_ETS */
     t = FIELD_DP64(t, ID_AA64MMFR1, HCX, 1);      /* FEAT_HCX */
     cpu->isar.id_aa64mmfr1 = t;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 3099b38e32b..f63f8cdd954 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -67,6 +67,10 @@ void aa32_max_features(ARMCPU *cpu)
     t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX*/
     cpu->isar.id_mmfr4 = t;
 
+    t = cpu->isar.id_mmfr5;
+    t = FIELD_DP32(t, ID_MMFR5, ETS, 1);          /* FEAT_ETS */
+    cpu->isar.id_mmfr5 = t;
+
     t = cpu->isar.id_pfr0;
     t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CVS2 */
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
-- 
2.25.1


