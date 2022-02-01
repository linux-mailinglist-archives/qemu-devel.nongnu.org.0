Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A02194A6834
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:51:00 +0100 (CET)
Received: from localhost ([::1]:44270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1zH-0007Mg-Kx
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:50:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExtp-0002ec-Ku
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:29:06 -0500
Received: from [2a00:1450:4864:20::42b] (port=44732
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExto-0001fx-7F
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:29:05 -0500
Received: by mail-wr1-x42b.google.com with SMTP id k18so33752829wrg.11
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CJ53Uj6U+FB2fJ+hgAKxvbRBEP4EFyNBAoP2qiY8QbM=;
 b=ZUxlQqqJBA4YDmIN2zLVlwC4UKygiy2t2beEmVZ02ZxY7Es5asPCi3Y35WY9Mrvhbu
 bgSeR89UKFtYHHlimv80FoPtOGepd2EmwVDNIg1DqmgOqJJE/Z9ZRByTiZI6UWqHsZ8Z
 54NF0SY8eg1QYvWiMnTmWXAyx3ltMmUOiKrpTe2GAF1BZAUvo4vQbGZFfiHKIao8QXBk
 GJXu/MOtgjgSr9y3qrki7zSg/9H5y8jAqCenMF9m0yRvryLJOaSZHKL2xsB6IX95H07M
 Yi7uhj6g8c5n08d1o+gwM6/bwZLVpM+imMjhcx0oZ2jFSeZhzQHNjwGqqd+bW9r4HaqI
 Ojcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CJ53Uj6U+FB2fJ+hgAKxvbRBEP4EFyNBAoP2qiY8QbM=;
 b=p5Hzj/egMGyx779hxpFXrxcvpEFxLyGgpedfDOWmfMelRuQMbxNAt+n/536Y2JRYoP
 9d29gnWz0FO39pk1HImd4Zg/6q1/p+u1FZxa5yM+K+/zPvmGzeCZtwyG9MHfhtJ1Ryan
 xecOeL+VwsiaBUEidfOWkwATBxusZPCr44svGGMN8kW7+1Ui2OGTzclb1OEGxsF/Adkj
 7iniQKY+GP1Q4Z09zUWmSlY9o24xpylZ5BvxjydKxGTc2SYXP/1S9ext2UvDwMJVNmLx
 auKpisIVPw0/uC9cWkYWHOKa8MgTUHfLvT9SbSednRdw7YvYcqeqByvpF/iZaVU2P07i
 2zrw==
X-Gm-Message-State: AOAM533M68cINXktp7J11aRNx6jYStf1dSsaYz1mgP0pZ8atG5nkcN1g
 fj3jAcRWlv3E5vwefac+JJVDnA==
X-Google-Smtp-Source: ABdhPJwLg8W6Vh8xKPx8y6k3D4snqNrE41q3f6EluakJ309SH9RbdKqcF4zjh8wGPi9zMo1FHRVNpg==
X-Received: by 2002:a05:6000:1568:: with SMTP id
 8mr21317434wrz.583.1643740142915; 
 Tue, 01 Feb 2022 10:29:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m187sm2638848wme.25.2022.02.01.10.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:28:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 081001FFCF;
 Tue,  1 Feb 2022 18:20:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 24/25] target/i386: use CPU_LOG_INT for IRQ servicing
Date: Tue,  1 Feb 2022 18:20:49 +0000
Message-Id: <20220201182050.15087-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201182050.15087-1-alex.bennee@linaro.org>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: fam@euphon.net, Eduardo Habkost <eduardo@habkost.net>, berrange@redhat.com,
 stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, f4bug@amsat.org, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org, Luke.Craig@ll.mit.edu, pbonzini@redhat.com,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think these have been wrong since f193c7979c (do not depend on
thunk.h - more log items). Fix them so as not to confuse other
debugging.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220124201608.604599-22-alex.bennee@linaro.org>
---
 target/i386/tcg/sysemu/seg_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/sysemu/seg_helper.c b/target/i386/tcg/sysemu/seg_helper.c
index bf3444c26b..824b9a5a26 100644
--- a/target/i386/tcg/sysemu/seg_helper.c
+++ b/target/i386/tcg/sysemu/seg_helper.c
@@ -167,7 +167,7 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
         cs->interrupt_request &= ~(CPU_INTERRUPT_HARD |
                                    CPU_INTERRUPT_VIRQ);
         intno = cpu_get_pic_interrupt(env);
-        qemu_log_mask(CPU_LOG_TB_IN_ASM,
+        qemu_log_mask(CPU_LOG_INT,
                       "Servicing hardware INT=0x%02x\n", intno);
         do_interrupt_x86_hardirq(env, intno, 1);
         break;
@@ -175,7 +175,7 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
         cpu_svm_check_intercept_param(env, SVM_EXIT_VINTR, 0, 0);
         intno = x86_ldl_phys(cs, env->vm_vmcb
                              + offsetof(struct vmcb, control.int_vector));
-        qemu_log_mask(CPU_LOG_TB_IN_ASM,
+        qemu_log_mask(CPU_LOG_INT,
                       "Servicing virtual hardware INT=0x%02x\n", intno);
         do_interrupt_x86_hardirq(env, intno, 1);
         cs->interrupt_request &= ~CPU_INTERRUPT_VIRQ;
-- 
2.30.2


