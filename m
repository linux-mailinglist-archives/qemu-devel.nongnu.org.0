Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B756AB41A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:53:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyyR-0004UL-W3; Sun, 05 Mar 2023 19:45:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxe-0002iC-AN
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:18 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxc-0007LA-AY
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:17 -0500
Received: by mail-pf1-x42a.google.com with SMTP id ay18so4730092pfb.2
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JZnYJVfgaZr2aM3UKe5uMquPPaXgvFIFPGlGbim4yak=;
 b=bEtkkBoUo3KNO0tJSnRNaHB734L+23+Dv1zBa01ca27l14EMn3PRL2yGS1iw46d9Ze
 9zd9wcq4Z/7Q7es8uJWZXrAhB3blF0cUdN6SeKBzYwRNcyqB0bjnz+Qy4WnO/zIsMF/l
 KWNe3+wFeXKZrRJjk+YLLCAr8YI3BQGuLj3USlVceSDLLkKWkP8qDjsmM0JY6XG4x5Me
 EFsXO+rbSTjrubsKTr+JoGfZOJLNR0ga9ivfsBxswvH//fNN2wNRqVE2Mgdsf2fvBiwa
 k1PNxqmgEb449ieLgn7l8uUyen0+V6b1cRcYH4e9YVdGKKnK5pSvC+7aXfuWIsKpddRC
 JBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JZnYJVfgaZr2aM3UKe5uMquPPaXgvFIFPGlGbim4yak=;
 b=cnLRpMD8fvTtbXSktzbdrSgjRRn/Gb00SxmCsO0ZjMoodoq+SFY+u89Csy14QWL75q
 pmSWr/+GF1/BrIMh0Giqj3DVTlpyqEAlLzlhe4Ndu9W+t0/YM8jU+x7AquATK+OD2KBA
 E+iufbgT8buLVEgNiDoZSKOfgkMNRm8luz6cvMgn4Iy9I9/Ri1u7gl3R7dXsfBRiBlZs
 k+rgZ427uulaxgISOR5EpIwvWIx1aX+Tays7qdLQ9Kj6fMAcbhnACCM1VnhnKP30iw67
 NEa0tGPIH4OAwXqATrmmfmbI5//TNo8diBkRVRp+rWReGrWIF4Bonvn+OvqFtZfColBt
 Onng==
X-Gm-Message-State: AO0yUKV/vR6QeSZ+h86scDDhz3BkVJj5NIyvwCaxGxXB4rVSbNOdtmYx
 LpbooIgRVwg3KE4aeJQFgtHW7l/Sj34ESruTgjBcdg==
X-Google-Smtp-Source: AK7set/hDZgD316OSnR9RpJqZrk1lFKiBviWO80uZNp7T1y1KF69ELZGnWEWZhXxscP3lpFan/I9Gg==
X-Received: by 2002:aa7:9713:0:b0:5a8:b2bf:26ac with SMTP id
 a19-20020aa79713000000b005a8b2bf26acmr8852076pfg.20.1678063454950; 
 Sun, 05 Mar 2023 16:44:14 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:44:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 66/84] include/exec/gen-icount: Drop tcg_temp_free in
 gen_tb_start
Date: Sun,  5 Mar 2023 16:39:36 -0800
Message-Id: <20230306003954.1866998-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

Translators are no longer required to free tcg temporaries.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gen-icount.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index aff35d6982..f6de79a6b4 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -61,8 +61,6 @@ static inline void gen_tb_start(const TranslationBlock *tb)
                        offsetof(ArchCPU, parent_obj.can_do_io) -
                        offsetof(ArchCPU, env));
     }
-
-    tcg_temp_free_i32(count);
 }
 
 static inline void gen_tb_end(const TranslationBlock *tb, int num_insns)
-- 
2.34.1


