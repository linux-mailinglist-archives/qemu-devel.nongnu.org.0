Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E74C67B2DF
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 14:02:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKfOz-0002ew-VC; Wed, 25 Jan 2023 08:01:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pKfOf-0002Xa-OH; Wed, 25 Jan 2023 08:01:08 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pKfOd-0007VX-IJ; Wed, 25 Jan 2023 08:01:00 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so1167169wmb.2; 
 Wed, 25 Jan 2023 05:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tm2HfgjxNCIKiUMmVm5C1G/KwgcC7AB6x1Fwz+gWZxc=;
 b=Map46ZWWhIB8ypFmRC8j6jD09Enul8Vs7UtdDpmj95Azbsq7mwyHIqldc8OJpMCavl
 EgitrG3IDwDMInNRLM6CzumZN/fuIQzDiUe8La2Xm/40OqVOIKVyj7tBIIEK1U4Pgqk7
 kZ+F6t6JajTByjU0y/d12fOLPJ3HBeLTkvWIHzbewtzDZnVqkfcZZKCcZx4gTs0FOYSb
 UD5Z6way+Jbj1Jsy3M0ncVWuC525+lynPOfHEB49H80jXwr5DlQwnr0Sc55/jjibO4Bg
 DTTFFB2KP1taE3VpDU0xSHIuyp6cBzqlr1/qHDnD9MytL5k0Rco6cNrU6d+f2KIWdQmf
 15Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tm2HfgjxNCIKiUMmVm5C1G/KwgcC7AB6x1Fwz+gWZxc=;
 b=yWAdlihpujbxhRdeFCkp6tkFEBhwo6x/aY+1Wva19LAe6rVMXrdcx3ib1fk6X6kM+q
 VkdW1HnccwxmrZDt5d7vlvbxKQ9z5Roc+R09/qmS9PtDyvhFY7nPYUhBN8wxuwDpFcua
 c+M7TPBrHdR3NIE22gJxtY55cXEzuPkYb1d5CRXihL4CC/9KNBQ/gPbD4w22CDFfAL3N
 Nc94obOvoKRptShd0a4XOiLDtz8RqgXxHuSU7KbeozRZ9r0bvRL0tsfzx/xhnvEl9KTQ
 AbtRrnm+5Xqqws5YmNgchWkuIIusv7vbx9hjeQGK19eiJaGYCcDB8n9WU5sNrcTHNzos
 uxQg==
X-Gm-Message-State: AFqh2ko856ABHW3Oj6lgKPNPjLbALf0gXFgRKmov5TFGOIj/ZctjBOjM
 FwUT9ixGNwGqAu0mggAk7OvU0DbucBow9Q==
X-Google-Smtp-Source: AMrXdXsOS80jTF/ecIuDAMH8iNQWlDb91Xg8nKHdxrGW1ptMD8YVGncW8fTDWV2/uEIX0Lnhy/t71g==
X-Received: by 2002:a05:600c:3d10:b0:3d9:ee3d:2f54 with SMTP id
 bh16-20020a05600c3d1000b003d9ee3d2f54mr39569863wmb.13.1674651651485; 
 Wed, 25 Jan 2023 05:00:51 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a05600c384f00b003d9de0c39fasm2078828wmr.36.2023.01.25.05.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 05:00:51 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 4/4] hw/ppc/e500.c: Attach eSDHC unimplemented region to
 ccsr_addr_space
Date: Wed, 25 Jan 2023 14:00:24 +0100
Message-Id: <20230125130024.158721-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125130024.158721-1-shentey@gmail.com>
References: <20230125130024.158721-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x329.google.com
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

Makes the unimplemented region move together with the CCSR address space
if moved by a bootloader. Moving the CCSR address space isn't
implemented yet but this patch is a preparation for it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/e500.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index e3b29d1d97..117c9c08ed 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -1022,9 +1022,13 @@ void ppce500_init(MachineState *machine)
 
     /* eSDHC */
     if (pmc->has_esdhc) {
-        create_unimplemented_device("esdhc",
-                                    pmc->ccsrbar_base + MPC85XX_ESDHC_REGS_OFFSET,
-                                    MPC85XX_ESDHC_REGS_SIZE);
+        dev = qdev_new(TYPE_UNIMPLEMENTED_DEVICE);
+        qdev_prop_set_string(dev, "name", "esdhc");
+        qdev_prop_set_uint64(dev, "size", MPC85XX_ESDHC_REGS_SIZE);
+        s = SYS_BUS_DEVICE(dev);
+        sysbus_realize_and_unref(s, &error_fatal);
+        memory_region_add_subregion(ccsr_addr_space, MPC85XX_ESDHC_REGS_OFFSET,
+                                    sysbus_mmio_get_region(s, 0));
 
         /*
          * Compatible with:
-- 
2.39.1


