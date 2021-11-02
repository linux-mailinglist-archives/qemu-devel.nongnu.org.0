Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7355444393F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:01:22 +0100 (CET)
Received: from localhost ([::1]:39918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi2mP-0006lr-Ff
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2eo-0006el-CV
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:30 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:37592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2ek-0002m0-EZ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:30 -0400
Received: by mail-il1-x129.google.com with SMTP id h23so665065ila.4
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IOY3t4AaHZe80iw8hQcSliA4Md0iNA8hrA2Uy7U0qF8=;
 b=lTpq017Ejx7nCI89/YhtE4NlpT5jMRw/EZO0Ibxsp64jWH4poHGiwtWgHOYy2UrFgk
 SKa4gQYK4baZyX0gwk9G2HlWw0LWOvIhyCWQDtx2Sk3znFsXBggY3++a6fIeiW0PvELK
 ScUt41xG6+7jCdPUhBxWTVIO6mJp+rTlommSwLasOQufRuCtJb8x9oWOIp7jlZUIOMj0
 qaQIaggKOEswIrwJVZgtMPGShbrblQj388W4ENHc0/UHZO4UvxstJaEZIWuYSECE6scw
 P8blTg2TxuHbqJkkYNcKnkIVWiLng27j8Y8zV8uTORaaE5cDkUQl5auKIM1Rt2dtg22h
 iVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IOY3t4AaHZe80iw8hQcSliA4Md0iNA8hrA2Uy7U0qF8=;
 b=Bhk2qkAAcxIgrTa2bhAm46PaGGvEkm+/qrNwfdObseIz24908Y/LPsUl9M7oa6/Tge
 pRRvfEPqn5d4/1F0eSZriS1C596Supa9y4EL4fYfnkhb6emegblsPSV0lJ3BJQhDiiQY
 DrkCF1mRnNgQDmn/ybkeUUDOtqRGw2Ho7vNeXAJpni7HeqBTBn6G29DxVBE2ktseB6KC
 4yfZ48vu3N41Jz+85ZqU7PsfwZ6fxDch899ifDovEj3B0QNKvGNjCyNZ0JNUvD/RmVgF
 yy6v798p1TG3o2f8XNesSSoZmDsLcDtnXqiBk0pjUk2Ojnnr4WoRzr3AKYvadvtG23v8
 cAEw==
X-Gm-Message-State: AOAM533fiTVSrUdlOmkijFOiEows0dfDKfsH8aW88R1XcEm0fwCeYq86
 1JheiTRX2WeoIfkFo2SEOG8/AhPI65o15Q==
X-Google-Smtp-Source: ABdhPJzn0NKXdfVt+SeIVbHGMbNtdA0J64LFw/Ah2iEoqP+iIbLmxm/DAd7dz/jgHpu4W14grPPp9Q==
X-Received: by 2002:a92:c263:: with SMTP id h3mr14546011ild.322.1635893605238; 
 Tue, 02 Nov 2021 15:53:25 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:24 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/30] bsd-user/arm/target_arch_cpu.h: Implement
 target_cpu_clone_regs
Date: Tue,  2 Nov 2021 16:52:24 -0600
Message-Id: <20211102225248.52999-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement target_cpu_clone_regs to clone the resister state on a fork.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 66215684d6..fa45d9335d 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -36,6 +36,14 @@ static inline void target_cpu_init(CPUARMState *env,
     }
 }
 
+static inline void target_cpu_clone_regs(CPUARMState *env, target_ulong newsp)
+{
+    if (newsp) {
+        env->regs[13] = newsp;
+    }
+    env->regs[0] = 0;
+}
+
 static inline void target_cpu_reset(CPUArchState *cpu)
 {
 }
-- 
2.33.0


