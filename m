Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3301A67C9F4
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:32:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0UD-0004pu-Ei; Thu, 26 Jan 2023 06:32:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0U6-0004XE-BQ
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:32:03 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0U2-0007my-Dq
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:32:00 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so3079994wmb.0
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QH6WpMBuDha8Hg60KN3NpqiGFmq6gMFj84j8CE60c+o=;
 b=aJc2UDnNkBuDec6zEPLXGbCknirzfZyiBFhTpIRlVvCZBg3RRvfaSKVzmQvvby3VwO
 HJykG1FyLaCFp3Se0pqQXpOhyminQ/ujo+XAi1GL6XmXo8YYmzuylRIiQXzO1ueqNwcr
 gtTy+1NLufkiGLnMJ80oQu4c5nEcITwwDqn/utq12P2qRzwTvqSEzzFLTk3/vGX7BR4w
 jYpPo36I/K/yfYRkNNVp9ENRzrM0ZYieYOh6FEofFyc+O2CJg/HlE7JTqaCjIhVfLeRK
 OQuVE5BNmcw7F0w2PSsEUpCp4GSLzIqpOZEVY9gK8usITDcJA8PTYf3VADxrin979pZ0
 C+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QH6WpMBuDha8Hg60KN3NpqiGFmq6gMFj84j8CE60c+o=;
 b=u5xzTKnVkgZLWEvrjmgGrEyoHdnabw2Ei6Rd7B3OuBL+FI5s27FKQzR+jFmLK53ZuA
 XfBlQDSPKe2B63XsC4IYLXP6mTaMw/SDsDIRHpq6zq+mkT6J7Q+k923PiGelXXMron5B
 4Hdzmxa5ddUYQlRViiIAln2evMJS7Y/vp/pt1q89OKstvobqbSMrZxLKxMnWRVR0Dzim
 RZksoSRcE61BVNKxr8q3DlbgWaFeIpJVAKcRRkMYd5vbuxcXmZBm7LrPwjlc4ocw8E03
 oTr1Yn/kKjF1cHJV4VeI4daca6fFDL/I8lf6P8Yk7O3QWbbqYekTA90K7zkqSFlSrQcI
 wPJQ==
X-Gm-Message-State: AFqh2koZNdCL4rJUKeYhPQYV73lq2sESNL7XuMzvFPx9qtSuv4U/mAEs
 Ecc0X2fjQprwMzdyV+bMBv+LEQ==
X-Google-Smtp-Source: AMrXdXtHwk49cpGz+MeNBYHOSpE6Q9BYnGEhKJytaECPE5Wjsr4tv94/yXxJzQpnYlGThnYCqvsgsw==
X-Received: by 2002:a1c:ed1a:0:b0:3da:c07:c5fe with SMTP id
 l26-20020a1ced1a000000b003da0c07c5femr32202186wmh.5.1674732716805; 
 Thu, 26 Jan 2023 03:31:56 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c35d400b003db16770bc5sm5096076wmq.6.2023.01.26.03.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:31:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9295D1FFC7;
 Thu, 26 Jan 2023 11:22:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Keith Packard <keithp@keithp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 23/35] semihosting: Write back semihosting data before
 completion callback
Date: Thu, 26 Jan 2023 11:22:38 +0000
Message-Id: <20230126112250.2584701-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Keith Packard <keithp@keithp.com>

'lock_user' allocates a host buffer to shadow a target buffer,
'unlock_user' copies that host buffer back to the target and frees the
host memory. If the completion function uses the target buffer, it
must be called after unlock_user to ensure the data are present.

This caused the arm-compatible TARGET_SYS_READC to fail as the
completion function, common_semi_readc_cb, pulled data from the target
buffer which would not have been gotten the console data.

I decided to fix all instances of this pattern instead of just the
console_read function to make things consistent and potentially fix
bugs in other cases.

Signed-off-by: Keith Packard <keithp@keithp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221012014822.1242170-1-keithp@keithp.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230124180127.1881110-24-alex.bennee@linaro.org>

diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 5893c760c5..ba28194b59 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -319,11 +319,11 @@ static void host_read(CPUState *cs, gdb_syscall_complete_cb complete,
     }
     ret = RETRY_ON_EINTR(read(gf->hostfd, ptr, len));
     if (ret == -1) {
-        complete(cs, -1, errno);
         unlock_user(ptr, buf, 0);
+        complete(cs, -1, errno);
     } else {
-        complete(cs, ret, 0);
         unlock_user(ptr, buf, ret);
+        complete(cs, ret, 0);
     }
 }
 
@@ -339,8 +339,8 @@ static void host_write(CPUState *cs, gdb_syscall_complete_cb complete,
         return;
     }
     ret = write(gf->hostfd, ptr, len);
-    complete(cs, ret, ret == -1 ? errno : 0);
     unlock_user(ptr, buf, 0);
+    complete(cs, ret, ret == -1 ? errno : 0);
 }
 
 static void host_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -426,8 +426,8 @@ static void host_stat(CPUState *cs, gdb_syscall_complete_cb complete,
             ret = -1;
         }
     }
-    complete(cs, ret, err);
     unlock_user(name, fname, 0);
+    complete(cs, ret, err);
 }
 
 static void host_remove(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -444,8 +444,8 @@ static void host_remove(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 
     ret = remove(p);
-    complete(cs, ret, ret ? errno : 0);
     unlock_user(p, fname, 0);
+    complete(cs, ret, ret ? errno : 0);
 }
 
 static void host_rename(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -469,9 +469,9 @@ static void host_rename(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 
     ret = rename(ostr, nstr);
-    complete(cs, ret, ret ? errno : 0);
     unlock_user(ostr, oname, 0);
     unlock_user(nstr, nname, 0);
+    complete(cs, ret, ret ? errno : 0);
 }
 
 static void host_system(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -488,8 +488,8 @@ static void host_system(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 
     ret = system(p);
-    complete(cs, ret, ret == -1 ? errno : 0);
     unlock_user(p, cmd, 0);
+    complete(cs, ret, ret == -1 ? errno : 0);
 }
 
 static void host_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -554,8 +554,8 @@ static void staticfile_read(CPUState *cs, gdb_syscall_complete_cb complete,
     }
     memcpy(ptr, gf->staticfile.data + gf->staticfile.off, len);
     gf->staticfile.off += len;
-    complete(cs, len, 0);
     unlock_user(ptr, buf, len);
+    complete(cs, len, 0);
 }
 
 static void staticfile_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -608,8 +608,8 @@ static void console_read(CPUState *cs, gdb_syscall_complete_cb complete,
         return;
     }
     ret = qemu_semihosting_console_read(cs, ptr, len);
-    complete(cs, ret, 0);
     unlock_user(ptr, buf, ret);
+    complete(cs, ret, 0);
 }
 
 static void console_write(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -624,8 +624,8 @@ static void console_write(CPUState *cs, gdb_syscall_complete_cb complete,
         return;
     }
     ret = qemu_semihosting_console_write(ptr, len);
-    complete(cs, ret ? ret : -1, ret ? 0 : EIO);
     unlock_user(ptr, buf, 0);
+    complete(cs, ret ? ret : -1, ret ? 0 : EIO);
 }
 
 static void console_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
-- 
2.34.1


