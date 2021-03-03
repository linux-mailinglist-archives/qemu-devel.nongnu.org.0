Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5436B32B7D5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 13:31:53 +0100 (CET)
Received: from localhost ([::1]:32776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHQfQ-0001Gu-DO
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 07:31:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHQas-0003LH-O9; Wed, 03 Mar 2021 07:27:11 -0500
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:37254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHQap-0000fM-FR; Wed, 03 Mar 2021 07:27:10 -0500
Received: by mail-qt1-x832.google.com with SMTP id v3so17312764qtw.4;
 Wed, 03 Mar 2021 04:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=menJUHN1K7cTAtjs7NSfWpmb0i7usQduiSyTL2YsAzU=;
 b=cDzXfBOQSGCjYbyPy9qSBCBMPGMdOFXCV4pFStvaIWF/TfGsJZ3bVudV/wjDc14329
 2rWDxWRVO2kw6dbGBmMC1dZLij+lbbr34CXeYvVYqoHJ9nsPCgUI0y6NIWvsaZzyAoxX
 rzeiQA5+NToD82RcR5NhVmBQf1XnPAq33LU3ATW3GS+v+hNAzXSmH5vQ8GbNNz4mbN9M
 atJupE2mBY80lvxRvtk7hgOoDNAByRpwuOcAV5mdT9/b+HQNsAo5gpQAblcSuu0CkU3Q
 Ml9X+QDctk6hTWuaX0+pxFyBIDK0q+WSLljUge4ZCM6/MewN54MOrmMrrJLLFJfloHM2
 oi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=menJUHN1K7cTAtjs7NSfWpmb0i7usQduiSyTL2YsAzU=;
 b=FoKRDH1E/zryUWF239ZDKcWK821X1pUhFjliX9Lz7rPd1sWduguLbEV9qWjXS9gvrv
 5wGHID/2/KkleldZmNSWNxgm66XrKdyl/UHu3UNj+HF5CNw95ukdAKhaN5yq3iM6Zd3B
 vcVoiyU4GBY07dL+jLkGm6cxOPkBts2gwt+h1v3pLCRmuVbqXMqVq8g1TRv3sLKhUEV8
 f62BKhq4jreqd8sWdlpdjOBsMiJDnAlaXoeiuE/K39wRzE96gpIh87gPSQNjwccnFl0p
 HkxOCJo8DIahakAv/npcuYvqOVGxB0C/SfpX8nI4NhE3w6BvPE3V7kG3sPFMStfwzuUJ
 MCEA==
X-Gm-Message-State: AOAM532BxQr9UCpCxpA9ymYhIBbFz3nOANoulSCqG9ps9Ou/rInW1WdS
 8boGZKvZETrO8+TYaQQLxvM=
X-Google-Smtp-Source: ABdhPJylWd4AvZwaLcjnMKt97+Atx+WNmJUxw9J6Q/QpuPUcQW1E9mn84OixqEaR+/KJgq6K60heQw==
X-Received: by 2002:ac8:45cd:: with SMTP id e13mr22139599qto.196.1614774425834; 
 Wed, 03 Mar 2021 04:27:05 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id x14sm15433458qtq.47.2021.03.03.04.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 04:27:05 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [RESEND PATCH v3 3/5] hw/sd: sdhci: Correctly set the controller
 status for ADMA
Date: Wed,  3 Mar 2021 20:26:37 +0800
Message-Id: <20210303122639.20004-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303122639.20004-1-bmeng.cn@gmail.com>
References: <20210303122639.20004-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x832.google.com
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
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-stable@nongnu.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When an ADMA transfer is started, the codes forget to set the
controller status to indicate a transfer is in progress.

With this fix, the following 2 reproducers:

https://paste.debian.net/plain/1185136
https://paste.debian.net/plain/1185141

cannot be reproduced with the following QEMU command line:

$ qemu-system-x86_64 -nographic -machine accel=qtest -m 512M \
      -nodefaults -device sdhci-pci,sd-spec-version=3 \
      -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
      -device sd-card,drive=mydrive -qtest stdio

Cc: qemu-stable@nongnu.org
Fixes: CVE-2020-17380
Fixes: CVE-2020-25085
Fixes: CVE-2021-3409
Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Reported-by: Cornelius Aschermann (Ruhr-University Bochum)
Reported-by: Muhammad Ramdhan
Reported-by: Sergej Schumilo (Ruhr-University Bochum)
Reported-by: Simon Wrner (Ruhr-University Bochum)
Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1928146
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

(no changes since v1)

 hw/sd/sdhci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 3feb6c3a1f..7a2003b28b 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -768,7 +768,9 @@ static void sdhci_do_adma(SDHCIState *s)
 
         switch (dscr.attr & SDHC_ADMA_ATTR_ACT_MASK) {
         case SDHC_ADMA_ATTR_ACT_TRAN:  /* data transfer */
+            s->prnsts |= SDHC_DATA_INHIBIT | SDHC_DAT_LINE_ACTIVE;
             if (s->trnmod & SDHC_TRNS_READ) {
+                s->prnsts |= SDHC_DOING_READ;
                 while (length) {
                     if (s->data_count == 0) {
                         sdbus_read_data(&s->sdbus, s->fifo_buffer, block_size);
@@ -796,6 +798,7 @@ static void sdhci_do_adma(SDHCIState *s)
                     }
                 }
             } else {
+                s->prnsts |= SDHC_DOING_WRITE;
                 while (length) {
                     begin = s->data_count;
                     if ((length + begin) < block_size) {
-- 
2.25.1


