Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B540515DED
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:57:14 +0200 (CEST)
Received: from localhost ([::1]:55510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknaz-0004Pn-9a
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAl-0004yz-Jo
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:08 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAj-0006L0-FX
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:07 -0400
Received: by mail-pf1-x42b.google.com with SMTP id i24so9053287pfa.7
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=thg/qH430ddCqrwkV3ZntRtLEhaKDDdaC5slwVCyxTw=;
 b=mPh9mY9L3eJP8WP8gDAI7ZVxpjFgvM3bxaU4wAeXpnGakUlzfFMgwRp5S/9CzPXVpx
 LqM1nRe5KrI4VeYBcHFJyj0tn6+ubj7y1uuGqgoXwbBSqjXCdsN/SNxBRoyBdr4kNWFF
 49JhCEH1cvFyb02je6jCJCcrPpgUykAOQHBEdLWnL1fo5OsWmVMjiOu5/4tI1EUgFt0V
 bSOANX0dMqFWlM2DaxrYdJcPv6QqPFGSr9Ym14yF6VEV65Oof5ErrX/5T2lKp0OtOVyP
 6zupC6Blt264sMG3DrOiRdrpes+09BT8lqqePL78jE0qEt8kOKaRYK67Lg4WCoy1Y9pH
 LG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=thg/qH430ddCqrwkV3ZntRtLEhaKDDdaC5slwVCyxTw=;
 b=5SRy/oveA69EtTCzsv6f0wuXTBOLL8UZALlXxwTrpcjtoexte6XHEQrIM9QL2qw5+M
 dVbJPW7Wtl7N7TQoShZXf3KHyj6NAnepbvSmzLs0TCJw2hQ+pYIGuIQbK7N3lkvUtchG
 y+OJ2MumsCBLr2n66iXq2DQGpYHXS1aNJS0L3iyU7EimLs6GeqU/J5RuQt7uA3SfupSl
 0PugpOJ8wf/3UgQRYYf/NgYl8RnsvqW1LZcnnN1BMr+yPfp7SQayd2MQe0g5CmTAFtqj
 3WFpq72iNgJ51TFTl0+U96vD4WtS57LkNi8vYYeND/5e1e7uL/AX3KmB5FI0itbfVagq
 HnAw==
X-Gm-Message-State: AOAM531odTU/OzcBYr1FKXsr/W6mx4A+/DP4M7NHmU5XiYAJSf8FM3Dd
 xm+CAUZ7ZpDZJ+wsqsDCLxm0PYBFBUWITg==
X-Google-Smtp-Source: ABdhPJw9I6gEAuJNQ11Grmzbjaesk4mXjW03ZDn5ZTmupi3QkaEQXEzPt7VwJi1s2ySR862ymlkdPg==
X-Received: by 2002:a63:1d5f:0:b0:39d:b5e4:ae24 with SMTP id
 d31-20020a631d5f000000b0039db5e4ae24mr3067945pgm.502.1651325403077; 
 Sat, 30 Apr 2022 06:30:03 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:30:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 29/43] semihosting: Split out semihost_sys_rename
Date: Sat, 30 Apr 2022 06:29:18 -0700
Message-Id: <20220430132932.324018-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Split out the non-ARM specific portions of SYS_RENAME to a
reusable function.  This doesn't use GuestFD, but it does
reuse validate_strlen() from semihost_sys_open.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/guestfd.h |  4 +++
 semihosting/arm-compat-semi.c | 21 +------------
 semihosting/guestfd.c         | 57 +++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 20 deletions(-)

diff --git a/include/semihosting/guestfd.h b/include/semihosting/guestfd.h
index c31a48598a..2bdf02429b 100644
--- a/include/semihosting/guestfd.h
+++ b/include/semihosting/guestfd.h
@@ -75,4 +75,8 @@ void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
 void semihost_sys_remove(CPUState *cs, gdb_syscall_complete_cb complete,
                          target_ulong fname, target_ulong fname_len);
 
+void semihost_sys_rename(CPUState *cs, gdb_syscall_complete_cb complete,
+                         target_ulong oname, target_ulong oname_len,
+                         target_ulong nname, target_ulong nname_len);
+
 #endif /* SEMIHOSTING_GUESTFD_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index d460754ea0..143c8689f5 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -480,26 +480,7 @@ void do_common_semihosting(CPUState *cs)
         GET_ARG(1);
         GET_ARG(2);
         GET_ARG(3);
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(common_semi_cb, "rename,%s,%s",
-                           arg0, (int)arg1 + 1, arg2, (int)arg3 + 1);
-        } else {
-            char *s2;
-
-            s = lock_user_string(arg0);
-            if (!s) {
-                goto do_fault;
-            }
-            s2 = lock_user_string(arg2);
-            if (!s2) {
-                unlock_user(s, arg0, 0);
-                goto do_fault;
-            }
-            ret = rename(s, s2);
-            unlock_user(s2, arg2, 0);
-            unlock_user(s, arg0, 0);
-            common_semi_cb(cs, ret, ret ? errno : 0);
-        }
+        semihost_sys_rename(cs, common_semi_cb, arg0, arg1 + 1, arg2, arg3 + 1);
         break;
 
     case TARGET_SYS_CLOCK:
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index 17d43e83d3..03e516535a 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -657,3 +657,60 @@ void semihost_sys_remove(CPUState *cs, gdb_syscall_complete_cb complete,
         host_remove(cs, complete, fname, fname_len);
     }
 }
+
+static void gdb_rename(CPUState *cs, gdb_syscall_complete_cb complete,
+                       target_ulong oname, target_ulong oname_len,
+                       target_ulong nname, target_ulong nname_len)
+{
+    int olen, nlen;
+
+    olen = validate_strlen(cs, oname, oname_len);
+    if (olen < 0) {
+        complete(cs, -1, -olen);
+        return;
+    }
+    nlen = validate_strlen(cs, nname, nname_len);
+    if (nlen < 0) {
+        complete(cs, -1, -nlen);
+        return;
+    }
+
+    gdb_do_syscall(complete, "rename,%s,%s", oname, olen, nname, nlen);
+}
+
+static void host_rename(CPUState *cs, gdb_syscall_complete_cb complete,
+                        target_ulong oname, target_ulong oname_len,
+                        target_ulong nname, target_ulong nname_len)
+{
+    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+    char *ostr, *nstr;
+    int ret;
+
+    ret = validate_lock_user_string(&ostr, cs, oname, oname_len);
+    if (ret < 0) {
+        complete(cs, -1, -ret);
+        return;
+    }
+    ret = validate_lock_user_string(&nstr, cs, nname, nname_len);
+    if (ret < 0) {
+        unlock_user(ostr, oname, 0);
+        complete(cs, -1, -ret);
+        return;
+    }
+
+    ret = rename(ostr, nstr);
+    complete(cs, ret, ret ? errno : 0);
+    unlock_user(ostr, oname, 0);
+    unlock_user(nstr, nname, 0);
+}
+
+void semihost_sys_rename(CPUState *cs, gdb_syscall_complete_cb complete,
+                         target_ulong oname, target_ulong oname_len,
+                         target_ulong nname, target_ulong nname_len)
+{
+    if (use_gdb_syscalls()) {
+        gdb_rename(cs, complete, oname, oname_len, nname, nname_len);
+    } else {
+        host_rename(cs, complete, oname, oname_len, nname, nname_len);
+    }
+}
-- 
2.34.1


