Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEB232606F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 10:48:28 +0100 (CET)
Received: from localhost ([::1]:37776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFZjW-0003bX-Sq
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 04:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lFZhR-0002k5-Lw
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:46:17 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lFZhN-0002ox-En
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:46:17 -0500
Received: by mail-ej1-x636.google.com with SMTP id u20so13743651ejb.7
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 01:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=KNYu58KHxWwA2wIe4BBHxrId54pB6VsSHUwDSELeuJw=;
 b=lU2mza2sfOlVkg2r0fpL6Bmts9MyJ/N/G7yCEnpoJrAad1ZxoMEFj2chJWNNAiO4nw
 lV4uC7oHu6k1f4xZzJRLEgjHZueAsOnfS1DUQxzCa02U9SBF5d5pjf4y73WB9xC6gi1D
 gZkUawMxbREJW9aZOIaRZCUvaRS0xUv8aoGKFTV+AFf/8c+KVJX/sn1+yW4WdAeerpux
 YfbYFSIvJoKSxzmBcsrDISxO3jMAyZTQEBdVShDYtxukyj9VyBGp6jfRiQXSNHkaeVgV
 8BQm9tnK1mEaK9DBuYylga2AI3jjT7YGQSKRddZExs1ZLIajm8ylrf+RYtJV49XYpFm1
 If3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KNYu58KHxWwA2wIe4BBHxrId54pB6VsSHUwDSELeuJw=;
 b=fTBKEdUa8faaVLHKf/SKXxC6a2g6wsTtWh4AIvRbu7vYSdrslP2bf6MJjhG6TwQzOo
 o09+NZ3p5dRfili9Or5OJrGcOoWAtZrjx7WIkyn3tsPXiLe0RaYyz4GBUyUW37ga1CE3
 +0SXuSd0D3nyZMd7tUse8X3dR01C/J6uCfOnxfbL/EcRPUDBjtweX7Lj0K+ibbPnt1iF
 q80ZmdbL8Nsx9FmIKeXKfdDvGYnSl0/8wgCWMH0iHSFSZy83P5w7bBqU6ZuN0Kku/sYB
 lxSPAMz0jb8b8lbFmmrI554oXGtjGWuiAQeG2zJlZaZ7hs5zQY08extONk3BttbZcu5q
 4uXQ==
X-Gm-Message-State: AOAM531vilhA2oy2wVWm7PspQm8bx5mW4OWOMB0h+tCsEOPVxKQ1kUJ2
 zfJM4xcHLHhHB02w37+woHc=
X-Google-Smtp-Source: ABdhPJwj8fxAwWY5rhsDawNBtQJiOswQIXNsJzYKy85V0ZEUwY6gs5kHpwWiyPC1SKJxMlbrvvCCHw==
X-Received: by 2002:a17:906:184e:: with SMTP id
 w14mr2478487eje.56.1614332771789; 
 Fri, 26 Feb 2021 01:46:11 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id r5sm4793952ejd.113.2021.02.26.01.46.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Feb 2021 01:46:11 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH] net: Print the packet size in the debug output
Date: Fri, 26 Feb 2021 17:46:01 +0800
Message-Id: <1614332761-72810-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x636.google.com
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

Printing out the packet size is helpful during debug.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 net/net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/net.c b/net/net.c
index 32d71c1..b038370 100644
--- a/net/net.c
+++ b/net/net.c
@@ -641,7 +641,7 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
     int ret;
 
 #ifdef DEBUG_NET
-    printf("qemu_send_packet_async:\n");
+    printf("qemu_send_packet_async: packet size (%d)\n", size);
     qemu_hexdump(stdout, "net", buf, size);
 #endif
 
-- 
2.7.4


