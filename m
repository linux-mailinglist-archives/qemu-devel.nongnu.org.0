Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F82401C7D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:40:00 +0200 (CEST)
Received: from localhost ([::1]:40666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEqt-0007Ac-KF
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPl-0001uw-OS
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:57 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPk-00081T-2C
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:57 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so3822456wmh.1
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=boHe/TN7iP4dCfI5Lt28Agud/RqY7EKeXZQNrY5FSWM=;
 b=Icd7hdrrObvJ6F0SagAFwTPZ4XVSE9Gd6q0XWUyG6RsdeP/2aCWsrtsr8rPadMrYNk
 Ej4muX1qEnlconrSCIZ+w6wjB37mz2b+DMpSZNpCHKXgYC0JY3StHRfxZhWDAwNAVwH2
 qO3pIO/zXDz/92jKWHen1/FNmps8bzi3CQtt/YmcaeCRT8oG3J14Zf4JafcdCFHs+obj
 RsA2Sq1BWMkUVD0pShe/5/Fo7RLdxVNps2Kpf0jlIA2EMS7y9UJBuq2F9IGZ5WC3Gm2E
 CeS1qYdCAZIw9s/wCz3x9GaenvddWuwYn6kDQ+swFG5kTH+bJkAFHl12ltxVBE3bcmFM
 r75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=boHe/TN7iP4dCfI5Lt28Agud/RqY7EKeXZQNrY5FSWM=;
 b=lGirj5emsLOiVeQHTsxAPmIhSpAhATkf8nTiv9hgbuORvfg90O0fJ6CD4KVtYYmagV
 DgwJ9UIXpQmd1pa+wuRg7/S1qZ/dATaYGpkZIgqYmR/2NSrK3WqjSngeBZ9yFVGq4x27
 IaW3r+5srenOBWt1W5+qtCwccFpDahOdCKU61bqtRABunPZtf7V44J6s9hdq7vhImjdF
 lSyklUVkAwbmRnbKOSoQUX//u+yJla6r64EtrfljDH7pmFthvQu7CPqQPOCBUdDJ5QfJ
 LabyhS6/UVCrXHZj2aMV8hAOaA44snlALeNDrkvIuGQkwUNvR4tYNEmamXfn/eNAU+Re
 q+zg==
X-Gm-Message-State: AOAM530u8DlHdx1R0RIDgl00fwxnM+OJxmzcRgooKN7QQQkm8lI0bIBE
 e2szQcAwy1+k8/Ki0JoW3FHM1V2E1cs=
X-Google-Smtp-Source: ABdhPJzi2hYQqVqdKNgxb9XZ/H79N6NSIO72DV1I2ITDWpUKP6kV8RFFBNKXo3+Wd4WiiHG2Evdh6w==
X-Received: by 2002:a1c:158:: with SMTP id 85mr11288033wmb.187.1630933914705; 
 Mon, 06 Sep 2021 06:11:54 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/36] sgx-epc: Avoid bios reset during sgx epc initialization
Date: Mon,  6 Sep 2021 15:10:55 +0200
Message-Id: <20210906131059.55234-33-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Yang Zhong <yang.zhong@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yang Zhong <yang.zhong@intel.com>

Since bios do the reset when qemu boot up, and sgx epc will be
reset by the registered reset callback function. Like this, the
sgx epc will do two times initialization. This patch will check
protected mode from cr0 register, and will bypass reset operation
from bios. The reset callback will only accept reset operation
from guest.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-25-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/sgx-epc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
index 9880d832d5..70075db37c 100644
--- a/hw/i386/sgx-epc.c
+++ b/hw/i386/sgx-epc.c
@@ -19,6 +19,7 @@
 #include "target/i386/cpu.h"
 #include "exec/address-spaces.h"
 #include "sysemu/reset.h"
+#include "sysemu/hw_accel.h"
 
 uint32_t epc_num;
 
@@ -97,6 +98,21 @@ static void sgx_epc_initialization(DeviceState *dev)
     sgx_epc->size += memory_device_get_region_size(md, &errp);
 }
 
+static bool check_reset_from_guest(void)
+{
+    CPUState *cs = first_cpu;
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    cpu_synchronize_state(cs);
+
+    if (env->cr[0] & CR0_PE_MASK) {
+        return true;
+    }
+
+    return false;
+}
+
 static void sgx_epc_reset(void *opaque)
 {
     DeviceState *dev = opaque;
@@ -104,6 +120,9 @@ static void sgx_epc_reset(void *opaque)
     Error *errp = NULL;
     int fd;
 
+    if (!check_reset_from_guest())
+        return;
+
     if (!epc->hostmem) {
         error_setg(&errp, "'" SGX_EPC_MEMDEV_PROP "' property is not set");
         return;
-- 
2.31.1



