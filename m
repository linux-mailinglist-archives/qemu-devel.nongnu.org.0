Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5C63DE575
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:37:52 +0200 (CEST)
Received: from localhost ([::1]:54142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAmBb-0007H2-FC
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlps-0003oz-Cp
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:27 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:45692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpq-0002RC-2R
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:24 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso2974661pjf.4
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vsmgHBg4n+7CFHLlurhpD4be1hWiIQq/b2tVjRwTP/Q=;
 b=zcRMGfoLUevYt6C7ZozFQaRZ7PXEsFUBSfIX5dptMLO3i02EbmB97fI+D/Uur1kMl+
 bluAq8IH5e4VGUKK56yInc8kxW6v9XGd+GN5Nz81Qp58EboqpYFlf8Jqf57y9nRsHFMB
 IHWmh19bHXVKK7/xUWmy6xnEx1jpTf/hF1+qzpTFSGrJCUiUG4n0/g8F93usX0d0et0D
 pmoQKXM5cqgoxVtU4oq0/fqRQx0VsTNYAWLx7ykqFOVnh3WkUD9tTWPlBg3QeFaHjYLb
 UuqwbtiHKz62WWaN5Ta/Up28YWWmnl7y09/SplUHYbUohEnrh/MClDtzPGMjoHCknNtv
 fhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vsmgHBg4n+7CFHLlurhpD4be1hWiIQq/b2tVjRwTP/Q=;
 b=KrBMBneSZx9gEeRLVNJO6/mqkyLdfk1ryFerVQqD9HsOtLvTYZYOLAYPZlvLSR6ozK
 uky/wXUZ+co3HXtZh4rRVekOaUUwZpirLp2ULswoUzKmoeUiz6Z+YN0wedQVBFS2jNWy
 gScD+N3IeVT0fJ0QYk4LQAcmbOlbdE1E46efsz/yxCH8giCbQ2uIWqxgsZap4+Z/wBp0
 Dq/6vl0UgcZTzGEc+ZQp93PN4O7Ddg8sTuYeCy4/qnJyjApIJkHhugt8gz4fajI0Zufl
 +5N7bFzyx/vi8nGyi7Z6m0uN9eqAbUk5cIVXItCKI2xUXEWrOXfVkCccAXgYA3uuLsnZ
 /MGA==
X-Gm-Message-State: AOAM530DJdFzE3ojBj7P7V5A+ajd9T+/0dorwT7BJM+C7oo3nnFuYqBA
 gzdNZW6mATcwVDOTPWQPj2CE5WUXp3K7xg==
X-Google-Smtp-Source: ABdhPJyv8gJsopAg7qJTNbzASBgcth+lAK5WsWH+6C+vJHfCCmuKIfjifwtZm86dbSRmaYcyXMKo9g==
X-Received: by 2002:a17:90a:510c:: with SMTP id
 t12mr21439656pjh.158.1627964120848; 
 Mon, 02 Aug 2021 21:15:20 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.15.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:15:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 30/55] target/i386: Use MO_128 for 16 byte atomics
Date: Mon,  2 Aug 2021 18:14:18 -1000
Message-Id: <20210803041443.55452-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/mem_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/mem_helper.c b/target/i386/tcg/mem_helper.c
index 0fd696f9c1..a207e624cb 100644
--- a/target/i386/tcg/mem_helper.c
+++ b/target/i386/tcg/mem_helper.c
@@ -136,7 +136,7 @@ void helper_cmpxchg16b(CPUX86State *env, target_ulong a0)
         Int128 newv = int128_make128(env->regs[R_EBX], env->regs[R_ECX]);
 
         int mem_idx = cpu_mmu_index(env, false);
-        MemOpIdx oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
+        MemOpIdx oi = make_memop_idx(MO_TE | MO_128 | MO_ALIGN, mem_idx);
         Int128 oldv = cpu_atomic_cmpxchgo_le_mmu(env, a0, cmpv, newv, oi, ra);
 
         if (int128_eq(oldv, cmpv)) {
-- 
2.25.1


