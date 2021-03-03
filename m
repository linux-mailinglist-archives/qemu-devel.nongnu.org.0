Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBED32B62F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 10:29:53 +0100 (CET)
Received: from localhost ([::1]:60778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHNpH-0006W7-Pe
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 04:29:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHNiG-0005ed-JC
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:22:36 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:46464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHNiF-0001Kv-4R
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:22:36 -0500
Received: by mail-ej1-x62e.google.com with SMTP id r17so40731320ejy.13
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 01:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bynr5MYFkB5Fb/MRZdPHIqg8W5OekBTrWbuXoxt0cro=;
 b=B1pK4gC9kGZ/s3n484HZMnOLJuSAbnw5JHnDDY7GiYkFnAQzjoKMU08ZNSzwncc613
 iOi5IUa6JY7F2/VbhhcdEgxXd9d5F3GWQKc7XmOnfWW4gjQ+HU1ZBvum6O1ybF5GvVUh
 DR2OA1/omcmiNlTfsbL7XND3ivehshTEOKmKhKgarvFgf1LVrHfIVgJfUsyQ0aJFXxG7
 RlAEuk2/hWAc4iepOqlXJ44wmcSl3k5ZoW/xk2C9gOXHFBs5J6sJnVGIVKhnLZg7OTsN
 6pYAxj2LPlgSO+mSh+FKfNxMHKsD2wgm2rtWDkuG3GME+cXGd0DJv1XqoVCEUBzjjMU4
 n+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bynr5MYFkB5Fb/MRZdPHIqg8W5OekBTrWbuXoxt0cro=;
 b=B0HPhByVPF5BpRDiihkWDlfNE/DNsGpmuH/Aj/zGmvzB9zlak0An2eNIOB4aKKsi4t
 MR/BJ0EqHMdsUwz4brQGV9XmGzK4ZWxPTNMvaG0hvSUy1hjqx2RkwFg4zMGhRJZewrJ8
 GlR0GQho0ivH3kT2fxRw0JI5F1eLPZ5LYcJV3IdkmV0xccgvhyu3vX9sJ4d8yqjnscQJ
 cfXSMIV+OlsuHkDQrJfAzXHhf1qOHyyoTyMVoqNwO+wJeVwuDdKweSOPlXj7brGYvtJ5
 woU/w3v/L2lt9DKUSvhcN9UttJiuB2UCK3jCejamtQbqdMVcdyb8URhiHjucRkaCvHW3
 hcfA==
X-Gm-Message-State: AOAM532e9Pzlj+Ba5Va6t5HP5SzGPS+BOIkLXzLxXl/rMuhk1gTnllMw
 PnW0mnOwfnNUqDojIZ9dpBY=
X-Google-Smtp-Source: ABdhPJxrgiFPAsx9oZSXVdacuG8Gr6ApWvAKy4+Z792h/PhFN3aAtSZzyzFcz6m2ARjS6NpaRYTWDA==
X-Received: by 2002:a17:907:3e1b:: with SMTP id
 hp27mr23709236ejc.506.1614763353883; 
 Wed, 03 Mar 2021 01:22:33 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id i6sm16614865ejz.95.2021.03.03.01.22.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 01:22:33 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [RFC PATCH v2 9/9] hw/net: sunhme: Remove the logic of padding short
 frames in the receive path
Date: Wed,  3 Mar 2021 17:21:46 +0800
Message-Id: <1614763306-18026-10-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614763306-18026-1-git-send-email-bmeng.cn@gmail.com>
References: <1614763306-18026-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62e.google.com
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

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

(no changes since v1)

 hw/net/sunhme.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/hw/net/sunhme.c b/hw/net/sunhme.c
index fc34905..6971796 100644
--- a/hw/net/sunhme.c
+++ b/hw/net/sunhme.c
@@ -714,8 +714,6 @@ static inline void sunhme_set_rx_ring_nr(SunHMEState *s, int i)
     s->erxregs[HME_ERXI_RING >> 2] = ring;
 }
 
-#define MIN_BUF_SIZE 60
-
 static ssize_t sunhme_receive(NetClientState *nc, const uint8_t *buf,
                               size_t size)
 {
@@ -724,7 +722,6 @@ static ssize_t sunhme_receive(NetClientState *nc, const uint8_t *buf,
     dma_addr_t rb, addr;
     uint32_t intstatus, status, buffer, buffersize, sum;
     uint16_t csum;
-    uint8_t buf1[60];
     int nr, cr, len, rxoffset, csum_offset;
 
     trace_sunhme_rx_incoming(size);
@@ -775,14 +772,6 @@ static ssize_t sunhme_receive(NetClientState *nc, const uint8_t *buf,
 
     trace_sunhme_rx_filter_accept();
 
-    /* If too small buffer, then expand it */
-    if (size < MIN_BUF_SIZE) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE - size);
-        buf = buf1;
-        size = MIN_BUF_SIZE;
-    }
-
     rb = s->erxregs[HME_ERXI_RING >> 2] & HME_ERXI_RING_ADDR;
     nr = sunhme_get_rx_ring_count(s);
     cr = sunhme_get_rx_ring_nr(s);
-- 
2.7.4


