Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC9D6D830D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:07:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk5dw-0006Ph-Ge; Wed, 05 Apr 2023 12:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5ds-0006OD-Jf
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:05:48 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5dp-000833-LK
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:05:48 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l10-20020a05600c1d0a00b003f04bd3691eso7394308wms.5
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 09:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680710744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1nroHqABUajLqRunlI+qD37HAN4v8HXiRYQrqBTvdwE=;
 b=qw5qTTc4CNQPm1h/LZ0mTTXy0OF7gIZq7jkcglSCTingvHz0cqXrBwBojetrVCnaEU
 V3XSlu7iPDyJb/v2VW6Mfo7ZEcibrTott+zYeXs/SZP1HCHBMI39vaj3sfGTFwJQbfZo
 bPbd459qPJhpcD9HW2tSPRWW6uWhsivNaPaKQ8L/mgDLhLP0gasJOaP/HIEJmenRuRRk
 umwaalz/6EAfiwgdglIA20tavSVgQWBEjmI01ISEOl/XiJZYm6MLszMBTX98bQRndoHx
 htVpU34jeAGTXaELsldCnNYgFUNan9n4kpcE+bf1j5dhHWTQfNnLz94EFHsmMlTBB75M
 MoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680710744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1nroHqABUajLqRunlI+qD37HAN4v8HXiRYQrqBTvdwE=;
 b=hYQb5X3JDT9QWT1qbtePcQFoH62PTlzWRKkxja+3rT5rChZu+oP62ikFKPQxPD5tw/
 B74px6a4Qcr9rpdcD838mDDe1g2grUGGXuUZZoKEuco4pf4zWp1ct7JjZW/qxDRKd7kE
 qXo0W4y7T7/1K4JZENKQ73enFm++kWH+BF1xmaiUKDdUcZ9XYwyUdSaZ+rvow8XV00zL
 NM/6JVnjhbiiksT/RLd6lUkgZmAyvzwWXmGTUl+qhZV5xnDve1QaRR1l8dvZ/TYMmuyq
 IP3oUg37V81llJtUqPKDt5ufG8Msu8jJAK1EcXsJODyjwViH+phEtx555BNuo6yYw0hB
 k3yw==
X-Gm-Message-State: AAQBX9cA7Ffi2pGmHHqckuxkZ/EwnNISjMd/UlYf+5/dQiy9l2iy+lGJ
 PCY2RmpAychstviU/JPNRff6jtLC4PJo/Fm4HXM=
X-Google-Smtp-Source: AKy350avtCPFICutt8vrOag6ZCtLMApHyjgYl5gdC/mIgFAzkBuA1jps8xP9/D8yQimuv1rVe3m43w==
X-Received: by 2002:a05:600c:20f:b0:3da:2ba4:b97 with SMTP id
 15-20020a05600c020f00b003da2ba40b97mr2228281wmi.19.1680710743845; 
 Wed, 05 Apr 2023 09:05:43 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c4fcb00b003ebff290a52sm2565572wmq.28.2023.04.05.09.05.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 09:05:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 08/10] target/ppc: Restrict KVM-specific field from ArchCPU
Date: Wed,  5 Apr 2023 18:04:52 +0200
Message-Id: <20230405160454.97436-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405160454.97436-1-philmd@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

The 'kvm_sw_tlb' field shouldn't be accessed when KVM is not available.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/cpu.h        | 2 ++
 target/ppc/mmu_common.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 557d736dab..0ec3957397 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1148,7 +1148,9 @@ struct CPUArchState {
     int tlb_type;    /* Type of TLB we're dealing with */
     ppc_tlb_t tlb;   /* TLB is optional. Allocate them only if needed */
     bool tlb_dirty;  /* Set to non-zero when modifying TLB */
+#ifdef CONFIG_KVM
     bool kvm_sw_tlb; /* non-zero if KVM SW TLB API is active */
+#endif /* CONFIG_KVM */
     uint32_t tlb_need_flush; /* Delayed flush needed */
 #define TLB_NEED_LOCAL_FLUSH   0x1
 #define TLB_NEED_GLOBAL_FLUSH  0x2
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 7235a4befe..21843c69f6 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -917,10 +917,12 @@ static void mmubooke_dump_mmu(CPUPPCState *env)
     ppcemb_tlb_t *entry;
     int i;
 
+#ifdef CONFIG_KVM
     if (kvm_enabled() && !env->kvm_sw_tlb) {
         qemu_printf("Cannot access KVM TLB\n");
         return;
     }
+#endif
 
     qemu_printf("\nTLB:\n");
     qemu_printf("Effective          Physical           Size PID   Prot     "
@@ -1008,10 +1010,12 @@ static void mmubooke206_dump_mmu(CPUPPCState *env)
     int offset = 0;
     int i;
 
+#ifdef CONFIG_KVM
     if (kvm_enabled() && !env->kvm_sw_tlb) {
         qemu_printf("Cannot access KVM TLB\n");
         return;
     }
+#endif
 
     for (i = 0; i < BOOKE206_MAX_TLBN; i++) {
         int size = booke206_tlb_size(env, i);
-- 
2.38.1


