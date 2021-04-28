Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1040C36DFF9
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:55:44 +0200 (CEST)
Received: from localhost ([::1]:43798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbqHf-0002H5-3q
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpx8-00060x-Mo
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:30 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpwv-0004gC-UI
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:29 -0400
Received: by mail-pl1-x629.google.com with SMTP id 20so29483362pll.7
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vh0kfN5CfXJgIuyczvf+DwPn2SrN7UGjddvSaX9nPq0=;
 b=UuIAdgLHbb3Kb7qU3A+f+M2tVJ/6JhxlzSzxzerbusJUr5b5s89R5g3eDqZ+Z+ieXW
 KIeJWR+pbZhviZB3FP5aghJkcIbfd/LUISELu54NoW/Bs+YB1FZGNqxitism6AWFJ3l+
 iyvxN6XJdrgiNAr/rq9xkjuHJ/WFDAbm7iA5oVbWtCucVamm0mGcLV/IWkgk3XxoxOg2
 Lgdu0j0nYm/R4e7sQSHBsamTvIVsCt07yabVVmx1eCeD+PMiQiB75EuoIRNPYVtDa+ds
 ep9MhplDOe7YeuHGvduGx4pOpAEp7KJ7iZYrlBUJ1U8C+jEB0DEwsQIXy5sjyPvYcojx
 wt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vh0kfN5CfXJgIuyczvf+DwPn2SrN7UGjddvSaX9nPq0=;
 b=FZGwOZbja9e9JmThTKM1eOEIV8IQ2gp/ufCCrcy98D5M21E8Q14Y4v3fibE4A5Xjxi
 BhAoAV3Ob/fjIcuB2B1nXiKgW1i4ma51LUWxdcWtZ6x/qBGyqJSbF+nU7mzBhOiRfsuA
 bU/bmOcdlo/VWnfiu+XWNACidlTUDT9oYhbvwGvqsoWNtGMCpZVLAtjcn9dJUWuawy7s
 USv+YNXh8v5Gs/UByEF+vW0wkjA7KX3iyLTBr00A8RMf6aot8hF6PnOcORvdw8ePJoVd
 x5aIslq3IwVg7Jw+jedcTygvTZasyEA89AKN1WX60h/cns3sO788THgz5dETWNICirdE
 BlmQ==
X-Gm-Message-State: AOAM533ccOdaWjl4XlBInQeJAuXSUfW40e+1kF0sHyFLyTrvBRDU83A0
 ggR7iWjSXQkHcMAV8Vf9mQIXFgzttHRW/g==
X-Google-Smtp-Source: ABdhPJyOlhDkkgmnl+OhbIv4rNdGzaRuT1B/UVeRgoq+KVgHG0VsxiP3R2olDH4TpyiyMNUP6YDG4w==
X-Received: by 2002:a17:90a:9409:: with SMTP id
 r9mr34377738pjo.157.1619638456430; 
 Wed, 28 Apr 2021 12:34:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h21sm403725pfo.211.2021.04.28.12.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 12:34:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/15] linux-user/s390x: Add stub sigframe argument for
 last_break
Date: Wed, 28 Apr 2021 12:34:04 -0700
Message-Id: <20210428193408.233706-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428193408.233706-1-richard.henderson@linaro.org>
References: <20210428193408.233706-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to properly present these arguments, we need to add
code to target/s390x to record LowCore parameters for user-only.

But in the meantime, at least zero the missing last_break
argument, and fixup the comment style in the vicinity.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/signal.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 17f617c655..bc41b01c5d 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -167,13 +167,16 @@ void setup_frame(int sig, struct target_sigaction *ka,
                   | (env->psw.mask & ~PSW_MASK_ASC);
     env->psw.addr = ka->_sa_handler;
 
-    env->regs[2] = sig; //map_signal(sig);
+    env->regs[2] = sig;
     env->regs[3] = frame_addr += offsetof(typeof(*frame), sc);
 
-    /* We forgot to include these in the sigcontext.
-       To avoid breaking binary compatibility, they are passed as args. */
-    env->regs[4] = 0; // FIXME: no clue... current->thread.trap_no;
-    env->regs[5] = 0; // FIXME: no clue... current->thread.prot_addr;
+    /*
+     * We forgot to include these in the sigcontext.
+     * To avoid breaking binary compatibility, they are passed as args.
+     */
+    env->regs[4] = 0; /* FIXME: regs->int_code & 127 */
+    env->regs[5] = 0; /* FIXME: regs->int_parm_long */
+    env->regs[6] = 0; /* FIXME: current->thread.last_break */
 
     /* Place signal number on stack to allow backtrace from handler.  */
     __put_user(env->regs[2], &frame->signo);
@@ -223,9 +226,10 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
                   | (env->psw.mask & ~PSW_MASK_ASC);
     env->psw.addr = ka->_sa_handler;
 
-    env->regs[2] = sig; //map_signal(sig);
+    env->regs[2] = sig;
     env->regs[3] = frame_addr + offsetof(typeof(*frame), info);
     env->regs[4] = frame_addr + offsetof(typeof(*frame), uc);
+    env->regs[5] = 0; /* FIXME: current->thread.last_break */
 }
 
 static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
-- 
2.25.1


