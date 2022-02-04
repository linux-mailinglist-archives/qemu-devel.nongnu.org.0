Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E3C4AA19B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 22:09:43 +0100 (CET)
Received: from localhost ([::1]:49268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5pu-0003pp-Uh
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 16:09:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5WX-0008Vi-UY
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:49:42 -0500
Received: from [2a00:1450:4864:20::42d] (port=44653
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5WM-00089w-CI
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:49:40 -0500
Received: by mail-wr1-x42d.google.com with SMTP id k18so13422748wrg.11
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CJ53Uj6U+FB2fJ+hgAKxvbRBEP4EFyNBAoP2qiY8QbM=;
 b=VIR/wlTjqEtbrmTlSp7XM9IFtB3NBGY8PkdM/hgplre1n9zAxCt5oybyIRn11iIHIM
 QUU3CXJwr0rAa5ekxc4I97dVfnQlaGSMKWKkkt10RMiMiQlN82DHRsfv1wWJRdy1Te0J
 cbAnpC9MgGIbix8BPpOGlq9/yozGTBv9s9J2Xyu5zlsFocSRBHmNSHrBic7Q9AlN0rw6
 pkI+9FlqDY2S3Vge/9Sgdd074Jf/O6/8kxELWVa89q+KBbq3xWO+aUfh/6O5+zfxWaUO
 z7EC9gQ72IBPGE1NnS2tr5n3OBMoriwAdXaYPm1hm6Mt2BKSisOsmxcAwl4iAySE9dea
 7pIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CJ53Uj6U+FB2fJ+hgAKxvbRBEP4EFyNBAoP2qiY8QbM=;
 b=1Zolal57Vnn3wcouC6pUJP3ldDlYykVDUB2Xv3K+FLzYBVSMpb2GjIsa8BKEBG2Qoo
 +mWTaRpawAbHFfUmevlYxMJFaSLPK4gAB4Gqa4f9wFnZaN6o/AmotuI+db0i8H1AIz/2
 08YDLJKiKdLFVqL21fv/C9TM/lupRHzMgHPDRw11ccLySl09SqMOzGJJOWS3zvwWZRAc
 2zfQQIox9uRlQV677AwrGyumA3ZWXIpSZVRlnRK58JEuc6NG9GULzRX5H2L1UrrN/GPs
 EHLIfeZI2VpjJyaN63KfClhr3QyxhwVMc7Ih6PAWVyYSgrUxZtZ2eg5aY3/RKTqEQUuW
 /FWQ==
X-Gm-Message-State: AOAM530u/xokuIKWwWe6waWsZWABjeeFLhl6tgqLn9xoE+De71lsRQ0V
 +ktiOZBHHJaZ/yVuP8hIy6govg==
X-Google-Smtp-Source: ABdhPJyQb+YyIDvN5TiZ/DmPSyr7ZlD48oDgffDxGc+Vg2cuAL24oIsJKawO7t7s940zC9hBxOV7Iw==
X-Received: by 2002:adf:ff83:: with SMTP id j3mr561469wrr.618.1644007761315;
 Fri, 04 Feb 2022 12:49:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u14sm2866860wmq.41.2022.02.04.12.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:49:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AC04A1FFD0;
 Fri,  4 Feb 2022 20:43:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH  v3 25/26] target/i386: use CPU_LOG_INT for IRQ servicing
Date: Fri,  4 Feb 2022 20:43:34 +0000
Message-Id: <20220204204335.1689602-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
 Luke.Craig@ll.mit.edu, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
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


