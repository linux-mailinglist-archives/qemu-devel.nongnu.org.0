Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5779C330500
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 23:29:06 +0100 (CET)
Received: from localhost ([::1]:33020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ1tZ-000068-Dy
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 17:29:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJ1rU-0006ui-AQ; Sun, 07 Mar 2021 17:26:56 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJ1rS-00074Q-TK; Sun, 07 Mar 2021 17:26:56 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 r15-20020a05600c35cfb029010e639ca09eso2673218wmq.1; 
 Sun, 07 Mar 2021 14:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wZgAkdNgYHHPx7xJjD/iFjUKEdSHqpiwnSo8fnDzN4Y=;
 b=FIdkUaV1A183dEm4W+tX1DVeznV8BCvkKmI23ZEblgI8HldsVtHimFa0wa7/1E+4cd
 pAk9cG/Xz3j07v+pXbPfPIF2dOWEGkvYyEK2WVeWK7kBNmL1oazTs2YyhYoXn4NYKYHT
 tK0+g+sc1xpHPQ+xoH6ai5JIX2UpChkoZRCHw2wMcLXT+UVXxU6z/WeYm0UBfJAFvahe
 d0MPzjZW8r+FHl38QujI2D6YX9uXZ+yKXjTocFm4r8Wc1Mz/UlXUh2ww9hIeSz+TZGzD
 cOI0aAyZ+k/21deeYt7Va0EtTI9dO9PocjExeXEpSewxC9X2wgLnFSrb/afx/UXaW/lw
 Y94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wZgAkdNgYHHPx7xJjD/iFjUKEdSHqpiwnSo8fnDzN4Y=;
 b=hH4axenSb5NspQzUc/GKt6rbRHJ9OCOLTSrrd/NJvuKWeywQ8eTg0GWZ65/VLZ5VEr
 31jIUvcrsqzAwP6QycCGLI466HI2QUHVNZL/XQPzAyLVefxaggyJ5FZTLc0+ZqR0+yzR
 9AeYuynG0RfLi1530Xpp6Ir6CjIEI1at8LHZ1s/kzvUl4i2OX68y0m39iUh7DG9XPBiQ
 MNP9CrwBBF9mW+0/i+Gp0JlnTl1R/2chmwabma6hy79NcETSpK8nYkUQw9NgF23wbS41
 B4KFTHF17/tuVFEzFz/KzdwQ2tyMAgIH99Y61vgk2eEpgdGkoGXTkprYGkKD8swqKXU4
 La4w==
X-Gm-Message-State: AOAM532aibscnxId03NbrrXax/eu8v+Swkih5F6Sve/NtRddyphmTImj
 AwOludjXY5+pTVDPmJrZiSVPdiEXI18=
X-Google-Smtp-Source: ABdhPJyrNASPTh86DSEvpDlPLC4lO0ju1nGa3QgR02XuK+f3i9zi7YtwgccaaClSKgGVasKUBvKS9g==
X-Received: by 2002:a1c:4b11:: with SMTP id y17mr18827650wma.171.1615156010040; 
 Sun, 07 Mar 2021 14:26:50 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h22sm15736238wmb.36.2021.03.07.14.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 14:26:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] hw/block/pflash_cfi01: Remove pflash_cfi01_get_memory()
Date: Sun,  7 Mar 2021 23:26:25 +0100
Message-Id: <20210307222625.347268-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210307222625.347268-1-f4bug@amsat.org>
References: <20210307222625.347268-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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

Since we replaced all uses of pflash_cfi01_get_memory() with
sysbus_mmio_get_region(), we can now remove this unused helper.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/block/flash.h | 1 -
 hw/block/pflash_cfi01.c  | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 7dde0adcee7..6c87b584c1d 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -22,7 +22,6 @@ PFlashCFI01 *pflash_cfi01_register(hwaddr base,
                                    uint16_t id2, uint16_t id3,
                                    int be);
 BlockBackend *pflash_cfi01_get_blk(PFlashCFI01 *fl);
-MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *fl);
 void pflash_cfi01_legacy_drive(PFlashCFI01 *dev, DriveInfo *dinfo);
 
 /* pflash_cfi02.c */
diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 22287a1522e..d6d3d94ac68 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -984,11 +984,6 @@ BlockBackend *pflash_cfi01_get_blk(PFlashCFI01 *fl)
     return fl->blk;
 }
 
-MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *fl)
-{
-    return &fl->mem;
-}
-
 /*
  * Handle -drive if=pflash for machines that use properties.
  * If @dinfo is null, do nothing.
-- 
2.26.2


