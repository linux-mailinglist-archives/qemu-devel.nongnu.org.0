Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C3E3C2B90
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 01:10:49 +0200 (CEST)
Received: from localhost ([::1]:37970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1zdw-0003Yo-Fr
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 19:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1zZm-0000P4-DN
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 19:06:32 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:33558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1zZh-0004jS-0Y
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 19:06:29 -0400
Received: by mail-pf1-x42f.google.com with SMTP id m83so2452560pfd.0
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 16:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/iDhmkz0f3T9GUt7lkp7w4neMFdEQE2MNAGQv76evlc=;
 b=VqpBkuiRUp/i9+4jEAq0AHdWD35YU1aAO18qYjpa3NDaABrIC+YySIMk1dVCDv81Oj
 0l4PtypDCpoLAfL+QSu1A3yDe3IctT1A8lmLzlOMCP0cMbodDA1rtNeXAZ9TyJnTL+Ln
 nB6iAAfh+NX87BRCjEP+ZzNnMIGUI+nWtQ9NpZsS7BJi61YbPGcr7UaSUfGpd3WREi0l
 SVjkOOkIVgdDrb72chWUwbc+pbuMmvdlxXJETdKcXjcEY2rupsCuaBksAUSK7chPMtIK
 5QExYP3HS1LC6zm45VrOAxi3gE5YDlSbdm+6X+m/w7X20KGUV3VW8qwp0gIBwEzUiBTA
 T/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/iDhmkz0f3T9GUt7lkp7w4neMFdEQE2MNAGQv76evlc=;
 b=Orj2FuDKkP861NJyfCYyzxyfplcCTRa6W3J02/MGgSp6UJoLacHKIxW9WY8/SUZ2F2
 Stgu3/bsOfsU9pnps/GF1ptucpAp717O0KU5G5UvQrMRyMsVEbtIF1zxD6DLrU6iZdjF
 C1GClvV6gB+c6OlRrJElTwDf9sqY5bxvgDeG7jl8F/hSCLd3y2PQ0uEud68MGRUja81X
 9D3oBaR69LIiLNjbJn1ret3e4PylL9l5RW2MOtK59fe2G6AOJ7+cz5CFodE0qiN99q2b
 Pc8zuPRQz0m2Wxl73I1jxMQXCcveAUNlfaRnGBOCBWK5Asm2F68WJw++tm7kRbFysaZa
 LiQQ==
X-Gm-Message-State: AOAM532+pG71vHAcGjS3j5i0aIj60pPlYJb8g9tP+xihdOA+ExSaJbLA
 nEiyj+D4Kji0x2/hxep5xHdGU04MF7hiXQ==
X-Google-Smtp-Source: ABdhPJwTWdCeT6UuQtI0BYWnUE4OSI+zDjolN4lDdUO1cSTWRfu+3CvJcENwvkb2ZEUxXtigmX0Ebw==
X-Received: by 2002:a05:6a00:b42:b029:31c:abd1:53ec with SMTP id
 p2-20020a056a000b42b029031cabd153ecmr33421380pfo.45.1625871983521; 
 Fri, 09 Jul 2021 16:06:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d20sm7270414pfn.219.2021.07.09.16.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 16:06:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] target/arm: Fix offsets for TTBCR
Date: Fri,  9 Jul 2021 16:06:21 -0700
Message-Id: <20210709230621.938821-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709230621.938821-1-richard.henderson@linaro.org>
References: <20210709230621.938821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The functions vmsa_ttbcr_write and vmsa_ttbcr_raw_write expect
the offset to be for the complete TCR structure, not the offset
to the low 32-bits of a uint64_t.  Using offsetoflow32 in this
case breaks big-endian hosts.

For TTBCR2, we do want the high 32-bits of a uint64_t.
Use cp15.tcr_el[*].raw_tcr as the offsetofhigh32 argument to
clarify this.

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/187
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a66c1f0b9e..3292e212e0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4106,8 +4106,9 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
       .access = PL1_RW, .accessfn = access_tvm_trvm,
       .type = ARM_CP_ALIAS, .writefn = vmsa_ttbcr_write,
       .raw_writefn = vmsa_ttbcr_raw_write,
-      .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.tcr_el[3]),
-                             offsetoflow32(CPUARMState, cp15.tcr_el[1])} },
+      /* No offsetoflow32 -- pass the entire TCR to writefn/raw_writefn. */
+      .bank_fieldoffsets = { offsetof(CPUARMState, cp15.tcr_el[3]),
+                             offsetof(CPUARMState, cp15.tcr_el[1])} },
     REGINFO_SENTINEL
 };
 
@@ -4118,8 +4119,10 @@ static const ARMCPRegInfo ttbcr2_reginfo = {
     .name = "TTBCR2", .cp = 15, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 3,
     .access = PL1_RW, .accessfn = access_tvm_trvm,
     .type = ARM_CP_ALIAS,
-    .bank_fieldoffsets = { offsetofhigh32(CPUARMState, cp15.tcr_el[3]),
-                           offsetofhigh32(CPUARMState, cp15.tcr_el[1]) },
+    .bank_fieldoffsets = {
+        offsetofhigh32(CPUARMState, cp15.tcr_el[3].raw_tcr),
+        offsetofhigh32(CPUARMState, cp15.tcr_el[1].raw_tcr),
+    },
 };
 
 static void omap_ticonfig_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.25.1


