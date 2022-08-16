Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C66DF595BC8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 14:30:29 +0200 (CEST)
Received: from localhost ([::1]:43502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNviG-00018S-UM
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 08:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oNveP-0004gh-9U
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:26:29 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oNveM-0001ja-UC
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:26:28 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n7so1232389wrv.4
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 05:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=bwzqfA6o9KxVQ+yh1ggjjAyIYRr9k3xUnAlnxn391Io=;
 b=hVupO/BbnR/puOKWMrDR9gWDlqWO6mB2t0k8CKg6WP7+HdJLhi2hbELMWX4mUJ7q8E
 LiNnr3lCif/t6rN2cwewWOkT2AjDR0vFhIqWnXEt5TZxE2psqsYobOEGRZPVBKP/+OB1
 XVmUCzF9PCJnRPCrr9DoHydLELmouwWnm/PeE1LHKyVzy7W1fgukuHuq5oBdgYNuh1jD
 OSuFyxekd/Wj2HavLX+PiKf67jYUAitK1sim+QwVFhFy+hlKIJTHiPpOsA/RsWPdflXv
 KH2mUlwxsTFVsxlKpuKir/HRShEcsN/qse/fZrtFI52vGCSaMvISQkuyu+yapZo5c5oH
 Kd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=bwzqfA6o9KxVQ+yh1ggjjAyIYRr9k3xUnAlnxn391Io=;
 b=PMR4isStjWHfzw4GEfwlXMmOm/+5IfmQ6gM01iwGLhaGClYJxp9B0QK92HB3Mz6JoZ
 ngGMNVmX1lpMIxHaK9b4DWgUh0BXSQ/L/EsOismKK60yOjYB9wID3Ob/qHoav1pCY56r
 w/Nt8ud7gXGcDvK9DdAwhI0N1asH4cGkZC7ll42mwpdNM62iioDhHViF74gTLTz1eKfU
 P9Blb/3pgTwKWh0Zhtd1Ca3v3NoynZv4Cxr4uT+coo/r0Xf8D8QteBsBmF1wh/XOKthN
 TV5Ooh37FqH+sUDFRhduQyP5eMo5F3yzxgWs8VkTRTczf/lVyFJVwoMTfknKInb6g06l
 y7Gw==
X-Gm-Message-State: ACgBeo327BrkVuImsQL3LOVz1blMQkaKnmCR010v4m5LVsjLU5u6r1mh
 lxP2lcVoqJhldF5uCunyTcRtvw==
X-Google-Smtp-Source: AA6agR7mOxPAmib3eQoY4/e9/CGYGKUVheW6GTO1WrbdfIq2mQ3b9EvP+WG0VrZky8rBTBhTn5Ad0w==
X-Received: by 2002:a05:6000:170b:b0:220:6535:26d8 with SMTP id
 n11-20020a056000170b00b00220653526d8mr12127609wrc.577.1660652785563; 
 Tue, 16 Aug 2022 05:26:25 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a05600c4ec700b003a3170a7af9sm13186389wmq.4.2022.08.16.05.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 05:26:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DD7B31FFB8;
 Tue, 16 Aug 2022 13:26:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 1/3] linux-user: un-parent OBJECT(cpu) when closing thread
Date: Tue, 16 Aug 2022 13:26:19 +0100
Message-Id: <20220816122621.2066292-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220816122621.2066292-1-alex.bennee@linaro.org>
References: <20220816122621.2066292-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Message-Id: <20220811151413.3350684-2-alex.bennee@linaro.org>

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


