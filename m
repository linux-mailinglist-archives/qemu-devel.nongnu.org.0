Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B093032FD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 05:44:58 +0100 (CET)
Received: from localhost ([::1]:55432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4GDp-0007Np-Ow
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 23:44:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l4GCm-0006v4-64; Mon, 25 Jan 2021 23:43:52 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:44029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l4GCk-0000Xh-3K; Mon, 25 Jan 2021 23:43:51 -0500
Received: by mail-ed1-x536.google.com with SMTP id n6so18187567edt.10;
 Mon, 25 Jan 2021 20:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=FPiAusrZUTw6PbUEFBf+lpEpV+RyR31e8FuvdErsSDs=;
 b=LYhDjtRPSC9RMPeKhktEnehTatk/DhwT9/aEGt03kKoeid2n4qWDd21BPrMe9Sau8I
 oo/5MsrkyeOv3303ivkDIh6g04vSATZsXRueP7LyxjumhKs9glguFjqHC5bTj6XTin/l
 kW9MD1thDIwSIKL9fn8TWkmSMZOujdYdORRkkcJ6qv9nV5IjYSddZ1FpkQ0tRIJYNZf9
 FBEnBmIOOQdimnVCY0U0S7IFJXngPPJMLsFeb9dHjR8UfRRuH5co4r4JMVwO27yxj4uI
 h0WXXcxDBT2hORcDpt1knWvkvLIep/oYDRCnq1ICTcXTpb2AtlSL6rVsoSSjorKwYX+t
 tggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FPiAusrZUTw6PbUEFBf+lpEpV+RyR31e8FuvdErsSDs=;
 b=RhTEpRoX2YGgRQSmCxbaH8lwRtZ0lHfOyNu8yzS5a6CRwFmzRs79LapG94C0lfjNy7
 c5apNdJQvSeYr6G1JfHRtrQQNBHoQJLgBB2sOec5xfYejjMiyPqTFufF2KXOGKCPnqHi
 YGyP/l10d5lfsxM+bdiK49ASNV68Lxp6cNHYPT2P8xKtEc0eQRuR6H5P4cfQkWiRh2Pe
 j8uW91rnzNtLPHrWgaFE2+j2AN3D1bSbacN+Pk/C9yLZlaK15m84tg/mTnLDooOlmi+E
 kmg4dxDKvnsxp3PD7Q01LErV6rql0fkdSM8jNX3zsDj/xTBezZxcsHDUBSkhKqk/t2ZJ
 6MqQ==
X-Gm-Message-State: AOAM532Boz8psvXyZXS9O62aXiwqlLOT/wy/k135uNAUuMzOFIELdjLw
 l4D2x2jPjPs/dmOT9asnw+I=
X-Google-Smtp-Source: ABdhPJwpkqEzLz2FPVzpM/3rUfUgjV9yDWWhjegoQ2FD3QEWwcp3tShJwkU0t3ZfU0z8HqWPC/0DZQ==
X-Received: by 2002:a05:6402:524f:: with SMTP id
 t15mr3111997edd.158.1611636227697; 
 Mon, 25 Jan 2021 20:43:47 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id y8sm11541970edd.97.2021.01.25.20.43.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 20:43:47 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: [PATCH] hw/sd: ssi-sd: Fix SEND_IF_COND (CMD8) response
Date: Tue, 26 Jan 2021 12:43:34 +0800
Message-Id: <1611636214-52427-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x536.google.com
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

The SEND_IF_COND command (CMD8) response is of format R7, but
current code returns R1 for CMD8. Fix it.

Fixes: 775616c3ae8c ("Partial SD card SPI mode support")
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---
When testing with VxWorks driver, this additional issue was exposed.
It looks like VxWorks has stricter parsing on command responses while
U-Boot/Linux drivers are all happy with exising QEMU CMD8 response.

Based on http://patchwork.ozlabs.org/project/qemu-devel/list/?series=226136

 hw/sd/ssi-sd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 2d08ce4..71911ae 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -178,9 +178,9 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
                 s->arglen = 1;
                 s->response[0] = 4;
                 DPRINTF("SD command failed\n");
-            } else if (s->cmd == 58) {
-                /* CMD58 returns R3 response (OCR)  */
-                DPRINTF("Returned OCR\n");
+            } else if (s->cmd == 8 || s->cmd == 58) {
+                /* CMD8/CMD58 returns R3/R7 response */
+                DPRINTF("Returned R3/R7\n");
                 s->arglen = 5;
                 s->response[0] = 1;
                 memcpy(&s->response[1], longresp, 4);
-- 
2.7.4


