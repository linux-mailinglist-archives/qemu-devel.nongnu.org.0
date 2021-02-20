Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A8B320238
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:27:49 +0100 (CET)
Received: from localhost ([::1]:46220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDG7g-0003Vb-HW
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:27:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFv3-0002El-6G; Fri, 19 Feb 2021 19:14:45 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:43130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFv1-0005vZ-BD; Fri, 19 Feb 2021 19:14:44 -0500
Received: by mail-ej1-x636.google.com with SMTP id k13so15046534ejs.10;
 Fri, 19 Feb 2021 16:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ogosMx6+XaZEFs6yOws54HQVGtnw3hfkzq/juj/s7jQ=;
 b=gBf3ZzCmTEV0ZFKUllE88OCt0Dd/WsCJ7NKJ1HcNzRlJw36X64z7xMKCm7QA/cp7od
 svAtTOEpq75lBZ6g6y6EWbOxHPIvun9kFIqEK4Aq1hRrb/bGy+v/Z8YTG4erGK276jXu
 lMK0xog9GC/6NzgyLtifnW9VjpuXmvVhWtvKTvwWMH/va3Wjho1ChrTqPXDvdMlkA4E2
 sR7GhFibCVT+uIqxymdEcS3RhK68H5pZLWXl05YhrgAwMW3fXIjee2eoEhP9vBfOHUGr
 Yy1zhDM7FvgZ8eIzwEKX3f9wPrU46nfWsX3jw1gN/kZPG7PFXfNZorQQgieTb+aJm7/G
 2aHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ogosMx6+XaZEFs6yOws54HQVGtnw3hfkzq/juj/s7jQ=;
 b=bqOGf3/Y1fKyIhhQbYE6bwSPvUbdvy4VZJFdVYeoWczHFnVJRgKH+ch88XOxihAU1r
 0pIzp/ov3fFC+WuObQaL3FMwVpKzJHWsbh4P5Ax0yA2KCjim7b/X02yk+1r5LuWbePGA
 RH6zn72M03dqY9xRf3oAZg9V86AxUMljcT2BKxC0INJLrnvLzlNq5ZOGQWU3FkAT7FnV
 KuoGwDTFkRSI0cnlb0HK+YQaID4dYqzFWBURFFNfWNFOm7DlSxDsKzzuD/iPoNqlMY6s
 CWrvJZ15+NOpo5G86eEWgwPi3qwOMmv8K9V0ismJwMeMTn88zzkQsLUx7OTbbvoWEAPG
 JktA==
X-Gm-Message-State: AOAM530NApYFtbd5fq2PcrGFV527ZO6HJqrEWqUiozaAJFW2Srs0qO3e
 eu4ftI/UdW22U/vjbdn8wi8LgpWMWUk=
X-Google-Smtp-Source: ABdhPJyU3Dt9q1+sEEC2hoQJoYLeWbmwNFtBTNSGfse740BQ4YxaWEJWu+OggTwVSWYGefJQxxO8zA==
X-Received: by 2002:a17:906:a0c:: with SMTP id
 w12mr10867759ejf.211.1613780081250; 
 Fri, 19 Feb 2021 16:14:41 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x21sm5326844eje.118.2021.02.19.16.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 16:14:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/18] hw/sd: sdhci: Simplify updating s->prnsts in
 sdhci_sdma_transfer_multi_blocks()
Date: Sat, 20 Feb 2021 01:13:08 +0100
Message-Id: <20210220001309.2225022-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210220001309.2225022-1-f4bug@amsat.org>
References: <20210220001309.2225022-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

s->prnsts is updated in both branches of the if () else () statement.
Move the common bits outside so that it is cleaner.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <1613447214-81951-5-git-send-email-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 8ffa53999d8..9acf4467a32 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -596,9 +596,9 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
         page_aligned = true;
     }
 
+    s->prnsts |= SDHC_DATA_INHIBIT | SDHC_DAT_LINE_ACTIVE;
     if (s->trnmod & SDHC_TRNS_READ) {
-        s->prnsts |= SDHC_DOING_READ | SDHC_DATA_INHIBIT |
-                SDHC_DAT_LINE_ACTIVE;
+        s->prnsts |= SDHC_DOING_READ;
         while (s->blkcnt) {
             if (s->data_count == 0) {
                 sdbus_read_data(&s->sdbus, s->fifo_buffer, block_size);
@@ -625,8 +625,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
             }
         }
     } else {
-        s->prnsts |= SDHC_DOING_WRITE | SDHC_DATA_INHIBIT |
-                SDHC_DAT_LINE_ACTIVE;
+        s->prnsts |= SDHC_DOING_WRITE;
         while (s->blkcnt) {
             begin = s->data_count;
             if (((boundary_count + begin) < block_size) && page_aligned) {
-- 
2.26.2


