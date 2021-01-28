Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AF030787E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:46:44 +0100 (CET)
Received: from localhost ([::1]:56940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58ZH-000640-6o
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:46:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58UV-0000QR-9p
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:41:47 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:39774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58UN-0007G6-SX
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:41:41 -0500
Received: by mail-ej1-x630.google.com with SMTP id g3so8113618ejb.6
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 06:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OxiSlNZhRqvdz8D8CqFLTD2O33eubJzrqgRXZJj8j/Y=;
 b=ZkYcj1cRAlQlJVcwRSDi3WCYy7lwZuD3S87GKTO4ZyGo1driqgKnDBdZNVRO2g9hxf
 OStGtHc/uco9VnpG3ZNgNl4hgD0saNmXtF318eAorIWOxINurB/sAsv9PHEsyJ48M/Im
 nhPm3NprcfcnipyqD3QkX3UUC95nxrsvCh5vPMwhA106Iz5Sf4m+lxttSnBPDPGmBgNt
 L6ZvZHN3G6o6xEUJ4GcG4DYszEbP8mMCt5Ad65jWXWVDpc8InAV0fwp23Z2vaUnV3pZL
 nxjgM2DPz1EXixXbqwK2/cWyoAInU+YvFsRhGssm/fz5YQt/UKZ7ERj/Lu8sCkrCKk5r
 3fRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OxiSlNZhRqvdz8D8CqFLTD2O33eubJzrqgRXZJj8j/Y=;
 b=pkHa2vI+XGhWMhcieY0vN3w5ZtM1IlwyjCYEJ6Yg7tU1/5Qz0+RYtEangf9ElwvHLG
 cuizHw6Mx23u9nZ/mz4UMmx6q1O6NKUXJMLiAqSpk/QR8KXXhqzo2qWvxHKAhCI3FdID
 5BozjGOHR1r9IuakqKLAwR6k8RCJPf+LCwAhlKlO+PQ8td6ZBZKTMD+ZRTwAG+/1pq+B
 bqOcOIGNek1HiQYJpqKk838fhGa9NrsqifvDx9aAtMDy+lVJDvwO1y9LkRphQUjkcgu8
 qEBAwzbBGw4dskMrrZWhFS3QthGthHUTaqDxj57xo+h34HafjOIPvZM9oLt0nc7/Ef25
 6/Ow==
X-Gm-Message-State: AOAM532xm+unSppCbgnESdyyRNzsh/W6NDbbzVrGRSeP4wmz3oZ6UL+K
 JWO863dQGuehSwrizbCYz8rcH7zl2yU=
X-Google-Smtp-Source: ABdhPJzKsS9ZmP1y6VsDK1sOVYduUVtuzuHfTEos+u8OZKh8jt5+ndzl521UDHwbx3ADOo+MZ+ZkQA==
X-Received: by 2002:a17:906:6407:: with SMTP id
 d7mr9938453ejm.133.1611844898305; 
 Thu, 28 Jan 2021 06:41:38 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z6sm2392056ejx.17.2021.01.28.06.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 06:41:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/13] target/mips: Remove access_type argument from
 get_seg_physical_address
Date: Thu, 28 Jan 2021 15:41:14 +0100
Message-Id: <20210128144125.3696119-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128144125.3696119-1-f4bug@amsat.org>
References: <20210128144125.3696119-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

get_seg_physical_address() doesn't use the 'access_type' argument,
remove it to simplify.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tlb_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index 1af2dc969d6..9906292440c 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -222,7 +222,7 @@ static int is_seg_am_mapped(unsigned int am, bool eu, int mmu_idx)
 
 static int get_seg_physical_address(CPUMIPSState *env, hwaddr *physical,
                                     int *prot, target_ulong real_address,
-                                    int rw, int access_type, int mmu_idx,
+                                    int rw, int mmu_idx,
                                     unsigned int am, bool eu,
                                     target_ulong segmask,
                                     hwaddr physical_base)
@@ -253,7 +253,7 @@ static int get_segctl_physical_address(CPUMIPSState *env, hwaddr *physical,
     hwaddr pa = ((hwaddr)segctl & CP0SC_PA_MASK) << 20;
 
     return get_seg_physical_address(env, physical, prot, real_address, rw,
-                                    access_type, mmu_idx, am, eu, segmask,
+                                    mmu_idx, am, eu, segmask,
                                     pa & ~(hwaddr)segmask);
 }
 
@@ -349,7 +349,7 @@ static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
             /* Does CP0_Status.KX/SX/UX permit the access mode (am) */
             if (env->CP0_Status & am_ksux[am]) {
                 ret = get_seg_physical_address(env, physical, prot,
-                                               real_address, rw, access_type,
+                                               real_address, rw,
                                                mmu_idx, am, false, env->PAMask,
                                                0);
             } else {
-- 
2.26.2


