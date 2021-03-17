Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228B433E9C3
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 07:34:54 +0100 (CET)
Received: from localhost ([::1]:38886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMPld-0000PQ-5o
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 02:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPek-0004H3-My
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:48 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:36023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPeZ-0000J6-3q
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:43 -0400
Received: by mail-ej1-x636.google.com with SMTP id e19so751285ejt.3
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 23:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=LVIjQbumBhLPw9k7hJ7IdwoWD2eM32N030BAj0m1X34=;
 b=rw8u3H88A/aq/lkqMzcOYmmVI2JWG+gz4nmSwKsev0NiDSJVTG8+QcJpk3xZI6uLL1
 /z0JELUcqlqHvtauNDt6ytLiATF3XnkG7DzLJFeZCCAo+Or79uiJaDctQyVsZq/Y43tu
 m5KtZBAfKR1zIPvLq0caHe/3jBTlZPfDr40AGNLYE/rDLYZgJxCvg1BTKyef483kaFZT
 HDh0Sgmb326jGnB5ym3NRSGptb2hSXmkztNAGOSEsVvbknUTHNaF+c/vC/mx5JKt+nzn
 cpV7IUVRuvxXLbUXSTgBLluaifK43U6HB+BAjkVRe/GPA+Ge19on4OPfbl9eddJGHZlh
 QdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=LVIjQbumBhLPw9k7hJ7IdwoWD2eM32N030BAj0m1X34=;
 b=ZqYHTVpSV+u2yjuJC01SNfC587l1kZZFRSxa7G0UTIYJxjm11omktKtmg9uxw6dBWt
 IwhDyrpB2CffD1WukE5SZW1QBgizNAuqHcngcffbJakGtpGf56kmjCjs+ug7AfhFalhO
 A9HoeCM6o3brdljNPDR7frAcRMaD/hepCFDa+rNgDQIupxKJz30nn0vYy7Cz+IgoMkTb
 hHgFuYi6DP/tnMBI3I0xhmWzAJir63tBTTXxb3gwx+GmGC7IerjvWIawKAtikNHcdUCc
 erTgQQTfNEU1qtEowrMD4V33DxRPnhPctRw2mgVaxYnu9EdpVwATdM80EVn18tmUclH9
 8FdQ==
X-Gm-Message-State: AOAM531IyEmkN8UP3+AbXz6ElVrjFRBz35gaPm5RQM/LFocBd6NDEDoE
 eXFDW8jMgz8eFLSyeVswSqI=
X-Google-Smtp-Source: ABdhPJw/dy2JxSNH6BFKaRywynV3Dx7x2Voh7TiGpBGNTBQNs705nuoZjWYf1J9PHkGWymuEXbVxWA==
X-Received: by 2002:a17:906:314f:: with SMTP id
 e15mr33154300eje.30.1615962453873; 
 Tue, 16 Mar 2021 23:27:33 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id d1sm10751349eje.26.2021.03.16.23.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 23:27:33 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v5 11/12] hw/net: sungem: Remove the logic of padding short
 frames in the receive path
Date: Wed, 17 Mar 2021 14:26:37 +0800
Message-Id: <20210317062638.72626-12-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210317062638.72626-1-bmeng.cn@gmail.com>
References: <20210317062638.72626-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index 3684a4d733..cb3593153c 100644
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


