Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4933F0BD8
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:33:53 +0200 (CEST)
Received: from localhost ([::1]:48540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRJw-000368-7e
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6d-000112-73
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:20:07 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:43965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6a-0000Ka-Fw
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:20:06 -0400
Received: by mail-pl1-x635.google.com with SMTP id e19so2420061pla.10
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K/7Y1V5oBIIfdjY20lpJpKxfET+Clwy5MMgM5y1dWLw=;
 b=VLF9RvOz5nYCoeAyfnPn2cyjN0r4htxzCydqrOAYbvA4IoBpHn/qN44/uIXqxCMOez
 3cuOqInhmO/7qL2k+kSRZMfWdOmvkminywUUlIygE9Y6EVcUbrhU6cKvsVFvT1a9ky/T
 iQNtyFN75TEFDlJbNiTnWx2rQPk8fB9mGduYh6f8AhyOTGuIjzeeaaPILDnNHiBM6ans
 hvmdQo3N1a+xd7fo2LnWhL6lsL/NkJiXvzZm93xu1Hw/bhB7ruwfx+3L/84agwm4zNEu
 xx3351scwBwABRXdHr3crShYcNsjZ55ayMsHKQbrPCCe/FdkBG+8cA7K0iYC6j8k9dMH
 9WAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K/7Y1V5oBIIfdjY20lpJpKxfET+Clwy5MMgM5y1dWLw=;
 b=eiF+2U0MVR1fh2/P5vXPUCzYmXmrYSoZO8MXGFe0v9uPQCKaWdh1fUhgarZzL/nBFo
 Tqi4slt6tq9wLzUPJ64jSh6h203DHeFafOzXUefABySy+CjOS7KAbkcCkEvmupswOq1Y
 +REsszScDTLUHWueY5SaXAN+fvoGYpyEoh5JGTPeHWniKxBUSb61cpsI8xiBG5Ju5zG6
 xIbz583LoNRC5SZTA3MGPxd5t2rct5ZPna6263cOym6OOv4kpVPWrsAe2z+WcIBemmQN
 Yd+ZYEwurMsbFqHlDmnJP1b8py+0YRgI/bacbU5q3GosRLwW5c87NP/MNvDX1TvbVIBg
 rgpg==
X-Gm-Message-State: AOAM531QHYv6A7H3yhWc2J1lWECG0ALiy+/BmmyrlXad/14dnd574Mv9
 KzcboWziXV6pjEwSX4XDy62xmiQOXktUxg==
X-Google-Smtp-Source: ABdhPJwanR6+RXBuDZ26xgdCnP7ac5yE7bqLQ+j5Ah8fghGXsZAQqDJgtyslXppmaxuFJpfO9zioCQ==
X-Received: by 2002:a17:902:d343:b029:12d:3624:d997 with SMTP id
 l3-20020a170902d343b029012d3624d997mr8597054plk.79.1629314403233; 
 Wed, 18 Aug 2021 12:20:03 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:20:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 33/66] target/s390x: Use MO_128 for 16 byte atomics
Date: Wed, 18 Aug 2021 09:18:47 -1000
Message-Id: <20210818191920.390759-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index ec88f5dbb0..3782c1c098 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -1810,7 +1810,7 @@ void HELPER(cdsg_parallel)(CPUS390XState *env, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_TE | MO_128 | MO_ALIGN, mem_idx);
     oldv = cpu_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv, oi, ra);
     fail = !int128_eq(oldv, cmpv);
 
@@ -1939,7 +1939,7 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
                 cpu_stq_data_ra(env, a1 + 0, int128_gethi(nv), ra);
                 cpu_stq_data_ra(env, a1 + 8, int128_getlo(nv), ra);
             } else if (HAVE_CMPXCHG128) {
-                MemOpIdx oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
+                MemOpIdx oi = make_memop_idx(MO_TE | MO_128 | MO_ALIGN, mem_idx);
                 ov = cpu_atomic_cmpxchgo_be_mmu(env, a1, cv, nv, oi, ra);
                 cc = !int128_eq(ov, cv);
             } else {
-- 
2.25.1


