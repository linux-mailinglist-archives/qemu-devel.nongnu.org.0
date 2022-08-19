Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DBC599370
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 05:28:42 +0200 (CEST)
Received: from localhost ([::1]:34306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOsgb-0006q0-39
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 23:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseL-0001RY-OB
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:21 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:36788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseK-0002iT-9A
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:21 -0400
Received: by mail-pl1-x631.google.com with SMTP id c2so3108230plo.3
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 20:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ztH2KdOZugDOiuPkZQawXgA4F56Gwh34Y3mDIuElS7Y=;
 b=x1MCq2nI2WuzpIlYXbl/jpbHcEo+NJaZbvN7kEPMwYzB8tJ1oDNLN/vqkvC5E0Z3z+
 2k3Sex1yChUeKGmPU2qXopnIoLjXUdlcxKARRoprpH/8Z6nACdsoMHzKfssVSndhuA7z
 lmSvqU4Lnx5k+mmtkpEM2WY4hAFYZh4jr/8tNbbtl1xtozjxi0Rf//X6YU8LUlNhWeE4
 ux67HkKsFZ0nqrtg2D5KpGAVlROdv8x+R/gjhmtXtRONjNe6sZh0o83vJzlSLBoonpQu
 po4WbtG/1KZTsfehSBqKeo3hGEByUWaue9domADT6zYUN5dueaqb8EjRs9Z9dFlhxDQB
 PHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ztH2KdOZugDOiuPkZQawXgA4F56Gwh34Y3mDIuElS7Y=;
 b=bQQD6+QL5KkoV9cHuscDyPB+vc3+7OMQJK3dx3jG/1Ena3Y60MIFQwFRsbnhQiNhTh
 00LxiXdPpGJkSwftKGH7pP2hZzWr8oFhqABltmK4GgvJ9H2RnL3v9NatVWOnwvR8JBNx
 joEuINO8S0eWaVY2VXuiFfgL2krhpBMvc3SNGpJ13IQNFmsk/HKNvanfPbvMY1vG59TI
 gtaESQL+vrst4At1/OFei417uAMEqPpamMg8Ba2SslhUD56YSB89QwDbW/8LP0t9YL78
 AWZ71izn/vtopidBMOBv30OjQ5Igse2U3QIE98YCVzADvfb2epSt6vfAuowu2V+QOket
 nBAg==
X-Gm-Message-State: ACgBeo0XvF3AAKqgxTvgn2FwgUkYVAlkO//QGYpgAeZI9oX33oMzGJYW
 AgnLsI+KCxtfuykW7oxymV6gaLAT0xD5Lg==
X-Google-Smtp-Source: AA6agR5SSVOZTCKWM/L/4/UjLnnprvfUncVl6UVSYO5XlcQE27VLofcm3WrSvQdEWJWSaLVm6fly7w==
X-Received: by 2002:a17:90b:33c4:b0:1f5:8428:beb9 with SMTP id
 lk4-20020a17090b33c400b001f58428beb9mr11821825pjb.95.1660879578520; 
 Thu, 18 Aug 2022 20:26:18 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e])
 by smtp.gmail.com with ESMTPSA id
 g184-20020a6252c1000000b00535d19c46d7sm2199904pfb.203.2022.08.18.20.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 20:26:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, iii@linux.ibm.com, dramforever@live.com,
 alistair.francis@wdc.com, alex.bennee@linaro.org
Subject: [PATCH v6 01/21] linux-user/arm: Mark the commpage executable
Date: Thu, 18 Aug 2022 20:25:55 -0700
Message-Id: <20220819032615.884847-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819032615.884847-1-richard.henderson@linaro.org>
References: <20220819032615.884847-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

We're about to start validating PAGE_EXEC, which means
that we've got to mark the commpage executable.  We had
been placing the commpage outside of reserved_va, which
was incorrect and lead to an abort.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/target_cpu.h | 4 ++--
 linux-user/elfload.c        | 6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/linux-user/arm/target_cpu.h b/linux-user/arm/target_cpu.h
index 709d19bc9e..89ba274cfc 100644
--- a/linux-user/arm/target_cpu.h
+++ b/linux-user/arm/target_cpu.h
@@ -34,9 +34,9 @@ static inline unsigned long arm_max_reserved_va(CPUState *cs)
     } else {
         /*
          * We need to be able to map the commpage.
-         * See validate_guest_space in linux-user/elfload.c.
+         * See init_guest_commpage in linux-user/elfload.c.
          */
-        return 0xffff0000ul;
+        return 0xfffffffful;
     }
 }
 #define MAX_RESERVED_VA  arm_max_reserved_va
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index ce902dbd56..3e3dc02499 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -398,7 +398,8 @@ enum {
 
 static bool init_guest_commpage(void)
 {
-    void *want = g2h_untagged(HI_COMMPAGE & -qemu_host_page_size);
+    abi_ptr commpage = HI_COMMPAGE & -qemu_host_page_size;
+    void *want = g2h_untagged(commpage);
     void *addr = mmap(want, qemu_host_page_size, PROT_READ | PROT_WRITE,
                       MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
 
@@ -417,6 +418,9 @@ static bool init_guest_commpage(void)
         perror("Protecting guest commpage");
         exit(EXIT_FAILURE);
     }
+
+    page_set_flags(commpage, commpage + qemu_host_page_size,
+                   PAGE_READ | PAGE_EXEC | PAGE_VALID);
     return true;
 }
 
-- 
2.34.1


