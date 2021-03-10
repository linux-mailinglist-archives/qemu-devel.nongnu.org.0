Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702B0333A13
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:33:10 +0100 (CET)
Received: from localhost ([::1]:40410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJw9N-0005yW-GS
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:33:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJvpW-0001Hb-Sj
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:12:38 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:42003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJvpV-00071f-Dr
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:12:38 -0500
Received: by mail-ed1-x52a.google.com with SMTP id v13so27147238edw.9
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 02:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=T3ctX4Zss8EX9is1InNFvRPjfz7K3KaTlyGjPD5l1Sk=;
 b=B0jXGmUev96EpafhUJZ1Ml+OpG6a70RKeozIhx21697hb7XYE7oDjoO7EMCToqcLqN
 wywiwXHMHraN86959ij9UBn9fSD6V9mnsl59+UmUP//ecDPxqrSpUX8lR2zJl37XqVXZ
 VHsEeo5iw2xuzi26EFYIbF/tuLCvSsz1Pj7+cGwrYOc44KvtRvdVSiItCwxxTv54tei6
 X5blEAK3NiKLOgflU1jMXqBmxaZ9Z9X0CLiYY1s72lbruaG8huVu+hZ2WtR2nxpJHlW3
 b5BYY+YdvohwJZY/hmUPIAh+mgUMf+d84YwEPlCJ9iOnKny/x0svVyXVjUkTSYiew1rQ
 Jsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=T3ctX4Zss8EX9is1InNFvRPjfz7K3KaTlyGjPD5l1Sk=;
 b=CWrix3wm+JxGXQjmKE1wxbzJ2nQPL1FiRy9BxcLRmIVHkIq6P2i7bMAZtDKReGD4zR
 lEzSyhbmMf91bVd/TxDizrDnAFHzsB7ji8jlzteuGMDZbqBc8q2pzKqKb5t9eMrqQXMM
 cXXN7zkkcr9lJyuYIfj4DDBetcl5bgIgZaiX/NQWPm8IOstJlsW4sPLzuOJFu+GlI2qj
 YBbxFCwxgzifw+RURijmv7/i7Ncxu8PJdBgTnfuHb3gc01sEAsyPr474V+zOh0drgYqa
 NzueRBD5aXXzDtjSBK7uD+B7/iTouqvdJOHIFaqKbMW9OGQKKFXVzNBmiLgrO8mx6Sus
 JIvg==
X-Gm-Message-State: AOAM531PASSuxawxPPm6qlGJD15YFmOH6xV04ABh/c5LpuPq2hJd0PUx
 xKWvDY45oKs8hOAQb3ieacU=
X-Google-Smtp-Source: ABdhPJxQ1pDBIRCMz82vliTr6tTXYTcLaRe+2qR2ZMtpKRY7+BsR3Wc2BEit5eO9p2FU7yHIjSfqxA==
X-Received: by 2002:aa7:d54a:: with SMTP id u10mr2430264edr.316.1615371156174; 
 Wed, 10 Mar 2021 02:12:36 -0800 (PST)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id n26sm5966864eds.22.2021.03.10.02.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 02:12:35 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH 08/10] hw/net: rtl8139: Remove the logic of padding short
 frames in the receive path
Date: Wed, 10 Mar 2021 18:11:55 +0800
Message-Id: <20210310101157.15136-9-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210310101157.15136-1-bmeng.cn@gmail.com>
References: <20210310101157.15136-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/net/rtl8139.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 4675ac878e..cbfe29a286 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -827,7 +827,6 @@ static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *buf, size_t
 
     uint32_t packet_header = 0;
 
-    uint8_t buf1[MIN_BUF_SIZE + VLAN_HLEN];
     static const uint8_t broadcast_macaddr[6] =
         { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
 
@@ -939,17 +938,6 @@ static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *buf, size_t
         }
     }
 
-    /* if too small buffer, then expand it
-     * Include some tailroom in case a vlan tag is later removed. */
-    if (size < MIN_BUF_SIZE + VLAN_HLEN) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE + VLAN_HLEN - size);
-        buf = buf1;
-        if (size < MIN_BUF_SIZE) {
-            size = MIN_BUF_SIZE;
-        }
-    }
-
     if (rtl8139_cp_receiver_enabled(s))
     {
         if (!rtl8139_cp_rx_valid(s)) {
-- 
2.17.1


