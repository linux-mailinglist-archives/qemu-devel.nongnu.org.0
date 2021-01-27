Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98723067C7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 00:23:55 +0100 (CET)
Received: from localhost ([::1]:52918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4uAE-0002ba-TF
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 18:23:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4u8a-00010C-Uj
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 18:22:12 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:50264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4u8Z-0006Fp-Bk
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 18:22:12 -0500
Received: by mail-wm1-x32c.google.com with SMTP id 190so2839242wmz.0
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 15:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uaR1HWYQodSHOqm/Miyng3SlcyOxsAAfxUqWlGYCQF0=;
 b=VTBKgA5IKld8YRDDqG0RjhQ+wEQlpLRhpwP7iuShvOeFsANBBsxvGDvj0CZ4XzzZR5
 PeB2AIU0eq3uBOpumQwgrsVf37VWhauTU0SS3lqIdbB25hTW8ZW7jrMydROk9phMvVvg
 c7hzAF/OQqrV4uQh+A593h9j+AHjcH3kVThhUUivrZs75YKzTti0oiJ4Ztiy583k7xzx
 KOyL9HR1pjHdNppwg/h94dhW8umHOem4xucONhQHb/nBH7KQorspD1DG6vGU1A4YXsQL
 +6UpPNaXZiLz9cHrP+7JGui4Q46dQQG1OAHU0cqP1v+CwTJMqvtwFCp2wHfszIHEx/Gl
 mh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uaR1HWYQodSHOqm/Miyng3SlcyOxsAAfxUqWlGYCQF0=;
 b=MDIUe+lT6MiAZa0R89BMB/fTSslRlWTE3sPsASiG6+xU7iPAS7ubHUzlGhAUa5EtDr
 IOnPSR/T5FiMt21NXFJRxX84o2UWTjsYazSSFWYkKJWWp62UaKRc2LOg2s8E7E+A7tce
 WLUh+X5dWswLxTL4p1EMkt57jvk9n/msG8KOTV4eBOFGCG5YDj3BXpqCDdhQ7UKmsy2i
 P861nKLQCQFdeFm0j4/sa83E+mmpmKDrRlu21OWYpiuzBSIHdJMZn3j2Zw8smvaQ0cl1
 jQPQzncB8o8/SDMSeb9/2NuCR2A4cUVI9dqkM3UMsQfIOiwo/BvIF9Z4/husGpY+V1++
 asHg==
X-Gm-Message-State: AOAM530AybmO895Txil+BRzE265/B4nJgX3WcmOqW/eFLV3/QQfsodjY
 GGcJGmwWH6br5VqgR7Zctc6DNpXCMG8=
X-Google-Smtp-Source: ABdhPJwe/1P/vFM7Ekq/q9Q6VfrctSacQRpMwS3no7nafIfuqZED9rC5iqIjXHey7UtCU7mU34tcIg==
X-Received: by 2002:a05:600c:230e:: with SMTP id
 14mr6040133wmo.161.1611789729590; 
 Wed, 27 Jan 2021 15:22:09 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id a6sm3760308wmj.27.2021.01.27.15.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 15:22:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] target/sh4: Pass mmu_idx to get_physical_address()
Date: Thu, 28 Jan 2021 00:21:49 +0100
Message-Id: <20210127232151.3523581-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210127232151.3523581-1-f4bug@amsat.org>
References: <20210127232151.3523581-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joe Komlodi <komlodi@xilinx.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

get_mmu_address() and get_physical_address() don't use their
'int access_type' argument: remove it along with  ACCESS_INT
in superh_cpu_tlb_fill().

Pass the MMU index along, as other targets do.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sh4/helper.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 4303ebf018b..737938d2fd1 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -331,7 +331,7 @@ static int find_utlb_entry(CPUSH4State * env, target_ulong address, int use_asid
 */
 static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
                            int *prot, target_ulong address,
-                           int rw, int access_type)
+                           int rw, int mmu_idx)
 {
     int use_asid, n;
     tlb_t *matching = NULL;
@@ -398,7 +398,7 @@ static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
 
 static int get_physical_address(CPUSH4State * env, target_ulong * physical,
                                 int *prot, target_ulong address,
-                                int rw, int access_type)
+                                int rw, int mmu_idx)
 {
     /* P1, P2 and P4 areas do not use translation */
     if ((address >= 0x80000000 && address < 0xc0000000) || address >= 0xe0000000) {
@@ -432,7 +432,7 @@ static int get_physical_address(CPUSH4State * env, target_ulong * physical,
     }
 
     /* We need to resort to the MMU */
-    return get_mmu_address(env, physical, prot, address, rw, access_type);
+    return get_mmu_address(env, physical, prot, address, rw, mmu_idx);
 }
 
 hwaddr superh_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
@@ -813,11 +813,10 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
            MMU_DTLB_VIOLATION_READ);
 #else
     target_ulong physical;
-    int prot, sh_access_type;
+    int prot;
 
-    sh_access_type = ACCESS_INT;
     ret = get_physical_address(env, &physical, &prot, address,
-                               access_type, sh_access_type);
+                               access_type, mmu_idx);
 
     if (ret == MMU_OK) {
         address &= TARGET_PAGE_MASK;
-- 
2.26.2


