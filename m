Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F1B49A225
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:51:20 +0100 (CET)
Received: from localhost ([::1]:46100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCAzP-00077A-L2
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:51:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAev-00025v-I6
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:09 -0500
Received: from [2607:f8b0:4864:20::d33] (port=42616
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAet-0001YT-HQ
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:09 -0500
Received: by mail-io1-xd33.google.com with SMTP id a12so21879303iod.9
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w4FRMcODA3Yw9ipRGV2deCv5GoQkPWInOh9N0fcX/6E=;
 b=ylFtY/F0LJ4W+jqf4U24IArnezLeEHYSO7HvvjD74R4dXiugfN05rTao/Pyjh2jj6J
 82fVyKOGF+vnfjUIToBT7+ZK35ZOEWAhlVfsQxYXERPrYjoWGpCievv9dEk8+x1FfcqE
 Zq7tKU1lsbZdvQhRq3rnohtqd/o9PmXy/aLJpFgwgXfpaDWjVOvpj/di0zE8idA4MI1Q
 x31sAYTtYRMtQAQ8yluTf10UPeSFyIQnZ4f48o6OuKRN+4d0eIw1QhNb+yEMsS1WHJT/
 hHZrqDZuVHBeBwCQRrM8IUspJ8UYGMTFI3Bcx/JXOggxFVJ54YB/OMJ7bkPsw8l+Q4cB
 Btpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w4FRMcODA3Yw9ipRGV2deCv5GoQkPWInOh9N0fcX/6E=;
 b=ZbgA7Forda1jb1oowJ7vXqxTAwIkGDzX/h4rQxX0r5IgoAjktTqDJC8wAcQSiM95CM
 O5mXEQuadMIqXz3rgW+Aeinz+eKwyBHyf7/ERTmqK3eTDeRO8JNJR/cTygb5WOu1fat2
 UQMAwCyFfNVpWTZPPHGB/NYprNpzS+rHmjsHeQxuUz/YPS4Gu1Aa58YRR2cLxlF6wwqM
 jcswruBoiyvEBnQutR6n79EtF1+xiOMNKMoreCJGU6j+PnpOw7X3Lf+oUFpYiaZS5/T1
 4rGY13RMWFhHgi/s6YEyBUOGyirQ4PHMUtr7z9kt5IiCbh+Cty6zCiUJ8vCtXtjm7Qqh
 ENWA==
X-Gm-Message-State: AOAM531NhSlC78bB5RE1Iwwta1x+QRF2KmOFHz8HlMSk2HbbdK12M0be
 J1Pn3d6BQXjD1HJEBt7dwXy6CJKY/xpHOA==
X-Google-Smtp-Source: ABdhPJz+OlUhSEAWLwauDig8xk/yKHori6tBJA9pqG4BF8BsZQIcToQModdZ1ZkWnDs0oo2G8gH0OA==
X-Received: by 2002:a05:6602:3402:: with SMTP id
 n2mr609721ioz.148.1643074206315; 
 Mon, 24 Jan 2022 17:30:06 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:05 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/40] bsd-user/arm/target_arch_cpu.h: Correct code pointer
Date: Mon, 24 Jan 2022 18:29:20 -0700
Message-Id: <20220125012947.14974-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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


