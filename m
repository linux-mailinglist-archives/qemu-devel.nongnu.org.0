Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BC5418B81
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:34:55 +0200 (CEST)
Received: from localhost ([::1]:34922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcjW-0005W3-40
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUccf-0000hq-MV
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:27:49 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcce-0005RY-9I
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:27:49 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t8so46609442wri.1
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D1NIBiKsJLet/LtgtEl9N8uYnLoHyxQP991kqXpIcyw=;
 b=axH1gbBnfyTyHMdOx5ecrp2+VnFyE6EmRNhA0XCtUgRzbykFuB+eJWOXwEuG2Y4Om/
 hYxqbxeesqEBsKdfflVD+mR5zrszBdR14q+9TduMY3ivYswTUPwFquo4+Xy1shZWRrVG
 NM1GhM/196K68PBUrOg6feSDWbD0qXO3qBQHltHyIVMVVGOGEqbkj8qrAPSGcwMxxE6q
 ZvYUa5xxGoWNE5HQQ/cfvX6bjCo2w3erKCmlVw0eNWQmBAefLJphHxf8NUKDgPawZzs0
 LiOF9NibpX8FChWhIYLyKkWAxHGQjBbS723DVa2I4qeSsmHlRdIrJD8FVUTXKAB1T+OP
 sXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=D1NIBiKsJLet/LtgtEl9N8uYnLoHyxQP991kqXpIcyw=;
 b=QqSiF0812qagFR1X9MghpNkGe2WR9oY039IFLKrsVE8hJTq9jQc1xajVdGc9wcZX2g
 PaCa5qcC1Ev6DLW5S4PeQfmUy3sATqvGxnPf4cJDvneoG3GXlKZ2Fvz8/G9X6+q7Nsxo
 lI+Lj54odkRayIbW31wiia0qf8tOBERTVdliHBM/eGc0ICcVVmuFXvYZG+4v2xPdv84u
 pDwzbavYstDo5XGlIWP3613bODgVgeN9ARJDR6ylD9cZJCleLneuB1bK2m8qd97WNvCF
 aM3b5UNXKdD2GoRnCuq2ujq8wpoKlRJ9qQva2rh19aikHgwV2ysfK0hcQ3v/ItrPbPqL
 t1EQ==
X-Gm-Message-State: AOAM530TXRpt5bYGr4/uaakND/G6WKBG9xUFDzYYiI/lCUCyv587zii/
 HNvP7LA3sq3H/Cv2tB7waNVyoQox7kw=
X-Google-Smtp-Source: ABdhPJzK67hIDjeNv+lzivFJ0ut+sSlo8xcApaTg0LIaaCyYCwrTBRDuS9PpcvnA3L1X4SchDAt+eA==
X-Received: by 2002:a1c:22c3:: with SMTP id
 i186mr12878915wmi.145.1632695266856; 
 Sun, 26 Sep 2021 15:27:46 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 z12sm14726385wro.75.2021.09.26.15.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:27:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 06/40] accel/kvm: Implement AccelOpsClass::has_work()
Date: Mon, 27 Sep 2021 00:26:42 +0200
Message-Id: <20210926222716.1732932-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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

Implement KVM has_work() handler in AccelOpsClass and
remove it from cpu_thread_is_idle() since cpu_has_work()
is already called.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/kvm/kvm-accel-ops.c | 6 ++++++
 softmmu/cpus.c            | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 7516c67a3f5..6f4d5df3a0d 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -74,6 +74,11 @@ static void kvm_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
 }
 
+static bool kvm_cpu_has_work(CPUState *cpu)
+{
+    return kvm_halt_in_kernel();
+}
+
 static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -83,6 +88,7 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = kvm_cpu_synchronize_post_init;
     ops->synchronize_state = kvm_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = kvm_cpu_synchronize_pre_loadvm;
+    ops->has_work = kvm_cpu_has_work;
 }
 
 static const TypeInfo kvm_accel_ops_type = {
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 85b06d3e685..c9f54a09989 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -90,7 +90,7 @@ bool cpu_thread_is_idle(CPUState *cpu)
         return true;
     }
     if (!cpu->halted || cpu_has_work(cpu) ||
-        kvm_halt_in_kernel() || whpx_apic_in_platform()) {
+        whpx_apic_in_platform()) {
         return false;
     }
     return true;
-- 
2.31.1


