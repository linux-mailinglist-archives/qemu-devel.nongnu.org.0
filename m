Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A76183E4660
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:20:32 +0200 (CEST)
Received: from localhost ([::1]:37340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5CN-0008Su-L1
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD54I-0003Vs-0H; Mon, 09 Aug 2021 09:11:50 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:36468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD54G-0001gA-2S; Mon, 09 Aug 2021 09:11:49 -0400
Received: by mail-qk1-x72f.google.com with SMTP id e14so18239431qkg.3;
 Mon, 09 Aug 2021 06:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FWFgfplaTzNkniHNY7tbeVhqT1oZv0wF6B465cGnKGw=;
 b=mv1UTL+yU66RTGPCMELNUgmOY98eh2wI1djFay+pnXuppBRROHqs+stICHC2KWS/ho
 NojF6kppwTBa6LodS6ids0s1Y2NUG3a1hUDazuO3SnXFUFgQQaHFBXr41TG6uqs6osYg
 Y3yaNEHqfOCPsqV1VCaWSFrUnU4SONmfKhZg9gIRGh0KRJijAjjCsoJ7eKZ91Lfl+KdC
 yX06XegjnRY3vBx5YFHZNE8n1hoQC33yAnFlakdb3adXNpdUmue1ls7zlRyMIjbHSgZD
 wxG/KL8RUaVRE+gu8IyJLtMuQKUCy6rHK/TpSrTSkxSfLSFJ8I0MUogEfRHjtbLr0soB
 12yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FWFgfplaTzNkniHNY7tbeVhqT1oZv0wF6B465cGnKGw=;
 b=OLM+xR9AMelSSSLE2Z/qVE7pcMM+0wyvJmHDNZ6DAGkI/INkGmqmFhxqXye6DFOvsm
 ZHlqQFvuuOMhJ0gozhgJ1BmjlDKUhewJTivPBZw5Zx367k0EKzEBGq0s3oDYrk+isoml
 sBJAfEQ3ud9lSJJdYkmzlfXn9kJdii+aOwTN/aDKLT0gI85Bv0/YFoJbib6DT8NJjYTp
 0Ir43USmC6APBPNcC/4njf2yoUYM1vAF5WYnACEpErfu/wwfvD87rCyo+WUBOf44GIxz
 QNscjCqLlf/n08w/2kAsj/jojjpYqJVpErDS6Ef0LjwuPspYDvryk23J1YKYNdg+oqFe
 m0Ew==
X-Gm-Message-State: AOAM531hHW0O4Ln0U4wdnQFxubb2tvSU3zQl30lwpJJgkjT6ZzQtjchH
 IiPFtbkGZxbAs3hSt6MYmjP7j/iTpA+8Cg==
X-Google-Smtp-Source: ABdhPJy50kwLV1/evSm1GSBeksMfltB6STe7VwppoGf19zUqASxF3WVVv+uFhY6TaIixQJy3LQdHWg==
X-Received: by 2002:a37:6897:: with SMTP id d145mr1206932qkc.490.1628514706769; 
 Mon, 09 Aug 2021 06:11:46 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id f3sm6757435qti.65.2021.08.09.06.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:11:46 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/19] target/ppc/pmu_book3s_helper: adding 0xFA event
Date: Mon,  9 Aug 2021 10:10:54 -0300
Message-Id: <20210809131057.1694145-17-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131057.1694145-1-danielhb413@gmail.com>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: gustavo.romero@linaro.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PowerISA 3.1 defines the 0xFA event as instructions completed when
the thread's CTRL register is set. Some EBB powerpc kernel tests use
this event to exercise both the PMU and the EBB support.

We don't have a way at this moment to tell whether an instruction was
completed under those conditions. What we can do is to make it
equivalent to the existing PM_INST_COMPL event that counts all
instructions completed. For our current purposes with the PMU support
this is enough.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/pmu_book3s_helper.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helper.c
index c5c5ab38c9..388263688b 100644
--- a/target/ppc/pmu_book3s_helper.c
+++ b/target/ppc/pmu_book3s_helper.c
@@ -52,6 +52,20 @@ static uint8_t get_PMC_event(CPUPPCState *env, int sprn)
         break;
     case SPR_POWER_PMC4:
         event = MMCR1_PMC4SEL & env->spr[SPR_POWER_MMCR1];
+
+        /*
+         * Event 0xFA for PMC4SEL is described as follows in
+         * PowerISA v3.1:
+         *
+         * "The thread has completed an instruction when the RUN bit of
+         * the thread’s CTRL register contained 1"
+         *
+         * Our closest equivalent for this event at this moment is plain
+         * INST_CMPL (event 0x2)
+         */
+        if (event == 0xFA) {
+            event = 0x2;
+        }
         break;
     case SPR_POWER_PMC5:
         event = 0x2;
-- 
2.31.1


