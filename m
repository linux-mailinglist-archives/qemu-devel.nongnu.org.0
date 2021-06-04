Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C2A39BBAB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:21:31 +0200 (CEST)
Received: from localhost ([::1]:33084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpBda-0007q3-Bk
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBa5-0007lv-2y
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:17:53 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBa3-0008EQ-KH
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:17:52 -0400
Received: by mail-ed1-x535.google.com with SMTP id dg27so11548627edb.12
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GjSj1BvMv7SkGTnFgml+cFr3Qod8iyQlPdCz9aegSrI=;
 b=GWEVTHaR8Fcs9geqyVtIzcmgFPqFMYqz+IbtZPoN6505YtiGmrv+N1Wivj6KGJOLwZ
 odCxKRoJqm4yHaavI6RZgsLtoRl/4cNihcjzAJq70IC3UPfc6uW+mTLR/WENkt7UQ00t
 bO2941X7NdNvKvQgTlPWe2qNXWrhIlO6EhZuMFCqGpmQ/p8jSaMO2dZsNJ4NEegoYFjt
 TbF7CSPQAKzl7AhPmNViDDtHokOTP+9JkP240d80/p5LYBu6X0n2UFIzqUqaGDpXjxBg
 qCfIhPMB72ae7eV7KsS4gt6GbmbU/6VsUgAvJR/I+0FOvLxMgQ8iYnhQPUM388Q5M/SB
 4iSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GjSj1BvMv7SkGTnFgml+cFr3Qod8iyQlPdCz9aegSrI=;
 b=iHmUTwR9PNzZ9gK2y3PtBPNeV9cMVwsx+s954E1yUy+uKGXwCFFGk3+t/7nSTxFT0q
 c8ZAZV2FDAJVNtXnY1SU1Iz6drpDbhNwnXERnSPfZt2wTQ+ZhCbDfgJqoowKTg/shr28
 kD7ijff/BLQPMCWRYV6WAffMhYtiPJ+KmpxDymJBqMW8fVaijiN3IYj1t/qa3bNZKMLr
 J03F4aar4djnAp7PWqrC2fZXqJrUGL/gi+Nl3u61FcCpSdQmIkv1Rzk1V4PsfSTts7jH
 tEOee0eWUJ8wkL3QEOkL09/8cHEojRzwg7qeGUfZQ7Av7+3nu+TwAeB+egNjaIpEYdUu
 Cu3w==
X-Gm-Message-State: AOAM530DKsJIFcthR1/WRtcHWE/0bSZftRR5pj4j0p99X8ycgeHZWUbl
 mbUyVIoQdW/2WenVzraime03Fy/erDuFKQ==
X-Google-Smtp-Source: ABdhPJw9qIN5tpMQG/DOus7qdL+TIc5J3RCfCj9IA+p+tTl8kYgWhZWJsw9QJRRxxcJUvAlwCskmKg==
X-Received: by 2002:a05:6402:524b:: with SMTP id
 t11mr5192861edd.327.1622819870385; 
 Fri, 04 Jun 2021 08:17:50 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 w1sm2402451eds.37.2021.06.04.08.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:17:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/13] target/i386: tcg: fix segment register offsets for
 16-bit TSS
Date: Fri,  4 Jun 2021 17:17:36 +0200
Message-Id: <20210604151745.310318-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604151745.310318-1-pbonzini@redhat.com>
References: <20210604151745.310318-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The TSS offsets in the manuals have only 2-byte slots for the
segment registers.  QEMU incorrectly uses 4-byte slots, so
that SS overlaps the LDT selector.

Resolves: #382
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/seg_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index 2f6cdc8239..547b959689 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -281,7 +281,7 @@ static void switch_tss_ra(CPUX86State *env, int tss_selector,
                                              retaddr) | 0xffff0000;
         }
         for (i = 0; i < 4; i++) {
-            new_segs[i] = cpu_lduw_kernel_ra(env, tss_base + (0x22 + i * 4),
+            new_segs[i] = cpu_lduw_kernel_ra(env, tss_base + (0x22 + i * 2),
                                              retaddr);
         }
         new_ldt = cpu_lduw_kernel_ra(env, tss_base + 0x2a, retaddr);
@@ -349,7 +349,7 @@ static void switch_tss_ra(CPUX86State *env, int tss_selector,
         cpu_stw_kernel_ra(env, env->tr.base + (0x12 + 6 * 2), env->regs[R_ESI], retaddr);
         cpu_stw_kernel_ra(env, env->tr.base + (0x12 + 7 * 2), env->regs[R_EDI], retaddr);
         for (i = 0; i < 4; i++) {
-            cpu_stw_kernel_ra(env, env->tr.base + (0x22 + i * 4),
+            cpu_stw_kernel_ra(env, env->tr.base + (0x22 + i * 2),
                               env->segs[i].selector, retaddr);
         }
     }
-- 
2.31.1



