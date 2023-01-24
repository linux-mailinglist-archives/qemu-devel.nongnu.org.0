Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0016167A3A3
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 21:11:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKPck-0001jr-2a; Tue, 24 Jan 2023 15:10:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKPch-0001jO-Ns
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 15:10:27 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKPcf-0004ZY-S0
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 15:10:27 -0500
Received: by mail-pf1-x42c.google.com with SMTP id x4so12017236pfj.1
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 12:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+zf6cP1xRQEyfQngEfnLHySxm6xVJWrwYZFSZ8DzkOY=;
 b=AnljH28z3Gly+CJU1/sGVoKitxIeT0fRZAhjKygnRWWplyEMwMLrzM6ecg4+94ujdc
 r3H/iFSBwzAy9uqi9/6+yTjYte4l/6GjaA370q8uTIgHExTXvzYSih7wOngBPDzDXH7Y
 CUGh2Tf66i7PyTxE9SV8ccvSkSMbA2wgpbjyoi/a+ROMkFYed3YdigmCcDR2ZjCCqA5D
 asSlsCYOVVC1/nggIn26BwzTIoKgJPAyxutzDkybuaxw5Of8k42HNMYO8g1/qNDnJ2NM
 K0mGPtLMBrQW5vo8WEjCt+xcbe/kMLSBrAO9vMwOj/7f0WN4mMWZaOLwlwRhy9twQEi4
 Te2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+zf6cP1xRQEyfQngEfnLHySxm6xVJWrwYZFSZ8DzkOY=;
 b=08pH+/rIFHaFTOL9/EhurjPAX6khMkM7tLD8DNbMsMGcvw9hyU8FgEFZpmrN46l/Gg
 CWJhzv3MDTdCzAf83A7svD2HZBx7YRtoS+6kAanQ85aSG6u+XnD6eQ5fuQrbbCdP3ivO
 rabp/SLO0Lo8OaabWqwZNp80DycbQwzL1N8w21FNs0/+MNToRdAq69xqO196XrFferRL
 GTEIDCipOocqSGuK4KUBrTkZDmsts2YGbhMzku7kVVkw6QSU5Ih0VYDyXyfNxvDcXpz0
 ljWbnV+jVIVLLfmW2xZmK42eOOmta2tHg/yJXlaBL+MwNXlDx9ZHcMfXU9CNZ6g4yBoI
 IgqQ==
X-Gm-Message-State: AFqh2kq1bQRmiUtsNyrKzLIwiYAqJhvba8GjFIQcF9DxumTRTUPAPE7T
 RfRsaTW9M0woN4batfHiI3c3LWVRWIHoptPG
X-Google-Smtp-Source: AMrXdXvRcpEixDIVPDBCJOq83cVRhaRnbyb3mLe9k6tft8zmrel79xK4tOpWUnn+WVxoA8WVubWJnA==
X-Received: by 2002:a05:6a00:331b:b0:578:333d:d6ab with SMTP id
 cq27-20020a056a00331b00b00578333dd6abmr32417217pfb.21.1674591023104; 
 Tue, 24 Jan 2023 12:10:23 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 b192-20020a621bc9000000b005817fa83bcesm1968520pfb.76.2023.01.24.12.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 12:10:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user: un-parent OBJECT(cpu) when closing thread
Date: Tue, 24 Jan 2023 10:10:19 -1000
Message-Id: <20230124201019.3935934-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

This reinstates commit 52f0c1607671293afcdb2acc2f83e9bccbfa74bb:

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

The original patch tickled a problem in target/arm, and was reverted.
But that problem is fixed as of commit 3b07a936d3bf.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1f8c10f8ef..4ca1b59343 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8642,7 +8642,13 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
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
@@ -8652,11 +8658,6 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 
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
2.34.1


