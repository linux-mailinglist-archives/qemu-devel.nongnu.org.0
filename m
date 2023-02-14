Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F7A695555
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 01:29:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRjBK-0007Tt-Ij; Mon, 13 Feb 2023 19:28:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjBA-0007S1-MI
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:16 -0500
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjB8-00060v-PG
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:16 -0500
Received: by mail-io1-xd29.google.com with SMTP id j4so5178669iog.8
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 16:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bp7wIC67rxl3rARTv1dR7WnW/q65KWMxrGAohWha+/s=;
 b=WSWE+Z0YBVZGakSomcooMCJPg+Y+fcJzNvMobVfGicLMGFyxkuWU7aopySJmMoPZcc
 Yct12/AJrAQd7NyH5/jFHK3cniuCc7EtRV6DLjs1SIFCDvvc/tiRsqKeQKnq+W8B9O2r
 xhqwRLuWZG737/2pZUAK09BalLLrEfrK+4TbWCYIhZYWdWKIfolVxxCB7j4Sjez6YWuB
 EtaVR+6KRx5iGtlRcuiksn13FxweCQYBLFDXTH7BP7E/MkeHRJNUERkZLuXWdMVIVOJD
 /yY0n4dSkaX6ZVS6Y5AotwvZGvRC3L3mTkTBYWVq/PS4IB8hI8pxQh1Pu0cSZSXbiKiq
 xz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bp7wIC67rxl3rARTv1dR7WnW/q65KWMxrGAohWha+/s=;
 b=1AvoQSoMQr1kIBzXPVRxGItsNP87LgQhZuCvodOHiJ07hixrzWkqMLyY7ycy0uXLi+
 n3L+Qbn0dcsPiDBtHP3xyK9WW2ifGQOX5rTsaCeUBm+T0iaNdF/Z2Yp46y87jIhcAUa5
 cgoi50Zc72xiR/PGKko7YbYlkKB4iRmrkTDSDOsp8THong5VI9lsKkslE5w5ArRYMN7P
 JVhC1JnnXM9IT/2Y3oJUcdJXt68UtGzC5mP/XHySRG1pOg+HGaiaP0MAc3okNpiEVm80
 Rxqi4HM2uv8LEp/X5OwS7om4aUSgk/BBS1fdbWjuNrs20vkD27UdraRiMIq6gwsunCGL
 rNxg==
X-Gm-Message-State: AO0yUKU9vYSCm+vY+NtNPmBvq0ROR0JGFijH70NtGZyIUBbNPZfw7+X3
 3Oo/z1vD2pFxKkKMT1GFwg/zLv9qROSABgXr
X-Google-Smtp-Source: AK7set8xebSWWZc22AtOllnwGD8vdaOGmt5GsX0RncnDak/amnDYKv5TiYHKhsyu7vPtOjL7VdtUEw==
X-Received: by 2002:a5d:9516:0:b0:734:6b18:3ee3 with SMTP id
 d22-20020a5d9516000000b007346b183ee3mr255294iom.13.1676334493448; 
 Mon, 13 Feb 2023 16:28:13 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 r17-20020a028811000000b003af4300d670sm4500923jai.27.2023.02.13.16.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 16:28:12 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, richard.henderson@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 12/12] bsd-user: Add -strict
Date: Mon, 13 Feb 2023 17:27:57 -0700
Message-Id: <20230214002757.99240-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214002757.99240-1-imp@bsdimp.com>
References: <20230214002757.99240-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
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


