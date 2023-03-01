Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFFC6A65E2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:58:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCf9-0002WY-PA; Tue, 28 Feb 2023 21:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCf5-0001vI-ET
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:47 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCf3-0003JW-OX
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:47 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so15752758pjb.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cQ+e+StNnIBvxiJomn1oId1CcGrm6cHa5TOv4UsHXlg=;
 b=OU8PDew+vC7WJvTHYzkWTFOdgyEY105UySHtlRRyT3SHht1dm759877h7LKWiy2eMl
 +KxVGNFI4Tx3RGVTjaTOiPm9RjSAQ3uakJu/Phs+OGd3zgGmWyJrtyR4mYM5jQHimKZ2
 92Dtz5o2cuanJG5Qbz1KVgq2U17aACYwGWK/8z2zZPtcghi4iQ1UWxqL0Q5QxJ0lQ1hf
 KHbaFHZtKhpL/NeNuZ6BTFltwmmV4JwK1E1DkOzb3woIH79QA37NIxRhKMpruIs1fHgy
 aMZdNlRhq0H2QGDj0xHFVSw5ZJpKXBj8NP6aOCY8WUVQpuyTvc3rLf1XC1rUzoxkQBzq
 8hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cQ+e+StNnIBvxiJomn1oId1CcGrm6cHa5TOv4UsHXlg=;
 b=uGQxcwrbDgQA1VYhftVatLu7bAurUliJFLtuC2NE95vx9/Jtnms/ax2ypA7pRa/xdg
 s4dsu+uw5YGZ2QPXqGdrmlaVpUr27w5RlSjJpAS9dHKirO3uhlGpw4hMDCP+O73f8LiL
 Cjuj4PgXYfHO07+LPqT2RY4l2cATgmPucI8ytIZ3217LAHePjTXq0VBBRpn+IuwuD+zu
 1SwCca4ZcMf7+xwJpqtQCsDuiQpuP7ORCmMK2DP5NnerYdMZY2nh/b6Jrxk8V0lVtyVF
 qg0Na+H0lZwNQCIbehX/+kVD/1oKqYB/ZZsPl8eMDdSpalTpPgELRopSgMRMSALGbsPS
 tnJQ==
X-Gm-Message-State: AO0yUKWLutE7ntmUREJlA2516KBqoHnK4zpCvK26u6dP22Rp90Lz4zYB
 vvk09jgcLGrOAyu2cHw9iVnZ7Y3ENogI0sl1ztw=
X-Google-Smtp-Source: AK7set+TkDynLjIKxHeZGg27ZyX3DlG/jKng4YiDdXnZaJNHCQHRzYkVVlDCug9xLk3lERSB1RshGQ==
X-Received: by 2002:a17:902:7d94:b0:19d:135:2013 with SMTP id
 a20-20020a1709027d9400b0019d01352013mr4520652plm.26.1677639464316; 
 Tue, 28 Feb 2023 18:57:44 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 34/62] accel/tcg: Use more accurate max_insns for tb_overflow
Date: Tue, 28 Feb 2023 16:56:15 -1000
Message-Id: <20230301025643.1227244-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Write back the number of insns that we attempt to translate,
so that if we longjmp out we have a more accurate limit for
the next attempt.  This results in fewer restarts when some
limit is consumed by few instructions.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index f56da8ea30..d0babfea88 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -78,7 +78,7 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
     plugin_enabled = plugin_gen_tb_start(cpu, db, cflags & CF_MEMI_ONLY);
 
     while (true) {
-        db->num_insns++;
+        *max_insns = ++db->num_insns;
         ops->insn_start(db, cpu);
         tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
 
-- 
2.34.1


