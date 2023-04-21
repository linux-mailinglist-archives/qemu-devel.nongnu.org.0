Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D816EAF6A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:44:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptrG-0005zD-P9; Fri, 21 Apr 2023 12:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pptrB-0005oC-72
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:43:33 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pptr9-0003Eb-OF
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:43:32 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f178da21b5so14075255e9.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682095410; x=1684687410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vnQfui4LvJlqBZLzJkayAo9pyQ0/W5+m4YKJSAvgiQs=;
 b=PeHpoFJSb5Ss0uS6M2jwXKF6OOhS1jevhrxZjwfzwsSs764gC3Jv88ygCxJ3JxtmuL
 X9RqC7bS8N7ha5osbpJGCrnbm9GAMGv+59KfagTbUeApFZs1yzo8BkLtp/Fa91BnCzkd
 n6kzUoUQNk27aKkzdHRKSSOTh+Cw3idc8jmvY9jzT+Q7zlSdFETg4hvMO/3l6Btt3KSW
 euU4ofdHh1eBnKaiEDsD4k/2br3vzsKD8zGgTQmwtynQG0WoomXCO9b3t1J2lnhBvbgh
 d8L5pekmUC1kr/uLbg0Ch5LiYi20NcFEFEeqxfta5lruau8VKlU1JBM7aUVQ3fTf1X5f
 nTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682095410; x=1684687410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vnQfui4LvJlqBZLzJkayAo9pyQ0/W5+m4YKJSAvgiQs=;
 b=eYbhcLaBcvrta0eIXUU5WmnGIlNHKCT3LTFlvZE7UyqxMYxFBU/3oHEAqwPQU2dZo9
 LsZk2YgFUaNFytb4Jqh1yISkN0BuZ4TamQUaZ+m7Yrwm3oV/TEHd5vPg1K36PAlwUfL7
 J7fM/lxXO2iRhnmzdFY468i7gNinFYaDTT1fdDsIDmSyvAIrSI3oDKS8bmNSwGyV9+08
 NDfCqLySsug35u0/DloCTdOsu5K0s5qD+2jHPg6enfJvLfxyFc66gao+VIKH00G0gVfm
 Ivcr0sCXA0f3jpzqTcMcuBRmzwG8qGS086Q4gGZi5cmluVpBZJQ4hHM1+C0t651oy8gq
 NP5g==
X-Gm-Message-State: AAQBX9dmZ9msZJo4tUxeXvBrFDuyLtnAZFlFunfaQjVwOrGZLatgHSyl
 1h1PTZVLaBrnB8yENLgjRJQ1QhVKif8=
X-Google-Smtp-Source: AKy350Y6ymRHqrynPbozzy5ZG3FyrJfXBfqnLkUshWhw2FsWNiRhicCGUjYwWf6o6IkdNyCjH5l1fg==
X-Received: by 2002:a05:600c:2257:b0:3f1:76d4:d43f with SMTP id
 a23-20020a05600c225700b003f176d4d43fmr2460332wmm.8.1682095410047; 
 Fri, 21 Apr 2023 09:43:30 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm5266658wml.11.2023.04.21.09.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:43:29 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com,
	Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH v3 11/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 18:42:00 +0200
Message-Id: <20230421164200.2913-12-kariem.taha2.7@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421164200.2913-1-kariem.taha2.7@gmail.com>
References: <20230421164200.2913-1-kariem.taha2.7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Warner Losh <imp@bsdimp.com>

Add the dispatching code of bind(2),connect(2), accpet(2), getpeername(2).

Add the bind(2), connect(2), accept(2), getpeername(2) syscalls case
statements to freebsd_syscall function defined in bsd-user/freebsd/os-syscall.c

Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
---
 bsd-user/freebsd/os-syscall.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index c8f998ecec..7f29196a05 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -44,6 +44,8 @@
 #include "signal-common.h"
 #include "user/syscall-trace.h"
 
+/* BSD independent syscall shims */
+#include "bsd-socket.h"
 #include "bsd-file.h"
 #include "bsd-proc.h"
 
@@ -508,6 +510,25 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_freebsd_sysarch(cpu_env, arg1, arg2);
         break;
 
+        /*
+         * socket related system calls
+         */
+    case TARGET_FREEBSD_NR_accept: /* accept(2) */
+        ret = do_bsd_accept(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_bind: /* bind(2) */
+        ret = do_bsd_bind(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_connect: /* connect(2) */
+        ret = do_bsd_connect(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_getpeername: /* getpeername(2) */
+        ret = do_bsd_getpeername(arg1, arg2, arg3);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.40.0


