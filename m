Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CB869FF92
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:34:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUyWu-0000yN-20; Wed, 22 Feb 2023 18:28:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWh-0000Wi-W3
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:57 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWg-0005N7-Dy
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:55 -0500
Received: by mail-pj1-x1036.google.com with SMTP id u10so10861321pjc.5
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ywIpknwVQ+7YXOPD8ekeMSrDTxtkruTV0ZhaLmqKonQ=;
 b=ddwop8QiJM+sh69lkSFXh9OtJacegXMmvWF8/33TQqUytLlRFHF15QMoNi0jh8OVuO
 LcwxuRqJLldkx5EjygdX//IrSycukrwmYmHjxv7WBikueBPgcPhWpOgJ21FhSsXKw5rc
 YC51OtWCPK0VmMXVTQO+yYwh/F+qQWxAXXzG3xoqLrKtD8VwNHl/c8gR0k1Pcw/bwMdv
 BFT+cxcwO5jpqD4NhKdmjJ0Ru6HyvB570VCCjdQOmbdp6jSmSqdMCtqcncf90HoP/f3I
 SPI6RFvy9M1VP2TIvDeBqOcfG7Ptu7WiE/p/N9iHSM0Ux9e4bQ4qeihrrsQGsz6Ctukt
 Mz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ywIpknwVQ+7YXOPD8ekeMSrDTxtkruTV0ZhaLmqKonQ=;
 b=h2oyOLmn/v1w3IsCRHwvzNxyUhikXKNCDNltffaQvihNO9CrB+oo5bo1EyKWs6wmoM
 3P088i05pjy/kNSvYy5n6VPBr6LwnyUIJXdl15DwPyG0lwJU/DPIrujY2wXdPeCMa/Ff
 ZcGS9ShohLjXNuaaSVKjRUS5V7ogpa9RyZOKxKzaDpC9zqGa3vv0EScgE8YxMRmbfyiu
 V4U+tYiEeQ4gRcVbTPjrvu4UqItmlC1jUp5jRmvFQp1D9Wz+m0FH6FDMmBu7jhxVhag/
 Wp/aLCDSovvwO85ALtCjqHB6T/iuZgkQ2Utg9MtHtfOQ2w1njA0rDJOL97aNmuhlD011
 l5wg==
X-Gm-Message-State: AO0yUKX2uRJ4EnsMzQEIfEg/063BhEzr48LEnsxXd4xwJda1rnz5gi5N
 PHkOoVuKuXmuva+t+bRa0skpvKz7wLPBCCvIjUQ=
X-Google-Smtp-Source: AK7set+Hn3/52hM2yP1sebxrqYyCmhdOT85x1gDHfbIqdJztstnbir78ku+j7wGE9oGOb+ICalfreQ==
X-Received: by 2002:a17:90b:1b4e:b0:22b:b82a:f3a2 with SMTP id
 nv14-20020a17090b1b4e00b0022bb82af3a2mr12083938pjb.11.1677108473553; 
 Wed, 22 Feb 2023 15:27:53 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090ad49000b00234e6d2de3dsm5008918pju.11.2023.02.22.15.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 15:27:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 25/28] exec/gen-icount: Don't use tcg_temp_local_new_i32
Date: Wed, 22 Feb 2023 13:27:12 -1000
Message-Id: <20230222232715.15034-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222232715.15034-1-richard.henderson@linaro.org>
References: <20230222232715.15034-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Since tcg_temp_new_i32 is now identical, use that.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gen-icount.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index c57204ddad..21a1bff8b7 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -19,13 +19,7 @@ static inline void gen_io_start(void)
 
 static inline void gen_tb_start(const TranslationBlock *tb)
 {
-    TCGv_i32 count;
-
-    if (tb_cflags(tb) & CF_USE_ICOUNT) {
-        count = tcg_temp_local_new_i32();
-    } else {
-        count = tcg_temp_new_i32();
-    }
+    TCGv_i32 count = tcg_temp_new_i32();
 
     tcg_gen_ld_i32(count, cpu_env,
                    offsetof(ArchCPU, neg.icount_decr.u32) -
-- 
2.34.1


