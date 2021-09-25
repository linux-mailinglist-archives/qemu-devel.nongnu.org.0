Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92711418307
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:04:44 +0200 (CEST)
Received: from localhost ([::1]:37624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9EJ-0003rA-Iz
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU91h-0007Xt-Pk
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:51:42 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU91g-0004zu-7x
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:51:41 -0400
Received: by mail-wr1-x435.google.com with SMTP id r23so11137366wra.6
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0AqKBFC+aFLNQwO8nQ0Y0K7FTRMmlUnvtkKFuSqHBPM=;
 b=VgGbYvr0zOUZ11vJzkJlKMILzL55l6ZQpg9wz0vVALAo+YpQSBtyttLYk4uZLw70K6
 QFRzS1pjSxMpxKpmbF7efFCe88zrYnUdS4WePbe1p6td3Z8bJUHoarUxaccx8uHQZ6Zk
 emsGumLandXTuwIhRbt2x3eE/YN/a3daJg/Gv9wzyrVKVNMmossnMdFNJbYHd8xaeAWj
 Us/qadeN0jVSrocrs7WRWBSdDnredCI47pwoxpR3YdFBO2PAUvd/MegerPvrl14vbTPf
 slpQ1SKMCRXKYCOe9Tg0Bx9LYVZtYkWTHlKqajNVqQ03NrNAMAEJ13qxaz9YPZmNGKLV
 x2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0AqKBFC+aFLNQwO8nQ0Y0K7FTRMmlUnvtkKFuSqHBPM=;
 b=ySPY6E4vUnO0TqIiroXY+LKJj2sCdnWBYz40H2IfuzQVx0CRMW9oS9Leo3q70o9d+M
 yl0GQTN2DY0Zcep96shj+EEVNBE9WeXqjwQmZHTtdCI7KNk4f06UYEinMmA5o2/EVsXz
 dYyZXgr3oWaILHBSHc6h6aqfdGpnPvjOqVRydXCZf8Bc42OuGF4Y5L4P+KJTfufu/iwa
 pmQqEOXzKBvTM3SvjJyL5bC32nby8ETDzdkX34nvD3NbVKrVDnMlak3HXi/ADG7Mk+2w
 i+vAhh8519nBQCcD3UnyM0D0/uzwVY78XzR/fPhA7mZkzIsJCjgdFS+NWWe22HR/28ia
 NMdg==
X-Gm-Message-State: AOAM532eZVBVjhELHthV/CSJmOIl5b8STqYAPyCTAhC2QDhgngOL+DFL
 8Zje+VKZfa8k/an3ejzCf4AuEMLjbd8=
X-Google-Smtp-Source: ABdhPJynwAAYE6uZr6+Ls3W+qh141dZhbxfysqzxFkctP0T3IxaM6Un9nQ8j/5Zrpt4YlEbojogeXg==
X-Received: by 2002:a5d:440d:: with SMTP id z13mr17596133wrq.433.1632581498856; 
 Sat, 25 Sep 2021 07:51:38 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 y11sm13690765wrg.18.2021.09.25.07.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:51:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 04/40] hw/core: Move cpu_common_has_work() to cpu_has_work()
Date: Sat, 25 Sep 2021 16:50:42 +0200
Message-Id: <20210925145118.1361230-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
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


