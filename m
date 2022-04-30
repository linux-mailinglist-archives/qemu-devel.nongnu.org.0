Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81542515DD3
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:47:32 +0200 (CEST)
Received: from localhost ([::1]:58284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknRb-00035f-KD
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAh-0004xT-Bc
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:06 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:33268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAf-0006IR-Ho
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:02 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 cu23-20020a17090afa9700b001d98d8e53b7so9749554pjb.0
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vn62q4JFTAD/R3vXFdx+pxyclHtNLhvG5t7w0tEUSHE=;
 b=bZNKDHVXJgAPpJoex5Y0STc+m70+YGhWkLQfC1HTWM0BYt+NCsDWyw8dChT62TEQPk
 6N+uhfb8Fl8hD4eF5Bw/YR3N0ADiOjoUETeFn8IWvdPNgB3sF6UyABnnhDUoNcayozez
 q50Cl0hd5+yGqSuN78N9lkZXrBxTvTcBj6p1KpW/KfhiL5A2I2luiMik/CRpXgzxZZMS
 EAZlcVvauqjG1p3w+RI+yaoCZCeXyNsNYRLnSqLQa1f2tfkO55nu2IQMHZzI8dICVeGf
 I+Vynq1UldJkgOv/PtMb1gBoxI7VhIYiSr3VcFcfn1koAdD9lTesMq8SiByDSroggScH
 1Gfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vn62q4JFTAD/R3vXFdx+pxyclHtNLhvG5t7w0tEUSHE=;
 b=28NYCuJJNPvk41NqNboOQ2lkM8wZKmGQ3nnsSTta07snuv38NUmgESP+V1LHWF45h0
 1N9VG82f315PSvDspA1xf/7vMiFbzFAhaZaczsSSJX7W2/snOiIXBni9Ht+ZhrUUV3g/
 6pqVnI9kijaUl7pzAkACyjDYu3l/kp+FaDtkw1N/M3ODBvv5MgscD/7Bo/ssnKHuP4n+
 KNffFKYoiGKSoK4sALaSMNjfGbn7kCFeLuUAR078FapqrlsYxcu+1u3NzsrkpF6HdxLJ
 OWyPjx/qGmLYr4hGCDqNzEksSFApzF+buFaqxuzWBcfQBaZ1bYx1L/32Aij9y8HZwNEt
 m7FA==
X-Gm-Message-State: AOAM530dilRo4QIGCpzp82iQA5UIB6EacDcAce4ZHvn956mhdOuy0HJQ
 S246+ONjBgvRA3Zmf512zK1quwM9jp0NNg==
X-Google-Smtp-Source: ABdhPJwU+v/8+Iawq/IHBBni15tpkSj/pV3j/KOuvN2n7RAdwAiEsZYUWfhSVQqF7N6ylAS9+nXmMw==
X-Received: by 2002:a17:902:82c9:b0:15d:2e43:a0e5 with SMTP id
 u9-20020a17090282c900b0015d2e43a0e5mr3804083plz.64.1651325400231; 
 Sat, 30 Apr 2022 06:30:00 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/43] semihosting: Split out semihost_sys_isatty
Date: Sat, 30 Apr 2022 06:29:15 -0700
Message-Id: <20220430132932.324018-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out the non-ARM specific portions of SYS_ISTTY to a
reusable function.  This handles all GuestFD.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/guestfd.h |  3 +++
 semihosting/arm-compat-semi.c | 27 +-----------------------
 semihosting/guestfd.c         | 39 +++++++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+), 26 deletions(-)

diff --git a/include/semihosting/guestfd.h b/include/semihosting/guestfd.h
index 9c6967ac53..d3dd081e81 100644
--- a/include/semihosting/guestfd.h
+++ b/include/semihosting/guestfd.h
@@ -65,4 +65,7 @@ void semihost_sys_write(CPUState *cs, gdb_syscall_complete_cb complete,
 void semihost_sys_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
                         int fd, int64_t off, int gdb_whence);
 
