Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EAD344D2C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:23:24 +0100 (CET)
Received: from localhost ([::1]:43352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOOGx-0004FW-Ir
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOOAY-0007Qo-FI; Mon, 22 Mar 2021 13:16:46 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOOAW-0000Qq-PH; Mon, 22 Mar 2021 13:16:46 -0400
Received: by mail-wr1-x435.google.com with SMTP id k8so17958394wrc.3;
 Mon, 22 Mar 2021 10:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YLOYqak8FH/Oy3wkw1CvXecOB1ns32LF4jnKjXataKE=;
 b=qOZde7UGHg+ylofNVFwHrY1IcuggeWMt82llp3E7ouKux3icKMcmDszezpOD+e8Nqk
 TbQBhvrP1xhgYe9R99v+o+CYlQqDCtG1rPdaO50Bds6M8vAHsEjCkqoH9XCpRlykwtCj
 2Bj3X6LepoqeVqqFc8516PjE3PPz9qqMaA1DXo8qbJGKLo0SU8WWspBTxUxiJksMiJQY
 1c1OhqvpfC3E3U52nwszyhqmSEULlpl/6mYiGnTK1+C9ToKYduI1UpvVOn48OQnA/eGa
 qcXijM09y3EsodchqSfO9R9pTaBhgOy7hO4bKSptGSzfc4mhSQErP5OoT/cT2M9n1nL2
 UCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YLOYqak8FH/Oy3wkw1CvXecOB1ns32LF4jnKjXataKE=;
 b=IugdyV299hhh04Mz1CDGfMxzIRqCZF0ib+7+W4XvK3EL12tPXslu5jgKX7s9SmNOfD
 V9AUoX2wmGT0RZJtCBlIcGswzKS0MiwM3hLHPz2zfy6Yz3A3xkEGkFdWsJBXOaW3LZfa
 iwO2zpTGXPaYT9ycFPJGsbwUI2ZkLn1BxGhQyNls8Y6c5kV0WFGrGpKCKIbZ0Wpje/Uf
 CxLClV0BbI1g3mjUWQUVCFzpicyOfCp+kcSxBGCvEuuTYmIcKDuj5IT2GXqmSgRBuxZa
 eQA1h74w5ynA+k4TGQAzqM89tUvq0Z/f1859M1bC3JIew6gQIEvEaY8kP7Rr1wW0wfcG
 6ZlA==
X-Gm-Message-State: AOAM530hhM+nyth4HU5QBT4K0/qJiD1B2DPBnIJjvfWt2wYFuGxFn3XL
 p86N6FMJ5ZHyMX/1yzEGGXb6YOckZ1mbzQ==
X-Google-Smtp-Source: ABdhPJyi6H/GJyGS9HlD7l7tHfQrN9bdkJb7fcQMA0y4nG6G2xl/65iDHZ4H/kWuH5YDr3y0H7mYSQ==
X-Received: by 2002:adf:e791:: with SMTP id n17mr579784wrm.322.1616433402744; 
 Mon, 22 Mar 2021 10:16:42 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id b17sm20175272wrt.17.2021.03.22.10.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 10:16:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] hw/sd: sdhci: Limit block size only when SDHC_BLKSIZE
 register is writable
Date: Mon, 22 Mar 2021 18:16:09 +0100
Message-Id: <20210322171610.4183696-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322171610.4183696-1-f4bug@amsat.org>
References: <20210322171610.4183696-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Simon=20W=C3=B6rner?= <contact@simon-woerner.de>,
 Bin Meng <bin.meng@windriver.com>, Muhammad Alifa Ramdhan <info@starlabs.sg>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>,
 Cornelius Aschermann <cornelius.aschermann@rub.de>,
 Bin Meng <bmeng.cn@gmail.com>, Sergej Schumilo <sergej@schumilo.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

The codes to limit the maximum block size is only necessary when
SDHC_BLKSIZE register is writable.

Tested-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210303122639.20004-5-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 7a2003b28b3..d0c8e293c0b 100644
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
2.26.2


