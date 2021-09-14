Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA2840A216
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:38:23 +0200 (CEST)
Received: from localhost ([::1]:40732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwSs-0002Au-P4
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6O-0001hZ-P1
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:08 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6N-0007eQ-4S
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:08 -0400
Received: by mail-pl1-x630.google.com with SMTP id 5so6976694plo.5
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qzdUbBvonI52eRjNBpOJVN+UXc3ukVmZEPGl23UhGwE=;
 b=HjgdIBwh9ygRgr+8uBSN2AUiUlcAfg1MJ8QzKEyARecJmKrXxIj2xp6FcfwN29zH7x
 wwbzRBVr2ZCKEY25vLnGoSgeUCXD3+razErErN+2Biiq879JIF8+rbIEhMb8qnMTJ/mm
 CcR17NJ/JZPi29SjUSt5VLwk65oA5Mxcm6gYa8VWSf9n+AB3w1n86ylTo5YdsSBMownJ
 id0330B7QV0ucoQUf8LEaQo++86LiCRvwfwuwVpGxl5flKxoklhHW2etpVahRiPToL/r
 SB71j5wIxS1SANMjrIbZBJwxVYlMx/wZrPSgUemHVql7jXFa2Xg02h13+bX8V3OQiJFn
 RHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qzdUbBvonI52eRjNBpOJVN+UXc3ukVmZEPGl23UhGwE=;
 b=QFTifSosoDYGSkVdkb7zhi/MocBVXAO5BinBycJ5CuMEP4s7cNpkPfskg1dAjXAvGX
 X921cCy+cjldnShPDkjoYB2+Vpl3h58AZHE/UPhXv7lFDFYBfZb2JK48Yk0EnCkGeUlK
 Ihcj9L8oolE3rdC9zbFDVH1wa3nAl5s/TZhfs/wzz0cnEdKz325V3W7axI2BJ+qTrkuH
 sUecQ1vAzAbR7JSp4yA8ckS/xUp1oAUJc7D/KafZmr9FpgMPIuTfLk1vj3WODBTizmmQ
 vDepVqDGcgq1TH/gClC7XyBONiX+myPKqEaN/4P/elJz4BlskEMu6w/thXqsbLs/okQV
 Wg6Q==
X-Gm-Message-State: AOAM5331FRntlnilogINum1YwjHW9P9MWEcq0yuX7dszo4uk5lR9oOGb
 AIGyOVDUtKNEONME5inhtra0NzebKwT77A==
X-Google-Smtp-Source: ABdhPJx+C7n+mIHH48xMaKJETYyO6aOfeWZsi4jihQtYciXPguwYS703dOYl2eyt3l3fsdKn6h25ZA==
X-Received: by 2002:a17:902:e846:b0:13a:479:33e5 with SMTP id
 t6-20020a170902e84600b0013a047933e5mr12650132plg.25.1631578505790; 
 Mon, 13 Sep 2021 17:15:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/44] target/i386: Restrict sysemu-only fpu_helper helpers
Date: Mon, 13 Sep 2021 17:14:22 -0700
Message-Id: <20210914001456.793490-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict some sysemu-only fpu_helper helpers (see commit
83a3d9c7402: "i386: separate fpu_helper sysemu-only parts").

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210911165434.531552-3-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/cpu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 71ae3141c3..1a36c53c18 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1837,11 +1837,14 @@ void x86_cpu_list(void);
 int cpu_x86_support_mca_broadcast(CPUX86State *env);
 
 int cpu_get_pic_interrupt(CPUX86State *s);
+
+#ifndef CONFIG_USER_ONLY
 /* MSDOS compatibility mode FPU exception support */
 void x86_register_ferr_irq(qemu_irq irq);
 void fpu_check_raise_ferr_irq(CPUX86State *s);
 void cpu_set_ignne(void);
 void cpu_clear_ignne(void);
+#endif
 
 /* mpx_helper.c */
 void cpu_sync_bndcs_hflags(CPUX86State *env);
-- 
2.25.1


