Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DF441F32F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:35:46 +0200 (CEST)
Received: from localhost ([::1]:48728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMRl-00010X-Aq
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM5C-00059h-53
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:26 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:34492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM5A-0005IV-9c
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:25 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id x8so6003373qvp.1
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cVCx2jHCPvPujkZ/wrXYdO47hYaVZq7kiqP/WMFmGDE=;
 b=Aew/8u6YB1iOZFN9N26/Kz5Qxnb6h66J9LkqbKIXer9tEZW+3Q01jRo5cXWzwKyMfQ
 3Lf93TBnKIdNWC0wRE2m/yimQvIHzW1b4Z1dwBu5ufPHeNkuqu0zwwAGNVrtiHOm4RFO
 BBXaW5hcC6ZAL5tYKg7QrTJHzTXlrcTHEt8pM6sgpomtlPQ4qqocotVzoUg5rzKr+xhY
 OUIzsIcPVxv82juVuzpDm3uEGQzhZapKcJ5wbhyHthYxo22z33TLe5prSoix2YtGhV58
 ZfRXbUG8UnaGVQOnunMBYicOD/er8mw1wEWE7OedRumxVomIczYs8xN5reksKeuh+QuF
 CIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cVCx2jHCPvPujkZ/wrXYdO47hYaVZq7kiqP/WMFmGDE=;
 b=ZY6oSXgQxHY+hJOMAX25q2wET7NU2ELp6rg7/52Md8+q1huhsKwSvr5uf9iaOwkOj+
 XbsstFZaKLy41HmER5fMT4cTgqzIEcrgBVea1TK3gWHbrprLIMVtBw2BTu74iwpvkbE3
 UsFnmOPJ561iwx3/gJA8lm2VRoqOCKGffickGYhrA7hyqlmg/MsyJZnbjtoTsggAcsgF
 wfRKqTQHvcvpIryX6Jwb5NDYpXDm7fhF3eEoBs/x6euzxFStlTsRZp8lGEzRg+Ns2ajF
 zAXqjDJHF8iSwM08dIqmLaP5KMWkkXMHkTrGN7msz3dyHjzLWCEJRDaWRn7i0wq6tia9
 vupQ==
X-Gm-Message-State: AOAM533kgcozzgsDdvFtUUrFQgFcrssLLOSlFjhYikWHrJgQp0mUxExP
 WZgiFzVgFjqPmQ4n+y5aQjM+KSlkOG6ymQ==
X-Google-Smtp-Source: ABdhPJzyWKY2LfvmqiOqyVMaSgPHdMqpVwOpBaOqEvzriY/ZXypnB7p1bjB53mTuKQ3Gwwnh1hSpYg==
X-Received: by 2002:a05:6214:5b1:: with SMTP id
 by17mr8179346qvb.18.1633108341355; 
 Fri, 01 Oct 2021 10:12:21 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 32/41] linux-user/openrisc: Adjust signal for EXCP_RANGE,
 EXCP_FPE
Date: Fri,  1 Oct 2021 13:11:42 -0400
Message-Id: <20211001171151.1739472-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stafford Horne <shorne@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kernel vectors both of these through unhandled_exception, which
results in force_sig(SIGSEGV).  This isn't very useful for userland
when enabling overflow traps or fpu traps, but c'est la vie.

Cc: Stafford Horne <shorne@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/openrisc/cpu_loop.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index f6360db47c..de5417a262 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -56,13 +56,17 @@ void cpu_loop(CPUOpenRISCState *env)
             break;
         case EXCP_DPF:
         case EXCP_IPF:
-        case EXCP_RANGE:
             info.si_signo = TARGET_SIGSEGV;
             info.si_errno = 0;
             info.si_code = TARGET_SEGV_MAPERR;
             info._sifields._sigfault._addr = env->pc;
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
+        case EXCP_RANGE:
+        case EXCP_FPE:
+            /* ??? The kernel vectors both of these to unhandled_exception. */
+            force_sig(TARGET_SIGSEGV);
+            break;
         case EXCP_ALIGN:
             info.si_signo = TARGET_SIGBUS;
             info.si_errno = 0;
@@ -77,13 +81,6 @@ void cpu_loop(CPUOpenRISCState *env)
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
-- 
2.25.1


