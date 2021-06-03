Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F5939A328
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:28:44 +0200 (CEST)
Received: from localhost ([::1]:57272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1looKx-0008Rs-KA
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1looJc-0005gj-Tv
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:27:20 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:43651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1looJa-0000Hj-H8
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:27:20 -0400
Received: by mail-ed1-x52b.google.com with SMTP id s6so7339686edu.10
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GjSj1BvMv7SkGTnFgml+cFr3Qod8iyQlPdCz9aegSrI=;
 b=PYghqe/RQS/a9pXknY1ax2g75KzsW9oQX8bR2qtkT38J8YkaOEPjjhy6L5CGaNzrX0
 rIos8pI0AMaRGRcw402HFFkzgRBzntmbw7a3QG3oZwOGdx5QJ+8qaOS/ju4KAULSP+s4
 8iGhlQjLEBZWzZINdONls3E5iTxLaldJtHAGdZiTzIyPLgWnLpu0m13pXZCIEMNqMknV
 Z9zvR7oqVHGMWM6Pg7JNkhdiAbx7cSEntTAX/4iMMjrWsbCtHbQbHkTIi0ei7YoNv5ZL
 Iw3Jl4yqOs/p/VpQ4bzkQEYdSzBfAzmRPSkjllTYFmOFqL2R1fUrVFJxLPWSIXfi78Y2
 lTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GjSj1BvMv7SkGTnFgml+cFr3Qod8iyQlPdCz9aegSrI=;
 b=VNtNN0RfWOfTFsKAWk/dVPZWMMj1h+OwdBmJc7Y9jobM5sSfIiye5adseIqemd4Kxt
 AIjuDJImzKs8ZcTD7vYFN6/MqXv8WcHhvXCBEhM6A82zi8/l7gk+Llyq+ehhRwEKf6rT
 P12ml17byIoPI2rd/5c17zKikrPql9RMX9Wc47gYMS8lLshV7ymbE5oI1WTnYksOQgJu
 nIUc0VKow4poxaI+4Y3ZE7+KYCfXzB+3oNkUlznvkdckfHMEVnNjw+l7Si6d6dYeosya
 TuLIyPV2AHu1u9Dlob3aG0FdAkxuqNNTx9Vd6emSvClc8XBvcjua5bXKXaVECMzuQrCg
 scUQ==
X-Gm-Message-State: AOAM531zVbFjQ974ncvCh/ORkdn5bW/0jll0scAjI65KgeRGhX+xqRWn
 1nfhnzb8dzzUC+9rAb6Gq7RUwaVzIo2+tQ==
X-Google-Smtp-Source: ABdhPJxx97wahZAFSzrLSFx+YB5jneBidNkgV2sV+3ajw6AYp9khJntgvw4gb6zCTLPcZHmMSBg2qA==
X-Received: by 2002:a05:6402:1801:: with SMTP id
 g1mr43474edy.305.1622730437247; 
 Thu, 03 Jun 2021 07:27:17 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 p13sm1562747ejr.87.2021.06.03.07.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:27:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/i386: tcg: fix segment register offsets for 16-bit
 TSS
Date: Thu,  3 Jun 2021 16:27:12 +0200
Message-Id: <20210603142714.224210-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603142714.224210-1-pbonzini@redhat.com>
References: <20210603142714.224210-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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



