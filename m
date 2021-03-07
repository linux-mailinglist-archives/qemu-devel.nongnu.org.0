Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E16C330508
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 23:33:41 +0100 (CET)
Received: from localhost ([::1]:42818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ1y0-0004FL-Kt
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 17:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJ1rH-0006en-3B; Sun, 07 Mar 2021 17:26:43 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:40542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJ1rF-00071V-MQ; Sun, 07 Mar 2021 17:26:42 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so2675384wmy.5; 
 Sun, 07 Mar 2021 14:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l+x3ilWAF4HBxRoA4j1jhis87Mqt2ccHGS29X/ly8xQ=;
 b=lJQbqDxyPL7OkfklQEPEdF4dkq2hcD7h7dD+9+TJj0NzweP2sOTO40MZkYuvOU3OCo
 ZwDaAT8XtuPDTaR6xXniwM9ubHVKhTVASIWMbaVq5nnwsip4YnGqFILk/iYPpeHybRJc
 xII+2OOtuCTQUwB60uIXF6ue/WUD4m4glRwd7pE7laAUMrcSMHmSmWbwKBNIwNW4uJwp
 zmMKRiSylhlmbiGu+kG7wQxT2NeaXM8Il03/hPJSosMmgmQ7ZC3Ql3cnQU4cbUO80q+P
 7EgtKYVKJZYEK0i+eAcyOVqThiWHTpX+PEhQkiT27mMduzYPlAReruG2FgY1bvloSPQy
 12/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=l+x3ilWAF4HBxRoA4j1jhis87Mqt2ccHGS29X/ly8xQ=;
 b=Rs3K/CqDanPujbJi5OrmtcovmXuC13yF+cZQnHr1awg4K5Y6IcsO+Eb9UFvI12n0wo
 HaovkHavrb4L5qpOX8X8OSfNKaLK82K+6KYedMTOZMkyTQIiZNsArtEYtsTt5+gziVtb
 ajhpi9zaR9GYkV7TDhZoD7yHG2izOWwGNsDeauixD/qmtT0JM08+uXDytxjyPW8m5geB
 ZE5gBFLakJzkLv8jdymin7M1/gIGB2v2bkKJCwySY4xWPdD7Xxr5j8qQDHtf0xzK94A+
 cqyAs4dIlhi21VyYuwPosJ8sUP/4CXFI40JY77wTYahBkMRiWBOWS2Nkq7hbsWMnfuiB
 K5eg==
X-Gm-Message-State: AOAM533LOra2hlFTgEMfsen2t5MWHnh5cfBLVR7G7NUIgooXwXpC4erb
 r7QhVV1JYgnbQHbKrGQPnk17UvRcQGU=
X-Google-Smtp-Source: ABdhPJyUhNO/SIB2PXWMtVRQU048vlvq05i9AeNOH5BfX+1XIiVkImWodcADLM3sSQm91Dmr1WSoaw==
X-Received: by 2002:a1c:f702:: with SMTP id v2mr18811766wmh.131.1615155999449; 
 Sun, 07 Mar 2021 14:26:39 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i3sm15276232wra.66.2021.03.07.14.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 14:26:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] hw/mips/malta: Get pflash MemoryRegion with
 sysbus_mmio_get_region()
Date: Sun,  7 Mar 2021 23:26:23 +0100
Message-Id: <20210307222625.347268-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210307222625.347268-1-f4bug@amsat.org>
References: <20210307222625.347268-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
 hw/mips/malta.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 9afc0b427bf..43b985bccf9 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1295,7 +1295,7 @@ void mips_malta_init(MachineState *machine)
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                65536,
                                4, 0x0000, 0x0000, 0x0000, 0x0000, be);
-    bios = pflash_cfi01_get_memory(fl);
+    bios = sysbus_mmio_get_region(SYS_BUS_DEVICE(fl), 0);
     fl_idx++;
     if (kernel_filename) {
         ram_low_size = MIN(ram_size, 256 * MiB);
-- 
2.26.2


