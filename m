Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316BF33D38C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:10:34 +0100 (CET)
Received: from localhost ([::1]:50924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8Wv-0007Pk-6m
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8RG-0002Zb-7p
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:04:42 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:44179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8RE-0003mo-Ft
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:04:41 -0400
Received: by mail-pf1-x42e.google.com with SMTP id o3so4002880pfh.11
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 05:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KAEqWNhqz0EAtqpGifC8nwC4RjGAER1nHSghOCdWhgs=;
 b=ac0CWFwrvqDpgsIpyhHZkpv0gCcfi2un1++FMfYqKR/OB9EbD9Ew2PfLJ4c1Yzjmj6
 14gEHviCG9XSUSb/xqMFZkPac7yzoAReKxWbr2jOeK36zMsMIYSOx/B+HdQdeYhN0/eq
 ldhCWlIcqhN+BXgz0CofVKiDge+eXWEm/iLWDClM4zKHMyoX2LQaIGlDhbjVT+hJfR/d
 oC/5ueZEi+SC/aK/ASJj0b/y+LiNEQ+dJj/w7IJyLyaAIKas8Fj/dvmnoKm+DC0nKdTV
 dpiKHoJOJRpKtSA0t6ZSh9yz+F0UHBjv4tB1Iz64ltY3L0qiihItglL5WyfBBuhJ2rWS
 R1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KAEqWNhqz0EAtqpGifC8nwC4RjGAER1nHSghOCdWhgs=;
 b=DP454WgLjdq8Zewel5PeUIk+7Hvdexflh3jkl+ah5ZZBdSeBwt98p9yGWwZ99PfYRa
 poH/KzOkKomm1Bs4nuribdsJUFApH6gz6Xe8UHfptXfR2xKgaD/ALLXuw311K0FLXaXK
 NPo6Fpa5e0EndzmKwIEIinLX0R4ixIie4ByHlwGLyDujZyDhWDliPipSOHpzfPDtYSkm
 q464gV+t8gV76702WCWvdAPzrzUkn3129RNrBJizT+BYvO1gnVCFXsCzN6Bbnfqo1P5R
 CMJWOHX85jifZYm54PfZEBNiPtmj31MbtBaHHhRAIVsXPfhAufgz0EQGNBnZomXCHyAA
 J4vQ==
X-Gm-Message-State: AOAM530ANhCSYzGsLz5PKA+9QH61B06Krg9vgfmK5VCbylclAJT+stop
 5/4swqqSJlrU5mJhBqkKiCM=
X-Google-Smtp-Source: ABdhPJw8C+ikbQKcrsHAGu0aet6pzFoAGPeDqRXSpzhya5drhdVp5xSnM2VFDwgL2jFRAiFE//p5qA==
X-Received: by 2002:aa7:9154:0:b029:1ee:fa0d:24dd with SMTP id
 20-20020aa791540000b02901eefa0d24ddmr14731261pfi.17.1615896279233; 
 Tue, 16 Mar 2021 05:04:39 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d5sm2722166pjo.12.2021.03.16.05.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 05:04:38 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v4 04/12] hw/net: virtio-net: Initialize nc->do_not_pad to true
Date: Tue, 16 Mar 2021 20:04:12 +0800
Message-Id: <20210316120420.19658-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316120420.19658-1-bmeng.cn@gmail.com>
References: <20210316120420.19658-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42e.google.com
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
Cc: Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For virtio-net, there is no need to pad the Ethernet frame size to
60 bytes before sending to it.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

(no changes since v1)

 hw/net/virtio-net.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 96a3cc8357..66b9ff4511 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3314,6 +3314,10 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
                               object_get_typename(OBJECT(dev)), dev->id, n);
     }
 
+    for (i = 0; i < n->max_queues; i++) {
+        n->nic->ncs[i].do_not_pad = true;
+    }
+
     peer_test_vnet_hdr(n);
     if (peer_has_vnet_hdr(n)) {
         for (i = 0; i < n->max_queues; i++) {
-- 
2.25.1


