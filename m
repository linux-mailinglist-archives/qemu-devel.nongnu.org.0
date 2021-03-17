Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1798233E9FD
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 07:41:14 +0100 (CET)
Received: from localhost ([::1]:52842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMPrl-0006DG-4l
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 02:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPeT-0003vq-No
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:29 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:46406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPeN-0000DY-5d
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:29 -0400
Received: by mail-ej1-x633.google.com with SMTP id r17so698036ejy.13
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 23:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=+3JML/eQ0iQLfY9F7pZALIkT5ONsUMtEeW41N50tDXU=;
 b=ceg7KbNKVjy5VmNRidLWYXeJcfy08eSsvLrRNfk7mQkMEwhPUhgHt2+jKEgJukdcVZ
 WlBOkwrgOiqz1KjpUmdO0yhDtr36dRZdmrg6+MrVtAD8x7mNsuW1gosxEZAydXzJ3Ja/
 dL4AoL3hpN+9CeU5AFJqcz1VM3Rv77Zye+ENXtRprlZ8kc4gRvKmKaGoehJ2rR6M3A9i
 oCyiay/zhVe4cSAWNwWKACZv1WgRzbg5WFrSVqPi77t41Wh9sC8H6sh3K40RNex7rVgf
 Qi/XcvgYjNoEyhtf/dgOHkUKWsEde4cBy+psyI/qylxpBP5jnh5TnG5QGSJJZ1OUzD23
 0NCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=+3JML/eQ0iQLfY9F7pZALIkT5ONsUMtEeW41N50tDXU=;
 b=WOP5GF8Tdxu8swAqXHxIpT72IcdxRNbA7ChosdvdnSRwPUSO5psZlUjchY1inowWex
 HpX/FH16jNkKUiGdGhM+gjqE3GHSVGhid/4cPRYsyfvospYgoAOOV8bIV+LK1KQ10/h/
 7CTfBaYuWy1fq27vavCule9ffWXuT/sNulFf5ytz4ObgZC5GISLO2ZQlC1syZ5FZIdvr
 HYfRoEMqcPPJPW2LreLdg+l3SINUZL6SE2HSdzxKZ4BH4SfW+LMQv47WZC6faCtQpU4X
 2ohltPVFh0nt4OnGrRZVKtLcfDXE8jGCv1O6rYwG9SWhUuID4F28Jic+m6mh1MhwZr37
 2+fg==
X-Gm-Message-State: AOAM531AhZOdFRwFNDxxFiOKTtPGhWnlIY1va7gFOAgLEITEBQI/YOh8
 OX+4rTYBxYHV+B7yJS0bdPs=
X-Google-Smtp-Source: ABdhPJxel28YzKErqIDhuYYBKjfZqtna3Iflef8TMnycOGyiJkmSQllOASsDWx6OCJitTbgkg3JcdA==
X-Received: by 2002:a17:906:c9c2:: with SMTP id
 hk2mr33908679ejb.244.1615962441781; 
 Tue, 16 Mar 2021 23:27:21 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id d1sm10751349eje.26.2021.03.16.23.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 23:27:21 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v5 08/12] hw/net: ne2000: Remove the logic of padding short
 frames in the receive path
Date: Wed, 17 Mar 2021 14:26:34 +0800
Message-Id: <20210317062638.72626-9-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210317062638.72626-1-bmeng.cn@gmail.com>
References: <20210317062638.72626-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x633.google.com
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

 hw/net/ne2000.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c
index 6c17ee1ae2..b0a120ece6 100644
--- a/hw/net/ne2000.c
+++ b/hw/net/ne2000.c
@@ -167,15 +167,12 @@ static int ne2000_buffer_full(NE2000State *s)
     return 0;
 }
 
-#define MIN_BUF_SIZE 60
-
 ssize_t ne2000_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
 {
     NE2000State *s = qemu_get_nic_opaque(nc);
     size_t size = size_;
     uint8_t *p;
     unsigned int total_len, next, avail, len, index, mcast_idx;
-    uint8_t buf1[60];
     static const uint8_t broadcast_macaddr[6] =
         { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
 
@@ -213,15 +210,6 @@ ssize_t ne2000_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
         }
     }
 
-
-    /* if too small buffer, then expand it */
-    if (size < MIN_BUF_SIZE) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE - size);
-        buf = buf1;
-        size = MIN_BUF_SIZE;
-    }
-
     index = s->curpag << 8;
     if (index >= NE2000_PMEM_END) {
         index = s->start;
-- 
2.17.1


