Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 823C168AB5C
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:38:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLU0-000569-K3; Sat, 04 Feb 2023 11:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTb-00050O-F1
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:39 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTZ-0002Tr-7q
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:18 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso11534695pjj.1
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kxDmw+FVE5lruLaCSsllZpfYhx9udcplIRRKsnSqczg=;
 b=wGDsRJL8nnqqw/cT5RVkzr+Thu71nXaRQeM46Fs2b46JQX2+yAaAnnDqbN+rXvN5HW
 aU+fxJz7OznFdXc/PGsdQ05Cn1oCY/MuRQzbDFiEziwJ2UQhsHbnmwXWV9HuPufjhiI0
 vubiICv2rdHSCaYNRmukWbq8xxAai1MCsfdILDPXsc3BxxffAdRtH41etyEl3pTXCE25
 VRuZeOJhwnpLfF5+2EAshVWhEksp0/ZDDOYl0uZB4zX7jp8h8F627XpPnjgTErwyOaD0
 5dim91o7pS3Nc21cBm9vpTNrEsz5k0ULJRhNP14bw5SmJLabu2+EMtGnTxecjPVgAjf0
 JLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kxDmw+FVE5lruLaCSsllZpfYhx9udcplIRRKsnSqczg=;
 b=f/FgrerFb/0Dz60kJ60Mpcya3W286DXs9TGOWcX7lpN9BIRVxhHVdQbg9ld0nQjQMV
 qIYrp9Lumw1Gqmyz/GCofwjcMwnopaMGxBX/DxYBJbuNo2l0pe1wmeeSG0SE86kvOSxq
 f7ABIAGM0hIez0mawdTC4hAldfP0az4M7anxqZz+KYAQQbeBI17Dmc4JFCs8XHmteLRh
 SWgn9RMbMJAA/TuluJjcLHC1CI2YNui3YNXwtfMw/P48Lap0D7RzDmUMQkB8OvS/feRL
 rL95xo2i4HKN2hkPUp5Qb6QtOhiHvarvL15DMOGZl+t6ChwGUZusa3li64mKeR3TqeDb
 Zdng==
X-Gm-Message-State: AO0yUKU4rk9qfWFTQvvBw5/TErVTJjarlf1F0pofW1q1TmXjBQY/lFPa
 2yeoh/jQ4oI47Kp9O/N1H9sp4dcPcuMp3kX2
X-Google-Smtp-Source: AK7set82Zbk9GWoY7oGBB5TM8kLqvUomLhcI7MWWP7XvrqxVQQt71+PaWejx+Li0yDW1thBEIKDP+A==
X-Received: by 2002:a17:902:ab59:b0:198:e3ee:2c98 with SMTP id
 ij25-20020a170902ab5900b00198e3ee2c98mr4774329plb.67.1675528395614; 
 Sat, 04 Feb 2023 08:33:15 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:33:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Eric Auger <eric.auger@redhat.com>
Subject: [PULL 01/40] accel/tcg: Test CPUJumpCache in tb_jmp_cache_clear_page
Date: Sat,  4 Feb 2023 06:32:31 -1000
Message-Id: <20230204163310.815536-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Eric Auger <eric.auger@redhat.com>

After commit 4e4fa6c12d ("accel/tcg: Complete cpu initialization
before registration"), it looks the CPUJumpCache pointer can be NULL.
This causes a SIGSEV when running debug-wp-migration kvm unit test.

At the first place it should be clarified why this TCG code is called
with KVM acceleration. This may hide another bug.

Fixes: 4e4fa6c12d ("accel/tcg: Complete cpu initialization before registration")
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20230203171510.2867451-1-eric.auger@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 4e040a1cb9..04e270742e 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -100,9 +100,14 @@ static void tlb_window_reset(CPUTLBDesc *desc, int64_t ns,
 
 static void tb_jmp_cache_clear_page(CPUState *cpu, target_ulong page_addr)
 {
-    int i, i0 = tb_jmp_cache_hash_page(page_addr);
     CPUJumpCache *jc = cpu->tb_jmp_cache;
+    int i, i0;
 
+    if (unlikely(!jc)) {
+        return;
+    }
+
+    i0 = tb_jmp_cache_hash_page(page_addr);
     for (i = 0; i < TB_JMP_PAGE_SIZE; i++) {
         qatomic_set(&jc->array[i0 + i].tb, NULL);
     }
-- 
2.34.1


