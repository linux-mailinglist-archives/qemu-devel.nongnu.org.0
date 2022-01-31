Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60B64A5125
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 22:11:43 +0100 (CET)
Received: from localhost ([::1]:59648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdxc-00021W-3O
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 16:11:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnl-000548-3N
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:25 -0500
Received: from [2607:f8b0:4864:20::12c] (port=43823
 helo=mail-il1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002du-Qo
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:24 -0500
Received: by mail-il1-x12c.google.com with SMTP id d3so12385831ilr.10
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w4FRMcODA3Yw9ipRGV2deCv5GoQkPWInOh9N0fcX/6E=;
 b=GVhiZpjA5T+Cg+ZkAMZMJ1sP/5R6wcjvCoxqqZBOMOMtElaYdxTTjZfRcQrJlWNg9B
 BW6VOo6oXFReOp+7TusA6p6Z8kic8KIyNiEmoFVl1ot2/SucZjxNk9TO0KT1WtyPJUVA
 fxDcO+1feYTBm4IYGPtReDEAZEu/GeLwxyyDTXgQIwIqMWOBMU/pc4hixOOORf6Fpyc1
 uSYCN6yq7JwDQND6yuTQebmN1FfFpU9I2kVlXIm6uLPUHgjvID5Vcjdagh3mm+WIpJ5L
 FyXTjEvhycaHJGkKAzDSlO2af6egXHeOJGn0apbrVx6cL5CYpN3/yV5uNAQr5BcWK3qZ
 qnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w4FRMcODA3Yw9ipRGV2deCv5GoQkPWInOh9N0fcX/6E=;
 b=rnqo9w40ryRSMY2HB15B7ZexKr29iNeeeRzJaI7VmGHlpz3IldYYUbZET8Hh8fBZt2
 qTz00DdkpzUYxHYMIEhhqUmtHD3TenrH7TCAhgoUu304NQS+AyY38BjMQUr+CnndV3Ym
 7x2avUWpwqitGAx7Lt5+anOpLclxIUJOjBg73ZztS825kSrvjefhZThaZKBn5wuXYiBj
 FVgsCRd5c9v1B9NfsAJi9S+GkVDFob00df4eAPLmTSJLnTCXSoUYpPfaHlT2kQnrIgrG
 J0XuV4fawwAlE3tx8Dg5jpvciIinTqBeV9QRJU2qB4liGHS2VlQjnvv/aBeU6SzBwwi7
 gdPA==
X-Gm-Message-State: AOAM530L0Tw2uxkhbx3WlngcYC2N4xyOt97scxq5g0c8u7eTT37GyvSk
 Q0oFkpTL9fHBh/mqcz4ta70v+wG7EHgVWw==
X-Google-Smtp-Source: ABdhPJzzPjbjMhHLbpulJPmj0qeWmmV3pbTaYCgFLMAj/zuEm8fzMCqCFq7+JEM/WSBic0+HxOdhWQ==
X-Received: by 2002:a92:cd8e:: with SMTP id r14mr13527540ilb.53.1643659003419; 
 Mon, 31 Jan 2022 11:56:43 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:43 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/40] bsd-user/arm/target_arch_cpu.h: Correct code pointer
Date: Mon, 31 Jan 2022 12:56:09 -0700
Message-Id: <20220131195636.31991-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The code has moved in FreeBSD since the emulator was started, update the
comment to reflect that change.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 05b19ce6119..905f13aa1b9 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -73,7 +73,7 @@ static inline void target_cpu_loop(CPUARMState *env)
                     int32_t syscall_nr = n;
                     int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
 
-                    /* See arm/arm/trap.c cpu_fetch_syscall_args() */
+                    /* See arm/arm/syscall.c cpu_fetch_syscall_args() */
                     if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
                         syscall_nr = env->regs[0];
                         arg1 = env->regs[1];
-- 
2.33.1


