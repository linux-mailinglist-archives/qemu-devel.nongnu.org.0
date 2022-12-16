Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F16EF64F14E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 19:55:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Fq3-0000cG-Tl; Fri, 16 Dec 2022 13:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Fpt-0000RY-Gp
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 13:53:33 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Fpr-0003GN-Q7
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 13:53:33 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 b13-20020a17090a5a0d00b0021906102d05so3254132pjd.5
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 10:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=znZNd3WG/BhN4qCSHGo7fJ9BmZ3G69LA+YD4Q3QuGKE=;
 b=pngyB/O0d1zApLv2MjZkIy3SPWOYTCTSo+Uz/AzLtitrg5KJGcKNxtaXoEyY9WS+YL
 amK/vKgwDDBjBupUpoIksvVm96F1hpcY8k8y2DO83TdiMdg0KbhNtW9k0eK/64rlQBgj
 K7e1y7Lc98uKMR0XxQHbeJHN/GZefsTVlQ8N8+aBORl36PlbSJmmhreLD/XtIsY4tFFM
 TvKKK8uqrB4CXUV3fwlosLryw9RrX+xHI6jQ5PW/FY1kXyntA4sEYfJfT+pYkmG8yIK2
 wVhch7Ajgz7I/JHtGQUtNiZiRURzZIh23lOOvSTRq4LjgKWc7xoFgUiDB9kmbIJoBHLo
 +l5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=znZNd3WG/BhN4qCSHGo7fJ9BmZ3G69LA+YD4Q3QuGKE=;
 b=Qt5zaeWDEgWdVLj7YrUEnIm6CsFAUl1jS4CdYuweuV5a4vBqPY3sGfs3dCMsYERXRA
 gSrKFrHbYVha0NvJwetdwlPWxXeu/TWgKvE/NwfoetuIAwkG8u9PxjcUPjrErpo82QzG
 TOwvSq+r3Z6yk7AZmkDMSzj3IEX/B9yo7tnxv8QYB0vEge40qiVJhvs4Xz5afNBfxc+p
 zQ2/VNprKQgepVuPW9jf3/wPBbqs5GX44vRG1Ezz3OEOC3+iQA0uWk6c55fK7GP5Edy0
 HTYsDm3Hf++TcfUmelcOa898xmtM7OcgWFrauE/3x6o+h0n6cSxxMJ1c99E4x9bmAHiz
 QJGg==
X-Gm-Message-State: ANoB5pmRER7FNoC+zzb00L/HpoCxtN2erOof7g645ZzDOF5vbeOaOyZ5
 BpTSdU7C78p8sMgFRceGRlE0l98UESl8ftvN
X-Google-Smtp-Source: AA0mqf6/SAliRClePTZ4erXLkuEpUKFTcSE9fqgHWiEyO2Q1KDpfP3k1tO1x/nbYoMqZ5SYp6KLBIg==
X-Received: by 2002:a17:902:ce06:b0:188:bc62:276f with SMTP id
 k6-20020a170902ce0600b00188bc62276fmr37998170plg.3.1671216810180; 
 Fri, 16 Dec 2022 10:53:30 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 13-20020a630b0d000000b0046ff3634a78sm1761300pgl.71.2022.12.16.10.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 10:53:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 09/13] accel/tcg: Restrict cpu_io_recompile() to system
 emulation
Date: Fri, 16 Dec 2022 10:53:01 -0800
Message-Id: <20221216185305.3429913-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216185305.3429913-1-richard.henderson@linaro.org>
References: <20221216185305.3429913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Missed in commit 6526919224 ("accel/tcg: Restrict cpu_io_recompile()
from other accelerators").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221209093649.43738-2-philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index e1429a53ac..35419f3fe1 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -43,12 +43,12 @@ void tb_invalidate_phys_page_fast(struct page_collection *pages,
 struct page_collection *page_collection_lock(tb_page_addr_t start,
                                              tb_page_addr_t end);
 void page_collection_unlock(struct page_collection *set);
+G_NORETURN void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
 #endif /* CONFIG_SOFTMMU */
 
 TranslationBlock *tb_gen_code(CPUState *cpu, target_ulong pc,
                               target_ulong cs_base, uint32_t flags,
                               int cflags);
-G_NORETURN void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
 void page_init(void);
 void tb_htable_init(void);
 void tb_reset_jump(TranslationBlock *tb, int n);
-- 
2.34.1


