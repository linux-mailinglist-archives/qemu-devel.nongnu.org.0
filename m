Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6166A3F0C07
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:45:20 +0200 (CEST)
Received: from localhost ([::1]:60844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRV1-0005UP-AG
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:45:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6e-00013I-8V
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:20:08 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:44778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6Z-0000KJ-Na
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:20:08 -0400
Received: by mail-pl1-x631.google.com with SMTP id q2so2409220plr.11
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i46GtS4jZvhz3YUTttQkHHMj47qcgxPUFuoIgSOj1ts=;
 b=BM54zykuE6REgnkG/spUnH+Bq5j2uozv1VtPsulo30hemAC47Kxec7YwGz2mnRqFrB
 7HaFpKzxyQdyE44gmmO0ICmBZ0vN6E6WW07fyUsY9riMW5yO4N+noemL7klQZYaZlfw2
 OgdWni+/nK1oS3sovVbPcsCGOLAcegZhic6lPDXtVzY6K3ppf80WTp6HDCd1sRJseSyb
 hHIvy2/y/GUpQKym+xG8pjT6AHY5CHet/M8rr00waEXMhm2/XRltR+C0uoGRZG4NLLv0
 Pe2UDPxnX98CUcqZX0WZ8iAHBTe/1+aZ3WRzMgIoAK8X3nEUtGWUyp6vHXIzqxiN5+jF
 GUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i46GtS4jZvhz3YUTttQkHHMj47qcgxPUFuoIgSOj1ts=;
 b=WgxuZgcYPHIbI7+bNJJ0wRuL5/COZVMWphec2UrYQ8bWaJJl2o+k9yWFltp1+3DtOZ
 6I3Xownat3VMMPxhyVcyOnl4QkHn6HG4s/raQIxmz2UKdnSErKsY+CXs2A/DK1u8qdKt
 67g7hT+5VlbrGFaTpibN2xkBsK0JhQlt5ibXu7j2drB92XgH7PeGPspzbjIC2Dn9yY5j
 XggNbPl2yXVUD+Kx/KhMqIjpdSK1nMQskRdHMbaZUHIZwT00R+OCVbHKVzxssWD9Ib1z
 eg2cuzgRZ9entM8V/7iKVpDaGkbuuBU43ojr7ad/Rv7cNXv5SAzGrk4BKDeIhcmqCWXr
 Iqzg==
X-Gm-Message-State: AOAM532Br8OZpGDiz+bcYkgA+Pght1W5FFqi1nPBR8oE2JOowBkkiwnE
 NxU+gxFdNO9kE846tzagjt6SVYUQhLwcMA==
X-Google-Smtp-Source: ABdhPJzrUoSayTRhneXXUDi98ZoZs3bkOm046dATeNkybkkbGSlWG407XyoItrQ1MnHo0J7kxSyLEQ==
X-Received: by 2002:a17:90a:fb81:: with SMTP id
 cp1mr11084417pjb.52.1629314400494; 
 Wed, 18 Aug 2021 12:20:00 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:20:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 31/66] target/i386: Use MO_128 for 16 byte atomics
Date: Wed, 18 Aug 2021 09:18:45 -1000
Message-Id: <20210818191920.390759-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


