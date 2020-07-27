Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C3722F3C7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 17:22:48 +0200 (CEST)
Received: from localhost ([::1]:43906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k04xj-0005bQ-NV
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 11:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k04ub-0001cb-WE
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 11:19:34 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k04ua-0001Mf-GV
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 11:19:33 -0400
Received: by mail-wm1-x344.google.com with SMTP id x5so13952236wmi.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jul 2020 08:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CzXyfsRq8ddGHiV45tDKp7Cox+Mr2SFib9wJfNHDSi4=;
 b=etTSnAIcnkE58iV63GVt7f+pQvl++n4MBYszFGoo0BLUkj5ZdQSZr1UO/YbWnAP6i3
 ZCGE5WKoyOw9lt+Bs7s1ioTvDmlNpUNkYm2T3GLokhk2jYBHsMc8ijFZ8o7m+Te8iK3F
 MA4PYJXFme4mfJlSBAHfCcmJ5yd7VVn1FbzKnEc0C+wPHMcfP1TwC1KLQvYSRPOiR9iY
 ElrHnLLUhzO0Pv361GKKSx30GsQM2DBanZ3LFIYiYF1ysrPXmRwgvTsGMebktdUrxLT0
 yDyL5YAZ9PuXmaASp3JSatLlBR9HYe9ey6yaK8wqnGOATeDneAjHU7DTJuCtYh4P+MQC
 6SFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CzXyfsRq8ddGHiV45tDKp7Cox+Mr2SFib9wJfNHDSi4=;
 b=dDgeFEsZ5EN5P/TTwMDRKRntv6Us6Z96o+BnH1BUjsaN+YfW+L9bP3kRIT0cpep+lY
 GRS+QZH0Fs/TUwo0jJhkLXt0wCme7n6LQubLonFBxcoGounYhxLZNfFXeDZslmiP3IOu
 7hfSqz/Wtqybs6HDaQ9+vyWK8353r/mzGcKVOFIJtyqJg9Y1p/yFKqkXJI6rk93f6PAs
 OW6QAf2lTq5qK2J9l0VfrwmWbiVqsO7pIPVFbuGvzzhRoGmZlcgMR0sVFuFJsoYxRcQR
 cPT40l45RcuFSlmcJ0P2zb2yH7RnBhVDQkEFQ4pqZC4KTdYC3+I04HgCeO+f4+hP3h14
 zdNA==
X-Gm-Message-State: AOAM5309dAH5t4f489bpLBDRmLYv3DzkzSNsT9CRAEotcPwvqzfYE79/
 qVq2LXXHVd9gYAMKCCkFKUd9f5265Cjecw==
X-Google-Smtp-Source: ABdhPJxrG6HDh8avw0pcbkROAiuPaxggACU5cvtY7AcKtsEKh8IFmz40WNHNQAAFDPF2b8eixUjhRw==
X-Received: by 2002:a1c:28a:: with SMTP id 132mr20619330wmc.109.1595863170533; 
 Mon, 27 Jul 2020 08:19:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h199sm18744996wme.42.2020.07.27.08.19.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 08:19:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] hw/arm/boot: Fix PAUTH for EL3 direct kernel boot
Date: Mon, 27 Jul 2020 16:19:18 +0100
Message-Id: <20200727151920.19150-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200727151920.19150-1-peter.maydell@linaro.org>
References: <20200727151920.19150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

From: Richard Henderson <richard.henderson@linaro.org>

When booting an EL3 cpu with -kernel, we set up EL3 and then
drop down to EL2.  We need to enable access to v8.3-PAuth
keys and instructions at EL3 before doing so.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200724163853.504655-2-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index fef4072db16..c44fd3382dd 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -736,6 +736,9 @@ static void do_cpu_reset(void *opaque)
                     } else {
                         env->pstate = PSTATE_MODE_EL1h;
                     }
+                    if (cpu_isar_feature(aa64_pauth, cpu)) {
+                        env->cp15.scr_el3 |= SCR_API | SCR_APK;
+                    }
                     /* AArch64 kernels never boot in secure mode */
                     assert(!info->secure_boot);
                     /* This hook is only supported for AArch32 currently:
-- 
2.20.1


