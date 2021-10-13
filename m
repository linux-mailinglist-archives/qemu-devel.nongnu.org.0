Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE14242C8A5
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 20:25:47 +0200 (CEST)
Received: from localhost ([::1]:47796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maiwl-0006cZ-0s
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 14:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maitu-0003lb-Md
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:22:50 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:34469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maitt-00032S-3N
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:22:50 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 ns7-20020a17090b250700b001a0937b87b7so4106701pjb.1
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 11:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kx8WnWbWmDtIbVxb9P1LlAYMJpSU3FiG1MWRd7HKShU=;
 b=k3FjYno33bj5m4fvyxRXtoJVUYkZlNfGJ8fBEMjdWf1uFf1O9OiVb73oNIocT7m8pK
 OdxpbJUSOyiKs3jRtEJe3pasWYFeo06MoVotM7j8DXNWSKCyTdTPOcjBi0VAdXNFFfa0
 TeVTkkBidDWtEA8/kvorjnTIZML7sicwhh4urk5LLUdxO0D2mcEsxEM4VQaom30WyIri
 kRdhzkDY4oeJtI8pPTV0Gz5abtPJ/mjclSsw7izkMY3hBBRML5o0Kvxjh1VqqGLQJ5h2
 W4GAMnbuwkGOTi4MXQrrxk3fwDh9KnSSwSRRRh7s3w1bDn29XZaotY4QFVQb+thgwNB9
 8sYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kx8WnWbWmDtIbVxb9P1LlAYMJpSU3FiG1MWRd7HKShU=;
 b=WWIHKXrVmSkMv76u1CEr7z0MOJbvwPBbxSLlumMFmM6QgnctNzV+YIZ5428kHK9ekv
 M8Kt08o+6D97/FvA5K3dxO9GFJEKUdveQnbxpq3nHtTkBWDEFQ2ZrZhsdXw7NcAWHTez
 LvcvhIh5P4VaWfJve6MMjXmZpfi3S+YRMjaSfLaleSMCVzjlxxGbQ32BJDYnxuF/IgSM
 SEYUh6DHxVsWvhK5Eikl7NfSFssZdFvZOSmZ/PB9wGuZEv8sLuz0t2BjN964nE4JuLY5
 CpZ6YKJ43Gak+ZVgjkuRMaYMoITcUufG3vVkOKWvrKJyHlNFSwH8mb4QAPzWI4dOqtsO
 58PQ==
X-Gm-Message-State: AOAM532fmQWDkGQ3FnKLIlmt/rOWoTz293jnGUt9sgFWcmWrPLDkVydV
 l0HpkFqFjK0FwGDBQjxyp3uJVVF/SkaaBA==
X-Google-Smtp-Source: ABdhPJxvgwfpRtsJV9z5LLjIaMPnF0YPEFQgN94+L2D1vP/vclLR46/YfnSLtTUAvzKUj7bClLIF7A==
X-Received: by 2002:a17:90a:353:: with SMTP id 19mr914914pjf.83.1634149367759; 
 Wed, 13 Oct 2021 11:22:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z2sm177140pfe.210.2021.10.13.11.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 11:22:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/15] target/s390x: Use MO_128 for 16 byte atomics
Date: Wed, 13 Oct 2021 11:22:29 -0700
Message-Id: <20211013182239.991127-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013182239.991127-1-richard.henderson@linaro.org>
References: <20211013182239.991127-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
index 75f6735545..e64d1bc725 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -1811,7 +1811,7 @@ void HELPER(cdsg_parallel)(CPUS390XState *env, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_TE | MO_128 | MO_ALIGN, mem_idx);
     oldv = cpu_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv, oi, ra);
     fail = !int128_eq(oldv, cmpv);
 
@@ -1940,7 +1940,7 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
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


