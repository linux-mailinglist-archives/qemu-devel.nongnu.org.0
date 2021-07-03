Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28EF3BA8E6
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 16:22:52 +0200 (CEST)
Received: from localhost ([::1]:44850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzgXj-0003xw-QW
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 10:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzgUx-00071Y-VY
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:19:59 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:35497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzgUw-0000DM-JM
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:19:59 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 j39-20020a05600c1c27b029020028e48b8fso2569215wms.0
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 07:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xzjbO+5jo6pD19SRnGaYYtwqZATAxg4quF6D0X5U33M=;
 b=ZywkxyBShV2Xh2f2XAB0qHxYfsyCR+4cYbbO4KPLOBhZNUi5N8IUvHmXXpLLLpGYDG
 x7mFmR8mBLBYpFBr6Tx+K7xb5lqcjpAkn89I3ge2zcY877LN4gBJpmJO73xycGDmlgKn
 ONVLlbpuRcFmYqLXgl8ZwU78sBufGkCKENjZipjabfMyb2m7U90PNLJM71/tIrMlwiFN
 2Fu8VS0H0Haq1cyl109SCnImPB184vyNQhiB+HV9XNF440E8yAGc4IAEtsXcCVovfOb3
 6f/XaidcTGIZCG1HwXvHVgcLYXvFCYt8MWPl+HQbu4TbU/IyShljbiyX6D8rX2NLMOms
 mAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xzjbO+5jo6pD19SRnGaYYtwqZATAxg4quF6D0X5U33M=;
 b=UOzOXBso79W3LptW/bs8sw96SzmsGlF2QJq5pKe9C/682zKS/8Iutp4px3fTqAO3JZ
 ljYnPASz0QLrrY/v9cJTFujFIgsR0yc1MjiZKkqxSWkFCJ3NFWPHccPJsYfMfqHemLIB
 NrNYTnpqGYl0hcCZ3mK65c8iAgg8GRfykPRfWJvO+158gYK6Ox9XW2q1QUbnmbxytZG8
 /vfNih2KwhiCFXeLbtgyiwT695kaSgsqmKR+Gf9RVqTLYfha1Biv8jFn2cIjyz5TILeQ
 w1GXqIM9uq+KwoWCxcc3W+6rfqBObpNmTKRsWQEoRdI288HkZt9lpjs5fLLzXJf/PqS0
 03oQ==
X-Gm-Message-State: AOAM531BuKtrIyE7zFLNYj5CeRERW5etD4FdXolUCZLj5taKdc6zz0A1
 JiFOOIsnxGNcNRGXIBQbmQ15+ydI3gjiOQ==
X-Google-Smtp-Source: ABdhPJy7PtXVjwTaet10N95+lFYVk4voZCHYcvSrbN/m08WflyH56XrQYXbTJJerB73XMdv+YWRDqQ==
X-Received: by 2002:a1c:b403:: with SMTP id d3mr5012554wmf.79.1625321996887;
 Sat, 03 Jul 2021 07:19:56 -0700 (PDT)
Received: from x1w.. (184.red-95-127-187.staticip.rima-tde.net.
 [95.127.187.184])
 by smtp.gmail.com with ESMTPSA id b11sm6834846wrf.43.2021.07.03.07.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 07:19:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] dp8393x: fix CAM descriptor entry index
Date: Sat,  3 Jul 2021 16:19:42 +0200
Message-Id: <20210703141947.352295-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210703141947.352295-1-f4bug@amsat.org>
References: <20210703141947.352295-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Currently when a LOAD CAM command is executed the entries are loaded into the
CAM from memory in order which is incorrect. According to the datasheet the
first entry in the CAM descriptor is the entry index which means that each
descriptor may update any single entry in the CAM rather than the Nth entry.

Decode the CAM entry index and use it store the descriptor in the appropriate
slot in the CAM. This fixes the issue where the MacOS toolbox loads a single
CAM descriptor into the final slot in order to perform a loopback test which
must succeed before the Ethernet port is enabled.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Finn Thain <fthain@linux-m68k.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210625065401.30170-10-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/dp8393x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 252c0a26641..11810c9b600 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -270,7 +270,7 @@ static void dp8393x_update_irq(dp8393xState *s)
 static void dp8393x_do_load_cam(dp8393xState *s)
 {
     int width, size;
-    uint16_t index = 0;
+    uint16_t index;
 
     width = (s->regs[SONIC_DCR] & SONIC_DCR_DW) ? 2 : 1;
     size = sizeof(uint16_t) * 4 * width;
@@ -279,6 +279,7 @@ static void dp8393x_do_load_cam(dp8393xState *s)
         /* Fill current entry */
         address_space_read(&s->as, dp8393x_cdp(s),
                            MEMTXATTRS_UNSPECIFIED, s->data, size);
+        index = dp8393x_get(s, width, 0) & 0xf;
         s->cam[index][0] = dp8393x_get(s, width, 1) & 0xff;
         s->cam[index][1] = dp8393x_get(s, width, 1) >> 8;
         s->cam[index][2] = dp8393x_get(s, width, 2) & 0xff;
@@ -291,7 +292,6 @@ static void dp8393x_do_load_cam(dp8393xState *s)
         /* Move to next entry */
         s->regs[SONIC_CDC]--;
         s->regs[SONIC_CDP] += size;
-        index++;
     }
 
     /* Read CAM enable */
-- 
2.31.1


