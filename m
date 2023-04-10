Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528CE6DCAAD
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 20:23:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plw8w-0002k3-SL; Mon, 10 Apr 2023 14:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8f-0002eH-36
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:13 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8a-0000ei-DC
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:12 -0400
Received: by mail-il1-x129.google.com with SMTP id s4so2662980ilv.11
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 11:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681150866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZT5fLQSNvwvtBf2Szoe2FViWNomI0FmkPHfn6pZOtis=;
 b=gETlza9NjXIn40l15kDfOHL8ahJPjhzFZPB59ZedY37d3pOvIC85j26xsAPSRJimgy
 sH4ibl8yWEOFvmW+fH2DATeLqZYzRarE3NGh2k4p3dpPm5jPQA+R9+rpqTVb5RKcVeSk
 hVz9A73wsaT5mQR+laBZ40buv2nPwGH16qRHvF6ipSxQvbLOtMFyXGGKVbpqzWj2MRH0
 b4Zfc1XOGZ6FgSkdRr3B2hSs7YWGi2ZQVJ4ibm1QR18Z560/dc4ykXAsC8fHNLGphOD5
 QbgWTvlWxCvo0dUyqvTepwzGbaY1h/zQzfhw1fsP5VQSu34igeIc+Jduyh6YIGNVthrE
 lBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681150866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZT5fLQSNvwvtBf2Szoe2FViWNomI0FmkPHfn6pZOtis=;
 b=CSUIXPwobCZyBc8UFqilgnerNFgrPrfP776e1bLvhCkYuTpV6FEJLrJr+kRngj9KJm
 WJ68XSYiN60AJeaTrMKjUOBAHlXoWRXBu/fTY5m/bmG371mno8eYwrZjfMNF56/pdpa4
 E90lS22XVvaty2vQP+Pg6MmOfz4ssUANzx+EwSfZ/ntv3v4ggMbciEQ2MnkJE1jsL01R
 OPxdptVYN4Ks1QkO/MmSwNj52tanRqF+53GnsPSSFpvY+TcZIx2fpE+MeSGO5ND3HhWc
 qBlf9nrrF1NZNTPk6xJ8f1ssXi4dEqfyPupf3rKM6Vw6gDvuG9/2f9SgCe1lASQbwOGn
 oP8A==
X-Gm-Message-State: AAQBX9dWWx2kBv0IDNVzxBbmz96ZQTC6AmY2/+PICzUR3mXVk1/WRPGD
 IE1GGxFh17UWwIjAUEzQ46Wds/yGJx1v9YAXMuo=
X-Google-Smtp-Source: AKy350bpgBwdap36kMgiExxDPOqcwwxtOB5w0ZR3ArOUqGoIvKPZNsd2Gnbxli/wWxlfH1cijsGtAg==
X-Received: by 2002:a92:c985:0:b0:326:3001:1f85 with SMTP id
 y5-20020a92c985000000b0032630011f85mr246513iln.9.1681150866237; 
 Mon, 10 Apr 2023 11:21:06 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 a15-20020a056e02120f00b00313b281ecd2sm3104314ilq.70.2023.04.10.11.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 11:21:05 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@jrtc27.com, riastradh@netbsd.org, Kyle Evans <kevans@freebsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, reinoud@netbsd.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 01/19] bsd-user: Make print_* public
Date: Mon, 10 Apr 2023 12:20:38 -0600
Message-Id: <20230410182056.320-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410182056.320-1-imp@bsdimp.com>
References: <20230410182056.320-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Make these functions public. Due to coming restructuring, we'll need to
call these from *bsd/os-syscall.c. Add declarations to qemu.h.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/qemu.h   | 20 ++++++++++++++++++++
 bsd-user/strace.c | 29 +++++++++++++----------------
 2 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 41d84e0b81b..22e16816a9e 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -211,6 +211,26 @@ print_openbsd_syscall(int num,
                       abi_long arg1, abi_long arg2, abi_long arg3,
                       abi_long arg4, abi_long arg5, abi_long arg6);
 void print_openbsd_syscall_ret(int num, abi_long ret);
