Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B7069C475
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 04:24:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTwmQ-0001AI-Mv; Sun, 19 Feb 2023 22:23:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTwmO-00019l-M7
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 22:23:52 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTwmN-0005qL-3Y
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 22:23:52 -0500
Received: by mail-pl1-x62d.google.com with SMTP id c1so139948plg.4
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 19:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nN1Nd19UG7Ob6HhOyu1ZExnb36Rzel7CeIAQhipYNRY=;
 b=fR9XRr4aNnBEzUwKGFljBa/TFdtHOOxXFEpFQGezrIiyixPeLrgNFCraGA/ZxJvPT9
 7KsrmWnc70go2jxy9Qmy8DxeODDfdtFUP5H5ehl8bhdvg9ei7IOYkS1v2bOk2LBGxSqO
 TnYL91VOUjWZ9+41VkWpXr/V//7dOBWuCPFGB9n+XEG2QKw+zOSb66WD0DNW4OjKvYp2
 oULPe3fKdw/yJ0TsdHXRXdntXypTW5gQ5ydUMUtoBInzrXJVxfArffisrcxvVzMG+aZa
 tnc5KKeEvv8p/8BQ46dhicvix2RyHZE6mhaIyyEQ3+v7gQnntJ+NcSQ+PNAYlbl7qnu0
 85Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nN1Nd19UG7Ob6HhOyu1ZExnb36Rzel7CeIAQhipYNRY=;
 b=pWc6UhfwonEVH3x6TKArs2IcrLcmxM5YW1YCTgBni5s9d0m7ypgoroCM+DvTxAKgoQ
 B7isZ/DP3YMmNq7kLgR09iErAXr6CcP2JCSzbR3POugFjBws1D++73GdRoNk18ndeh/W
 7SEpQy6j+BcUFHycBhhGXpafPUcx1gwP0H5IE29cKAgJLd33+qgpFM3kEAGm142hZ48+
 AFlbhR01I4FgVJs4AgOFVoXIfrD7RYZNcAYuuVpn5abjwDRW+tBSY1/pWPUw2kr3TcJp
 AVmw4jdJczBXdEwC846JVbExYV+Playx9HyRyDBV6QFIeXA0oUthE8OfnzeCi2oa+4su
 x4HQ==
X-Gm-Message-State: AO0yUKXNsATHRaFZqL1a7MnsEeZl6jLR7YOxI52AZvGNS9TQJvEpPCoM
 4tqMvW2BsspyFkNGKOH0eooJudLb+V1zrAO3R94=
X-Google-Smtp-Source: AK7set+fXV67x1mRr5eV2/HPhQlgZflJQ9YkMIgTvDg1xn8DUEzMhUuYzHxMIusBob3rrIVw5dWCng==
X-Received: by 2002:a17:902:cec1:b0:199:2f0a:697 with SMTP id
 d1-20020a170902cec100b001992f0a0697mr2404580plg.33.1676863429612; 
 Sun, 19 Feb 2023 19:23:49 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a170902d34b00b00198e1bc9d83sm6621302plk.266.2023.02.19.19.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 19:23:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 3/7] linux-user: Always exit from exclusive state in fork_end()
Date: Sun, 19 Feb 2023 17:23:34 -1000
Message-Id: <20230220032338.5619-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220032338.5619-1-richard.henderson@linaro.org>
References: <20230220032338.5619-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

fork()ed processes currently start with
current_cpu->in_exclusive_context set, which is, strictly speaking, not
correct, but does not cause problems (even assertion failures).

With one of the next patches, the code begins to rely on this value, so
fix it by always calling end_exclusive() in fork_end().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20230214140829.45392-2-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/main.c    | 10 ++++++----
 linux-user/syscall.c |  1 +
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 4290651c3c..4ff30ff980 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -161,13 +161,15 @@ void fork_end(int child)
         }
         qemu_init_cpu_list();
         gdbserver_fork(thread_cpu);
-        /* qemu_init_cpu_list() takes care of reinitializing the
-         * exclusive state, so we don't need to end_exclusive() here.
-         */
     } else {
         cpu_list_unlock();
-        end_exclusive();
     }
+    /*
+     * qemu_init_cpu_list() reinitialized the child exclusive state, but we
+     * also need to keep current_cpu consistent, so call end_exclusive() for
+     * both child and parent.
+     */
+    end_exclusive();
 }
 
 __thread CPUState *thread_cpu;
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1e868e9b0e..a6c426d73c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6752,6 +6752,7 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
             cpu_clone_regs_parent(env, flags);
             fork_end(0);
         }
+        g_assert(!cpu_in_exclusive_context(cpu));
     }
     return ret;
 }
-- 
2.34.1


