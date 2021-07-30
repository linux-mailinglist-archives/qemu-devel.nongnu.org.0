Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 302C73DBE5D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 20:30:15 +0200 (CEST)
Received: from localhost ([::1]:53640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9XGu-0005fQ-97
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 14:30:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XFD-0003dD-F9
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:28:27 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:46785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XFC-0002GP-0d
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:28:27 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 g23-20020a17090a5797b02901765d605e14so15570650pji.5
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 11:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w06bUv5LRjs6n6zmJVqpQJN5oZD2CyZbJSw31pPYfbA=;
 b=bhyVNQ7qOH5DeI9nAKMQzZANzYheKf/D1JMww4Wpl4Wmx9P7jNO72EfX4uyuaTUg7Z
 RGUKsPqREx/ztKDQxeA/shxEgZLfj7SqD7bK3dxjLcahwpJP+0Gx2TwDgwx7Z0tO1AO1
 P8b66FUKtta0moubjKhC2xCa4i2UIIL3iPlZ4Lk9ziDUnksYFqb6yICTsfxFf/pvW8P9
 i37F8362eVUBqvDEHiCnTaf19WU4HDHayEC4VoLnQvyYBKF5vdTfqdYmQ0F/RXuLKZ73
 JoEv6hDiIUKEeoMFeRNSgFB+30m0l9EiEZL+mAKRiwfUPRWffPyHmQj/Aep+BbRqWAiV
 dd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w06bUv5LRjs6n6zmJVqpQJN5oZD2CyZbJSw31pPYfbA=;
 b=TVZ3NJ9C2BYnJEtUQXTKrNRPOLCKONlpYccj3AiTppRkfiu71O0+peCNQDfbnTRgqY
 xeCjPeq9NOjyDeXd2Ol2pxxLzRoAo+8rD/JZSGvSucuyHoLT+YQdOV7KUXEflST+sa6Z
 vdf32cjKQYbNTm8EfCvMODMI3k9LF1yMoF0o1HUKqS+PJnfywomCpr3VcKiH1Bf8EBra
 w+3B25OoZDcEfgi+o+lnORJnlicPX9x4g80vAhc+aE62TJGqK3vpdQxSJQTjF64gnix3
 GHsHamdLCJvxO7AFEKiahi7gnG1bKl3r/Wf8M0Lwqb1Ph43vyAixtkQX5jo4qTIBZ5Kf
 n7/w==
X-Gm-Message-State: AOAM53134H7zZNQf2gYpz/WKBy9s/4UVkHXFEvJxpdNZGZm5LGHw5ytR
 Q+GYHxmMgJSIbf/kVC/5Y5J2oCwHQ/Dazg==
X-Google-Smtp-Source: ABdhPJwnyFn9iAt/FKosel0Jh+3B4/0gopvGZzbcpdy85OCGzw5AzhdcVXvT4Td32mRa0yvJzuNMOw==
X-Received: by 2002:a62:dd83:0:b029:30f:d69:895f with SMTP id
 w125-20020a62dd830000b029030f0d69895fmr3869627pff.17.1627669704623; 
 Fri, 30 Jul 2021 11:28:24 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id k16sm3004185pfu.83.2021.07.30.11.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 11:28:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] accel/tcg: Remove double bswap for helper_atomic_sto_*_mmu
Date: Fri, 30 Jul 2021 08:28:19 -1000
Message-Id: <20210730182820.451248-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730182820.451248-1-richard.henderson@linaro.org>
References: <20210730182820.451248-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This crept in as either a cut-and-paste error, or rebase error.

Fixes: cfec388518d ("atomic_template: add inline trace/plugin helpers")
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210729004647.282017-24-richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/atomic_template.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
index d89af4cc1e..8098a1be31 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -251,7 +251,6 @@ void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
                                          PAGE_WRITE, retaddr);
     uint16_t info = atomic_trace_st_pre(env, addr, oi);
 
-    val = BSWAP(val);
     val = BSWAP(val);
     atomic16_set(haddr, val);
     ATOMIC_MMU_CLEANUP;
-- 
2.25.1