+void print_execve(const struct syscallname *name, abi_long arg1,
+                  abi_long arg2, abi_long arg3, abi_long arg4,
+                  abi_long arg5, abi_long arg6);
+void print_ioctl(const struct syscallname *name,
+                 abi_long arg1, abi_long arg2, abi_long arg3,
+                 abi_long arg4, abi_long arg5, abi_long arg6);
+void print_sysarch(const struct syscallname *name, abi_long arg1,
+                   abi_long arg2, abi_long arg3, abi_long arg4,
+                   abi_long arg5, abi_long arg6);
+void print_sysctl(const struct syscallname *name, abi_long arg1,
+                  abi_long arg2, abi_long arg3, abi_long arg4,
+                  abi_long arg5, abi_long arg6);
+void print_syscall(int num, const struct syscallname *scnames,
+                   unsigned int nscnames, abi_long arg1, abi_long arg2,
+                   abi_long arg3, abi_long arg4, abi_long arg5,
+                   abi_long arg6);
+void print_syscall_ret(int num, abi_long ret,
+                       const struct syscallname *scnames,
+                       unsigned int nscnames);
+void print_syscall_ret_addr(const struct syscallname *name, abi_long ret);
 /**
  * print_taken_signal:
  * @target_signum: target signal being taken
diff --git a/bsd-user/strace.c b/bsd-user/strace.c
index 96499751eb0..e45909b8688 100644
--- a/bsd-user/strace.c
+++ b/bsd-user/strace.c
@@ -49,7 +49,7 @@ print_raw_param(const char *fmt, abi_long param, int last)
     gemu_log(format, param);
 }
 
-static void print_sysctl(const struct syscallname *name, abi_long arg1,
+void print_sysctl(const struct syscallname *name, abi_long arg1,
         abi_long arg2, abi_long arg3, abi_long arg4, abi_long arg5,
         abi_long arg6)
 {
@@ -71,9 +71,8 @@ static void print_sysctl(const struct syscallname *name, abi_long arg1,
         (uint32_t)arg2, arg3, arg4, arg5, arg6);
 }
 
-static void print_execve(const struct syscallname *name, abi_long arg1,
-        abi_long arg2, abi_long arg3, abi_long arg4, abi_long arg5,
-        abi_long arg6)
+void print_execve(const struct syscallname *name, abi_long arg1, abi_long arg2,
+                  abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
 {
     abi_ulong arg_ptr_addr;
     char *s;
@@ -105,9 +104,8 @@ static void print_execve(const struct syscallname *name, abi_long arg1,
     gemu_log("NULL})");
 }
 
-static void print_ioctl(const struct syscallname *name,
-        abi_long arg1, abi_long arg2, abi_long arg3, abi_long arg4,
-        abi_long arg5, abi_long arg6)
+void print_ioctl(const struct syscallname *name, abi_long arg1, abi_long arg2,
+                 abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
 {
     /* Decode the ioctl request */
     gemu_log("%s(%d, 0x%0lx { IO%s%s GRP:0x%x('%c') CMD:%d LEN:%d }, 0x"
@@ -124,9 +122,8 @@ static void print_ioctl(const struct syscallname *name,
             arg3);
 }
 
-static void print_sysarch(const struct syscallname *name, abi_long arg1,
-        abi_long arg2, abi_long arg3, abi_long arg4, abi_long arg5,
-        abi_long arg6)
+void print_sysarch(const struct syscallname *name, abi_long arg1, abi_long arg2,
+                   abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
 {
     /* This is os dependent. */
     do_os_print_sysarch(name, arg1, arg2, arg3, arg4, arg5, arg6);
@@ -136,7 +133,7 @@ static void print_sysarch(const struct syscallname *name, abi_long arg1,
  * Variants for the return value output function
  */
 
-static void print_syscall_ret_addr(const struct syscallname *name, abi_long ret)
+void print_syscall_ret_addr(const struct syscallname *name, abi_long ret)
 {
     if (ret == -1) {
         gemu_log(" = -1 errno=%d (%s)\n", errno, strerror(errno));
@@ -159,9 +156,9 @@ static const struct syscallname openbsd_scnames[] = {
 #include "openbsd/strace.list"
 };
 
-static void print_syscall(int num, const struct syscallname *scnames,
-        unsigned int nscnames, abi_long arg1, abi_long arg2, abi_long arg3,
-        abi_long arg4, abi_long arg5, abi_long arg6)
+void print_syscall(int num, const struct syscallname *scnames,
+                   unsigned int nscnames, abi_long arg1, abi_long arg2,
+                   abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
 {
     unsigned int i;
     const char *format="%s(" TARGET_ABI_FMT_ld "," TARGET_ABI_FMT_ld ","
@@ -190,8 +187,8 @@ static void print_syscall(int num, const struct syscallname *scnames,
     gemu_log("Unknown syscall %d\n", num);
 }
 
-static void print_syscall_ret(int num, abi_long ret,
-        const struct syscallname *scnames, unsigned int nscnames)
+void print_syscall_ret(int num, abi_long ret, const struct syscallname *scnames,
+                       unsigned int nscnames)
 {
     unsigned int i;
 
-- 
2.40.0


