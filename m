Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4099481C3A
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 13:52:44 +0100 (CET)
Received: from localhost ([::1]:51198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2uvD-0000Ez-VY
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 07:52:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2uf6-0001jH-AW
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 07:36:04 -0500
Received: from [2607:f8b0:4864:20::1036] (port=47004
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2uf4-0003Fd-Ud
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 07:36:04 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 rj2-20020a17090b3e8200b001b1944bad25so22987261pjb.5
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 04:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4/faZkg58Jf+x/baAEshxr35wC0Pr5DAdvUkI/KiX30=;
 b=l7b8Gd5W069fO50Rd5So5b59/iqAZmYZAOGZXV3TPx3gnZn9w3xX9yS6o1VEDpiaZ+
 aWlq7degpIXNgZVtChFIet6KCYS/aKGzF49Fw0J/Ywd/l9Du1HxvZYiE2xhCOldzZG1K
 OSFfCKCtbOq5vc9WlpAuksEK/GCq4kCKHgPhcDaUa/zAfCCe9oHphLaQIAV5JWOd/qR3
 7IwO1jx9TQl/cQk7xPJg0HK6phfz5+jCzPzugYc223zwbNG6vpN8zT2Thc0kuNo0xnNt
 P2wtesr/ACbeAuJ948sfdoOinjZPkqa1IA1Rv8pqsUx2jjT1M6LSlBEmjn0dcMf1g7nm
 60Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4/faZkg58Jf+x/baAEshxr35wC0Pr5DAdvUkI/KiX30=;
 b=GaJXR3xz8/SBSnunNxSrq1Q5kNT9McKCZJl6tsrWIXGU/g8Ob6LROyULPBttqpkwtM
 ZwOgUjOYwvqztw9FL8RQenUbe5ZXU8sQ9S0IZimnu5QBJcFsJ/9XwJudvJ6Oc7BU32SQ
 CuZONuXP/TFGA1B2wdYNAryCy31C4g2nc5NxvXRjHMhjBZwi8nEnkE655AnwS1/ZezjY
 yZkYWrtlAqu+JrueOmN4fYVqF2Zn9BaKPbbZsS613gw+8idcBhVLnuivcGMMZbzafM0N
 MstoFm6TRSON9MpOxzOIdkQMTLl+/xvbgsLkMZZmjJoRUa/IIcPlmBA8C6CKU/FVs3YO
 Abqw==
X-Gm-Message-State: AOAM530ijVNbzm80Zrs5AvQ++RxLIfsLBS18U8N62DWsmPofu8a8291x
 uN+atBiJvuRXcD0pUwXqhFCJJw==
X-Google-Smtp-Source: ABdhPJyoTtw1KqkpURMipOtI1WIYWEFREx1QZcDnHwoUnJZ4LwoVKsI1B4PjpQv/LaBUePCXiItg3Q==
X-Received: by 2002:a17:902:e5c4:b0:149:5945:72e8 with SMTP id
 u4-20020a170902e5c400b00149594572e8mr29196587plf.142.1640867761702; 
 Thu, 30 Dec 2021 04:36:01 -0800 (PST)
Received: from localhost.localdomain ([171.61.71.9])
 by smtp.gmail.com with ESMTPSA id a3sm28588348pfv.47.2021.12.30.04.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 04:36:01 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v6 04/23] target/riscv: Improve delivery of guest external
 interrupts
Date: Thu, 30 Dec 2021 18:05:20 +0530
Message-Id: <20211230123539.52786-5-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211230123539.52786-1-anup@brainfault.org>
References: <20211230123539.52786-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=anup@brainfault.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Anup Patel <anup@brainfault.org>,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

The guest external interrupts from an interrupt controller are
delivered only when the Guest/VM is running (i.e. V=1). This means
any guest external interrupt which is triggered while the Guest/VM
is not running (i.e. V=0) will be missed on QEMU resulting in Guest
with sluggish response to serial console input and other I/O events.

To solve this, we check and inject interrupt after setting V=1.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index bf50699b1f..43d6311e49 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -325,6 +325,19 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
     }
 
     env->virt = set_field(env->virt, VIRT_ONOFF, enable);
+
+    if (enable) {
+       /*
+        * The guest external interrupts from an interrupt controller are
+        * delivered only when the Guest/VM is running (i.e. V=1). This means
+        * any guest external interrupt which is triggered while the Guest/VM
+        * is not running (i.e. V=0) will be missed on QEMU resulting in guest
+        * with sluggish response to serial console input and other I/O events.
+        *
+        * To solve this, we check and inject interrupt after setting V=1.
+        */
+        riscv_cpu_update_mip(env_archcpu(env), 0, 0);
+    }
 }
 
 bool riscv_cpu_two_stage_lookup(int mmu_idx)
-- 
2.25.1


