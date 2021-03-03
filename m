Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789E432B6C9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 11:44:11 +0100 (CET)
Received: from localhost ([::1]:51560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHOzC-0007uI-Hx
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 05:44:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHOxG-0006FV-4p; Wed, 03 Mar 2021 05:42:10 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:44169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHOxE-0001FN-Dl; Wed, 03 Mar 2021 05:42:09 -0500
Received: by mail-ed1-x535.google.com with SMTP id g3so29200916edb.11;
 Wed, 03 Mar 2021 02:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AjaG7SFUC789NzbgHP098bim6a7g+oWTdKH7hnce4V0=;
 b=PAIiI5MSsuFvxTjA9h6UsIKjacci8hs1zr5DPHnaZPzc/cThFDmweR+pWKEeYk69ko
 /DpUzQiN3cGtSHk5Dn8RxBdQ+O3cGbshdagPYbUtjf3KYVnw83pjnQzjoVJgRDAcApi1
 wv5DC/jYljasqovZ/JC3FXKEDliHM5jAV2P+00OMdUE00iav7mpK0gvt95Z4Go0rQsOM
 U1D4DKaOYMUgF6sfLA5EYiix+BzCwRcwDfmbZHFEuFCTZ0awiC65mkJnMPbtODt+XlKp
 kZUj1LehRCfQb43nqh9MpBvmPLIyYOLNPTl0P6a0UMAlsSlA4Sj2oj17uwnw6G+zljJ/
 JnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AjaG7SFUC789NzbgHP098bim6a7g+oWTdKH7hnce4V0=;
 b=FDoGyenllezUzzKAWv9kL44/we5aYuxVYu5XcCjmzl9yytGNjystyCwUJm9BbOLPp5
 X7eWFQIYXRRVvV62TIpT/mmqY3uigJlFMMNNkn7S6QXS8nJq1e8FzLIUfJY6N01sIIpS
 CmS6hE3Nl+rLprgRgVWYl9sg/ZQ9W7zG8s7iVwnRe8jDPLmTHRlZdi7fT8KLCxySG7vm
 boWTcIMmXHGLerVjhf66VmCftt/r9EENn+GgCuIYViS7SLqk+loBV+WI52xccQpOGMdJ
 UkgHpGoD1k7OvmE1f6U2PgA1ukxWUczFvsZj/rA4C038P6Bq8u5QfXQOjVP8qTnEYPRI
 hBqg==
X-Gm-Message-State: AOAM532Cr8d8sHVthYe3c/1NtcfPYui6OZZpM2Awee/ztIdm0FcMKhII
 FHEStHYPPjiI1JItT9sEz7NpSSP7PXU=
X-Google-Smtp-Source: ABdhPJyldwIJWyWXGWZ6B1D5c5+aQWs437zuWVyu+10ZbDf9HsSKxf0EKE4CT/Hwp2xwshdHrMTA2g==
X-Received: by 2002:aa7:c398:: with SMTP id k24mr5460160edq.61.1614768126238; 
 Wed, 03 Mar 2021 02:42:06 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id jx22sm19029811ejc.105.2021.03.03.02.42.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 02:42:05 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [PATCH v3 4/5] hw/sd: sdhci: Limit block size only when SDHC_BLKSIZE
 register is writable
Date: Wed,  3 Mar 2021 18:41:27 +0800
Message-Id: <1614768088-20534-5-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614768088-20534-1-git-send-email-bmeng.cn@gmail.com>
References: <1614768088-20534-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The codes to limit the maximum block size is only necessary when
SDHC_BLKSIZE register is writable.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v2)

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


