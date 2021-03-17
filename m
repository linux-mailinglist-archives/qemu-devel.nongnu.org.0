Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E8933EA00
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 07:43:12 +0100 (CET)
Received: from localhost ([::1]:57764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMPtf-0008KU-Iu
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 02:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPeV-0003zv-5T
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:31 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:44262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPeS-0000EZ-Bu
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:30 -0400
Received: by mail-ej1-x629.google.com with SMTP id ox4so706070ejb.11
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 23:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=PP+55yH3XMS6A6pGNsy7hHqHBcvps0qODKJPfFXkSco=;
 b=JGTucIWKcwIoshy+XYmN2uP3+gnf8Cg3z5xPbYIzl3oUY+hjxDNVL/FIzqMAvaAq9l
 TUlcYr+Q71Ht6zRqzXleklOQ6rjqXSGQQ6qeD7LughOR2DMn37oyYBg54kTZe6PIl1nu
 1qupzaKJEmflvR6JrknJaNRP0MCUWv5B5Ea5HgF6fMapXw3gTgHE2K3Wzn7HXRUG+gpH
 suAua6qUzVd5Rk9+P4by/fWIaBG0XvM75RbYdY7eDWhz2dy4Z5rOgPDizJG7n1CQXJXv
 xZV6+80Twu3Qd48PuUvrFHCy+iFmaG5OLoE4bd0QXMdAfgt7Xfob/GMUobe422+Cw6mY
 DVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=PP+55yH3XMS6A6pGNsy7hHqHBcvps0qODKJPfFXkSco=;
 b=nDc8vD157iOAzHqvLj2wbvi3AlrajQhlG3BaspNpUzWhxcD7EDbccN+pv8GdMatZ2V
 CmmbapYh1d/ExnGNIsQ38rlkvFH2YhuoNhp9HSptH5zjgxvknDbY5ve31kbaim0XdyRn
 HwTeZ3xDGccC+pSuZUNtDBY3D/o0BxBMqTTdQF/i5D4xeCyRRFvWRcAHzo2mfwQKKdiq
 Yyx2lTWfS2/5LBld51YdeI7GGIbqBL/X2V9HkMXZ/ie1zKmtsfvVv7CckdzJzH/z86UN
 bPC2+MHvPUosJsjY6hoV/WPIOGATzjKsmeMXkDxA9ZPcqN/SBLthZM9+6zvcQKbW7nMy
 Az3Q==
X-Gm-Message-State: AOAM532Gd8sQj6v83FcbacIVgxsdcPWEQvYUxgRralI0fFY9FKDq8KNr
 ehJ7Ki77sHizighg99YQwLW+dGDrpvM=
X-Google-Smtp-Source: ABdhPJwNLHghG2wD2exe1a9x1ey0ES6NdxlbA5Mwr2Vr4w6RApfM+yzASllRrOPuhfmtmNbVj1pOyg==
X-Received: by 2002:a17:906:eb4e:: with SMTP id
 mc14mr32842800ejb.169.1615962446330; 
 Tue, 16 Mar 2021 23:27:26 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id d1sm10751349eje.26.2021.03.16.23.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 23:27:25 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v5 09/12] hw/net: pcnet: Remove the logic of padding short
 frames in the receive path
Date: Wed, 17 Mar 2021 14:26:35 +0800
Message-Id: <20210317062638.72626-10-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210317062638.72626-1-bmeng.cn@gmail.com>
References: <20210317062638.72626-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x629.google.com
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

 hw/net/pcnet.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
index dcd3fc4948..044528385e 100644
--- a/hw/net/pcnet.c
+++ b/hw/net/pcnet.c
@@ -987,7 +987,6 @@ ssize_t pcnet_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
 {
     PCNetState *s = qemu_get_nic_opaque(nc);
     int is_padr = 0, is_bcast = 0, is_ladr = 0;
-    uint8_t buf1[60];
     int remaining;
     int crc_err = 0;
     size_t size = size_;
@@ -1000,14 +999,6 @@ ssize_t pcnet_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
     printf("pcnet_receive size=%zu\n", size);
 #endif
 
-    /* if too small buffer, then expand it */
-    if (size < MIN_BUF_SIZE) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE - size);
-        buf = buf1;
-        size = MIN_BUF_SIZE;
-    }
-
     if (CSR_PROM(s)
         || (is_padr=padr_match(s, buf, size))
         || (is_bcast=padr_bcast(s, buf, size))
-- 
2.17.1


