Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAE73339DD
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:23:49 +0100 (CET)
Received: from localhost ([::1]:40562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJw0K-0002aO-6W
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJvpa-0001OM-8r
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:12:42 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:45442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJvpY-00073a-LB
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:12:41 -0500
Received: by mail-ed1-x52a.google.com with SMTP id dm26so27098413edb.12
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 02:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=+blp/Z6sDaZhi7CWJcTK5u4ylxWQZLR1Fg3/VNTa5MU=;
 b=fceYT15FKdVYNOY7+CFEHQEPVjb9UZJgHwktWhcfhMmPBTSeNOvkHDAj+9pVZ7yAmK
 VMnmD49VRVdU0M+8X69F4rc3t01K6rS5Lkanfq7tTLNHPr6WIRVy0oylM6p63Z/+K3WV
 2ZIjMymPFWQm5GaqzIj/LOqCxLuX4jZ3GYxmDtrI6vQq2mwz4Klec9iStPiZepki5/SD
 UwZM4dxLBzcFiMloukeHlx6tzGWybnAkxOXUttrQfEBh+sS9Gt27yRz7zxJYPRLIUAsx
 a0brbOrvYStJsUb8mpXLpAS0tQ2Qmbi1Wcdv/l/JLvilgelNmjWsqPB+XJHSkxD5539u
 Md/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=+blp/Z6sDaZhi7CWJcTK5u4ylxWQZLR1Fg3/VNTa5MU=;
 b=Na/nkELhJGH871asHd/TzKWtKFDhvr1rtH3HnlHOY/JyTxJMkOtegB1nFU5V7dqM+s
 Uyqn1AoHw8iU/oDRHB26Z8+ewu2L98/dEoyeIIJuyMfltJZFteAhcWaheRxk2Z+/Gcp3
 9wf28KPSHy68daFTjuk2LnuefuYf08N5Er7K52bZXXx2/Un5DFOEFao0BNiCP2ldiFM/
 nbdoqFMQfWK29I1jnfpRemlReYmhxWxjwmpVRfXPt2j80L340OLtUYwS9AGubKIfQjIU
 kfRCEtmWcfrqaLEjsEFW8bEVxGH0jTzbTjbz89Z9KuTDYZgnG+u5q0t5FsYdLEopLGeX
 PrBQ==
X-Gm-Message-State: AOAM530oIlU48gAvDlW9GcGL/bSrYY6jtHt+kG2+PRRX9taUVF7IEpce
 CyHx4L8Fia6PFdM7noH2vLkuy4asGEA=
X-Google-Smtp-Source: ABdhPJwZ6JL7YjS0Lt3YUizkH2OcblBvszvbVRZExnLg92YaKlA96RR5tPy5hBUUB38k0HUgeS6H9Q==
X-Received: by 2002:aa7:dc0b:: with SMTP id b11mr2447574edu.124.1615371159562; 
 Wed, 10 Mar 2021 02:12:39 -0800 (PST)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id n26sm5966864eds.22.2021.03.10.02.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 02:12:39 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH 09/10] hw/net: sungem: Remove the logic of padding short
 frames in the receive path
Date: Wed, 10 Mar 2021 18:11:56 +0800
Message-Id: <20210310101157.15136-10-bmeng.cn@gmail.com>
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

 hw/net/sungem.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/hw/net/sungem.c b/hw/net/sungem.c
index 33c3722df6..3fa83168db 100644
--- a/hw/net/sungem.c
+++ b/hw/net/sungem.c
@@ -550,7 +550,6 @@ static ssize_t sungem_receive(NetClientState *nc, const uint8_t *buf,
     PCIDevice *d = PCI_DEVICE(s);
     uint32_t mac_crc, done, kick, max_fsize;
     uint32_t fcs_size, ints, rxdma_cfg, rxmac_cfg, csum, coff;
-    uint8_t smallbuf[60];
     struct gem_rxd desc;
     uint64_t dbase, baddr;
     unsigned int rx_cond;
@@ -584,19 +583,6 @@ static ssize_t sungem_receive(NetClientState *nc, const uint8_t *buf,
         return size;
     }
 
-    /* We don't drop too small frames since we get them in qemu, we pad
-     * them instead. We should probably use the min frame size register
-     * but I don't want to use a variable size staging buffer and I
-     * know both MacOS and Linux use the default 64 anyway. We use 60
-     * here to account for the non-existent FCS.
-     */
-    if (size < 60) {
-        memcpy(smallbuf, buf, size);
-        memset(&smallbuf[size], 0, 60 - size);
-        buf = smallbuf;
-        size = 60;
-    }
-
     /* Get MAC crc */
     mac_crc = net_crc32_le(buf, ETH_ALEN);
 
-- 
2.17.1


