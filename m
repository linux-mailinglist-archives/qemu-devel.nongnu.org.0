Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 854C74D46C8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:25:15 +0100 (CET)
Received: from localhost ([::1]:38914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHqz-0006Pu-Gk
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:25:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxf-000689-7N
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:03 -0500
Received: from [2607:f8b0:4864:20::62b] (port=43855
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxd-00080c-Mv
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:02 -0500
Received: by mail-pl1-x62b.google.com with SMTP id e2so4579794pls.10
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X9NHWUxVFbhUbKp9xmQLehwV/i5chUkMUmRvZ87Nmy4=;
 b=bz9XmRB8VQu6dOEwqenN5EROsQoUuMV9GjtKCMFTATg2HEfFfOG0HrYrVO133bBDu4
 +JG/Xeg6SnDerwDp1ZUQa7RhmCHT5fV5Sbq+QlSQy6efBuVC1OFEo97FQ9Csnp4ya2hP
 g+RWC5uhYBoGVcJgGqXa0+BW/fA8/iM3UTWyfDX/BIq1N5AaoDpkm56oKCRoLzsDVfzB
 s+/2cEf6s9I6KQ6FEb4s8+iimH/DY8SUyqubVGQ/4mdL8YLk9buK5xgDuigCSZ4GuZRw
 3ixjAFQZIkfWajTTudDKcUjAlgy0zjl3OCFKLFms0q0X3UCHmNPy0Y9b1smz1hLl3hlY
 Lx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X9NHWUxVFbhUbKp9xmQLehwV/i5chUkMUmRvZ87Nmy4=;
 b=iLgnqI3EexicANQicFtdssV48bCpgSvWQNh4/EqEbAYhv9ubxqDI4J93zn440zuT3O
 wfhrRktgv2EYLccSa+0FFnFa/RRItdqTlLZNsLkQjmKrL3vG8+tgRcjuwf7TCjzQkFRp
 opyemJddyQEIRIdR8Lt/JW38G4qdmSaCCbL1TXB1tJWGESsnYKVgrTUOEHTR+y7x3mKE
 CIEb5jLZcGzFG2ffpu93OKe15oyZwsAIvvo5qxxqArFXUtC2R5zzVxs0V73SDwOh2jqE
 leq5n+tRPsSsQd4HLgNpIIWUV4q9xB0kK4shBbXwFUf+CwvDVKadW4BVeIS/HWAxvprD
 8rXQ==
X-Gm-Message-State: AOAM530WCsdcSNhlr5rh/pFFwJgmjDk0DOAVzyjVa3wgGGyDs30ydivB
 RhDsfNhDKOElgzKKe1YEqc4gXzDC3sHUZA==
X-Google-Smtp-Source: ABdhPJyz8IlHDl4HQ/wDXund9y9lVObazAwe6fqkpFZaIW0IFbDIzpZraCxIwOYBjwQin/Og+a+s5Q==
X-Received: by 2002:a17:903:40c3:b0:151:c8a2:1c46 with SMTP id
 t3-20020a17090340c300b00151c8a21c46mr4605705pld.141.1646911680374; 
 Thu, 10 Mar 2022 03:28:00 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 29/48] target/nios2: Remove CPU_INTERRUPT_NMI
Date: Thu, 10 Mar 2022 03:27:06 -0800
Message-Id: <20220310112725.570053-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This interrupt bit is never set, so testing it in
nios2_cpu_has_work is pointless.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 2 --
 target/nios2/cpu.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 410e76ccbb..161f8efe82 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -177,8 +177,6 @@ FIELD(CR_TLBMISC, EE, 24, 1)
 #define EXCP_MPUI     16
 #define EXCP_MPUD     17
 
-#define CPU_INTERRUPT_NMI       CPU_INTERRUPT_TGT_EXT_3
-
 struct CPUArchState {
     uint32_t regs[NUM_GP_REGS];
     uint32_t ctrl[NUM_CR_REGS];
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 64dc916ed2..745a583f9d 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -36,7 +36,7 @@ static void nios2_cpu_set_pc(CPUState *cs, vaddr value)
 
 static bool nios2_cpu_has_work(CPUState *cs)
 {
-    return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
+    return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
 
 static void nios2_cpu_reset(DeviceState *dev)
-- 
2.25.1


