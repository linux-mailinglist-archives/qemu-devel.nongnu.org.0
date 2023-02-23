Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573036A1170
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:47:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVIRZ-0002mb-Gh; Thu, 23 Feb 2023 15:43:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRW-0002jQ-3c
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:43:54 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRU-0007QA-5p
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:43:53 -0500
Received: by mail-pl1-x62f.google.com with SMTP id q11so14829499plx.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 12:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m3uf45aNqmoWHA7BxhgBMDgfKLKR3Hs0LkS31+eiMNU=;
 b=xFJK81G6y60hJSq+g8lrIzMMCS7am57ThhfMsuBVMvAc+Uj6Kxtm4tCFRuUuUjDERe
 c2Iv0MPCjRwdmDVbLC478W66+5Rvfkk/7aMJPgR1/kS9r5te6C/gk6secIGq3LyRafEi
 0RFXVvoBOA+gP0vyUBBTpzDPo8zVNtfaLndtGQkEC2JQewtBIbCyHXMNxGgh7GZRwLS3
 EznFxW9etI6IHHBRHrhqnPbZwcHpiOZutDNiztajwj6VEkYT2JYC9r1q/In/sLJCSKtO
 ePTjGvgUPz9C3OL1eNeOpJ9jpN5JEJZhQh5x+OvED4qN49i+GaUt+PZ/DoQApggKucVp
 kiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m3uf45aNqmoWHA7BxhgBMDgfKLKR3Hs0LkS31+eiMNU=;
 b=Vbv+ez2OgIIPWNz9X4rBRqhAXEl15WMhxy7N0PJRAodgo1yybKUc1x1F6By9C2rQUG
 ZKE8QRPUtMZoQGgRZEQcArmq1OgfIAgDo/k/NKCDsu8pMPmo/eSsUk4aS7Fg5GmT/mK2
 Wyg0SzVxy3WSypw1tc9MYtksbx2nHzurP6I2roi3oNvQCQHjiNkHgHTM834cw6RFcnM5
 WfnvCOGfl+U9fB8trKTamIIxAjICmhKhQHlXuxHE0KcXFEMA5NTxXtjJqYcWxxoTYd+L
 qb3jHhSiRDxUuv9uFFvIrypKwcuzF6eLaZymTOaiy6poIUcr9IL1x6I+230z6Gwq8bTp
 Y3Qg==
X-Gm-Message-State: AO0yUKXha5Fij6yidwMiIwQGzowyFe6D6R3Bi0Vou4cGQFhDJSTwEXv9
 oCM7Z9nBN2xVKGnKkSw9C1JPZM5Vuh5Cg0pD+b4=
X-Google-Smtp-Source: AK7set+YwK7LQmSdzXvndRhdhCrKpvuF2ZQEdfyTjtDgvJQa13jXkO/97Xe3hXpDm2XlXbtvD9VzYw==
X-Received: by 2002:a05:6a20:690d:b0:cb:c266:3f6b with SMTP id
 q13-20020a056a20690d00b000cbc2663f6bmr8770526pzj.12.1677185030839; 
 Thu, 23 Feb 2023 12:43:50 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 e187-20020a6369c4000000b004b1fef0bf16sm5992850pgc.73.2023.02.23.12.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:43:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 02/13] accel/tcg: Retain prot flags from tlb_fill
Date: Thu, 23 Feb 2023 10:43:31 -1000
Message-Id: <20230223204342.1093632-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223204342.1093632-1-richard.henderson@linaro.org>
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index d7ca90e3b4..169adc0262 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1251,7 +1251,6 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
     desc->fulltlb[index] = *full;
     desc->fulltlb[index].xlat_section = iotlb - vaddr_page;
     desc->fulltlb[index].phys_addr = paddr_page;
-    desc->fulltlb[index].prot = prot;
 
     /* Now calculate the new entry */
     tn.addend = addend - vaddr_page;
-- 
2.34.1


