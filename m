Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 219E7692B12
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 00:23:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQcjY-0007FK-DF; Fri, 10 Feb 2023 18:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pQcj8-0007Ba-Hx
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:22:46 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pQcj6-000547-9P
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:22:46 -0500
Received: by mail-io1-xd35.google.com with SMTP id y2so2554836iot.4
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 15:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bp7wIC67rxl3rARTv1dR7WnW/q65KWMxrGAohWha+/s=;
 b=eywvpvJUVRMC2ZVzCoD55ukwq7RamjI1Z9T85TM5kIld87GaHFGnCOdHQylOnSm4l0
 vExNoRSUDu83YwG6yeW3whci8CUrr0MkVTuzf12yVsRfYKK0YRvpfqfJcQdZ63wAencL
 4xRi5FT63+OCAS9zSEGiTab4ZUbLkb7Fr5AbWxM/FLmPvAFHIGDuhzfq7ozE4rYja6Ay
 6nWaN64dlfWDFLw9IUZjro3FIcjX7AyhnqLL7AXU5aY4kJ8zXFzPs0bgRVqMvGTZOfzg
 Bg3bg2zdscTlWrDJG8jEnuhSPyV4H/Kjo+lCid+1ZdXyT7et10Peq2sI7iqx3FhfIEPh
 uBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bp7wIC67rxl3rARTv1dR7WnW/q65KWMxrGAohWha+/s=;
 b=dTNpoAjCoRwJVSuQU0IBI+ZFZq8AK+DxOhS0KkD4wGnq9NHq+cnoQXETEfUZ4wZfGZ
 VcUwt/AhPuc2awLCAwyqldcmDTUVv1b0zsNj9Ufo72KqZ3AOweIV1t6KpGqkvcBh4kq/
 xKnqi/CFAwZjxPb54etWOY/iLIMADHWTS+2FzAqR/vBZW5VRRpNVZTXUXBPECNCeqQS6
 a6rtPchmZyl9VBVOg2vy7hRdGjjhcREfdYKsrqJAeKhZpy2FHnSPJ9CNBsFv5/pwGpEr
 D/0u4Y4QvWaLVrJJp6vjwOFzBXLZ0HpLFbD6KJDtKs4K39CrK//MF3cKFp513KRG3Yd+
 slCA==
X-Gm-Message-State: AO0yUKV9nhGWPR92Sc8i+fZtVjp5HsBZJVyFpnxaBC+rwDiioAlvVmxe
 OU9wjpdT7MOZ08T0hvmLUqhx19675xnb75No
X-Google-Smtp-Source: AK7set9IfbUH1tT3MbBpCWd3wzcKW0UL2x1P56lEWiBXyavfrObC6RvwsP1GUIe2MveUCI0eDrujTQ==
X-Received: by 2002:a6b:db14:0:b0:722:5927:c9c0 with SMTP id
 t20-20020a6bdb14000000b007225927c9c0mr13317983ioc.4.1676071362740; 
 Fri, 10 Feb 2023 15:22:42 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 k18-20020a02c772000000b003a9418e89acsm1850995jao.23.2023.02.10.15.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 15:22:42 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>,
 richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 9/9] bsd-user: Add -strict
Date: Fri, 10 Feb 2023 16:18:29 -0700
Message-Id: <20230210231829.39476-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210231829.39476-1-imp@bsdimp.com>
References: <20230210231829.39476-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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

Most of the time, it's useful to make our best effort, but sometimes we
want to know right away when we don't implement something. First place
we use it is for unknown syscalls.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-syscall.c | 4 ++++
 bsd-user/main.c               | 5 ++++-
 bsd-user/qemu.h               | 1 +
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 179a20c304b..e2b26ecb8dd 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -508,6 +508,10 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
 
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
+        if (bsd_user_strict) {
+            printf("Unimplemented system call %d\n", num);
+            abort();
+        }
         ret = -TARGET_ENOSYS;
         break;
     }
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 41290e16f98..ba0ad86ad28 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -91,9 +91,10 @@ unsigned long reserved_va = MAX_RESERVED_VA;
 unsigned long reserved_va;
 #endif
 
-static const char *interp_prefix = CONFIG_QEMU_INTERP_PREFIX;
+const char *interp_prefix = CONFIG_QEMU_INTERP_PREFIX;
 const char *qemu_uname_release;
 char qemu_proc_pathname[PATH_MAX];  /* full path to exeutable */
+bool bsd_user_strict = false;	/* Abort for unimplemned things */
 
 unsigned long target_maxtsiz = TARGET_MAXTSIZ;   /* max text size */
 unsigned long target_dfldsiz = TARGET_DFLDSIZ;   /* initial data size limit */
@@ -396,6 +397,8 @@ int main(int argc, char **argv)
             trace_opt_parse(optarg);
         } else if (!strcmp(r, "0")) {
             argv0 = argv[optind++];
+        } else if (!strcmp(r, "strict")) {
+            bsd_user_strict = true;
         } else {
             usage();
         }
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index e24a8cfcfb1..22bd5a3df42 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -113,6 +113,7 @@ typedef struct TaskState {
 
 void stop_all_tasks(void);
 extern const char *qemu_uname_release;
+extern bool bsd_user_strict;
 
 /*
  * TARGET_ARG_MAX defines the number of bytes allocated for arguments
-- 
2.39.1


