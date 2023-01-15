Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7998666B2D1
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 18:18:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH6ce-0002cd-Lk; Sun, 15 Jan 2023 12:16:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pH6cd-0002bz-0N
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 12:16:43 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pH6cY-0004f3-M6
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 12:16:41 -0500
Received: by mail-pl1-x633.google.com with SMTP id k18so4078012pll.5
 for <qemu-devel@nongnu.org>; Sun, 15 Jan 2023 09:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mrv9cPitT4gYyiIqkJILWgmA5af8TdIaHVS1zuDY5+g=;
 b=V/aLbKdUeYoZYJjxyx4V5iCLqRZKYSMBIv5AxjWuJrqftbtRMaSBxzNhHaaTYaSnVv
 RoH23OE3JMVkdQf3L1Tx6Nimv+E2+HvNqPhMsZnh+Rh5vPUYqe6F9Dgtcg137WN1eTSg
 2V71LdXQuz37AsQ/GlZjNS/4UhuC+xBkc9PC4hULE5goaoXsi3K3esd/mm+ee3VGVSlq
 kh042nNb0xl9CRH4wvPXWTL/6/XKiolYumlVy8FFj0lqBznW4e/rgn2ybtCyn9CjxzO8
 7ZoFqPxAwo7lFVeIhB74sXEosmCzzECTymSUGGfcWJtoT93Nv/MuIaD2jabnk4rJDnb+
 /UVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mrv9cPitT4gYyiIqkJILWgmA5af8TdIaHVS1zuDY5+g=;
 b=wRa6PtndRYT8gipGOWyS1WvgAEz1/BSLnbBseK0/F4LktC4QhkSbyZeE4CBNUETp4K
 +XPlnGSURaaZxJK4n78hZ4OqyKNR2iiNdN34KQVvyl/ldmWccsKzqmxs1bgo9yJl9HFY
 UKJ/LZJdEucDh2YZQJhuo7JvZ20y3U6VooMn1l6j1BZcrLBsSE4Bqfzwxbjjz4feuvCj
 eG2Q3xBNxJmMvPfrbpcbm+fk3sxcvEOvRKJM6xN71XTuBPh/oNqSGP+G4tvShRGqYJ2b
 UsZ4WoWdwJGpJdIs3g+yoMfvZFluxYrZCsXq93BWLeQFoQqhndz3gqVaLDXRrumJaKBo
 qjoQ==
X-Gm-Message-State: AFqh2kqTbOb0qa9CMGPGfpSXXvdUKkm6m6s9qpbA/TVYvmrGi7iL5B02
 9TJEHu8qCQMBQDADge0Z7PpVTy+7g38zZHlZ
X-Google-Smtp-Source: AMrXdXt4Q6HHATwC1mY+V03Ce9eeuL/IDZ4iXpv99e/h0IdtcUZeb4Ec4V/7W+R09QvQikHoVGQ2lA==
X-Received: by 2002:a17:902:d48a:b0:192:48d1:f06c with SMTP id
 c10-20020a170902d48a00b0019248d1f06cmr26089646plg.35.1673802996471; 
 Sun, 15 Jan 2023 09:16:36 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a1709027e8900b0019472226769sm4716086pla.251.2023.01.15.09.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 09:16:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH] target/arm: Widen cnthctl_el2 to uint64_t
Date: Sun, 15 Jan 2023 07:16:33 -1000
Message-Id: <20230115171633.3171890-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a 64-bit register on AArch64, even if the high 44 bits
are RES0.  Because this is defined as ARM_CP_STATE_BOTH, we are
asserting that the cpreg field is 64-bits.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1400
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

During my perigrinations of reorganizing cpregs, I've been thinking
of ways to detect these sorts of errors -- preferably at build time,
but failing that at startup.  I think all raw usage of offsetof has
got to be replaced with something like

#define cpreg_fieldoffset(field) \
    .fieldoffset = offsetof(CPUARMState, field), \
    .fieldsize = sizeof(((CPUARMState *)0)->field),

I'm not going to touch this until Fabiano's --disable-tcg cleanup lands.

r~

---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bf2bce046d..1feb63b4d7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -479,7 +479,7 @@ typedef struct CPUArchState {
         };
         uint64_t c14_cntfrq; /* Counter Frequency register */
         uint64_t c14_cntkctl; /* Timer Control register */
-        uint32_t cnthctl_el2; /* Counter/Timer Hyp Control register */
+        uint64_t cnthctl_el2; /* Counter/Timer Hyp Control register */
         uint64_t cntvoff_el2; /* Counter Virtual Offset register */
         ARMGenericTimer c14_timer[NUM_GTIMERS];
         uint32_t c15_cpar; /* XScale Coprocessor Access Register */
-- 
2.34.1


