Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F483486D0F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 23:08:02 +0100 (CET)
Received: from localhost ([::1]:60964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5avR-0002JK-1y
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 17:08:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3imbXYQcKCskAt2896tv33v0t.r315t19-stAt0232v29.36v@flex--venture.bounces.google.com>)
 id 1n5auQ-0001cy-6P
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:06:58 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=52895
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3imbXYQcKCskAt2896tv33v0t.r315t19-stAt0232v29.36v@flex--venture.bounces.google.com>)
 id 1n5auO-0004IU-J8
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:06:57 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 u130-20020a254788000000b0060a9645f781so7612976yba.19
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 14:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=5IlEkjJ+ofJj0s6IViJPQp6sFty9w8jzIZpJGSxhSHM=;
 b=P/8tnCznF5ncUi1FaT6Hl5/UTWqvO7VUfhc/bkpuNH5aZjTYBt9aJZ90LsIVS0TNRh
 sSwWUdAQe7UwDneyEX2SftJq3w/uV1yY8Dna8zhzApbHYokdY/N0QZrhGc0Jt6fNbJHK
 6UKKkhWISex+cbbzYJYyUzOj+a0c028mgx9IfT3PaxkrYLT9yD3RUalt219TCoZWcscE
 2n0kWDKvnCzufkGLuhjHzXuljNZcG7UqxuR8A5eF/NU/XfUpvkttDBblozDf/URCfyWj
 9zegMiu6UWXqRwiTvOGunZ+xxT37InTs10ojXjHT7DdbZsOmQsX4BV3WsuOL7SaLBjdb
 dyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=5IlEkjJ+ofJj0s6IViJPQp6sFty9w8jzIZpJGSxhSHM=;
 b=CwNv4m5f6LeNZ8Hqf+PQVkG1JwG43Y+kZg2OERwAmwlwUfUXeWI8fG1ucvQQ4M8WPI
 LLgeh4kLiG4KCHdSZA/syag5bhx/lOD/L7JPvJldwF0iO/cWsZR2kcZPq6crzUhJ5b5l
 MkVl4eEUpSQYh1Y11ZXaJ6FUu42UVssBLa6ao14eJQMB0ffSST8QJwshD4djdhQOaJKh
 ff1v8+PfNx5N7QL0B49UurSi9u+NWzrsjOpMn2K20cs4V2bNBm3N60WqZc+VS+OvMNRo
 J5eirModlQEWF4baagTecoGFfFhYln0EdRHYcRxO7nvGrUF4n8RrSdW0nyz/iC+1WkjZ
 NzYQ==
X-Gm-Message-State: AOAM532kdvyzty+J3EYhYlYxpNuqFF+E1qE11vcFn4G+JEDKnMHiWQGc
 SYZyjWCxJhmVmXNf3aCFTdJPeuB2zsdW
X-Google-Smtp-Source: ABdhPJzTYsWBUGdK72VvINl7XaD0PKLJ71mjf+qeZuZNJdzndAMby8QNmSvqOW5KMKvoINhM7keokK5HEni1
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:9986:338a:477f:1df7])
 (user=venture job=sendgmr) by 2002:a05:6902:154d:: with SMTP id
 r13mr43465529ybu.314.1641506442894; Thu, 06 Jan 2022 14:00:42 -0800 (PST)
Date: Thu,  6 Jan 2022 14:00:38 -0800
Message-Id: <20220106220038.3658586-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH] linux-user: rt_sigprocmask, check read perms first
From: Patrick Venture <venture@google.com>
To: laurent@vivier.eu
Cc: qemu-devel@nongnu.org, Shu-Chun Weng <scw@google.com>, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3imbXYQcKCskAt2896tv33v0t.r315t19-stAt0232v29.36v@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shu-Chun Weng <scw@google.com>

Linux kernel does it this way (checks read permission before validating `how`)
and the latest version of ABSL's `AddressIsReadable()` depends on this
behavior.

c.f.  https://github.com/torvalds/linux/blob/9539ba4308ad5bdca6cb41c7b73cbb9f796dcdd7/kernel/signal.c#L3147
Reviewed-by: Patrick Venture <venture@google.com>
Signed-off-by: Shu-Chun Weng <scw@google.com>
---
 linux-user/syscall.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ce9d64896c..3070d31f34 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9491,6 +9491,11 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             }
 
             if (arg2) {
+                if (!(p = lock_user(VERIFY_READ, arg2, sizeof(target_sigset_t), 1)))
+                    return -TARGET_EFAULT;
+                target_to_host_sigset(&set, p);
+                unlock_user(p, arg2, 0);
+                set_ptr = &set;
                 switch(how) {
                 case TARGET_SIG_BLOCK:
                     how = SIG_BLOCK;
@@ -9504,11 +9509,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 default:
                     return -TARGET_EINVAL;
                 }
-                if (!(p = lock_user(VERIFY_READ, arg2, sizeof(target_sigset_t), 1)))
-                    return -TARGET_EFAULT;
-                target_to_host_sigset(&set, p);
-                unlock_user(p, arg2, 0);
-                set_ptr = &set;
             } else {
                 how = 0;
                 set_ptr = NULL;
-- 
2.34.1.448.ga2b2bfdf31-goog