+void semihost_sys_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
+                         int fd);
+
 #endif /* SEMIHOSTING_GUESTFD_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 0cab721a50..3844d0e376 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -290,14 +290,8 @@ common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
  * do the work and return the required return value to the guest
  * via common_semi_cb.
  */
-typedef void sys_isattyfn(CPUState *cs, GuestFD *gf);
 typedef void sys_flenfn(CPUState *cs, GuestFD *gf);
 
-static void host_isattyfn(CPUState *cs, GuestFD *gf)
-{
-    common_semi_cb(cs, isatty(gf->hostfd), 0);
-}
-
 static void host_flenfn(CPUState *cs, GuestFD *gf)
 {
     struct stat buf;
@@ -309,11 +303,6 @@ static void host_flenfn(CPUState *cs, GuestFD *gf)
     }
 }
 
-static void gdb_isattyfn(CPUState *cs, GuestFD *gf)
-{
-    gdb_do_syscall(common_semi_cb, "isatty,%x", gf->hostfd);
-}
-
 static void gdb_flenfn(CPUState *cs, GuestFD *gf)
 {
     gdb_do_syscall(common_semi_flen_cb, "fstat,%x,%x",
@@ -337,32 +326,23 @@ static const uint8_t featurefile_data[] = {
     SH_EXT_EXIT_EXTENDED | SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
 };
 
-static void staticfile_isattyfn(CPUState *cs, GuestFD *gf)
-{
-    common_semi_cb(cs, 0, 0);
-}
-
 static void staticfile_flenfn(CPUState *cs, GuestFD *gf)
 {
     common_semi_cb(cs, gf->staticfile.len, 0);
 }
 
 typedef struct GuestFDFunctions {
-    sys_isattyfn *isattyfn;
     sys_flenfn *flenfn;
 } GuestFDFunctions;
 
 static const GuestFDFunctions guestfd_fns[] = {
     [GuestFDHost] = {
-        .isattyfn = host_isattyfn,
         .flenfn = host_flenfn,
     },
     [GuestFDGDB] = {
-        .isattyfn = gdb_isattyfn,
         .flenfn = gdb_flenfn,
     },
     [GuestFDStatic] = {
-        .isattyfn = staticfile_isattyfn,
         .flenfn = staticfile_flenfn,
     },
 };
@@ -487,12 +467,7 @@ void do_common_semihosting(CPUState *cs)
 
     case TARGET_SYS_ISTTY:
         GET_ARG(0);
-
-        gf = get_guestfd(arg0);
-        if (!gf) {
-            goto do_badf;
-        }
-        guestfd_fns[gf->type].isattyfn(cs, gf);
+        semihost_sys_isatty(cs, common_semi_cb, arg0);
         break;
 
     case TARGET_SYS_SEEK:
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index e33d226534..6ed4a9162d 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -523,3 +523,42 @@ void semihost_sys_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
         g_assert_not_reached();
     }
 }
+
+static void gdb_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
+                       GuestFD *gf)
+{
+    gdb_do_syscall(complete, "isatty,%x", (target_ulong)gf->hostfd);
+}
+
+static void host_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
+                        GuestFD *gf)
+{
+    if (isatty(gf->hostfd)) {
+        complete(cs, 1, 0);
+    } else {
+        complete(cs, 0, errno);
+    }
+}
+
+void semihost_sys_isatty(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
+{
+    GuestFD *gf = get_guestfd(fd);
+
+    if (!gf) {
+        complete(cs, 0, EBADF);
+        return;
+    }
+    switch (gf->type) {
+    case GuestFDGDB:
+        gdb_isatty(cs, complete, gf);
+        break;
+    case GuestFDHost:
+        host_isatty(cs, complete, gf);
+        break;
+    case GuestFDStatic:
+        complete(cs, 0, ENOTTY);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
-- 
2.34.1


