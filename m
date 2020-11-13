Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E59752B18AF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 10:58:04 +0100 (CET)
Received: from localhost ([::1]:56602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdVqG-0006AH-1Y
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 04:58:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kdVon-0005it-M8
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 04:56:33 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:38729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kdVok-0004oM-3m
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 04:56:33 -0500
Received: by mail-pl1-x644.google.com with SMTP id d17so2800941plr.5
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 01:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=lS+bubuS1dgRzDNDIVlnH3l1r8xUutZnE6XMTZAVHW4=;
 b=IXfAEyp/5BGDGimkWsp8rAACHEnqa4caS8fyuJeDTTEIu2ub3C1FnsIOOD8WGM1zSS
 OViJVsG2bNhBbBp0FpqixhYpSG8EXTtWEMlRsn9+4Msb/am16KuI3r03PxfBtVYAXQ0G
 YnKfcdNIGJoTXWmJlbBHz+Hnc2Mgjk4TkaMads3yjcmauVrvkOh2jrkwtyO7ZovbOLkz
 QD1dHMQOOshjr+5wvZAoymek8rHs0X6qaulGurBwj6b5v1yFknQ2RBKBM84a6qAJESaL
 yGCa3dqPJxoZLIhYmmb9ibt8MOrl5XR7209fNt0FCxEI09loU/y0LXyGUjP03Q7/9TNh
 wasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lS+bubuS1dgRzDNDIVlnH3l1r8xUutZnE6XMTZAVHW4=;
 b=h0h3qj57Wz2LSJrM9t6Q/mU80fPT3nwVo+/PRuTHlv0N4NGMmIkWMnekM0empUiU2m
 CjQ36QoeAEHuUqQCnYLYxfTRZqrSG0y84s/jlMpFNef/6AkO9unSAo2m+NDLwhL3xGL9
 bg1mkrZM+9BhaqWdzLfVYiK3/JT5uwemHuFdZ7dGkAbYn053ymnliG76ohzsqTARwpGi
 oV/foDEqGg1X1ssYzt6eP9vAk+C2FQitJfFpSXKpcHOz8W+XZUQvNIWw93Atm8d4VPDY
 1rsVNiFAn0VYpNOdtCc9IRqFz29OpMCEKv+vMd18KlQuJz6O0+7sIEM6zFNlEIE2lLDS
 5woQ==
X-Gm-Message-State: AOAM532d1Vo/HZrfu7DY0bnqLtAhpmv83chpzdqFlX7hDcRuZb9NfQ7r
 Y0+6uKQrJvh36JdRkuvGZMY=
X-Google-Smtp-Source: ABdhPJy4b8PPbhyBN5KDJz8JzyWrRxDcH/g2c7zhU27ic2k7VoSEtVxt6vp0q2djHEZwUHjzZW9p2Q==
X-Received: by 2002:a17:902:c286:b029:d6:6cbd:eabf with SMTP id
 i6-20020a170902c286b02900d66cbdeabfmr1499130pld.41.1605261387817; 
 Fri, 13 Nov 2020 01:56:27 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id l133sm9544096pfd.112.2020.11.13.01.56.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Nov 2020 01:56:27 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v2] target/i386: seg_helper: Correct segement selector
 nullification in the RET/IRET helper
Date: Fri, 13 Nov 2020 17:56:18 +0800
Message-Id: <1605261378-77971-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Per the SDM, when returning to outer privilege level, for segment
registers (ES, FS, GS, and DS) if the check fails, the segment
selector becomes null, but QEMU clears the base/limit/flags as well
as nullifying the segment selector, which should be a spec violation.

Real hardware seems to be compliant with the spec, at least on one
Coffee Lake board I tested.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- clearing the DESC_P bit in the segment descriptor

 target/i386/seg_helper.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/i386/seg_helper.c b/target/i386/seg_helper.c
index be88938..d539573 100644
--- a/target/i386/seg_helper.c
+++ b/target/i386/seg_helper.c
@@ -2108,7 +2108,10 @@ static inline void validate_seg(CPUX86State *env, int seg_reg, int cpl)
     if (!(e2 & DESC_CS_MASK) || !(e2 & DESC_C_MASK)) {
         /* data or non conforming code segment */
         if (dpl < cpl) {
-            cpu_x86_load_seg_cache(env, seg_reg, 0, 0, 0, 0);
+            cpu_x86_load_seg_cache(env, seg_reg, 0,
+                                   env->segs[seg_reg].base,
+                                   env->segs[seg_reg].limit,
+                                   env->segs[seg_reg].flags & ~DESC_P_MASK);
         }
     }
 }
-- 
2.7.4


