Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962DD347AF4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:42:51 +0100 (CET)
Received: from localhost ([::1]:49498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4ig-0003CU-K7
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Ww-0006dG-0O
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:42 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Wo-0007Mx-0n
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:41 -0400
Received: by mail-wm1-x32b.google.com with SMTP id d191so13010135wmd.2
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ma50U0tSPKQlNSM/2UIXylhE0jwIndZoBnvcG4UWEO8=;
 b=N8xKYFeyoAcogtXdsFkVQaPlupP2THGf6rpxHeV1qksM8QCEiC/YLuZPpiX8cXEmRu
 8mrqyffuXXTekUyIMKPOuqUgQLeLUSmQm+rsJVr6WoIk6r/zQclBDwuddhCWeh/C0EI+
 kwwCUz4gjurDsqdQstUKIyhwbg9uBVoOcsTmHcAOGwvIiEdadS9Ax7M9oiavSSDrniGN
 QFGxmDKE6Aa6igv+YeK/o3Bjs3QzzifIQiBpmD4Tzvv0LdhrQKWi11CfWYO822O1hKG6
 YwYDl5k76NhE0QLnFYdsnfSjy1qfIRyS+19YvvvVh1jbtINWgPjW+UKneI81Ft39Hp4a
 8MSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ma50U0tSPKQlNSM/2UIXylhE0jwIndZoBnvcG4UWEO8=;
 b=W9qK2t+zH37j+C1dE0wEBhWUo7zdlnyIfajjNFeHK3z9y77cH/Y/eIB+M9tBApUTB9
 y7+nhYBcHABBjx0ilth+cnbNQMhINvp4V17anZPEP8U5PyqtIbe6tSDcJJRQBsiitO16
 Ao3emP98uK8rQ9h25r9Ctd6w/e/+iHC2Dnekx5fYSGILSLBDW9mTtzzRuiyM7NiO02zf
 XF56rwCw3vDyACSvkF1BeCvAF/EclEOi53l27Wi82UAli14Wnr60abVyoYIXS4k+BRly
 ADNpWNPgu+j51r++pVY5fuuVmH4IeLWDvDjgmRdMgpZD/AU7nPWu3LH9OW+i9ZeIBf1F
 gWPw==
X-Gm-Message-State: AOAM532d2MNVc+cJY+lCHUMoiEpixS06IXQZSXQRWfWDcbIkNzjph6lj
 0C+8If2M6sszxz9SCHXuVvjkWA==
X-Google-Smtp-Source: ABdhPJxvFmYfcUjveb0lFCpuh44af9LsCMfDDHoaCyBM2Izox+zswyBfpt+AhD/NBbF4II7VoWfBYw==
X-Received: by 2002:a1c:6543:: with SMTP id z64mr3248739wmb.50.1616596232560; 
 Wed, 24 Mar 2021 07:30:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u4sm3488701wrm.24.2021.03.24.07.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:30:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7A04D1FF96;
 Wed, 24 Mar 2021 14:30:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 08/22] linux-user/riscv: initialise the TaskState heap/stack
 info
Date: Wed, 24 Mar 2021 14:30:07 +0000
Message-Id: <20210324143021.8560-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324143021.8560-1-alex.bennee@linaro.org>
References: <20210324143021.8560-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Arguably the target_cpu_copy_regs function for each architecture is
misnamed as a number of the architectures also take the opportunity to
fill out the TaskState structure. This could arguably be factored out
into common code but that would require a wider audit of the
architectures. For now just replicate for riscv so we can correctly
report semihosting information for SYS_HEAPINFO.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210323165308.15244-9-alex.bennee@linaro.org>

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 6767f941e8..74a9628dc9 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -135,4 +135,9 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
         error_report("Incompatible ELF: RVE cpu requires RVE ABI binary");
         exit(EXIT_FAILURE);
     }
+
+    ts->stack_base = info->start_stack;
+    ts->heap_base = info->brk;
+    /* This will be filled in on the first SYS_HEAPINFO call.  */
+    ts->heap_limit = 0;
 }
-- 
2.20.1


