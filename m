Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B6338E083
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 06:56:51 +0200 (CEST)
Received: from localhost ([::1]:52266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll2e2-0004oG-Ih
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 00:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1ll2cS-0002iP-9b
 for qemu-devel@nongnu.org; Mon, 24 May 2021 00:55:12 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:41974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1ll2cQ-0003Zk-3Y
 for qemu-devel@nongnu.org; Mon, 24 May 2021 00:55:12 -0400
Received: by mail-pf1-x430.google.com with SMTP id p39so3503503pfw.8
 for <qemu-devel@nongnu.org>; Sun, 23 May 2021 21:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OeAn/cQqWx3M6p6wyRkeBhZn1UMAlrViv39KO/QNygU=;
 b=dYQOvLaFs4ra50N8xknUtPMsdJq6p4/AH1KSVKlJFzYJDwFMsDfrOK7GUpv2X2lrnf
 FDmUYCJkMBFUlxjkMY8FnhsLNAqQCaRBUdtmV+p/criLKxqFjoiX3k1Prg7ITfiXtOWs
 ftlLA8zboj1QsRtlV4YOs0f8qj7hy7VvJEg+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OeAn/cQqWx3M6p6wyRkeBhZn1UMAlrViv39KO/QNygU=;
 b=SwKEMaZyVjzfo4CgP830n2zGVJu3s66I3Fz8R7P6uAozdQa+zmf0WmK7hF6KtYVZIJ
 ELyHqamL//qEHVmRfxU/AWKbjlW1HSAJ5LjcvuPC+rGGHix3+0wTvPMHvlX8Fo7rHD2f
 PMHIBgg6NE7QVVHwAflD9xvaYrTSznD7/V8QLlaC2Xp9GI2Jtq9U+O5l3Onk3Ke3MWJ1
 7yMrKczZtiZFZ9MT/zje1I0YLtAUZAZ4ZIsSUc5SyR6jWmDhQ5UBfXFkiJhpLm6T2+oM
 VBfusJLRLuoZ9ReLOl4xkhHWdWL9eukJjfewVD2o/3SzE2sUCn50Y7Sjt1Y+kQTD3MA5
 47KQ==
X-Gm-Message-State: AOAM530NI2Vvuf5wlNLK+koj2C1cG+IfrcHLJUqpaLeAx3VAExPBxQgr
 aD9qjjY4JUgsmLCRwVEiym1uPhqNjTGuMg==
X-Google-Smtp-Source: ABdhPJxckaOYC02JcZo46MIgafsS8Lao7RgcHh7zLQEUW6ncoRImWWiQDN4q4vJkDpDeLaJLQq1tmg==
X-Received: by 2002:a62:c541:0:b029:2e8:c7c7:d96e with SMTP id
 j62-20020a62c5410000b02902e8c7c7d96emr4775272pfg.26.1621832108727; 
 Sun, 23 May 2021 21:55:08 -0700 (PDT)
Received: from spacetanuki.lan ([202.12.244.32])
 by smtp.gmail.com with ESMTPSA id 24sm10040142pgz.77.2021.05.23.21.55.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 23 May 2021 21:55:08 -0700 (PDT)
From: YAMAMOTO Takashi <yamamoto@midokura.com>
To: qemu-devel@nongnu.org
Cc: YAMAMOTO Takashi <yamamoto@midokura.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 1/5] linux-user: handle /proc/self/exe for execve
Date: Mon, 24 May 2021 13:54:07 +0900
Message-Id: <20210524045412.15152-2-yamamoto@midokura.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
In-Reply-To: <20210524045412.15152-1-yamamoto@midokura.com>
References: <20210524045412.15152-1-yamamoto@midokura.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=yamamoto@midokura.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It seems somehow common to execve /proc/self/exe in docker
or golang community these days.
At least, moby "reexec" and runc "libcontainer" do that.

Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
---
 linux-user/syscall.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index c9f812091c..a2b03ecb8b 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8470,6 +8470,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #endif
     case TARGET_NR_execve:
         {
+            const char *path;
             char **argp, **envp;
             int argc, envc;
             abi_ulong gp;
@@ -8537,7 +8538,11 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
              * before the execve completes and makes it the other
              * program's problem.
              */
-            ret = get_errno(safe_execve(p, argp, envp));
+            path = p;
+            if (is_proc_myself(path, "exe")) {
+                path = exec_path;
+            }
+            ret = get_errno(safe_execve(path, argp, envp));
             unlock_user(p, arg1, 0);
 
             goto execve_end;
-- 
2.21.1 (Apple Git-122.3)


