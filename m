Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73033440F4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 13:29:44 +0100 (CET)
Received: from localhost ([::1]:43434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJgl-00032n-OQ
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 08:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lOJcF-00085J-OW
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:25:03 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:42811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lOJcE-0005Zb-0Y
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:25:03 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so9152430wmj.1
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 05:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OJriT6OHsNVPmr/xBcOCwHqhfooctMGjJPAgbRBfHXA=;
 b=RNNjWRRUobdCzFz5mNVkBfFGHPvgoGIomO/DGYGu4WCRJv1cgTz4v0b2R4gfvPMLIA
 B6qAGIrZub3+r8cWtcCI/uDr+ckcgOYSOMRVPwP/my2ooiGKKtVNK/bPX+TyljEz262M
 tJJRZOG3KBjjlckSM0cJLe/w8vwa2Ft/sHxVmF7LRpZ0ehE4GowOCPEV0c2KkfblC4J2
 IeROpKuRofAoKoXhPhuWRAS2W9I2laByr6+5Yy6opMlU4yKpkETKutSoV2K23szHx4+Q
 O4QbNBeRm/DFBDtjnepYZyIakFi260EIKY95nTxKEeKpQz3nKukdmoCCD3zOnLpS0P1W
 w8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OJriT6OHsNVPmr/xBcOCwHqhfooctMGjJPAgbRBfHXA=;
 b=YIl/BAGypo6lJAQ+PbdtOeHdLZNRozguqBXAY/Zv7atXlVZvlIH2kt8fMTy2YGKsIS
 fJCMcDE5TpDwpKYLN1z2XGE1dQlqyrKkk+zGbC+Xn7N5GPlQOQJ+cO9qel5t0K/BLnKD
 4qbi5C95YPXPhH3UWW3RPhXS4OFG/LZHjbkyHV313YX97FFpoCW6YBUmEnA7P3ts/ydc
 WOlNjaowXIYzumyAVNFGeEpNc4KJIBYX6+76gPwWRpHJS56FrHfMfPlbrAriteW9armj
 L4fpWHwPpCnfZd9yLp+AK+Te54oYkOsPvLBWQcYQmudKjzGm77HyLBhCoYKV4OIR+Xpn
 R9LQ==
X-Gm-Message-State: AOAM530nBc9QTEb+V8s5ZMV2p79Ifd5INWoWOuROgDKyd35Cl37cyPNP
 3Bt9tECr+SCXa+K7CqhE1PYUHA==
X-Google-Smtp-Source: ABdhPJw5PqLan5VyjNVJb1e2H9/NU+NsinTsZq1dqwko7dAEDA+39A0v7QLPoS5uulPRHgprcVjyag==
X-Received: by 2002:a1c:5f54:: with SMTP id t81mr15779689wmb.84.1616415900611; 
 Mon, 22 Mar 2021 05:25:00 -0700 (PDT)
Received: from f1.Home (bzq-79-176-30-57.red.bezeqint.net. [79.176.30.57])
 by smtp.gmail.com with ESMTPSA id w132sm16785325wmg.39.2021.03.22.05.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 05:25:00 -0700 (PDT)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	berrange@redhat.com
Subject: [RFC PATCH v2 1/3] net: add ability to hide (disable) vhost_net
Date: Mon, 22 Mar 2021 14:24:50 +0200
Message-Id: <20210322122452.369750-2-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210322122452.369750-1-yuri.benditovich@daynix.com>
References: <20210322122452.369750-1-yuri.benditovich@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::32b;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If 'vhost_net_disabled' in the NetClientState of the
net device, get_vhost_net for TAP returns NULL. Network adapters
can use this ability to hide the vhost_net temporary between
resets in case some active features contradict with vhost.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 hw/net/vhost_net.c | 4 +++-
 include/net/net.h  | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 24d555e764..6660efd9ea 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -436,7 +436,9 @@ VHostNetState *get_vhost_net(NetClientState *nc)
 
     switch (nc->info->type) {
     case NET_CLIENT_DRIVER_TAP:
-        vhost_net = tap_get_vhost_net(nc);
+        if (!nc->vhost_net_disabled) {
+            vhost_net = tap_get_vhost_net(nc);
+        }
         break;
 #ifdef CONFIG_VHOST_NET_USER
     case NET_CLIENT_DRIVER_VHOST_USER:
diff --git a/include/net/net.h b/include/net/net.h
index a02949f6db..a938211524 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -103,6 +103,7 @@ struct NetClientState {
     int vring_enable;
     int vnet_hdr_len;
     bool is_netdev;
+    bool vhost_net_disabled;
     QTAILQ_HEAD(, NetFilterState) filters;
 };
 
-- 
2.26.2


