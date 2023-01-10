Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EBB6648D7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:15:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIb7-0003Wm-Df; Tue, 10 Jan 2023 12:39:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIb4-0003TR-D1
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:38 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIb0-0001GY-Kq
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:38 -0500
Received: by mail-wm1-x32f.google.com with SMTP id l26so9370180wme.5
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/kMBc7kYwawlV6mjDVr7qPyvgsdPKM2HCAFr0iHJ9Nw=;
 b=UHhc0T0rb4uynWDAFJZnoOJ2P7Smw/qCsCapN9ijSucUCWMGpTbboSlB3VmjlGw2ZM
 B5c5hEgBRr96sdujQksdakonZDoDHxCnhPVKQ9ElQj1LsUE5dHsWunAnxObAYJXUdcSd
 Z5OBfCdSDY0GoXDjJbk2cF/bP1PQ6la6cHbrTCE/ny6VIHUmBw4GmhP9EatyfgEazIM0
 3q/BL88aRuHbzsYXPSwtOfdOk6DpGnaxo5uLCplmL20hoP6XbDdOjaRqTMcq1p3FXc6k
 GAp+IlYb334t/AjNuUlrca/YwwlFW92ecZ8gPMBMM5WAgV6sMk2B1HCQO5KwOT0rZ6bW
 RxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/kMBc7kYwawlV6mjDVr7qPyvgsdPKM2HCAFr0iHJ9Nw=;
 b=IouljP4H5CrW0F2BToYjhWNXJimzCQjZIVMBsh8pas3QrCrWvaV0G5GUundEjdXkhw
 lYbJToE346NuXZbZizU1PYzeyOV9cYendlsShUVCAsoxWrBEHq9V60aLWFv3VLFwc6H9
 bFZMDZLsUgkn7Vy4r8Rw/glzW5YUFFcsrpMOZ/W9S9sJvhN6Lu/peLM3kUoYHUPIMbYc
 LqRwhB6bHbHyQAnZ14aYyqP5BSCcrGcoNJEVtRx5bFDVFoO/fvFNtVFHTw0R2Dv6EbMD
 WUCGMbJ+0T/1sjFIB++CN2zQZhhaSi5hLS/u2gKtnWE8o00HvhPRGnYkaFYGVHRquTpw
 dOAA==
X-Gm-Message-State: AFqh2kru5v6cOdtl1nsefBd0J888urx9ujeiP4G/AbHe48HX4+/8/g7b
 emYDM8I4YItsZXpx5J32uvqZBw==
X-Google-Smtp-Source: AMrXdXu+5ABeUFGhC9PHCZAemaG2KtZ2e5zmi8Xj859zk/votQbTBiHXtKdeXl2MxI4n8G8Vf6MjCg==
X-Received: by 2002:a05:600c:601e:b0:3c6:e61e:ae71 with SMTP id
 az30-20020a05600c601e00b003c6e61eae71mr60134889wmb.1.1673372373262; 
 Tue, 10 Jan 2023 09:39:33 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adfd4c6000000b0027cb20605e3sm11612410wrk.105.2023.01.10.09.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 09:39:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 962D81FFC5;
 Tue, 10 Jan 2023 17:39:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Ed Maste <emaste@freebsd.org>, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Keith Packard <keithp@keithp.com>
Subject: [PATCH 13/26] semihosting: Write back semihosting data before
 completion callback
Date: Tue, 10 Jan 2023 17:39:09 +0000
Message-Id: <20230110173922.265055-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 semihosting/syscalls.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

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


