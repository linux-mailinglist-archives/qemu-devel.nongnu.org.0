Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF3732F88F
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 07:03:12 +0100 (CET)
Received: from localhost ([::1]:42982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIQ1v-0005NJ-0A
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 01:03:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lIQ0q-0004qB-4i; Sat, 06 Mar 2021 01:02:04 -0500
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:33534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lIQ0n-0004Hn-Up; Sat, 06 Mar 2021 01:02:03 -0500
Received: by mail-qt1-x835.google.com with SMTP id s15so3637210qtq.0;
 Fri, 05 Mar 2021 22:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ll8Okbz5Uij50gPjGOSZvQHfhgX4epjg5WaXEqmkK+o=;
 b=QEdVFFFZuvkunLyt90Yye9iNR2dtA00wqde08BN2FzVx0VFqK6+4wpTJYVFZNj0Cr5
 Pl2OomV7+yALuGGJ/RSKgnCr2lTLlO4zBdXAPW5p39SfqxFK5ubcp6Ab1d0TrkwBfN3L
 UdPfzKDWFw5jPvbmMCr3WGN+KHk9yYGg3Ud7Uf8tc6Mot8ptse57wX4xrtam1iZdnQUz
 +wqkTp/GqvpZS6POzYVhurekjwHT9kc1tuMpo35uPvj5mFw/HG6HQQP5v4SQ4LQnHGE9
 pBf39IYn+ARelgdz8KznTPIe8KyFiHwt8Wiyo5DQOX6qxmt/9EFEJ7wU95qdgO0VUERZ
 j1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ll8Okbz5Uij50gPjGOSZvQHfhgX4epjg5WaXEqmkK+o=;
 b=f87oSJXDR8YrnBPeB38bXD9gscuSJl0vcXLQtAeQ1RjLzj6BMd3K/rhoTw/uFuoxfS
 FDzaWSsl8nY/PJbsGucNJmLMMagi7uBaH0FCBHkVCBZJyRUnXrq8p3qDrpR9mmpVTem1
 ZUSGvq/Ty52Z1nh0Z5/gaYo6ZNzyHFJRpJMMVRYx9q71Amr39haI6j2va7qJI2+LxKYK
 3chr3cnYxAxfUajfklB0Is/ZiDvBI4UZl9sHKVAMTanjn2gpcbqZflueXSwA7AcaPGjJ
 GkwxKsCcva17NGwIMZ2By9TN50XuHp83HrPkfwlN9lMy6slmWBqUl7FCH0yKgVNw69IP
 ChkQ==
X-Gm-Message-State: AOAM533/h3N6mZIizvvwV8zgl7KTQQoL8nE5X5kwFhS7dgbIQ6hqVpCt
 iyXwVfPROcyT49NN/4Hvwsw=
X-Google-Smtp-Source: ABdhPJwfstoLQemv6WurxQnZ28t7TNkM8LSAu0qzFnFwhSqJ8dgZWjanlbFVljySuygu/0sx0ro4gg==
X-Received: by 2002:ac8:1098:: with SMTP id a24mr9561342qtj.27.1615010520307; 
 Fri, 05 Mar 2021 22:02:00 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id e5sm3475068qtq.1.2021.03.05.22.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 22:01:59 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2] hw/block: m25p80: Support fast read for SST flashes
Date: Sat,  6 Mar 2021 14:01:52 +0800
Message-Id: <20210306060152.7250-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x835.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Per SST25VF016B datasheet [1], SST flash requires a dummy byte after
the address bytes. Note only SPI mode is supported by SST flashes.

[1] http://ww1.microchip.com/downloads/en/devicedoc/s71271_04.pdf

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v2:
- rebase on qemu/master

 hw/block/m25p80.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 5f9471d83c..183d3f44c2 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -895,6 +895,9 @@ static void decode_fast_read_cmd(Flash *s)
     s->needed_bytes = get_addr_length(s);
     switch (get_man(s)) {
     /* Dummy cycles - modeled with bytes writes instead of bits */
+    case MAN_SST:
+        s->needed_bytes += 1;
+        break;
     case MAN_WINBOND:
         s->needed_bytes += 8;
         break;
-- 
2.25.1


