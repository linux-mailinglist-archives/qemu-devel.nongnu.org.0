Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 906032E0636
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 07:47:54 +0100 (CET)
Received: from localhost ([::1]:55946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krbSb-0004pM-JQ
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 01:47:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krbQS-0003Vg-K9; Tue, 22 Dec 2020 01:45:40 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:40047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krbQK-0001OZ-HL; Tue, 22 Dec 2020 01:45:40 -0500
Received: by mail-pl1-x635.google.com with SMTP id q4so6924305plr.7;
 Mon, 21 Dec 2020 22:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=d7IOUo4AcRyuLE/rbBKw0HMgY33UrqSXYHbEddqnYjc=;
 b=Baz6mSM87rLV9o7Dfxsh/VXCho3EU1AYzXrZT+fu3oqQJzb7LleA6AfebYV5SvzO3H
 aS3juSd2yLwcrKQiceUyZQdB+ey6jR9kNgmU6tyfMMVsHEW9Xi/8y1DQd+g41C29msrx
 Mn3KIZEvB63JnmAZO7VvenfDi/xr/g+7jADn8Cf76z4KD1cLglry+fqySVKFiw7QMzus
 1ifqn5fYkr9TRUb0B+qw2KpqWSA8unb0RkVHsjLlXbX8mi1lRTltW6KC/cSxLxKKLM0h
 l73RxUhXh3niT6KgKz4NOQWypDEaVOh9oyUcuzuVMuv3uXxsYhnzfngLnmOyAdSBI28a
 9wOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=d7IOUo4AcRyuLE/rbBKw0HMgY33UrqSXYHbEddqnYjc=;
 b=ZgdWP4JbsTrtLxne2zAtCpspuSHHQZEKpjkKcCyRADJ5ByaGirA6vSVt2xkIZyax8T
 g37ETcNd9ed1zhO2z8nUkmlvwGNW8H9ofIgD63uy+KVS9ROCr3xdt6K3e+yS0gtx50K1
 BTMONJfGyTFEsgUP7sLoyj4BS5gOtrwjtoTh0Yj4iR5eBw/JZ9zE472PO4/Td/2Vux8k
 40wXbj2dHqGqrpYUuTGZ7puS8ZLkQd3UhqBC563O7plYCGSSO4LV8YA5/yUcrBfFRAbx
 BbXzsYmCxolw4S9OBg+Qc/YcvYZbfUvWP5278sER4qa2TyHdO38YE3XnFzkqDsHniMz7
 08Ow==
X-Gm-Message-State: AOAM532XNyinlvb0ctwgNdxBV97+isENY7CIBU0NUH5sVsiQ6v+4gCtU
 iay4bk83ZN7iZnkioIqxi0o=
X-Google-Smtp-Source: ABdhPJwyoRTirNN2lVgo/JSoePMn+fPQwQ2KjkyCMc66X0mDxQaxJ4TMb+DshFn0Zj69+znIIlye6A==
X-Received: by 2002:a17:90a:e28f:: with SMTP id
 d15mr20830338pjz.10.1608619530502; 
 Mon, 21 Dec 2020 22:45:30 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id w9sm18311492pfj.128.2020.12.21.22.45.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Dec 2020 22:45:29 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 1/2] hw/block: m25p80: Don't write to flash if write is
 disabled
Date: Tue, 22 Dec 2020 14:45:19 +0800
Message-Id: <1608619520-62782-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

When write is disabled, the write to flash should be avoided
in flash_write8().

Fixes: 82a2499011a7 ("m25p80: Initial implementation of SPI flash device")
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

(no changes since v2)

Changes in v2:
- new patch: honor write enable flag in flash write

 hw/block/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 483925f..236e1b4 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -594,6 +594,7 @@ void flash_write8(Flash *s, uint32_t addr, uint8_t data)
 
     if (!s->write_enable) {
         qemu_log_mask(LOG_GUEST_ERROR, "M25P80: write with write protect!\n");
+        return;
     }
 
     if ((prev ^ data) & data) {
-- 
2.7.4


