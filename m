Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2309933AD14
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 09:09:59 +0100 (CET)
Received: from localhost ([::1]:36708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLiIY-0005PB-3e
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 04:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6y-00005u-0y
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:58:00 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:34944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6w-0004Qp-AJ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:59 -0400
Received: by mail-pg1-x536.google.com with SMTP id v14so13051585pgq.2
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 00:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QcEF78pFDQdH5vJ2d7Y7KIq3IgJO2ibE3qMPR9Ev0r8=;
 b=Vr+ZpSFYeS0aUzGTSWl2lUA8I6tepSPe/BxJ7snwmaPS9ggy1pQfyAl3dGZSMm0oZL
 3rxDxYeFai3s2PhXf7Ny9TwTJR+4uJf366Wa2wG62U6ITtpqzXa4dmDDryYVsz5khn0E
 mSFb9Dq9EGbxKxng0CsIW6CkGLFIROvxBfdtotQ03BJu2raL+liex1k7flfZ0UHWjkc3
 nVXfLSaOibDhMF4rojWdKGVQ8HxQS3jEaesNBL6j6GDepoy5ZqtYSPHvRky1aCniIITt
 27YhdyEl8bWB/xiBbEytM1VVLlp14+idDfSBXHIqGLFUxFyioszsB+w+PbNhSQ/k/xyl
 6cUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QcEF78pFDQdH5vJ2d7Y7KIq3IgJO2ibE3qMPR9Ev0r8=;
 b=uRvRqrXdjyVO7QVLlL9eUgYiS9ZzvABp+Dy64amEUIVzmrmdm48UEFWCFTWx7XP7Ka
 0B23bvBb7X9KoyZAhd7KA8J5BpD1xz5xlMse2nQeePKeljZ6hwff/S60fr0E4G227FHC
 4d6zvOMW9fP4OUNitdxsM9X2VUWPZgizad2uThg/V71SoaoyQvMlHUTGdNyViHaxSrhz
 402KJMBMICHCaaaC/dI04UdO0250lH5eq6XdjEtX2q6mKZhuxJX26nygFTFDFoMZbDgt
 sLHFvMknfi9vLrmxHchZeIqpvyuPk/WvpBfCKMq0OZUkj6iLV8JWusA8Jido8CrGWifu
 5vQg==
X-Gm-Message-State: AOAM530QwAag5eW0gzbhvuFnL7CcBNyBkK1Tlb+avRdy3vWNTwgnBL43
 97obHbX4TG+AypG8uyH+piI=
X-Google-Smtp-Source: ABdhPJwoG2v6+8M4Rywofdpq1etz1UcFu927sgvB+2xUwmyHTEjTv0r9ZQ+o4jh5QboWZcUyq+oBPg==
X-Received: by 2002:a63:1119:: with SMTP id g25mr21669565pgl.162.1615795077024; 
 Mon, 15 Mar 2021 00:57:57 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id y9sm10166745pja.50.2021.03.15.00.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 00:57:56 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v2 12/13] hw/net: sungem: Remove the logic of padding short
 frames in the receive path
Date: Mon, 15 Mar 2021 15:57:17 +0800
Message-Id: <20210315075718.5402-13-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315075718.5402-1-bmeng.cn@gmail.com>
References: <20210315075718.5402-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x536.google.com
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
2.25.1


