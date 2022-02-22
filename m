Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8BE4C0284
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:56:21 +0100 (CET)
Received: from localhost ([::1]:37596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMbGm-0006dV-Jt
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:56:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMawE-0003Lh-Pc; Tue, 22 Feb 2022 14:35:10 -0500
Received: from [2a00:1450:4864:20::534] (port=35527
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMawC-0006se-0F; Tue, 22 Feb 2022 14:35:06 -0500
Received: by mail-ed1-x534.google.com with SMTP id bq11so18138184edb.2;
 Tue, 22 Feb 2022 11:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EeijvT97pxct3XtQrY7wd6pgmajnCOIp6/PW1V9+uSs=;
 b=Zp6Fh1qF7HC7ykNIoErj9+K/Gjzov3JKBYHUAwrSL0ir6PfjRm8gaDKzLG/1AvkxWA
 XGHEatWJb6kMW6lWyLEbeO33Sz2Xth34iiGw6R4Krf57uZWxhH+zV6bllqyCKTe3xuI8
 yZ/TePO5vYh8lQMx7xrz6MjTOBVGi+dL4OSUCus3L93sbVGuBGulmsVeaCFxVp2954kZ
 cCmYxG/tJRecgoKIKkKCGfO+05G5n+k4N3DcWov/nhWDvU2rT4KysHC4h5TXKqRDQXH9
 dMCKFcFyXE4eZ5PNZeZk9vUD/RiQIeVOTqebpYa21f/EpvuB9SRz/lbItO1M+L0/k0vn
 lhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EeijvT97pxct3XtQrY7wd6pgmajnCOIp6/PW1V9+uSs=;
 b=nbaWEK2WM5Hu9TyOZHwz+nmoMcI3F6H4gGwp53oVupDPt1xA++SEtVM0oCGLAO38pB
 ZnJhleUrWpPipiEB4ggrjBEHAxQ5VTp347bb5QDqpGm0psybyVg0GNZZ7cSPnmSJGstR
 fOOyfFoEeNPKqm77De0mb3NV08y5dOyi4lPyIJzVsDWSDiIKFZBpUrqK8hoOJhMwXIjy
 Xvmi/hTakvG4Dj+WfyCHLzUXl+GTBlfDpqg77/w84mbFS6a9OI6Tww98H7PCL7Qe5cs7
 rYFFaUt1MJmZ1/b+FVy4VjYJV+CoHqj9HMGIk0m5RLduhgBShyhWMHEAmu+cQcSIfXBW
 U8VQ==
X-Gm-Message-State: AOAM530qp5A0ZqhodJ0iTEFtzJd+gUEktURD/eQ5tAp/Ai3WgZGEgEas
 q9A+qyj3McGaZNvVFU5xW/4kitli4fM=
X-Google-Smtp-Source: ABdhPJy+1u0dTwGsG02z+fdZXHDkXh9TUBxQxdUZNhD1p3weZO/+Rn7Md8zS7EUXZXqgjfZgCfle0g==
X-Received: by 2002:a05:6402:198:b0:410:83e3:21d7 with SMTP id
 r24-20020a056402019800b0041083e321d7mr28454796edv.159.1645558502064; 
 Tue, 22 Feb 2022 11:35:02 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:35:01 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/22] hw/block/fdc-isa: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 20:34:34 +0100
Message-Id: <20220222193446.156717-11-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222193446.156717-1-shentey@gmail.com>
References: <20220222193446.156717-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 "open list:Floppy" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/block/fdc-isa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/fdc-isa.c b/hw/block/fdc-isa.c
index ab663dce93..fa20450747 100644
--- a/hw/block/fdc-isa.c
+++ b/hw/block/fdc-isa.c
@@ -94,7 +94,7 @@ static void isabus_fdc_realize(DeviceState *dev, Error **errp)
                              isa->iobase, fdc_portio_list, fdctrl,
                              "fdc");
 
-    isa_init_irq(isadev, &fdctrl->irq, isa->irq);
+    fdctrl->irq = isa_get_irq(isadev, isa->irq);
     fdctrl->dma_chann = isa->dma;
     if (fdctrl->dma_chann != -1) {
         IsaDmaClass *k;
-- 
2.35.1


