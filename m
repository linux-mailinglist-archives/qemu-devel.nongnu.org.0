Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1F8306834
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 00:44:40 +0100 (CET)
Received: from localhost ([::1]:56640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4uUJ-0008Sx-SK
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 18:44:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4uRN-0006Ip-3V
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 18:41:37 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4uRK-0008DN-VD
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 18:41:36 -0500
Received: by mail-wr1-x429.google.com with SMTP id g10so3676925wrx.1
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 15:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RURiTY/Wc59G330AGMgU1K21BtflcqCz0oy9kI/xiq0=;
 b=KlKzn0aTrzFB5/wZoJhCGfGh4Ww89xKjp3WMiSriMBZnXBFfG8M0e5ZnsARbVQXcMp
 GY1IWnKX20MFi8t/u5iowRaqCWlYfWkqE10Lm7uEUbTQOOJAn5wu5jKTGnF05eYvN4GY
 XoE0DN4RWseacaUZRO+8voR2lvo6gEeiZegDwegTDKf62tw2Mhj8ujl+MIDs/Ua2LBfZ
 5Smat6wJPS83baUVcf9EYfSzeU5MkIkntXSObiT/K8qsPJ9t2rZF2gnHqq8O9h70wvuh
 2cVBQBr5wC0LpOLbJqc2rMFfOTFq0PsyvII+64SWTuvtClFTjRoTbsEeTUJE4njq7T9K
 sIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RURiTY/Wc59G330AGMgU1K21BtflcqCz0oy9kI/xiq0=;
 b=SinW8SHq3JoWo4HDB9490XDlkejxnMowqZKUYxtxP6st4evEUpeetKHies9aILQeWQ
 joLtwAxmawJhUdF8xqbQ64L0290SYsV+qtdLLX2DtALXrDT/FV8teAkp83SUy/+r5Nc/
 MLKuHBBfN34h8nmne5zXt45NSiai6Alj8aBGmyQ+KFdLXyC0OMfLItfqK+Ac/SGFlKAK
 F4F1jfQxaRFq4EazRT77vUsbORy4ps/IIrmxkQLqSUzVy2pURN0Qog9hC8eM3sGEEPYT
 RY84YxGAzmX9TG23GUUzhpFqy0eicZIMEq3+BYRXqmLAXQayxO80RrC77BNtid6pmqU8
 uKUQ==
X-Gm-Message-State: AOAM532X7S/axwsdgMB9pJv+hbpxuThR6klYFEt73Qi0AkZFKxY+CVZ/
 Oz0kJUgweFOV5TZYFihQDeQdTNmJmNw=
X-Google-Smtp-Source: ABdhPJxWkNLd8VSFsNJyGl30/5ORfHUCYmpXK/ikSzP1rR6Dy3HbToGBPYIXit4s85vQVQV52vPbog==
X-Received: by 2002:a5d:4d08:: with SMTP id z8mr125609wrt.240.1611790892730;
 Wed, 27 Jan 2021 15:41:32 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id y63sm3988603wmd.21.2021.01.27.15.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 15:41:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/nios2: Use MMUAccessType enum type when possible
Date: Thu, 28 Jan 2021 00:41:19 +0100
Message-Id: <20210127234119.3537399-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210127234119.3537399-1-f4bug@amsat.org>
References: <20210127234119.3537399-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All callers of mmu_translate() provide it a MMUAccessType
type. Let the prototype use it as argument, as it is stricter
than an integer. We can remove the documentation as enum
names are self explicit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/nios2/mmu.h | 3 ++-
 target/nios2/mmu.c | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/nios2/mmu.h b/target/nios2/mmu.h
index 4f46fbb82e2..2f4e325a81e 100644
--- a/target/nios2/mmu.h
+++ b/target/nios2/mmu.h
@@ -43,7 +43,8 @@ typedef struct Nios2MMULookup {
 void mmu_flip_um(CPUNios2State *env, unsigned int um);
 unsigned int mmu_translate(CPUNios2State *env,
                            Nios2MMULookup *lu,
-                           target_ulong vaddr, int rw, int mmu_idx);
+                           target_ulong vaddr,
+                           MMUAccessType access_type, int mmu_idx);
 void mmu_read_debug(CPUNios2State *env, uint32_t rn);
 void mmu_write(CPUNios2State *env, uint32_t rn, uint32_t v);
 void mmu_init(CPUNios2State *env);
diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index 2545c06761f..ebe13b89f68 100644
--- a/target/nios2/mmu.c
+++ b/target/nios2/mmu.c
@@ -55,10 +55,10 @@ void mmu_read_debug(CPUNios2State *env, uint32_t rn)
     }
 }
 
-/* rw - 0 = read, 1 = write, 2 = fetch.  */
 unsigned int mmu_translate(CPUNios2State *env,
                            Nios2MMULookup *lu,
-                           target_ulong vaddr, int rw, int mmu_idx)
+                           target_ulong vaddr,
+                           MMUAccessType access_type, int mmu_idx)
 {
     Nios2CPU *cpu = env_archcpu(env);
     int pid = (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4;
-- 
2.26.2


