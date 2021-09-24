Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D67416F67
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:45:54 +0200 (CEST)
Received: from localhost ([::1]:33490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThmC-0003Fm-LC
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThfp-000302-3l
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:19 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThfn-00068d-0w
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:16 -0400
Received: by mail-wr1-x433.google.com with SMTP id i24so9556879wrc.9
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0AqKBFC+aFLNQwO8nQ0Y0K7FTRMmlUnvtkKFuSqHBPM=;
 b=dtaPENSHWgqPCqi+uk96kCR07UH/mqS1ORNhhtTyDM7hhadwpEy6Szr93fFMW0qjEF
 MVUbQ7hiiWAlWh+x2FJyHgwxu3DxQEOc1CWdWo6xS+oqjuu23Tj84K/2nixMYCXv97I9
 NQ41qjmmFdQA3SCCl043i6iA4DqFqTlyPTCqiPzDAX/2fDnFF6MTPoyThhmhFw+9yOmE
 9QEDItSxG5RKsUfyTFScLRrYQeYNcQk0YnVa4CRAsJqyMK3dNEQYjlL3EzULFEFVY0Ia
 4Akhyp41ZIRPRLfRTi5gEOwWRjdooMOgBxkm58BARyTjnY13OJz5D4Lev9IlsUAoId6r
 mDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0AqKBFC+aFLNQwO8nQ0Y0K7FTRMmlUnvtkKFuSqHBPM=;
 b=wONluHZ+ee9Bf1ODBWQkDblnhu7flfXUaI8he0r5kE/0yMl2jh6JPIB5uCXNXbv7eA
 1lgvlSmMInwoy2ub7e5IWoIQmc9AjU8f33vIDlHXhttn6wITgcdtRrj3rgIz6uuM8iIP
 oO/x5T/5YMQD5atCbfMk2Rz0JHF+1kDt4WrHCZY21RJ2ExSdcBnSfoupTQX1V+0GuI5s
 r2vkhr4CVywDVNO2ZR6fLh7zAY8BvmKYcGRdiOEvabZUzKNNTKSne718eH7fLr3AQZMg
 jkAjeavlvwKoaZC5jtDgI2tms4sG5sOodOpfpeO4GbtJ9yG5TlFz3+eEcKreEjZU53E8
 RhXg==
X-Gm-Message-State: AOAM532lBGRbU0XI5JSsoNrICuLl7sVtJlz7GBm1jktY/2tek/7LWj0j
 O7ilHe+kx74bjaRLIkZwGgI3959W/fo=
X-Google-Smtp-Source: ABdhPJz9UK14yoXE1B3z9UZMUIsew3qRgZpVt2fmKtsCDzDAOGrjCPlzJrS0FAx9kT0lPHVHEVdVUw==
X-Received: by 2002:a7b:c148:: with SMTP id z8mr1012888wmi.160.1632476353468; 
 Fri, 24 Sep 2021 02:39:13 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 q3sm6362677wmc.25.2021.09.24.02.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:39:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 05/40] hw/core: Move cpu_common_has_work() to cpu_has_work()
Date: Fri, 24 Sep 2021 11:38:12 +0200
Message-Id: <20210924093847.1014331-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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


