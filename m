Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2979D32B7CC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 13:28:35 +0100 (CET)
Received: from localhost ([::1]:52556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHQcE-0005gw-4h
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 07:28:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHQav-0003Pl-PA; Wed, 03 Mar 2021 07:27:13 -0500
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:44343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHQau-0000gF-1L; Wed, 03 Mar 2021 07:27:13 -0500
Received: by mail-qk1-x732.google.com with SMTP id 130so9049724qkh.11;
 Wed, 03 Mar 2021 04:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ONW5B8dL+K7mWJzVOxTaznriLdX5Ax/sh23bCpsoVmA=;
 b=YoIFyyj++D30WuwCv1DI1U/6DUUO+waK0VxxKTmmOCHLngijopb8/kYfA1g0dYdNKH
 kRGGcGbVO6rNJcLUS2Cdv6BhuJBXhJCJw+C+1X/xkinePZTXtvNU7ex6O0Qoc25RFwEF
 aykzGkSovNp0vwKRFxF4acjLN+1JKpipPQtnf/ffGa2BSaWP73MkyI/6yMnioLOzWn32
 n9z1uXzYEY5I5IPx9spr+taJAJPqgnqGizCmV7cVY66+bZfRmtqQUJKGhB9eE+UJ8bi+
 lnGvWkDfiB/9yZ7r6U6N4lsCcxpztITW1Hvd50eWyQoWA/p3IRoR99SfO/jh65yebt74
 9amw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ONW5B8dL+K7mWJzVOxTaznriLdX5Ax/sh23bCpsoVmA=;
 b=Hs9hEuTDqW0gC2tGybD66w6ZJc0BeC31OAelllnIbHFogf/BeVKXk5f6p9eqOYD33p
 XuUdjZloBOlu4jqawEjaiHPe+zhtwEjuk5qIbJJ0tqsswlYz0MBoYdOPyz7E+OIQ0ov4
 WagGC3Qwcu3dOs9xPd/guM3+QM+WLhcbRv219ncpktyC5juFafDULJxpjPac/Awyrouf
 uqNCuIkClF/PR8E5UqIo6Fk9hD+3qTpxRbGhp6fma+e4OKZnz6GaXiep+MPKCbMbn0W7
 pqlxWTYcmc0JRkfUctOJ88BPBi09XNhFeB4w/OFF9AchJBeKXf5sa5UrWsMNO0syw+UU
 3TWg==
X-Gm-Message-State: AOAM532KEgcXZA7iec1yjO+QwS7VARzQDpkLwbzC2iR/6YKIapK4Hpzk
 H8YExFv6l57QlvSLVz3QJBE=
X-Google-Smtp-Source: ABdhPJyjcvMl+pM/MoQDpm/ReVIHhqssmBfeymbMtHuAchXE9a89XXiFGOf+4cZCBQKQl/nWOhFNRg==
X-Received: by 2002:a05:620a:220e:: with SMTP id
 m14mr14007871qkh.303.1614774430725; 
 Wed, 03 Mar 2021 04:27:10 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id x14sm15433458qtq.47.2021.03.03.04.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 04:27:10 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [RESEND PATCH v3 4/5] hw/sd: sdhci: Limit block size only when
 SDHC_BLKSIZE register is writable
Date: Wed,  3 Mar 2021 20:26:38 +0800
Message-Id: <20210303122639.20004-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303122639.20004-1-bmeng.cn@gmail.com>
References: <20210303122639.20004-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x732.google.com
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

The codes to limit the maximum block size is only necessary when
SDHC_BLKSIZE register is writable.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

---

(no changes since v2)

Changes in v2:
- new patch: sdhci: Limit block size only when SDHC_BLKSIZE register is writable

 hw/sd/sdhci.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 7a2003b28b..d0c8e293c0 100644
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
2.25.1


