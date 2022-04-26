Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11F55107B4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:54:16 +0200 (CEST)
Received: from localhost ([::1]:39268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQKF-0008VE-PC
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmo-0002p2-OS
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:42 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmn-0004Sk-8q
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:42 -0400
Received: by mail-pf1-x435.google.com with SMTP id i24so18692906pfa.7
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3aQg/hoAbUd4FyanyKyY4J09ziZifM+SJiSbzB2iG8g=;
 b=eiPB9tlHIBWQkhf1mTISs6h2qoJU2kjTP1E1bHlyi1jFb1paEoAv+VAb49/3z7/Z9z
 VzJEwAavGSE7JdOJLT+DzhtTCEgH/KMVGE1kx6cd3eOvy0y++GvgxobKde5ADbVWfKiy
 WFRGbVM6gb3wUsk2frEsrU6Geu3gySwq516LcMgNX+UqwzetDolqOc2fI1tHwMH8edg1
 rjcx17zQTLfz3bpyiwf2PK8tu9T4H31o5tzol4ExNFzGR/TMUehRn43mR471DoK7c3Rj
 2Q7je/Ay088pkSOEaP+o627uMT6FER7DF7frTYPT7/N4vuIS7co4y9WYHsoeg9gqNI5y
 tWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3aQg/hoAbUd4FyanyKyY4J09ziZifM+SJiSbzB2iG8g=;
 b=J53qBMyhzKLRJku5iXahQ6cdzYV/vI0uf/rn1geaN7TY9oJN1rrsCHEyA3J/U59Eue
 EdtVkV8P2WEIjWzrd/4wDPBCAEeXbI4QJdKT7mattiw1LQauF1jm73nZZOTByyi421/K
 rxn/ZE4wx4FCV/QGJ9zdECRnfaydguwMC6aLpT8kzBPBFf53Yb9PADuAlTHRH8QbblKA
 eynHH9MGj1ZjhZ73UJMTm+50XBtf9Hu//Pw88TKJTYywBoD/pr/oK/SEbCEsJoYKBBTq
 UyRsDPATPHmQeIy0DmVHDZhIipbfQmsdQ6Kxg3hfV0GZL/61quZ+VJNuT8bdpLP4JU1Z
 d5ng==
X-Gm-Message-State: AOAM532Q5Svm8RdYX2l/9TPENShb/6smVY+thOoC/VbOA2li/mIDhcPk
 Z9QoTtvV2P/d5kp+zyWV0uCdb6CkbgjthA==
X-Google-Smtp-Source: ABdhPJxlGcVE/rg7NCEK6Pn2uWgaHce1T0+jMgJSNZk30YhbbzyniAI40yD+BhmM21HyVudAPU/B1Q==
X-Received: by 2002:a05:6a00:b8b:b0:50d:6080:6be7 with SMTP id
 g11-20020a056a000b8b00b0050d60806be7mr3501650pfj.56.1650997179959; 
 Tue, 26 Apr 2022 11:19:39 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/68] target/nios2: Handle EXCP_UNALIGN and EXCP_UNALIGND
Date: Tue, 26 Apr 2022 11:18:33 -0700
Message-Id: <20220426181907.103691-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While some of the plumbing for misaligned data is present, in the form
of nios2_cpu_do_unaligned_access, the hook will not be called because
TARGET_ALIGNED_ONLY is not set in configs/targets/nios2-softmmu.mak.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220421151735.31996-35-richard.henderson@linaro.org>
---
 target/nios2/helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index c57ffd64e0..25a89724d0 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -99,6 +99,12 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         case EXCP_ILLEGAL:
             name = "ILLEGAL insn";
             break;
+        case EXCP_UNALIGN:
+            name = "Misaligned (data)";
+            break;
+        case EXCP_UNALIGND:
+            name = "Misaligned (destination)";
+            break;
         case EXCP_TRAP:
             name = "TRAP insn";
             break;
@@ -147,6 +153,8 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     case EXCP_SUPERD:
     case EXCP_ILLEGAL:
     case EXCP_TRAP:
+    case EXCP_UNALIGN:
+    case EXCP_UNALIGND:
         do_exception(cpu, cpu->exception_addr, false);
         break;
 
-- 
2.34.1


