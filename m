Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5AF31EE0A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 19:12:17 +0100 (CET)
Received: from localhost ([::1]:50680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCnmi-00049b-8E
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 13:12:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCnXq-0006Gw-Fi; Thu, 18 Feb 2021 12:56:54 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCnXo-0005EL-Sg; Thu, 18 Feb 2021 12:56:54 -0500
Received: by mail-wr1-x42a.google.com with SMTP id 7so3982827wrz.0;
 Thu, 18 Feb 2021 09:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U4K5mV9Oj6Q7VuTUZ6Y9QWIDTEEDo3vpgGL+EGjUbzs=;
 b=izsRhtu2Ynvx7FgS2WhmdmUvvrf5xRP74YGCGEND0kzGltiroV+RnzoWPCGQCf3zwo
 pMCLhhJYWlmIrMVbRBakEh1gGnWlrClh5TbjmaNqJ80l9k05FG8G7zfwr3c6x0Grzx1s
 1xCHu2n7+AhbPgcEe6ALwczDLqQJO+cWjeA68y1MYmX19Mt0LgMa4aJCZ3dx4EwW3Lc7
 xUxkABjhJqcjTUhOh5bjkSDM9kFAwDm9MmeQ0nqySk9V4heoRENeD7ijrFP9g89k8SdX
 Khgb8x2Wmn02tElL7r+ixFAgYpeJ6hcuef9a4jnOvb2uZpDRcKrSJk1p8mPDYdLUXMkB
 EMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=U4K5mV9Oj6Q7VuTUZ6Y9QWIDTEEDo3vpgGL+EGjUbzs=;
 b=LIcENZCavCW+YXRsOBDIWCTRiTv62qBirvv1nGu7egXoeY+yJ0VG2tPNQ4qXsMGlGu
 3oCHOOZe12nWz4XFVPgNSRmo8Ixsq1Gn4+XBpPPsLkHz1DMoTlF0pi27g6M1wiURIjtZ
 URRuznkG9hLPLWJm1fA+0ZnnskS+D+6yJ6T1+jcfSpEThkAffnkclufDKS3qve1GjbCP
 uRDuDOd8SMxB8KloI8lnSADcv9MYBG9DmjJ6Lnm6FLX1TFDMfl/ES0CpKl7qgJJ3Ll7C
 qr4TRSNGL1mmGrL//C4E1kWbQb38zjUt9pi3+e1JbGZzVB2HAgd2vwMGiRc3BxmP6hj2
 tRRQ==
X-Gm-Message-State: AOAM530NQffxltE5y/XvObfwa1835VHISBcFtoS5c6xySkGUiYBpP2O0
 VBxuk71vUQVS8H/2gmtWYlwPCpnIBxQ=
X-Google-Smtp-Source: ABdhPJxfaL6jMMgyQe5CI/4N6F7+kwudKxpEBLsyCd5M1EGHngXH1KTAFT0M8LnJ9R5hLRfmfTRlhA==
X-Received: by 2002:adf:f905:: with SMTP id b5mr5204767wrr.129.1613671010785; 
 Thu, 18 Feb 2021 09:56:50 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v12sm10813669wrv.69.2021.02.18.09.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 09:56:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/sd/sdhci: Report error when guest access protected
 registers
Date: Thu, 18 Feb 2021 18:56:48 +0100
Message-Id: <20210218175648.1636219-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SDHC_SYSAD and SDHC_BLKSIZE can not be accessed while a
transaction is in progress, see 'SD Host Controller Simplified
Specification'

  1.5) SD Command Generation

  The Host Driver should not read the SDMA System Address, Block
  Size and Block Count registers during a data transaction unless
  the transfer is stopped because the value is changing and not
  stable.

Report guest intents as errors.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Based-on: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 5b8678110b0..98928c18542 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1136,6 +1136,10 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
                     sdhci_sdma_transfer_single_block(s);
                 }
             }
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Transfer already in progress,"
+                          " can not update SYSAD", __func__);
         }
         break;
     case SDHC_BLKSIZE:
@@ -1163,8 +1167,11 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
             if (blksize != s->blksize) {
                 s->data_count = 0;
             }
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Transfer already in progress,"
+                          " can not update BLKSIZE", __func__);
         }
-
         break;
     case SDHC_ARGUMENT:
         MASKED_WRITE(s->argument, mask, value);
-- 
2.26.2


