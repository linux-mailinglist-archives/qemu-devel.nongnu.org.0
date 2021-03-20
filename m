Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B809342FCC
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 23:11:59 +0100 (CET)
Received: from localhost ([::1]:50674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNjp8-00078M-CO
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 18:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lNjnE-0005nN-2p
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 18:10:00 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lNjnC-0003Ui-MT
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 18:09:59 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 d8-20020a1c1d080000b029010f15546281so6888865wmd.4
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 15:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q8nffv8cDX+xg0dinm1qF33rM9tIhFRImp5jboI5ADA=;
 b=nTotpkSMXvnVASF7SUW+226qiy2YmP3KKlskMBhNa6msuQgXfe+pqweM3WWY+RdCiG
 Mhvzpi27uSL23mHtQt0btAHAs/BsrDq5Rf9ne03Zivj0EeAResMJrwIvv5fKzwPI+dc3
 ERN32gl2Q6oBLmquChbhRmosdWOyG8As7u/+jx6zi6VlpXRyjdo7M6YEHYp8PYoGCUZ8
 mO+olfsZNvCwW/KxwNwyFcF9Q7pp3wPo+vTb0mg74qX6M9pxTzN0VazYWrzkXCSCsmIr
 do75Uxe/mUncNVYqjM5EJinV88vl/9ezQ1IHwpfm15PN0m5/lormAasF3mKZNF8sRmvo
 NYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q8nffv8cDX+xg0dinm1qF33rM9tIhFRImp5jboI5ADA=;
 b=Cn7SV+BaXJUEic5Zvb+q+wJVsCapMgk7+9DlzqtziauTDV2OAMwedk64wBEmr9obyD
 ZsKeRB/o7tSmpt/WsyqxJIp8K334F0H8qaMbNTrWdSh8ml7hquj45RtgUZ9clgHOvNGu
 OuFOJ+wSILJgiflLxFbY5hxrQ6/0xJ4xQCfYYcAdpaE4Jx6y8Y98rVEflknlqixTwt0N
 tQtRCtg9Pt5bSMBqyjzbmmF4YPdQbSh8UBjYxnC4M7DS9guhWzUU/nugan4IC+zwbgo0
 VSyoFL1Cpg5mAc4yqQGro59qPh2F0nLEIZ41k6Lty2aXd3sgkZGnKw1Fz3wXswNsGjkY
 j14w==
X-Gm-Message-State: AOAM532I8ZEfbqbj10dK2kl1zgcqZf6usGkoBeqTv5teZzc3PzlUh2ZU
 NmlD/qWMzN0ZBUZ3pnaqChC97vdBfYPE2w==
X-Google-Smtp-Source: ABdhPJyMHYpGPTl7loVeCCHbwumy/KV70HvaNOraw+iSzBTcuzCA4LpnytIS/QpWcyZ9+soiqLvOoA==
X-Received: by 2002:a7b:c407:: with SMTP id k7mr9555522wmi.136.1616278196796; 
 Sat, 20 Mar 2021 15:09:56 -0700 (PDT)
Received: from localhost.localdomain (bzq-79-176-28-221.red.bezeqint.net.
 [79.176.28.221])
 by smtp.gmail.com with ESMTPSA id i16sm17175272wmq.3.2021.03.20.15.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 15:09:56 -0700 (PDT)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] Set TARGET_PAGE_BITS to be 10 instead of 8 bits
Date: Sun, 21 Mar 2021 00:09:49 +0200
Message-Id: <20210320220949.40965-2-mrolnik@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210320220949.40965-1-mrolnik@gmail.com>
References: <20210320220949.40965-1-mrolnik@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=mrolnik@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Michael Rolnik <mrolnik@gmail.com>, dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
---
 target/avr/cpu-param.h | 8 +-------
 target/avr/helper.c    | 2 --
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/target/avr/cpu-param.h b/target/avr/cpu-param.h
index 7ef4e7c679..9765a9d0db 100644
--- a/target/avr/cpu-param.h
+++ b/target/avr/cpu-param.h
@@ -22,13 +22,7 @@
 #define AVR_CPU_PARAM_H
 
 #define TARGET_LONG_BITS 32
-/*
- * TARGET_PAGE_BITS cannot be more than 8 bits because
- * 1.  all IO registers occupy [0x0000 .. 0x00ff] address range, and they
- *     should be implemented as a device and not memory
- * 2.  SRAM starts at the address 0x0100
- */
-#define TARGET_PAGE_BITS 8
+#define TARGET_PAGE_BITS 10
 #define TARGET_PHYS_ADDR_SPACE_BITS 24
 #define TARGET_VIRT_ADDR_SPACE_BITS 24
 #define NB_MMU_MODES 2
diff --git a/target/avr/helper.c b/target/avr/helper.c
index 35e1019594..da658afed3 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -111,8 +111,6 @@ bool avr_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     MemTxAttrs attrs = {};
     uint32_t paddr;
 
-    address &= TARGET_PAGE_MASK;
-
     if (mmu_idx == MMU_CODE_IDX) {
         /* access to code in flash */
         paddr = OFFSET_CODE + address;
-- 
2.25.1


