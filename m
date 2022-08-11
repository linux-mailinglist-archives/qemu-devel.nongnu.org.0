Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C39858FF38
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:22:46 +0200 (CEST)
Received: from localhost ([::1]:49916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMA1F-00084Z-Aq
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM9tA-0005AA-0A
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:14:25 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM9t4-0005fm-1k
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:14:23 -0400
Received: by mail-wr1-x432.google.com with SMTP id n4so19933084wrp.10
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 08:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=dE/aepTkeWyaKeW9DSbNNJCa9P7NbA+RgibPE9dQEzk=;
 b=aNDdNq8Sh2QFpX9tlIcaBhxLbmprD1gOwaBknKuG7qMqRK5ljpjnHxFhiDn/Ia2FEh
 tUyGUpSHKsB2VoBTNygKFhcRW2srWNFX8idwYPJODfyLg96dgxQa+xZmwnSjy532QXRa
 zDRGhRhzGWLgzizjgXLbchfoo6qiwxf8INUsPe9EY0mpOlKyXG4gzl98vsLuQbFUhC9m
 3hjkAGP0bV86jpDxn4tDEWSHj1k1PYO6cLGTS3ESNpOXbG4KnWPTnNSZn7zytNrOUU/i
 d5P+rH7aRWaeNVpGsAy9LmxJAXKjaZ8rjTCNKMvM1nu2G7SwsucBD1CQLtx9M30dzThH
 lbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=dE/aepTkeWyaKeW9DSbNNJCa9P7NbA+RgibPE9dQEzk=;
 b=vtoRe+RY94W/gTe5CTxWlqqQu698UI04apSp6xf2p5xt+NpS11mok/XrQoFnYYa6fx
 foJI577iJ20Eu6JkXNG2bp22dwbqs0FrqsyBYfB7SIkTS186HfnxZ7I64DgmCljKwV4e
 BU19N+x6Df6ghS+7VKON7tnmnHEeAACc4IZ0LUf5KyB2Wv00ulH9vLPqy3ZrJfH+4LzH
 kfXkdelUn9zuGVv5tzO/E/VLd3pHbe5UF7PqGJx2hc7eqLbdLImG94X2jupyx+RxMfXD
 aF1eQ8JSAyX3oIKlbkCILa2gv4Pyjy+EedgrFT1l6y/SWIq9QaPkOt3WrYtGlDZyA5XN
 ujcA==
X-Gm-Message-State: ACgBeo2cXNMAuJjBF9iONFc+WiW0p3Np/k4DQGIEGnW6E7TBd+BtIzS3
 H1sELSu+5xnyMwR7NqIp0Yr2a2NZ8Az+Qw==
X-Google-Smtp-Source: AA6agR6ojNuv10uafWsnGcOALB8XBlhKNCR2mFMELK4OJicb/ZQMsS199tUhnETyFZ/raGKtTCKfdA==
X-Received: by 2002:adf:f7c7:0:b0:21e:fc10:b81b with SMTP id
 a7-20020adff7c7000000b0021efc10b81bmr21128175wrq.51.1660230855771; 
 Thu, 11 Aug 2022 08:14:15 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a05600c4e4a00b003a5c064717csm2454994wmq.22.2022.08.11.08.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 08:14:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5AD8D1FFB8;
 Thu, 11 Aug 2022 16:14:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v1 1/8] linux-user: un-parent OBJECT(cpu) when closing thread
Date: Thu, 11 Aug 2022 16:14:06 +0100
Message-Id: <20220811151413.3350684-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811151413.3350684-1-alex.bennee@linaro.org>
References: <20220811151413.3350684-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

While forcing the CPU to unrealize by hand does trigger the clean-up
code we never fully free resources because refcount never reaches
zero. This is because QOM automatically added objects without an
explicit parent to /unattached/, incrementing the refcount.

Instead of manually triggering unrealization just unparent the object
and let the device machinery deal with that for us.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/866
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220610143855.1211000-1-alex.bennee@linaro.org>

---
v2
  - move clearing of child_tidptr to before we finalise the CPU
    object. While ts itself can be cleared g2h needs the current CPU
    to resolve the address.
---
 linux-user/syscall.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f409121202..bfdd60136b 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8594,7 +8594,13 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         if (CPU_NEXT(first_cpu)) {
             TaskState *ts = cpu->opaque;
 
-            object_property_set_bool(OBJECT(cpu), "realized", false, NULL);
+            if (ts->child_tidptr) {
+                put_user_u32(0, ts->child_tidptr);
+                do_sys_futex(g2h(cpu, ts->child_tidptr),
+                             FUTEX_WAKE, INT_MAX, NULL, NULL, 0);
+            }
+
+            object_unparent(OBJECT(cpu));
             object_unref(OBJECT(cpu));
             /*
              * At this point the CPU should be unrealized and removed
@@ -8604,11 +8610,6 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 
             pthread_mutex_unlock(&clone_lock);
 
-            if (ts->child_tidptr) {
-                put_user_u32(0, ts->child_tidptr);
-                do_sys_futex(g2h(cpu, ts->child_tidptr),
-                             FUTEX_WAKE, INT_MAX, NULL, NULL, 0);
-            }
             thread_cpu = NULL;
             g_free(ts);
             rcu_unregister_thread();
-- 
2.30.2


