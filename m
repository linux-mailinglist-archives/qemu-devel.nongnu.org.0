Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8C132B622
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 10:25:23 +0100 (CET)
Received: from localhost ([::1]:46786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHNkw-0000Z6-2i
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 04:25:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHNhn-0004hs-Nk
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:22:07 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:32913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHNhm-0001BK-96
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:22:07 -0500
Received: by mail-ej1-x62a.google.com with SMTP id jt13so40836760ejb.0
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 01:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qvjoH8Av1aiwoBjs4TpFm49HM6EV85fk5Z2xHbHZ2/0=;
 b=fzYbKDxt6X2Rw5PEsc0lG+JMATnx/KplYK0WrFLFA+b/6sbI9sol6VxVYfxyBjOMu2
 cuPiSQKRuhI/Ii/pufMRLvpv/RRtreOjComrr2cSY/UsQ/eitQ4lV8A4N9vkihXGfAXC
 jocIMcj4nZNfaoliBOzYCuvg07IrPpwYxejfdq0rP9aBjsz+GCs2v9UWvWp74NK8xysm
 I+MiJPlWe7ku5LF2LmQ2XRLZz3XUS2zcuRsG+0YhoBLd8bVGYHiJeMr9+xvHK2lfp7qX
 TjY2QHLWSBX0Xh/nPYNKoC00rDegSERPF0opJOSf9PQygeQEqXOh8DBnQIosWOmroEKv
 gRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qvjoH8Av1aiwoBjs4TpFm49HM6EV85fk5Z2xHbHZ2/0=;
 b=KQd+1OwXilzcPnaMABTTFysdHoHTo4617NUSzxt34U5QS78BLrv4oWRex65J2eg0F/
 ZjayKhC88bHyZWZpIYnDVA5HGekylF9ZLPqgkIAPCRmM1wu7zBkt0/LCjmxCciM2Ei3H
 +ge9tu9wvCu1cdg3CXe/wp8WEiTzbeR3OwQyKW3GHE+ekz/4KlEaAh3Ph1QYm56tiVid
 dClqJFjVqahX9eYWUpl79rTm17Uish2BsgEoZxY4GU3DCiM2c9R1jxqwNFiluf10/dL6
 ept85P2+1jM/Y1XZZK0LHGC7QRbIo2PNYiiiTbbqTUCSHLQypW8r6+IVojcM28pmvXqN
 8GyQ==
X-Gm-Message-State: AOAM5323pg0IB/y6NMjpZD61epPAkh+Q495OtyeI57t/6aIvJWqMgpP0
 XI2YBR7bDWhZzQ5gMx4HshY=
X-Google-Smtp-Source: ABdhPJxDj6V7p1mg49Gk9lRZQdvAU66BzRIX02ieR1lokjcap8hmT0h8WxzGD3Dl3puao3c2m4T0Fg==
X-Received: by 2002:a17:906:26c9:: with SMTP id
 u9mr25945431ejc.166.1614763325167; 
 Wed, 03 Mar 2021 01:22:05 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id i6sm16614865ejz.95.2021.03.03.01.22.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 01:22:04 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [RFC PATCH v2 2/9] hw/net: e1000: Remove the logic of padding short
 frames in the receive path
Date: Wed,  3 Mar 2021 17:21:39 +0800
Message-Id: <1614763306-18026-3-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614763306-18026-1-git-send-email-bmeng.cn@gmail.com>
References: <1614763306-18026-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62a.google.com
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

This actually reverts commit 78aeb23eded2d0b765bf9145c71f80025b568acd.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 hw/net/e1000.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index d8da2f6..a53ba90 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -882,7 +882,6 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
     uint16_t vlan_special = 0;
     uint8_t vlan_status = 0;
     uint8_t min_buf[MIN_BUF_SIZE];
-    struct iovec min_iov;
     uint8_t *filter_buf = iov->iov_base;
     size_t size = iov_size(iov, iovcnt);
     size_t iov_ofs = 0;
@@ -898,15 +897,7 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
         return 0;
     }
 
-    /* Pad to minimum Ethernet frame length */
-    if (size < sizeof(min_buf)) {
-        iov_to_buf(iov, iovcnt, 0, min_buf, size);
-        memset(&min_buf[size], 0, sizeof(min_buf) - size);
-        min_iov.iov_base = filter_buf = min_buf;
-        min_iov.iov_len = size = sizeof(min_buf);
-        iovcnt = 1;
-        iov = &min_iov;
-    } else if (iov->iov_len < MAXIMUM_ETHERNET_HDR_LEN) {
+    if (iov->iov_len < MAXIMUM_ETHERNET_HDR_LEN) {
         /* This is very unlikely, but may happen. */
         iov_to_buf(iov, iovcnt, 0, min_buf, MAXIMUM_ETHERNET_HDR_LEN);
         filter_buf = min_buf;
-- 
2.7.4


