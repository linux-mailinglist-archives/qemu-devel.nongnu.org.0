Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FA5395523
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 07:53:22 +0200 (CEST)
Received: from localhost ([::1]:44118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnarY-0007Vv-HC
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 01:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapR-0004r5-W0
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:10 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:47036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapQ-0003l6-6c
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:09 -0400
Received: by mail-pl1-x634.google.com with SMTP id e1so392721pld.13
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 22:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OeAn/cQqWx3M6p6wyRkeBhZn1UMAlrViv39KO/QNygU=;
 b=mXfeLo0C63QDtvkw2najSeuNEyo/d0ZeDx0gkZIhe0q7VWzD5dGFzkGwEapR9dmTiW
 WyGwY3wFBIffO2vyS34EpLv+lPSz0M9YTNcFP1jE7Kcmi98JPzVXjT6tHGGBFji7tWQK
 uz3R4Q6tNl6JL3etkZhZ0Zc+xYtTwkIJHAJdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OeAn/cQqWx3M6p6wyRkeBhZn1UMAlrViv39KO/QNygU=;
 b=P4cYxH6Bot9kU/ol36W79rvbPyVvzxGyITMGq4d8C7VdmeLPEsDalBLesWNrA8YLeG
 0IlMNfMNTlLTLNnQI8E+LoLtOxngCzUvoFhSDeaAWCvPDNDZBodAw/ViS4hl5FGYjrv8
 5eBjvi2YKJJitJDMpdYAATJcQGMLIBD6LGk4O93DRq75sNh20clFNG2H6q1N+qGjTRPX
 HEudIWxGlnt9Txab/rT0jXYg2YW9+VcA41EwaYH+5jztGq1sgjBhEFncqvpieQzaKYIz
 RIKa73LrYsz7/VndGffeuKeWURG4QP8u3FKQsVUKUb81e/YLUlYK5lkiTANkd08VBDA/
 I4cQ==
X-Gm-Message-State: AOAM530qhfYRuj1sqJRU+crIztAzZ1+XL8uTD1DQ87peDWveH+UVdPvT
 xsO23/XlJhnSPI3gj/Gn0a3+rL7G+J3ZgA==
X-Google-Smtp-Source: ABdhPJwAh07FJKuuI6yCHuGtnSF6u/z21RWyoK23GzthxtZ9HYEG/w+SVOjmQ5GQDx8fDTfmeC9UXA==
X-Received: by 2002:a17:90a:7e07:: with SMTP id
 i7mr5796807pjl.191.1622440266613; 
 Sun, 30 May 2021 22:51:06 -0700 (PDT)
Received: from spacetanuki.lan ([202.12.244.32])
 by smtp.gmail.com with ESMTPSA id b10sm4744058pfi.122.2021.05.30.22.51.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 May 2021 22:51:06 -0700 (PDT)
From: YAMAMOTO Takashi <yamamoto@midokura.com>
To: qemu-devel@nongnu.org
Cc: YAMAMOTO Takashi <yamamoto@midokura.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 01/11] linux-user: handle /proc/self/exe for execve
Date: Mon, 31 May 2021 14:50:08 +0900
Message-Id: <20210531055019.10149-2-yamamoto@midokura.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
In-Reply-To: <20210531055019.10149-1-yamamoto@midokura.com>
References: <20210531055019.10149-1-yamamoto@midokura.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=yamamoto@midokura.com; helo=mail-pl1-x634.google.com
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


