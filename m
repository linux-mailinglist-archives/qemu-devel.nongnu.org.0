Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C3E330506
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 23:31:30 +0100 (CET)
Received: from localhost ([::1]:38168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ1vt-0002Hr-Bm
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 17:31:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJ1rC-0006X3-Sb; Sun, 07 Mar 2021 17:26:38 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJ1rB-00070K-Iz; Sun, 07 Mar 2021 17:26:38 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so2675318wmy.5; 
 Sun, 07 Mar 2021 14:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IXFyeqK1CTpX3BeruT6hgoEpNJU4XbuAmq1jWxI1ce0=;
 b=sD9qbS0fWhWvt05Ei8vEt3U1rTE+JEYpE7xBlc2nN6PKRyBh7FwOysRoiav1YTgW3J
 J9cJlej7hFd1VkgH7PNjKyhBNIZ6W5WVFL8AaNVBt6593fc+ChvTjFyd+mt0W/At3xe7
 uCtqh1T9io/O6OLYooPIv1P4YwRS+AqogTtvigSXRZMf6hMcub//UqTQQXloCAlmM8Kx
 RiF4a4H3PwotrmsUGTg2tHNtHQ53HRDi97rBBmee59O4XcxQD2JciGp6GBe+Ztm1olB3
 6QVOIcIjt0feq9YbEJO1p21kKhcHjSzNbK2TEUYNFpsPWSYQ5WxmSCREc25C/wc3Bxjb
 xW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IXFyeqK1CTpX3BeruT6hgoEpNJU4XbuAmq1jWxI1ce0=;
 b=ObuFbQZ/NGXXVYbG+GZPoxJoPgfZzD+hX01/tTTaWu5LKj4NsriEaWuTjs1VNGC7z6
 RQspyrAemBUOCw/cU0jyhuKmm560JJWdQw5wR78XX3vRf/zlSxXrSJKRyYShbQGfrdDS
 lBp/Got0XL2+cngnGV3udDZzOVZ5WSatrvm4DpFL+LVxJeNEvEiZVB1+6S/t+eTTqNx5
 /yQpt/DvZuDaaT+J9voTWHwk3O3gRyMRmukwEBbi/Zk6FnBCikYj99vjsUh9M/juLaDN
 zMiqVxGaGSnhqu3XTRnytEYeYYCCEUnobb9yEYe5/1sywNqHBc5sRhmSglpQJctHF7ln
 frQA==
X-Gm-Message-State: AOAM533M71jWSbWX/OSQXdVSsp8mcq4EaKV9DML4hBBctsoA5SwobpqN
 vlFTdZSP1IXxkS4dwOkfMsEmqdXM4lU=
X-Google-Smtp-Source: ABdhPJwEZI9+cwNyR2xYkhawW7HxyYUEpg+gjWEa6EjaudXqiA063myUhNzmeMjW8Mj2LQ3RBNOtiQ==
X-Received: by 2002:a1c:1fc6:: with SMTP id f189mr19409691wmf.68.1615155994040; 
 Sun, 07 Mar 2021 14:26:34 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y18sm7651000wrw.39.2021.03.07.14.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 14:26:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] hw/i386/pc: Get pflash MemoryRegion with
 sysbus_mmio_get_region()
Date: Sun,  7 Mar 2021 23:26:22 +0100
Message-Id: <20210307222625.347268-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210307222625.347268-1-f4bug@amsat.org>
References: <20210307222625.347268-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TYPE_PFLASH_CFI01 is a TYPE_SYS_BUS_DEVICE which registers its romd
MemoryRegion with sysbus_init_mmio(), so we can use the generic
sysbus_mmio_get_region() to get the region, no need for a specific
pflash_cfi01_get_memory() helper.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/pc_sysfw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 9fe72b370e8..caad9cbd5eb 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -297,7 +297,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
                         0x100000000ULL - total_size);
 
         if (i == 0) {
-            flash_mem = pflash_cfi01_get_memory(system_flash);
+            flash_mem = sysbus_mmio_get_region(SYS_BUS_DEVICE(system_flash), 0);
             pc_isa_bios_init(rom_memory, flash_mem, size);
 
             /* Encrypt the pflash boot ROM */
-- 
2.26.2


