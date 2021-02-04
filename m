Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 183D830FE6A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 21:33:14 +0100 (CET)
Received: from localhost ([::1]:59564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7lJR-0002Jf-6H
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 15:33:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1l7lFu-0007Ik-Eu
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:29:34 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1l7lFq-0002eb-K9
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:29:33 -0500
Received: by mail-wm1-x336.google.com with SMTP id y187so4139559wmd.3
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 12:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=L7PVBmk+2nxLogepx4whST2GuDoJC+uo2HBF8DDdhak=;
 b=tPjeG6yWV72ECYG4Ny4LNsINTYj5ZNy/Jqz78LSDShHjdNBBqNIaeozVjBAOe2Bpee
 DbGGjEwGgBxJHAvQREW2a3hO0D6zEr8kyqTFSToIxA3k7tkEDEuKu2d9QJmGOlp7KKD8
 JVBFIyieWC5fWVGUwghbvNsqPCsrreDKBBkBtXhDvh+tjF37synJnUyy+R/RJYJoe8jj
 2Em1Mtw/Nkj4tdadBOyh8yJSA8FKCyC948UbXkIWnMREm+0tZ50lJ3Zhsg3AsLnSKUdh
 v/oo2uRI58gttZ2klZiTJ7Yk98JRSfmzMj5JKmcKg2TlhMb0JCfpI9HWFl3BfvlViBti
 w0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=L7PVBmk+2nxLogepx4whST2GuDoJC+uo2HBF8DDdhak=;
 b=jlLZnKoO/+avY8NIanjcQO8PoTaEcrJqefRFsftRqK7uIAdbsFM4o9SmwHk9cPtw80
 75yUCAl2nHAB/F2qbHJTKcwYv4G/hfgq8l6voUkFjUnhQGopKl0h1PWXcBllGzRJULvw
 A+zskdZ051T7/JAMZpwyWKSWjt15tAIXLbVXxLa8v6SA3ygYyxgCnzkNush65QKNOuTH
 VYdFaUJna/WBJd+0Oj6/9qkLdpAFUIwTyiiZrDaYq0LrDBsqs/cO96u6PzCxobe9bO4Y
 LXiPdP6Vj+hi3om7uprO4HFi9dwcKUfvnxKXKvBNGVbEeoSGBJl9Zvv0OfvNoMt71fAI
 +stA==
X-Gm-Message-State: AOAM533wExFCRuZHOYO7ADoqL3ElCUl1km6CLg8q25EB+fV6aCfOBa2C
 /WyMV233ntDysCU2nBmRsyJ+qw==
X-Google-Smtp-Source: ABdhPJx7jVzE/HZCbr9I28b4vMFSAK8p2yvRLds345lrqA+cr7b4ZHnEIdSTv0+AhsmACiG6ePiBVQ==
X-Received: by 2002:a05:600c:19c8:: with SMTP id
 u8mr754077wmq.59.1612470569295; 
 Thu, 04 Feb 2021 12:29:29 -0800 (PST)
Received: from f2.Home (bzq-109-64-9-177.red.bezeqint.net. [109.64.9.177])
 by smtp.gmail.com with ESMTPSA id f7sm8807834wre.78.2021.02.04.12.29.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Feb 2021 12:29:28 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] net: add ability to hide (disable) vhost_net
Date: Thu,  4 Feb 2021 22:29:14 +0200
Message-Id: <20210204202915.15925-3-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204202915.15925-1-yuri.benditovich@daynix.com>
References: <20210204202915.15925-1-yuri.benditovich@daynix.com>
Received-SPF: none client-ip=2a00:1450:4864:20::336;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-wm1-x336.google.com
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
Cc: yan@daynix.com
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
index 8282e440bd..7873d27a36 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -437,7 +437,9 @@ VHostNetState *get_vhost_net(NetClientState *nc)
 
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
index 919facaad2..4479bdcec0 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -100,6 +100,7 @@ struct NetClientState {
     int vring_enable;
     int vnet_hdr_len;
     bool is_netdev;
+    bool vhost_net_disabled;
     QTAILQ_HEAD(, NetFilterState) filters;
 };
 
-- 
2.17.1


