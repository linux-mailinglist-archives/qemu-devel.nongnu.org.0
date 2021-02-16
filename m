Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A1631C5E6
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 04:52:33 +0100 (CET)
Received: from localhost ([::1]:52424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBrPc-0007ER-Qa
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 22:52:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBrKu-0001eb-PL; Mon, 15 Feb 2021 22:47:40 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:42142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBrKt-0002hg-93; Mon, 15 Feb 2021 22:47:40 -0500
Received: by mail-ed1-x535.google.com with SMTP id z22so10498395edb.9;
 Mon, 15 Feb 2021 19:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CJO8DxU1QoLsfU9lugfwUF5MGKH2/AMCsBzzgg9qF94=;
 b=MlUMCNBpEbTJEh6Nji3441OXFEQffD+WQnVlEzYWqWAIpU/YO5U3dxE210GvMziwAm
 O8ULfd8aezzZWEo6hVq4GABupx8LlFFc1n3niJquT+97084E+E20ulUCjeSY5keSzeXZ
 yaNasKpCFerm83npaqnTukr8sIecai0AJTRkhMWR3X7bc3seLj3MyjaCk4mUqxJLqhqt
 jXLqqpZJ2fwy2cHmcAnHUoNIKrulD0JO9Eu+PtSnaWFj+ewBQKprwWgfgnyY/pdkTGo3
 EUIa3Fj+Bc+QO5aq6yGBMp2UjdcXmMolKe5uf+B9Zh4ZyPFbMEsoHV0Uv7RykzC8oern
 kJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CJO8DxU1QoLsfU9lugfwUF5MGKH2/AMCsBzzgg9qF94=;
 b=s8lzGk/eT65/JRX3z3YofrfLUULRwy0bKvdbRPB2ZFibYwCIDYvFEIVSePeJ/M10dP
 oNY/ShmqDBJlE7IzrwcDBxzmnM2xG9b6CYatwoYbIBKZOcyHoZUQJ+v42P/0ZF3Q1qxW
 TeJgauz5Dhu+9KaYI3Q8T+wTT2wSJqamfBrQ1TmZbtmLHSMVySMZh1UWNUlwiZd05ub0
 Mr9yIfq1MngWtdBaQRl49NMGtirsTXX5TqoorvpOluGiIxwhkpmJqjQQMbkplIUNi6YH
 QHEBqkl65lH2V+2TAaBcm1e+HaHUFQ0WcdY75GHs3Ih7YMdg8o9WC1m6SpxhHM36vaWC
 wgvA==
X-Gm-Message-State: AOAM533jJTSgw44C4hchffbHAuvNytQjwz0Crxryl6tAQiDb+rFsTbcD
 Nvwbg+2x+sUjN65ZhnNzrlYa+nvEbhc=
X-Google-Smtp-Source: ABdhPJzUSUIFVWwsahW2Br/tDkOMgYHFJyB/iqtRxS9gvrrZdMEfuT06GjI6m5ynwMWbA/9snM6E8g==
X-Received: by 2002:aa7:c0da:: with SMTP id j26mr18772464edp.253.1613447257375; 
 Mon, 15 Feb 2021 19:47:37 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id z19sm12837866edr.69.2021.02.15.19.47.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Feb 2021 19:47:37 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [PATCH v2 5/6] hw/sd: sdhci: Limit block size only when SDHC_BLKSIZE
 register is writable
Date: Tue, 16 Feb 2021 11:46:53 +0800
Message-Id: <1613447214-81951-6-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
References: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x535.google.com
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The codes to limit the maximum block size is only necessary when
SDHC_BLKSIZE register is writable.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v2:
- new patch: sdhci: Limit block size only when SDHC_BLKSIZE register is writable

 hw/sd/sdhci.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 7a2003b..d0c8e29 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1142,15 +1142,15 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         if (!TRANSFERRING_DATA(s->prnsts)) {
             MASKED_WRITE(s->blksize, mask, extract32(value, 0, 12));
             MASKED_WRITE(s->blkcnt, mask >> 16, value >> 16);
-        }
 
-        /* Limit block size to the maximum buffer size */
-        if (extract32(s->blksize, 0, 12) > s->buf_maxsz) {
-            qemu_log_mask(LOG_GUEST_ERROR, "%s: Size 0x%x is larger than "
-                          "the maximum buffer 0x%x\n", __func__, s->blksize,
-                          s->buf_maxsz);
+            /* Limit block size to the maximum buffer size */
+            if (extract32(s->blksize, 0, 12) > s->buf_maxsz) {
+                qemu_log_mask(LOG_GUEST_ERROR, "%s: Size 0x%x is larger than "
+                              "the maximum buffer 0x%x\n", __func__, s->blksize,
+                              s->buf_maxsz);
 
-            s->blksize = deposit32(s->blksize, 0, 12, s->buf_maxsz);
+                s->blksize = deposit32(s->blksize, 0, 12, s->buf_maxsz);
+            }
         }
 
         break;
-- 
2.7.4


