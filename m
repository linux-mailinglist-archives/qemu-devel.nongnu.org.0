Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FA84E4348
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 16:43:40 +0100 (CET)
Received: from localhost ([::1]:41164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWgfa-0004Hi-Uy
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 11:43:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nWgeL-0002i7-NG
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:42:21 -0400
Received: from [2607:f8b0:4864:20::435] (port=38608
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nWgeK-0001c0-4T
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:42:21 -0400
Received: by mail-pf1-x435.google.com with SMTP id p5so12371926pfo.5
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 08:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h/Xc6kzIUTOxeLIhESyA4D64LChnfkFS4s+/E7srJug=;
 b=Zg8U5f5gwrcl6OXrVJuR1cBUrJH9i+RQbv49non6Q2LrdDb6YGm31D0yjNjMvGI2Gk
 RD9O9JJGnySm8+NURcbh4uh8cDrEGviXlEo/Wq2+n81/kCok1YJTCgnROioC0h/av4Qr
 mTsu4Qy/hfSNHlVaTN8d669t4n/tqQLR9FVmWQy4dEo4E7CKqLWEDP8I103Zwht8mqRB
 qnDuZjxS402+Sfsc1KWpuru5E1N3yvj/WiOkQDC/tlIKTVqwwlagE/Ac6QXAk1w20gQk
 cr5FkRhVqheyP9SM5zI7mDQDJnWyrVO6I8YwU2ghjzQjskuU/emwenUUan9BEitdUStM
 ArNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h/Xc6kzIUTOxeLIhESyA4D64LChnfkFS4s+/E7srJug=;
 b=4XL0cgRPm9nbd392fMt/Tg003rC13VYgD8Oy899kCiGpNLgA9fHFj5FYjszu3qYKcC
 GC2Vi1C4zjdBb9xXlTHwLVcGtq6kp/16Cnm0VDiJQVgFqVOQE3h4Eov+DQsiQzOO0pQ0
 y6qstuXMCOImuSVdtppFn5exvq7Yq8wQil3e0+0NEKtTCxY8bF+opkrImCWsExGzwZ59
 QStd/0h3sE2kxhiIuNb/1gsM4cosmaVK94k9lFOGHRx4QVJNSllP9QwZPJgsPn9ei+x+
 DQ5u3WzNqHKiayBLQgB97et5RaZoC2xkL3KoW9ciwZwSYixpZXV5K1FvXjGPFYOKOirV
 9SAg==
X-Gm-Message-State: AOAM5313agkEuskf6g81G5VY4B96gl9FrInfyj8QBQtIMOtPtSNfflBt
 CxLjXxrKu1ju6HQ6K0D5ljM=
X-Google-Smtp-Source: ABdhPJzvanWZ1GmPha48nQWw5+0U0hqJWDUMgjvjWfSG2d1VNySx1qYY1XQr1r+h0uB7LeyNhIlpuA==
X-Received: by 2002:a63:4c5c:0:b0:383:1b87:2d20 with SMTP id
 m28-20020a634c5c000000b003831b872d20mr3747543pgl.294.1647963738789; 
 Tue, 22 Mar 2022 08:42:18 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 u4-20020a056a00158400b004fa0263cf5dsm24482136pfk.130.2022.03.22.08.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 08:42:18 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Subject: [PATCH 1/2] gdbstub: Set current_cpu for memory read write
Date: Tue, 22 Mar 2022 23:42:12 +0800
Message-Id: <20220322154213.86475-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

When accessing the per-CPU register bank of some devices (e.g.: GIC)
from the GDB stub context, a segfault occurs. This is due to current_cpu
is not set, as the contect is not a guest CPU.

Let's set current_cpu before doing the acutal memory read write.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 gdbstub.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 3c14c6a038..0b12b98fbc 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -66,6 +66,9 @@ static inline int target_memory_rw_debug(CPUState *cpu, target_ulong addr,
                                          uint8_t *buf, int len, bool is_write)
 {
     CPUClass *cc;
+    int ret;
+
+    current_cpu = cpu;
 
 #ifndef CONFIG_USER_ONLY
     if (phy_memory_mode) {
@@ -74,15 +77,21 @@ static inline int target_memory_rw_debug(CPUState *cpu, target_ulong addr,
         } else {
             cpu_physical_memory_read(addr, buf, len);
         }
-        return 0;
+        ret = 0;
+        goto done;
     }
 #endif
 
     cc = CPU_GET_CLASS(cpu);
     if (cc->memory_rw_debug) {
-        return cc->memory_rw_debug(cpu, addr, buf, len, is_write);
+        ret = cc->memory_rw_debug(cpu, addr, buf, len, is_write);
+        goto done;
     }
-    return cpu_memory_rw_debug(cpu, addr, buf, len, is_write);
+    ret = cpu_memory_rw_debug(cpu, addr, buf, len, is_write);
+
+done:
+    current_cpu = NULL;
+    return ret;
 }
 
 /* Return the GDB index for a given vCPU state.
-- 
2.25.1


