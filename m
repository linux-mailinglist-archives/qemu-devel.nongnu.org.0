Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 170A5326108
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 11:13:51 +0100 (CET)
Received: from localhost ([::1]:44456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFa86-0005Y3-1z
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 05:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lFZy0-0004Tk-V5
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 05:03:26 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lFZxy-0003BO-J9
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 05:03:24 -0500
Received: by mail-ej1-x632.google.com with SMTP id w1so13813842ejf.11
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 02:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cvh9q9jShUm90b680zacQW5v3lxe1KF1xWzOx2ZWZx4=;
 b=fHWYqIRMPrA6xp1pdI87qpGk/L+MizuHWtiX12sQYU66zLgQW+ziUga8Mub3M3OLCx
 TH81MZxu61Kylx7S4VpGZ7w+dU8Qle8HmGtjEyx8WocGsaHDlNw8ArK3iWmJ6MpzjcPg
 7gVKW4fQ/Mo3uUAaiSJ1h2b7EjmyA76bUTUzMREah3G6iR92NPvZ2Uzx7pQDzPC0PNaU
 Np554iTK20PWlZ6Moi4c4/k7qVKSMvD7JiNY4+Lkc5rVQpUlRV9kH6M0i2gM2yDZFm+z
 0KqSstFbWtyuvqZA49C7XeaYKcAJYu1qvjkhX/ShpYR8eH7bppPnQwQ+skMwrFHyscfS
 9+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cvh9q9jShUm90b680zacQW5v3lxe1KF1xWzOx2ZWZx4=;
 b=O5e2Fk2kMZ4cLvywzhfj1x475dDAUNioouSmDRkDbYgHaqwB/0D5dq26yK0kP5qhea
 2hP4xLzDw+Ju2fmwDSl3e0KgbAAtDUWGVnYuaEp7XLu5F03hTjlMY+R7WsZQJk6bGAji
 Z4/BEp2h+cOTJ5jz6mjUIW+38FQ5r+zhVYdvOPxqP4t8stt1kH4IwPStnkst0CvtGvhP
 eiwgPDDjlO6V5yFDNzHRU1hrKsAF0nIyvYDY0F9HzTaV8ZZBXvmntjbSqK7tkQTGmlU/
 +IddY+lP0MybcsF9XmmFXrekVXDEYaesyS80yLPr3lwZLSWIETdJwJnhiSIDilY2ct1U
 7t3Q==
X-Gm-Message-State: AOAM532W/EWF3KEVL4GspFDTbasnygb2wztdJjo4k/6QD+C2f3VIBOLX
 D1EbExZRvKfx8ZR8lJ2rjy4=
X-Google-Smtp-Source: ABdhPJxys/iyEq5OBkHD2aihByM1xsJhp5t97FpxqC3cfb4eHozZaSybVHlWaJNzWgsiFW0BYj8EdA==
X-Received: by 2002:a17:906:dbd0:: with SMTP id
 yc16mr186858ejb.71.1614333801288; 
 Fri, 26 Feb 2021 02:03:21 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id a26sm5667554edm.15.2021.02.26.02.03.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Feb 2021 02:03:20 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [RFC PATCH 2/3] Revert "e1000: Pad short frames to minimum size (60
 bytes)"
Date: Fri, 26 Feb 2021 18:03:05 +0800
Message-Id: <1614333786-74258-3-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614333786-74258-1-git-send-email-bmeng.cn@gmail.com>
References: <1614333786-74258-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x632.google.com
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

This reverts commit 78aeb23eded2d0b765bf9145c71f80025b568acd.

The short frames padding is now handled in the QEMU networking codes.
Revert this workaround in e1000.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/net/e1000.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index d8da2f6..8edc2e7 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -898,15 +898,7 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
         return 0;
     }
 
-    /* Pad to minimum Ethernet frame length */
-    if (size < sizeof(min_buf)) {
-        iov_to_buf(iov, iovcnt, 0, min_buf, size);
-        memset(&min_buf[size], 0, sizeof(min_buf) - size);
-        min_iov.iov_base = filter_buf = min_buf;
-        min_iov.iov_len = size = sizeof(min_buf);
-        iovcnt = 1;
-        iov = &min_iov;
-    } else if (iov->iov_len < MAXIMUM_ETHERNET_HDR_LEN) {
+    if (iov->iov_len < MAXIMUM_ETHERNET_HDR_LEN) {
         /* This is very unlikely, but may happen. */
         iov_to_buf(iov, iovcnt, 0, min_buf, MAXIMUM_ETHERNET_HDR_LEN);
         filter_buf = min_buf;
-- 
2.7.4


