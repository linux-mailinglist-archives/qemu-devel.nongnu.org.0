Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29B064ED37
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 15:58:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6C9y-0003xh-Pm; Fri, 16 Dec 2022 09:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6C9p-0003kM-2O; Fri, 16 Dec 2022 09:57:53 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6C9m-00024E-SL; Fri, 16 Dec 2022 09:57:52 -0500
Received: by mail-ej1-x62c.google.com with SMTP id bj12so6646757ejb.13;
 Fri, 16 Dec 2022 06:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M+Y2J9PDP4DZ4iDoia/puViG/9DauPlN51y/+zVmrBg=;
 b=bSgYVQEBucb3IAA+n5YpWx2Oh3MZeFkuyOojYS2S9ws6LAMjAjZI5dLcwV2HifSFkQ
 CxPQ+amtPc+wX5F9QldKQPDHrEzYP3NctlfpWBGnUjgENdruX0vrmdb6d5L6fx7msqAr
 /nSeWw97hD0HpTomxqnK9y9KjUDJSIdTyPYgLp7M4+fAd951RZIjKjoGknARL14F/LyZ
 98wX1Z6i/k5JD3rzAEx0n2I3Jzqg1/G4kAtIxmXYcYxLSelIrCy9JnZj1MvwkafpOerl
 t0t+Y2OwY4RuyMRYeQ0hAYXAQ5rJTyPdHYCB+Wv9XxW6FSai5QXOHB0ZDDCUiZ2oPXS5
 selQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M+Y2J9PDP4DZ4iDoia/puViG/9DauPlN51y/+zVmrBg=;
 b=BN8J4Khf4BPEE7sihpfXVWZepGrbwXbvJN20hWIKFxrMCpRs6JOGTQfNLb/7r4AlpB
 4AeGA71iPdlcpXxsO/Px+Zm9eNJNSqodtnBnNoLIqvhTZgqRW6Fq0sEjG277W/nWeH9L
 VFvsnUZtNkMhw9y0Cotb3VDAB/S5Ukg+8Kn2Qr7h6Y2HJF3DRFo//Wb2h/7qyNe+FhgY
 7eXQXheICtGIRa/6EigTRCyPq/Q9TPenoFKYDhf+5T9wvFDIkSpJEfTwMp7WSux4kzWJ
 fNS5ZSIT9yMHZTHoOgexahD3kbLajVBJySlEQC7fRopX7RNcv/xJIH5aCNRZnyidO5jn
 aQfQ==
X-Gm-Message-State: ANoB5pm1BuR4T1NcVtAXykYnrkCuXM0AKJ28v2NxyfRYRL4VHxtGvEt0
 d6W6wvgGsEKGCmeYGZD9KQZFrL9t/Hk=
X-Google-Smtp-Source: AA0mqf7EtylOk2nnta7VowpXeOBUt/z0+Nkf93makFpS1oTX94E7BmPEFbGVwboQpstFseD7SLT3VA==
X-Received: by 2002:a17:906:351b:b0:7c0:a6a9:64e9 with SMTP id
 r27-20020a170906351b00b007c0a6a964e9mr37948814eja.36.1671202668616; 
 Fri, 16 Dec 2022 06:57:48 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-138-012.78.55.pool.telefonica.de. [78.55.138.12])
 by smtp.gmail.com with ESMTPSA id
 g18-20020aa7c852000000b00467c3cbab6fsm942225edt.77.2022.12.16.06.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 06:57:47 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 5/6] hw/ppc/e500: Resolve variable shadowing
Date: Fri, 16 Dec 2022 15:57:08 +0100
Message-Id: <20221216145709.271940-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221216145709.271940-1-shentey@gmail.com>
References: <20221216145709.271940-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Assign to the outer variable instead which even saves some code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/e500.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index ad83924004..104a85ad22 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -883,7 +883,7 @@ void ppce500_init(MachineState *machine)
     bool kernel_as_payload;
     hwaddr bios_entry = 0;
     target_long payload_size;
-    struct boot_info *boot_info;
+    struct boot_info *boot_info = NULL;
     int dt_size;
     int i;
     unsigned int smp_cpus = machine->smp.cpus;
@@ -938,7 +938,6 @@ void ppce500_init(MachineState *machine)
         /* Register reset handler */
         if (!i) {
             /* Primary CPU */
-            struct boot_info *boot_info;
             boot_info = g_new0(struct boot_info, 1);
             qemu_register_reset(ppce500_cpu_reset, cpu);
             env->load_info = boot_info;
@@ -1217,7 +1216,6 @@ void ppce500_init(MachineState *machine)
     }
     assert(dt_size < DTB_MAX_SIZE);
 
-    boot_info = env->load_info;
     boot_info->entry = bios_entry;
     boot_info->dt_base = dt_base;
     boot_info->dt_size = dt_size;
-- 
2.39.0


