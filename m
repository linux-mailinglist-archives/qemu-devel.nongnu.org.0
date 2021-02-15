Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7658C31BC38
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 16:25:06 +0100 (CET)
Received: from localhost ([::1]:33546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBfkH-0003K1-GR
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 10:25:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBfXX-0007pm-8g; Mon, 15 Feb 2021 10:11:55 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:40297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBfXU-00054T-Mu; Mon, 15 Feb 2021 10:11:54 -0500
Received: by mail-ed1-x531.google.com with SMTP id q10so8436129edt.7;
 Mon, 15 Feb 2021 07:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j74hA88dQlRT5h9AyzKihyhf2yOb2rwfrpA+aown/fQ=;
 b=pX/D1UpnbROkcbZ+6nMOZCkZdkAS1JKk0Z6OrMn04DUGxJVgRY+/iDD17vjqq6j3zJ
 g2LStGj5MvoJn5d21+LtfZqz0g4Tk12UjccO+luccMjm4FfXVtONXrmhrG5Y2lle/7gP
 iC+Bsrp+fROpmtneE0+7fv7Wmg2XTWU3sTrv/8ZwDeFjAfvzBcvdPfwq5UedV9x+F0ZU
 BsUISc8y3AbNyJ8SdNGCijNp3uBMuifwB/Az61MZven18v7nRdm2S2OXBQ3x3TeCuKlb
 iEhQAJj/jRW6ATLtht914iBXJ/S4zk2raeYwE33+avGNXZ8GiJV0K204KNrNBTPcOL+4
 thZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j74hA88dQlRT5h9AyzKihyhf2yOb2rwfrpA+aown/fQ=;
 b=kbK1XazvAoJh9Gli2lfXG5pqOoDlzRNZazCGSmz+ZDrZYm8jb55putOX8diUOojwpo
 onC9CVJeqvmopMMG2CwxwsJO6SVH2QyMG16lLY2A8b0GFrAbK/aA8kGWlK7XEUwXr3+W
 SAhlZq1m2EEJqchvGQRrMrj+AHdatwHMHqUqvsMIh5u58vubWhS2g5JHQO8uRJWeqRZv
 Z5WnD2SnERS+BxGciwUyBe3nbFEoUfu38b77v+GH3a8lp0KprNGAGNtPtduh2vyhh1C5
 pq/e3FO977Rw8FhRFjdy60jL3GjhYyVCk/6/1WG0HnrzEHEVf/wzrKggkyarAyNS325Z
 tl3Q==
X-Gm-Message-State: AOAM532X9jfNSLK8TnPkKNj+8xg45rHqK2QDC4n8Sq2EzeHWEPkK1RO5
 RJPOOtL1Fd+Gcqupby6loDg=
X-Google-Smtp-Source: ABdhPJz+WqQY/h9plbR6IjZ+cSKSI01SM8svwIS2BvGf3C+YpBJcKJESorEfVZrBksnje41GeK6EkQ==
X-Received: by 2002:a05:6402:17e2:: with SMTP id
 t2mr16061759edy.140.1613401910645; 
 Mon, 15 Feb 2021 07:11:50 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id gz14sm10813069ejc.105.2021.02.15.07.11.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Feb 2021 07:11:50 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [PATCH 4/4] hw/sd: sdhci: Simplify updating s->prnsts in
 sdhci_sdma_transfer_multi_blocks()
Date: Mon, 15 Feb 2021 23:11:11 +0800
Message-Id: <1613401871-59515-5-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613401871-59515-1-git-send-email-bmeng.cn@gmail.com>
References: <1613401871-59515-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-stable@nongnu.org, qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

s->prnsts is updated in both branches of the if () else () statement.
Move the common bits outside so that it is cleaner.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/sd/sdhci.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 0b0ca6f..7a2003b 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -598,9 +598,9 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
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
@@ -627,8 +627,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
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
2.7.4


