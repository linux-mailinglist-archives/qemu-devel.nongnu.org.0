Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00FA3E3753
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 00:03:48 +0200 (CEST)
Received: from localhost ([::1]:36768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUPz-0007SP-Ke
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 18:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6M-0008DW-2Y
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:30 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:34514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6J-0005Ds-2c
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:29 -0400
Received: by mail-io1-xd33.google.com with SMTP id i7so13719944iow.1
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=elLmv36Kug9A6y9rvQz6AHSujsYE6H7MjC5Me2JmWos=;
 b=gk4+7t71HFpVtGYMyJEvGrzzAonn2W+Ihzp5PEWjxlx2ShmUZJqbm95J1rGwrvjU8k
 9S4dA9BQHZz0mqeX9llGSCYEQrjAZYHwXJWlrJ5CZBNRBTFyRmTxP12jifMo+ntsGB0f
 tlsxAyTbFY5tSIHiBh8qvyC30VHKxvubnYWulkk5Y1v5gkKtULhnTwoI+FUuowKQ8un6
 fpVw4gg8ySzF1i6wDIRs4B1OBSF0p/3KtlEswy2wFxobo9Q6NA4HQUkQT7VXB7P2aK7V
 qQrKEpinZ9HZFJA63KW8Ugci+gSxscvGQAuFUftpK19cygfg7m/4gAKNBC4gg1cXhvgM
 T1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=elLmv36Kug9A6y9rvQz6AHSujsYE6H7MjC5Me2JmWos=;
 b=oH6oZpeVU1v3Q0KZNDudgt1azXWTicWrnmcfKPTVmK9LXPPd3viIR316C+aNcNw3mb
 KuMK1xeAoB3W7JZ/rJ0kEDW5gcMjSmzAPy+WQlA59hglHGZAuH+/X8QfVBpmvsdQwfm1
 vZ6sfscErHIBqUEaAgzYkx+O6D4tlTnv9CW35JothdiFWYCF/JiZCdAJFRjqKtC4YEwg
 ridrajdWo9VWcyHWSrVvXn2UK1xnRIAOfmZUcC7xJeBfEf6R80fCM97B6AeuTWqB4AdE
 DZ1tmD0H9GHhWxhrEbk3W3foy5ZSAspuAu8Z3ePK+nylSr25p5/t0zvuaVQhKJCWzJVF
 RUmg==
X-Gm-Message-State: AOAM530oluey06GH+A5BZ4LIMsSBgh4zD05HU54SduIR0EWSYrz68JEf
 CCuju91RDCBdDDs28YhlESNe3NnJfD4ZgSfX
X-Google-Smtp-Source: ABdhPJzcvJNyRavK0c3G6QAhDF3NSerRar/oxNmwiDg7ipk1M/B5GB7OpXNJdHq0dYISa8GM7CnIwA==
X-Received: by 2002:a05:6602:2e8a:: with SMTP id
 m10mr32350iow.45.1628372605768; 
 Sat, 07 Aug 2021 14:43:25 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:25 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 34/49] bsd-user: Fix initializtion of task state
Date: Sat,  7 Aug 2021 15:42:27 -0600
Message-Id: <20210807214242.82385-35-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@FreeBSD.org>, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Fix a number of mismerges in initializing the task state. Save a copy of
bprm in this structure and move it earlier before starting to setup
other state. Remove linux specific procfs access to find minimal vm
address that likely is here through a misguided merge. Remove duplicate
initialization as well.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
---
 bsd-user/main.c | 42 ++++--------------------------------------
 bsd-user/qemu.h |  1 +
 2 files changed, 5 insertions(+), 38 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 5ca1173f04..b5527537b4 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -205,7 +205,7 @@ int main(int argc, char **argv)
     struct target_pt_regs regs1, *regs = &regs1;
     struct image_info info1, *info = &info1;
     struct bsd_binprm bprm;
-    TaskState ts1, *ts = &ts1;
+    TaskState *ts;
     CPUArchState *env;
     CPUState *cpu;
     int optind, rv;
@@ -407,31 +407,7 @@ int main(int argc, char **argv)
      */
     guest_base = HOST_PAGE_ALIGN(guest_base);
 
-    /*
-     * Read in mmap_min_addr kernel parameter.  This value is used
-     * When loading the ELF image to determine whether guest_base
-     * is needed.
-     *
-     * When user has explicitly set the quest base, we skip this
-     * test.
-     */
-    if (!have_guest_base) {
-        FILE *fp;
-
-        fp = fopen("/proc/sys/vm/mmap_min_addr", "r");
-        if (fp != NULL) {
-            unsigned long tmp;
-            if (fscanf(fp, "%lu", &tmp) == 1) {
-                mmap_min_addr = tmp;
-                qemu_log_mask(CPU_LOG_PAGE, "host mmap_min_addr=0x%lx\n",
-                              mmap_min_addr);
-            }
-            fclose(fp);
-        }
-    }
-
-    if (loader_exec(filename, argv+optind, target_environ, regs, info,
-                    &bprm) != 0) {
+    if (loader_exec(filename, argv+optind, target_environ, regs, info, &bprm)) {
         printf("Error loading %s\n", filename);
         _exit(1);
     }
@@ -459,21 +435,11 @@ int main(int argc, char **argv)
         qemu_log("entry       0x" TARGET_ABI_FMT_lx "\n", info->entry);
     }
 
-    target_set_brk(info->brk);
-    syscall_init();
-    signal_init();
-
-    /*
-     * Now that we've loaded the binary, GUEST_BASE is fixed.  Delay
-     * generating the prologue until now so that the prologue can take
-     * the real value of GUEST_BASE into account.
-     */
-    tcg_prologue_init(tcg_ctx);
-
     /* build Task State */
-    memset(ts, 0, sizeof(TaskState));
+    ts = g_new0(TaskState, 1);
     init_task_state(ts);
     ts->info = info;
+    ts->bprm = &bprm;
     cpu->opaque = ts;
 
     target_set_brk(info->brk);
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index a22fc19cd6..bfd7b8eaa5 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -90,6 +90,7 @@ typedef struct TaskState {
     pid_t ts_tid;     /* tid (or pid) of this task */
 
     struct TaskState *next;
+    struct bsd_binprm *bprm;
     int used; /* non zero if used */
     struct image_info *info;
 
-- 
2.32.0


