Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13B74037AD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:17:24 +0200 (CEST)
Received: from localhost ([::1]:56622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNudv-0006vt-OT
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRz-0006tJ-RQ
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:06 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRx-0003Ac-A8
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:02 -0400
Received: by mail-wr1-x42d.google.com with SMTP id i28so2432493wrb.2
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=boHe/TN7iP4dCfI5Lt28Agud/RqY7EKeXZQNrY5FSWM=;
 b=PgGePefxh3kdOPswUci+IVtBKQUypG4r9vYa/iJrTwhZCtBQ38GndYskjHbe4axiR9
 jNKAJZKCzYU29ChE2lA7ZbouU6uFUzEvGAG88bSUUzqP05XVMOp0t/q3wIYlaq0Syl52
 ajM2/YIKmuRPPjt7UssFyO7feOfiPoLCGImb0SFFXfWx8XrlN2c/2g+/kWroBavUgRa1
 IYM5oUAFhAqw7m0mbV0/fGQ2U+qXzWHrD3AIrxwNAqagCkvANfCcgwNn9doEL5xZNtuz
 jtdcgpGrw+w3lOAaz78+x2wpcJdc7rxQhtB4dPQ73VZxlna8vZ8bz3S1+iY8EnBJe5aG
 Shzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=boHe/TN7iP4dCfI5Lt28Agud/RqY7EKeXZQNrY5FSWM=;
 b=QYWILHCr4Y4xL3XLtwRPELmQRn9sNccRRwWQOBvoco/Z+m99Dn43vNZrl3+/MHSx+J
 t/2DejcxXpBHzDh8lZwYywI68W/eBkfcIE8GhU2XWwXG+rbxU/jq3ymUh24tHrWQU2Sk
 foHaXTaRhhErgIGNsjQgq1q8ZhaN+UZmOFkcKnUxO9udm9N7+k7tlHvW0sczv0AEJKhy
 Wev0L4ujg4sowXgsEKyWSuB7qiXfy34WrexK+pVvWxFipxdIKZyK3wnL96Irry8Epm/r
 AJPu/vymRRndXX33NXkQUqO73CRUdmMg72VgjENefIPY2S0XqxEaJwpM6QsmdrgfgtZB
 tIWQ==
X-Gm-Message-State: AOAM531qnWR7Zo6+kDsepih/W7xTh9s/ZE1GjW0oJg81jarGmqR38GXA
 KLHWaYpdYyHVCNLIRV8oSZiXxnJOlfY=
X-Google-Smtp-Source: ABdhPJxEZiaOqOx/Jb98g8+iL2pN/PRuBw8nUkWfSIL+aB2EAG6rIjDOX2klh2vgkF1iAeRrfiwPbQ==
X-Received: by 2002:a5d:58e2:: with SMTP id f2mr3040907wrd.272.1631095499920; 
 Wed, 08 Sep 2021 03:04:59 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 33/43] sgx-epc: Avoid bios reset during sgx epc
 initialization
Date: Wed,  8 Sep 2021 12:04:16 +0200
Message-Id: <20210908100426.264356-34-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
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



