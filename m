Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3B8442D4B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:57:14 +0100 (CET)
Received: from localhost ([::1]:59614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsPh-0006oJ-HB
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreJ-00042t-Ky
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:15 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:38522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreE-0000wu-7K
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:15 -0400
Received: by mail-qt1-x833.google.com with SMTP id h4so17862632qth.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mXI5pLklfarH8j3WhgGW5xn4dLCOLkkDAfhYzkOpzbo=;
 b=pnWkhqvB+yiHYoayc0XTVOtqrb/Zj7wlE0pU/F/+hcJJYdDFIQelrGO2yH2GLCrmJP
 u8CdzMabCW2SgUSoJHsZEOUVl+LjOoPJagAqVn/RafyJtN1/Y8cAxs8yXnuUY7nJ2F2E
 f0EQocLINTK1OtcoorMSQQ0/OO3pNtpVCAk6E2anMX8gybPd1CPH8GPoEti6gqSTiTZw
 /K6aOxMwfd5j450oK6DXLEZ6bqlfIjQYnAzxkiotMujFyJNQlrMdFVLCQBfT8xpwvfCr
 l4dsbBi9OELYeaJKOMIWUUCKnPIzvDJwv8eYnAdcxlt8HnypJhBuXAk2s3v/KxzwSAWO
 PUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mXI5pLklfarH8j3WhgGW5xn4dLCOLkkDAfhYzkOpzbo=;
 b=iO/eBdXlip+VgoP6jL3uHXSFKW1vWodIEJL6IMz35aoNvtpm0u9nCodCNCKvbTWgES
 YhNUfPnVJpoDf+NiQpm4dNTLIoo996hfsod7FooDHVNXmWIavVm6Y3T+0jnnK2UIHLLm
 kPxk3J/9XgZo85hRfcswERtiq4ipjOZV7GY7coVobVv7sf8zfncXMWGjH9mh18DBnSbb
 Oh3Wcneizjm6h/bmRDBAN7/RQvrJkLQZWvmqCemGlgxzEjfXT1qvbVI+JllXXxyK2mHt
 j8Avg+2jYVZfvFHj5DaZS03yNPJHgr1c+xch45/tMt+Y0iN4f3TNlrSaWC6uS7EoQy9R
 lvFA==
X-Gm-Message-State: AOAM530Z71Fu1wbEGBVVOF16PAGSdB+W3RUsUyaq0CvTckQDDtVm/ZlP
 qACM5vV6jm23rFfJzw21wspJPy0ljpHpCA==
X-Google-Smtp-Source: ABdhPJx3t3Vk740y0qck+fmHEf0wrP5gPk8o+sc4k0sh7yuuoBLGhg23bq4ARzptPnVjU4ngzRmY9g==
X-Received: by 2002:ac8:5f51:: with SMTP id y17mr327607qta.154.1635851280521; 
 Tue, 02 Nov 2021 04:08:00 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:08:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/60] linux-user/openrisc: Abort for EXCP_RANGE, EXCP_FPE
Date: Tue,  2 Nov 2021 07:07:12 -0400
Message-Id: <20211102110740.215699-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU does not allow the system control bits for either exception to
be enabled in linux-user, therefore both exceptions are dead code.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/openrisc/cpu_loop.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index f6360db47c..10b7147f68 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -56,7 +56,6 @@ void cpu_loop(CPUOpenRISCState *env)
             break;
         case EXCP_DPF:
         case EXCP_IPF:
-        case EXCP_RANGE:
             info.si_signo = TARGET_SIGSEGV;
             info.si_errno = 0;
             info.si_code = TARGET_SEGV_MAPERR;
@@ -77,13 +76,6 @@ void cpu_loop(CPUOpenRISCState *env)
             info._sifields._sigfault._addr = env->pc;
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
-        case EXCP_FPE:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = 0;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case EXCP_INTERRUPT:
             /* We processed the pending cpu work above.  */
             break;
@@ -96,6 +88,15 @@ void cpu_loop(CPUOpenRISCState *env)
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             break;
+        case EXCP_RANGE:
+            /* Requires SR.OVE set, which linux-user won't do. */
+            cpu_abort(cs, "Unexpected RANGE exception");
+        case EXCP_FPE:
+            /*
+             * Requires FPSCR.FPEE set.  Writes to FPSCR from usermode not
+             * yet enabled in kernel ABI, so linux-user does not either.
+             */
+            cpu_abort(cs, "Unexpected FPE exception");
         default:
             g_assert_not_reached();
         }
-- 
2.25.1


