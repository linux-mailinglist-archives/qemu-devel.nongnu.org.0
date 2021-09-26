Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A735418B8D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:37:45 +0200 (CEST)
Received: from localhost ([::1]:43994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcmG-0003Kq-Af
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUccW-0000dD-MG
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:27:42 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUccV-0005K5-6b
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:27:40 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x20so1785242wrg.10
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0AqKBFC+aFLNQwO8nQ0Y0K7FTRMmlUnvtkKFuSqHBPM=;
 b=BEwRKqrjMQHMRTikiEs9+mKvi9rjtm0V5A4SrWuoplqEQFiL/6iUrE3XSinEPQaQBg
 6NQ2/q5lTmt3TavNclLyxuCGQn/Us7IW10SI3G6Wu1T5Nd5iI3em8eDDsfNdndlq6evG
 xYVk4xqAcPYbX984a/zz4WXCOoVzXjJxmAJQRKKHHJk8/qsZCEwt26gsbS6VL3cp4vS9
 yos1UrFt+ezV2WYp8sRp5vh5B6mq/b9SI4GRxqABFy3MZdBIgRZcHjTLqSwt5M48JFel
 fkE83fCGxR7hRuHTrhrvWUN/joWOCe+ymm6E4zC5Uu8noxQJ+Z8DcgCGGxh/3k/JEd0v
 TUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0AqKBFC+aFLNQwO8nQ0Y0K7FTRMmlUnvtkKFuSqHBPM=;
 b=RKKftjoJneSdMIiz+O/pZmjoUwETBlly7LSAJRyZEuwqh7myAfIdTI2S34uyz8VolK
 m4Q0i7QSqSNfw4hjkzUvk5GnPotkmwmNzQVHMmPc7tWDkSQlk11HUGziMvhmQPtEOu5y
 3pMSQKXVzDR83hG1Nom+K+Gm8aM88RjD0hNx9M2GCDaUcdadoQZfN4JHVOaQCzr5pqH9
 2RgSBGDb4QwVg6Tnl54HQw9swVtIq7f/fLj3zZRqabdFVD5vkiUp4JGjsaCMiB12ROBC
 eq8rVVt3LYNKgEqrwMXJc2udrc0AuXlzbSAovsxMyoYfOLvWSzQSZoA41gtI5cq7zCSe
 a7Ug==
X-Gm-Message-State: AOAM531GtectGLbRb4zj00M2TmE9wUngR1rW61HB/cMaeiypgTnwEkrp
 E/rd5Y7JW23P9JzwqYG230VpabC7vSs=
X-Google-Smtp-Source: ABdhPJwd2etxjr1/6ZHzGJzBhyh49DQVM3lL60rMd7zDtv5jCtF2A0W9Y7tGVDWT06axWfuxsOiKWw==
X-Received: by 2002:a05:600c:21d6:: with SMTP id
 x22mr13271735wmj.121.1632695257785; 
 Sun, 26 Sep 2021 15:27:37 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 s2sm14428010wrn.77.2021.09.26.15.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:27:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 04/40] hw/core: Move cpu_common_has_work() to cpu_has_work()
Date: Mon, 27 Sep 2021 00:26:40 +0200
Message-Id: <20210926222716.1732932-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpu_class_init() always register cpu_common_has_work() as
CPUClass::has_work() handler, so the assertion check in
cpu_has_work() is pointless.
Since cpu_common_has_work() simply returns 'false', we can
inline it in cpu_has_work(), improving the function readability.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/cpu-common.c | 6 ------
 softmmu/cpus.c       | 6 ++++--
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index e2f5a646046..5ed1ccdfdd5 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -143,11 +143,6 @@ static void cpu_common_reset(DeviceState *dev)
     }
 }
 
-static bool cpu_common_has_work(CPUState *cs)
-{
-    return false;
-}
-
 ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
 {
     CPUClass *cc = CPU_CLASS(object_class_by_name(typename));
@@ -279,7 +274,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
 
     k->parse_features = cpu_common_parse_features;
     k->get_arch_id = cpu_common_get_arch_id;
-    k->has_work = cpu_common_has_work;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 6a05860f7fe..accb20f0589 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -255,8 +255,10 @@ bool cpu_has_work(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    g_assert(cc->has_work);
-    return cc->has_work(cpu);
+    if (cc->has_work && cc->has_work(cpu)) {
+        return true;
+    }
+    return false;
 }
 
 static int do_vm_stop(RunState state, bool send_stop)
-- 
2.31.1


