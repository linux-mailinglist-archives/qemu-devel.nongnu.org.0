Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2AB314314
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:37:44 +0100 (CET)
Received: from localhost ([::1]:60192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FA7-0000Wh-Du
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:37:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCt-0003jM-JI
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:19 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCp-0006Ni-AZ
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:17 -0500
Received: by mail-wr1-x42f.google.com with SMTP id 7so18443380wrz.0
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mF4TQkdD5rwh7fw6nl40RAErrcBZ3KqyV7DzoiqBtLE=;
 b=h7RMtcPuytAxZSOilWPZs980d++Kc+epvkZrHHJuDXUqfOHSPkRWb15ws2toE+owRC
 lw7AZ2v2TQ5m/UuxWXY9PZelgcqh6ZKc4GtCDxA3ShtYZvq/LkrR1oGnJAtoGvz65ujP
 iPPnI+RAyN90bnK61i9UDcG+p+5GCn//QPh/7vONc44GHgCquTLzNesQxBJyRAeJQrIr
 zYTNDgmFGjjADF5VZ2GKb1+OSjUn/QL7hJdt29chWkIZB/dLUT4prDRec04w30cD+bmd
 uEH4WOClXJe+Xlpy4ex0XZRXeJD/uX09y1Jv2coGSNHBY4pq+0mrgCV5XVYfvk5hCOXI
 ZbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mF4TQkdD5rwh7fw6nl40RAErrcBZ3KqyV7DzoiqBtLE=;
 b=Lg7gbtaRd7TeBjcHrXO84beGSxGPVEYIiDEhbE1urpRQrccOHT34jaZaTDeU3Md5my
 MDHJz+ulzxz6KjtET9tlkwJ6LYhn+dLqPBX65rrjw7RywUkfs4AbL0Irp6Z7U1oaetcT
 kx3pTwtTxymaiQEHLpuPLI3KG4ITVU4J4TZbfNHEG1zf46GD+HayQmuY8TuDmpqWqkGl
 x9udGjVqCMNHtDXTGnclGNSfi96HQd0rS/nq2GBxlbcs+Dx/zUf8TD7udRhyiuKuhaPP
 aei+6ccjJQJUCswcqL3PZoP/QyrBHtofhFq05BvwyZYZVNGUu+oxBI0l+9jmUK+/ZP+Q
 Brxg==
X-Gm-Message-State: AOAM531tWUdrPQZIUkiT3qtfiuBbF05RSHzvfcnTcr84L9v7LdB8DtHc
 N5diAcqY1yzCcgZdlxUq/7gVm7bBgfPM1A==
X-Google-Smtp-Source: ABdhPJzzfbkyoRVmkhi1abL8NirUPOUWeUnbYTur9TocC/SDRn4YPbP7F264Ce/Bl94vmnIC7U9mcw==
X-Received: by 2002:a5d:6c66:: with SMTP id r6mr20704991wrz.86.1612808652434; 
 Mon, 08 Feb 2021 10:24:12 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:24:11 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 41/46] nvram: add nrf51_soc flash read method
Date: Mon,  8 Feb 2021 19:23:26 +0100
Message-Id: <20210208182331.58897-42-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Lei Sun <slei.casper@gmail.com>, Li Qiang <liq3ea@gmail.com>,
 Prasad J Pandit <pjp@fedoraproject.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Add nrf51_soc mmio read method to avoid NULL pointer dereference
issue.

Reported-by: Lei Sun <slei.casper@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Message-Id: <20200811114133.672647-6-ppandit@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/nvram/nrf51_nvm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/nvram/nrf51_nvm.c b/hw/nvram/nrf51_nvm.c
index f2283c1a8d..7b3460d52d 100644
--- a/hw/nvram/nrf51_nvm.c
+++ b/hw/nvram/nrf51_nvm.c
@@ -273,6 +273,15 @@ static const MemoryRegionOps io_ops = {
         .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
+static uint64_t flash_read(void *opaque, hwaddr offset, unsigned size)
+{
+    /*
+     * This is a rom_device MemoryRegion which is always in
+     * romd_mode (we never put it in MMIO mode), so reads always
+     * go directly to RAM and never come here.
+     */
+    g_assert_not_reached();
+}
 
 static void flash_write(void *opaque, hwaddr offset, uint64_t value,
         unsigned int size)
@@ -300,6 +309,7 @@ static void flash_write(void *opaque, hwaddr offset, uint64_t value,
 
 
 static const MemoryRegionOps flash_ops = {
+    .read = flash_read,
     .write = flash_write,
     .valid.min_access_size = 4,
     .valid.max_access_size = 4,
-- 
2.29.2



