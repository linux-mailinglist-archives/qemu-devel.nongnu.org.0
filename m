Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9386A6957
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 10:03:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXILz-0004CP-QO; Wed, 01 Mar 2023 04:02:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXILm-0004Am-Ez
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:02:14 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXILk-0002mX-L9
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:02:14 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso11275572pjs.3
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 01:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nPoeDtOvmGxYvwpMM4bXj84/8ik0pjk8FjiBqOPYuhE=;
 b=V1eP2P6bVL6EZ8NtR0FoH+hMQDaC3+HgrcvRutGifIsKSIwO7VaMUL3PSp0waG0i3E
 22H3g/OLJzNXpr5MU1KHNUtW82rxYN75k1yYHneu0G+wk/UU46Hg6B6QCU1GQmHpcRKr
 Fn+X3/I4pCpgSNQXEtH3BulXsFbhHfrzwQkGTqtxjuJ35hOz0/ud2w1+8wxrhpyzasKl
 ZgiP3M+eTq/DN1SfKmdAe/opIhJiO66oA0+lPZyOy/8lkW/DabOrjRzqwgO6PhVx64nR
 9NZT4NnvMCEdZJTneChPKqKe/ri0BRK+q5oj3J6DlGgzHF71Q3+1OumnAfh7I13UBW+a
 eYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nPoeDtOvmGxYvwpMM4bXj84/8ik0pjk8FjiBqOPYuhE=;
 b=lcPLnZU4wPIr9qUYFAz9FKhnxYCXu+kuZJb6XNXJDum51pmjWpYYlc5eG/f1aE1S60
 UcjODcSf2UqR2sEtF0V1c+OJ6R0y542N32DNvnDtjITbGs4ALN7CMUK3+l7KPQvqF/jk
 ZU0Ifog/HWOU6dff9u+S6RPEPU+d7BkST+gxIlhyno+8wMUuBrgclkXw8RayKgmOvrYb
 VgmknRevNKY+JNmKK32dXx1dsEfgMpJtOcZt53Pt75xWmrfND7vRT6PdgtisccR4nc/w
 OxpvZwmj277Y843JIkPoHs/C5/aD8jFiPxHXKyg82mlu9462EaJLYlY7ZvQN9/sxfGdz
 G3Yw==
X-Gm-Message-State: AO0yUKWzoH+cI8wV5VRF1mbSer1CU4H6sIsbcAJjkp71AqLtEiYGHe96
 xGl2dVR71wPpUnWv9W9qGz8=
X-Google-Smtp-Source: AK7set9VZmFJHNcb+Xg/EWJ/uhYWtgo3SlBI7GIDxIh2uuzIaRXhiNqJZo/WtvWf6FeQseUyepijlA==
X-Received: by 2002:a17:903:228f:b0:19b:33c0:409e with SMTP id
 b15-20020a170903228f00b0019b33c0409emr6823864plh.50.1677661331158; 
 Wed, 01 Mar 2023 01:02:11 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 iw6-20020a170903044600b0019aa8149cb3sm7878991plb.219.2023.03.01.01.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 01:02:10 -0800 (PST)
From: bmeng.cn@gmail.com
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>,
	Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v6 1/8] hw/net: e1000: Remove the logic of padding short
 frames in the receive path
Date: Wed,  1 Mar 2023 17:01:56 +0800
Message-Id: <20230301090203.1601925-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301090203.1601925-1-bmeng.cn@gmail.com>
References: <20230301090203.1601925-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bmeng.cn@gmail.com>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

This actually reverts commit 78aeb23eded2d0b765bf9145c71f80025b568acd.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 hw/net/e1000.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 7efb8a4c52..d9637cbc6d 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -908,7 +908,6 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
     uint16_t vlan_special = 0;
     uint8_t vlan_status = 0;
     uint8_t min_buf[MIN_BUF_SIZE];
-    struct iovec min_iov;
     uint8_t *filter_buf = iov->iov_base;
     size_t size = iov_size(iov, iovcnt);
     size_t iov_ofs = 0;
@@ -924,15 +923,7 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
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
2.34.1


