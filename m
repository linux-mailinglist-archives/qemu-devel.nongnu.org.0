Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406736AB3D3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:43:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYytb-0004OE-QW; Sun, 05 Mar 2023 19:40:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytY-0004Nu-La
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:04 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytW-0006ND-Fn
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:04 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so7390660pjz.1
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IAxYS/NLsp62C58QNtXkZeKbxEYzefJWF0ZeIzVuJpA=;
 b=fmYprNiKMwj8CErJ3zbjU6GBhpbyKslkf2xF34+7bnbXfTSHD8r4LBPeh0JsjoodBD
 Wn9zzjKY4f50GtgzSWHtVY3a49OEX/iCXeRftYeY0Oe302JhFq2r1mzcnYQLG4SUGcLI
 ktWdhKC5gTD9HZFMJdxQSSlw5cIQ2tGfy7dDXgzz3BH1Eee/3nOtvZEvd6oO2f4VRRO/
 XRbFTFh8BIXx9Az/w9uHk12SX8oN8Iy+D9SldHKv9ulHBZsiUW/f+MFEWRRn/hLJdGfW
 282ESe912lN6qnM0/LBqsdpdSvraHzzEqYP6n1sRadMRSfHt0T0zxdZnG1GC0n/0fjEO
 BoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IAxYS/NLsp62C58QNtXkZeKbxEYzefJWF0ZeIzVuJpA=;
 b=bfxNjWrK/bfMXTREUBI9KKL2h8NBSF8alUTDDr3BjDiQVyuMBON3CmUIPytQaT6XqA
 3cC8JMeNXZqkONMnOGtVkL5x6XaGPxxIaSXt8Swn0+PglIPzvte8BswgfORiysnC9i4u
 dbyMKw5joCzGMv9QEofSJFnWhb1afPp8xRdthqp5u0WG3fYnmp/2UnaP2xv1DVNBVXFh
 DtqmTcBUjp54+G+XwG5aH2roNB6EBPt/3so0Pp5EqNSSZ1kWMgVU5nOzsfrvJqZcmPmW
 4Wl0JGzQ5boy4Re7HIIFqkcJJal82lqH3oEPyZcz7UQsTAmLva+UaH8TRO16sHY6hgCT
 Fa5Q==
X-Gm-Message-State: AO0yUKVRYs0gh7QyZeNP3vq/j9KBbY12L2OL8Fp6vT0OCDtcN+1NKtww
 acHQdnoDLwIYBifds3gYMqQIHQ6PPFdrQIJXnSoH6A==
X-Google-Smtp-Source: AK7set9K7VejTJtgs/sDcXxMjUEB5qwwnZPmn0GBd5o6zSfFhISB27+92vOVLnZfUx3N9t9hE7hU+g==
X-Received: by 2002:a17:90b:4c43:b0:237:cbcb:efba with SMTP id
 np3-20020a17090b4c4300b00237cbcbefbamr10049725pjb.17.1678063200409; 
 Sun, 05 Mar 2023 16:40:00 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 05/84] accel/tcg: Retain prot flags from tlb_fill
Date: Sun,  5 Mar 2023 16:38:35 -0800
Message-Id: <20230306003954.1866998-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

While changes are made to prot within tlb_set_page_full, they are
an implementation detail of softmmu.  Retain the original for any
target use of probe_access_full.

Fixes: 4047368938f6 ("accel/tcg: Introduce tlb_set_page_full")
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 008ae7a66d..deafcc7f15 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1250,7 +1250,6 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
     desc->fulltlb[index] = *full;
     desc->fulltlb[index].xlat_section = iotlb - vaddr_page;
     desc->fulltlb[index].phys_addr = paddr_page;
-    desc->fulltlb[index].prot = prot;
 
     /* Now calculate the new entry */
     tn.addend = addend - vaddr_page;
-- 
2.34.1


