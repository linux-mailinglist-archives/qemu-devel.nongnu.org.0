Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6C233CFA9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:22:16 +0100 (CET)
Received: from localhost ([::1]:45582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4xz-0000QI-I1
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pq-0002oK-Sq
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:50 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pp-00082u-2R
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:50 -0400
Received: by mail-ed1-x530.google.com with SMTP id w18so20401787edc.0
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 01:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=8/C9/LzvDyZp6/9+sMenMqZa9EJuFC9jwr8igSt0+vo=;
 b=rOzVRvi75EdkipCk/ytEV3KvXw/rvDcLt+wyBqdweqB8GwkDNmq8pOH8mSLJJ/QIqR
 6/FkQlGsNZtwSYdWgHiTTHow+Pb8NPMSxswkkNDX5OzsefIatNCcrK5Bh2z8EQxShKgw
 d72JAwKqKHEkNuunIYN7nykLMBWpl0efhWqnAiKsdHwafFzQ0OdQZIFzRcn49HQp96Tr
 mDXcUKD+r2LAgc/LcUQQKCD7uT2vzu8T9IhDoKNuUcG4XzwRyWht/p6v1wMeES9FAg1l
 6WL5dblJXcGsBNGKeivTNS8czwKeeLLjZtdOocJKh14MmDpU9qS+Tgu0DsNpdVaxIuzd
 ds9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=8/C9/LzvDyZp6/9+sMenMqZa9EJuFC9jwr8igSt0+vo=;
 b=Bqd0r3YUt1QSbrpCO/taqWoGp0jjpz8WlLSMoygv/9RvGKMnQeMde9mahwXHvsJiBf
 KdZI5zMZYEHWu9AEr61L35vB4D2Ruh/mfz1f1Gof4onOzUYWlBxHil2/wFX8nQ4HDl/8
 Zm7o86ZIsmv9D7hSi89vZbXVDRqfJTIvZX5HcQIeyzw4gdRnUmu9zYtoHVS+hR+AsYt6
 3EhbS54FQI3HsZpR1jMGzQTPqEsT/VNuvO8HTUMRIpK2a56bqzRjPPy4wiWApEwZGMRN
 LfpwjHJCK/urr8ydXDyl946VpWgiqDltPPr3QjyutHRQb7HeuYqMoeS6Uj9iZIMzM2Pg
 AD+Q==
X-Gm-Message-State: AOAM530evjx0sojWVgLpP37TPc5rSsF8QpcArz0gutfWBmZxPepYjOZW
 U4qk2TdpasWurbF62a9pGt4=
X-Google-Smtp-Source: ABdhPJwrTTHNhDK23oYbuiN2nquyt8VhU3v1Ot4rPtFxRI2pfaq0iG1aSWPNaPNC+E7dBBwF24XHLw==
X-Received: by 2002:a05:6402:3487:: with SMTP id
 v7mr34476143edc.302.1615882427801; 
 Tue, 16 Mar 2021 01:13:47 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id a17sm5620333ejf.20.2021.03.16.01.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 01:13:47 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v3 12/13] hw/net: sungem: Remove the logic of padding short
 frames in the receive path
Date: Tue, 16 Mar 2021 16:12:53 +0800
Message-Id: <20210316081254.72684-13-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316081254.72684-1-bmeng.cn@gmail.com>
References: <20210316081254.72684-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x530.google.com
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

(no changes since v1)

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


