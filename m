Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F60133CF98
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:20:57 +0100 (CET)
Received: from localhost ([::1]:37834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4wh-0005db-Tz
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pg-0002ag-9R
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:40 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:37759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pe-0007wM-9O
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:39 -0400
Received: by mail-ej1-x634.google.com with SMTP id bm21so70596646ejb.4
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 01:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=+3JML/eQ0iQLfY9F7pZALIkT5ONsUMtEeW41N50tDXU=;
 b=GylkHYzH8OgJ/wB9fPjQ8GE3IqpQtRe1akmFIO3jnpecfFTLRcOGDh2f+z9PkT7cgJ
 GHOwNYyaLu1hFPqLiOc3xKrLrpNoWRT2ejUegazEjWzhm1fVvaKl5wW4hele611L36W1
 rOAH5BoEG2Ki6nVbkoHAV2M45+LFp2/B/RV4hyY7QjQ0TORF1T/wyCtrFD5hUbPiLuwd
 hIOU7EL/KxoK8d0HtmNCOXWrwrkk6W3zTVqa6PJSGUQO8gfgE5AR9SkNS71JbUA0be2M
 p3l4wlUNDHH44hjJxV6Xf6em0ne+Et3t6ciaBFYMhLiLFIGl9+THCrOFbCCQ0SOrhFLu
 fM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=+3JML/eQ0iQLfY9F7pZALIkT5ONsUMtEeW41N50tDXU=;
 b=hskfpyDwHTlVEkSzeozmXGW9lhmBMMuosxpBr4rG+B3rlHXocVqrDG3cf/fNZfPDSC
 djMiPlyNhJwNOxBcqE/ypsRJ7zNn15Uyz4tRBnHn1qp6agUTQlu4zAejaOIXtytgfkKI
 B1nEm9a7d2Z+xguBvIfaSokRFPnuO8CJcHFyNx4Yrty4IKgLJJEyaw5Y+xfTpEoXR2ne
 V07jooppVr96fDbcBbGeWbq4zvgQH0blOzC7o0rumjUlfj/nYueEJpmX9Vqt19dxPdwx
 Pvxd6xt12FrBjclnkm4cifYzeVyCkL05ZWE3mMAAAog+nei3EW5IUNMeVh4WO2GUm8ps
 5wTQ==
X-Gm-Message-State: AOAM532rVheiVt+dSK67HRtyxXh7R+BEKgop/Do3wx63lhUxHzANLsxv
 m+Xp4oVr81neOYEH/yog720=
X-Google-Smtp-Source: ABdhPJw7xMdrwRcSFqvIS2MWPwRxvHXC4UulBHlLuKYFi/YUEa1Oh8swHacMPYG7g4xP10mNJ9BpcQ==
X-Received: by 2002:a17:906:fcd2:: with SMTP id
 qx18mr7370758ejb.327.1615882417032; 
 Tue, 16 Mar 2021 01:13:37 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id a17sm5620333ejf.20.2021.03.16.01.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 01:13:36 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v3 09/13] hw/net: ne2000: Remove the logic of padding short
 frames in the receive path
Date: Tue, 16 Mar 2021 16:12:50 +0800
Message-Id: <20210316081254.72684-10-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316081254.72684-1-bmeng.cn@gmail.com>
References: <20210316081254.72684-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x634.google.com
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


