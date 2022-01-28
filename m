Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82A94A046F
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:43:24 +0100 (CET)
Received: from localhost ([::1]:57620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDatn-0001cX-O8
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:43:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafh-0000Wj-3Y
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:49 -0500
Received: from [2607:f8b0:4864:20::d33] (port=35496
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaf9-0001Zm-GP
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:16 -0500
Received: by mail-io1-xd33.google.com with SMTP id 9so9732659iou.2
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bc6DcyWj3C/koTrEJ9qrW7xAW1qoks2DIh1czZk9FmE=;
 b=hsCB0dPgpT8URvuWnyeolp0f8NZLqBSNNPdxd/O8M3o8gatPj9VVhAlzappTIl96PK
 BFpkMi9RbKRmEaneIjBe7JNWyN0/1HBjHzG6WQmUcHt0FnDVVk46L7W4flrJseDh0LVT
 mg0WfkR0LqlW273os67Eh3pCOcYrv7W7IWjemDoxSN3FndBlzBZnwXZjO3lOkimHJGAt
 Zl8QituWfd1+w39YZwFq9/HfUfudDXaz4q6FNoKmNeWSi9o8oiV2VF44lZ/5xFWPZ+0p
 yuoQipnOd9yeMiR5UhXdnIjocTMwd2XTEzWA67SZAzMi/5wzi81+BARp4g6r51lCEA94
 yXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bc6DcyWj3C/koTrEJ9qrW7xAW1qoks2DIh1czZk9FmE=;
 b=ZaTHiltd4fPCYUhyXtILKdNAyVXg2vtHVZ+cJ72bkQYr7BQngRXjg11oc0Sed+RQ0U
 CKc6oHTd9WSTCg2af8xySd8Taf6+nOZiLvTLKZpxok2MqYpdLMARdR+jjUhPfXgvKcgY
 EH9vA2S79lqzYmNjg7GGZvTx2r57mAVY4uW2/lIgY2SO1Rhu0Aq/GVZyEIBHAFOsTeuM
 soLP6fK1O+NzMNm5lXCpoQEjKBHv0BQ/OsPhjjFtdtOREqyIkeLivrqnMnQltrYInKgB
 S+Zcz9GrPNYUMfFrfTmwx2WBMo9DfBON9OT+uoDRCrfuvwOguDbDbpEeDCqbwqAPAQUL
 Y8Hg==
X-Gm-Message-State: AOAM530mWzlWqD4JDcNM5TgMAoP4LeMU9aFyHKMnR8jlJH/bNKkTHq3L
 TBDtPH2vJyejWz4PjSYqV+U1jimRDpYW5w==
X-Google-Smtp-Source: ABdhPJykd1tXVxAv1Ik7z+IhZJMANbxcLulR89EMPfoQadoTXJdau2krjJN9nL6Em7qHtrIUpOWlDQ==
X-Received: by 2002:a05:6602:2d95:: with SMTP id
 k21mr6749066iow.107.1643412494234; 
 Fri, 28 Jan 2022 15:28:14 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:13 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/40] bsd-user/arm/arget_arch_cpu.h: Move EXCP_DEBUG and
 EXCP_BKPT together
Date: Fri, 28 Jan 2022 16:27:37 -0700
Message-Id: <20220128232805.86191-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Implement EXCP_DEBUG and EXCP_BKPT the same, as is done in
linux-user. The prior adjustment of register 15 isn't needed, so remove
that. Remove a redunant comment (that code in FreeBSD never handled
break points). It's unclear why BKPT was an alias for system calls,
but FreeBSD doesn't do that today.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index b7f728fd667..05b19ce6119 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -65,19 +65,7 @@ static inline void target_cpu_loop(CPUARMState *env)
             }
             break;
         case EXCP_SWI:
-        case EXCP_BKPT:
             {
-                /*
-                 * system call
-                 * See arm/arm/trap.c cpu_fetch_syscall_args()
-                 */
-                if (trapnr == EXCP_BKPT) {
-                    if (env->thumb) {
-                        env->regs[15] += 2;
-                    } else {
-                        env->regs[15] += 4;
-                    }
-                }
                 n = env->regs[7];
                 if (bsd_type == target_freebsd) {
                     int ret;
@@ -172,14 +160,8 @@ static inline void target_cpu_loop(CPUARMState *env)
             queue_signal(env, info.si_signo, &info);
             break;
         case EXCP_DEBUG:
-            {
-
-                info.si_signo = TARGET_SIGTRAP;
-                info.si_errno = 0;
-                info.si_code = TARGET_TRAP_BRKPT;
-                info.si_addr = env->exception.vaddress;
-                queue_signal(env, info.si_signo, &info);
-            }
+        case EXCP_BKPT:
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->regs[15]);
             break;
         case EXCP_YIELD:
             /* nothing to do here for user-mode, just resume guest code */
-- 
2.33.1


