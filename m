Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD622F6C6A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 21:45:34 +0100 (CET)
Received: from localhost ([::1]:38298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l09Ua-0005Oy-FE
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 15:45:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1l09SC-0003jU-Jd
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 15:42:48 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:44138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1l09S8-0004iz-Gu
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 15:42:48 -0500
Received: by mail-lf1-x131.google.com with SMTP id m25so9939249lfc.11
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 12:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cP5ueAi9y+O3krqgK3UyLK5m0SKkF5/Zu4Expc80iEI=;
 b=B3/OFRrIzdKd7C0zQ/SCd0rQSRNmr9p2p6e5ipqlzvIPFXZh44UYGHa4q7F1N66YLf
 NTUthl/F5xIO98c5qbrIu0LThihff8kaKIv45+0nWQ2vdBY4ICDp+VJq+Gl4OXZXOREo
 srLke916fq+mNaqxl7Ge39Knu9lCCnG4wh13VwH2siRicjvOOu+luaD4oZA9cpKNiZzv
 2WhmxZH2XLU+SoHUQLASmrOzX/ihqfoGQgQCSRZb28d7oPnbTV1Y9wItkbhvJzvsrWNo
 nop7IK8xYLCbF6+VRgW0xeL+JQHuJY//XL3EQCyAljxiiHyVbxELuhM03ebcWRUN9uVw
 5HFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cP5ueAi9y+O3krqgK3UyLK5m0SKkF5/Zu4Expc80iEI=;
 b=Xe2Ryv2ugA/GAdkLx+F1TzmGYiMCC7koHc5WAoJSYnm6NAL2uiAXK6XdUmV4cqc/AF
 kEN5273utAv353LSkJBFHiutp6QdP5r8nRA48UR4sTNaRJzsbpQZYU7GZ2Kt+m+xKvFC
 On4oftF5zkNi7jKtHTvmqET6Tujh7LkbKfzVTRt0z+rj4ShEMTgz9mET29wPG9UOscvK
 siu3v5MMC7cU2L3ek+Iaq7GLFjqfpQ94cA2I1YK/k0EAOQKQezBP+nn9H4++3utt1CLG
 KBS6t2i5pk+IlXs8wZkUCh7yNZeXw4W54uiimI4vagkdsb/s4+KleBtjFmk2kV1PrmwR
 lNug==
X-Gm-Message-State: AOAM531y4t9gAF2d4hZnBsI2e7iPAkvazkFi/CuodLefFxLUqT16wi+y
 A/NZPoQN8jigZWVX5cZ78nl4+g==
X-Google-Smtp-Source: ABdhPJyQzGhBksP+ybmAXbQtFmeW+dYvkpVBPi0zB09vciWMZ8DfZsigRwsbCf3rPi2O+MBPjwo+Wg==
X-Received: by 2002:a19:5e5b:: with SMTP id z27mr4026173lfi.143.1610656961570; 
 Thu, 14 Jan 2021 12:42:41 -0800 (PST)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id t20sm565833ljk.58.2021.01.14.12.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 12:42:40 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH v3 2/6] net: Added SetSteeringEBPF method for
 NetClientState.
Date: Thu, 14 Jan 2021 23:16:08 +0200
Message-Id: <20210114211612.387052-3-andrew@daynix.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210114211612.387052-1-andrew@daynix.com>
References: <20210114211612.387052-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::131;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x131.google.com
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew <andrew@daynix.com>

For now, that method supported only by Linux TAP.
Linux TAP uses TUNSETSTEERINGEBPF ioctl.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 include/net/net.h |  2 ++
 net/tap-bsd.c     |  5 +++++
 net/tap-linux.c   | 13 +++++++++++++
 net/tap-solaris.c |  5 +++++
 net/tap-stub.c    |  5 +++++
 net/tap.c         |  9 +++++++++
 net/tap_int.h     |  1 +
 7 files changed, 40 insertions(+)

diff --git a/include/net/net.h b/include/net/net.h
index 919facaad2..d77fbb8878 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -61,6 +61,7 @@ typedef int (SetVnetBE)(NetClientState *, bool);
 typedef struct SocketReadState SocketReadState;
 typedef void (SocketReadStateFinalize)(SocketReadState *rs);
 typedef void (NetAnnounce)(NetClientState *);
+typedef bool (SetSteeringEBPF)(NetClientState *, int);
 
 typedef struct NetClientInfo {
     NetClientDriver type;
@@ -82,6 +83,7 @@ typedef struct NetClientInfo {
     SetVnetLE *set_vnet_le;
     SetVnetBE *set_vnet_be;
     NetAnnounce *announce;
+    SetSteeringEBPF *set_steering_ebpf;
 } NetClientInfo;
 
 struct NetClientState {
diff --git a/net/tap-bsd.c b/net/tap-bsd.c
index 77aaf674b1..4f64f31e98 100644
--- a/net/tap-bsd.c
+++ b/net/tap-bsd.c
@@ -259,3 +259,8 @@ int tap_fd_get_ifname(int fd, char *ifname)
 {
     return -1;
 }
+
+int tap_fd_set_steering_ebpf(int fd, int prog_fd)
+{
+    return -1;
+}
diff --git a/net/tap-linux.c b/net/tap-linux.c
index b0635e9e32..9584769740 100644
--- a/net/tap-linux.c
+++ b/net/tap-linux.c
@@ -316,3 +316,16 @@ int tap_fd_get_ifname(int fd, char *ifname)
     pstrcpy(ifname, sizeof(ifr.ifr_name), ifr.ifr_name);
     return 0;
 }
+
+int tap_fd_set_steering_ebpf(int fd, int prog_fd)
+{
+    if (ioctl(fd, TUNSETSTEERINGEBPF, (void *) &prog_fd) != 0) {
+        error_report("Issue while setting TUNSETSTEERINGEBPF:"
+                    " %s with fd: %d, prog_fd: %d",
+                    strerror(errno), fd, prog_fd);
+
+       return -1;
+    }
+
+    return 0;
+}
diff --git a/net/tap-solaris.c b/net/tap-solaris.c
index 0475a58207..d85224242b 100644
--- a/net/tap-solaris.c
+++ b/net/tap-solaris.c
@@ -255,3 +255,8 @@ int tap_fd_get_ifname(int fd, char *ifname)
 {
     return -1;
 }
+
+int tap_fd_set_steering_ebpf(int fd, int prog_fd)
+{
+    return -1;
+}
diff --git a/net/tap-stub.c b/net/tap-stub.c
index de525a2e69..a0fa25804b 100644
--- a/net/tap-stub.c
+++ b/net/tap-stub.c
@@ -85,3 +85,8 @@ int tap_fd_get_ifname(int fd, char *ifname)
 {
     return -1;
 }
+
+int tap_fd_set_steering_ebpf(int fd, int prog_fd)
+{
+    return -1;
+}
diff --git a/net/tap.c b/net/tap.c
index b7512853f4..d0c1356a04 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -337,6 +337,14 @@ static void tap_poll(NetClientState *nc, bool enable)
     tap_write_poll(s, enable);
 }
 
+static bool tap_set_steering_ebpf(NetClientState *nc, int prog_fd)
+{
+    TAPState *s = DO_UPCAST(TAPState, nc, nc);
+    assert(nc->info->type == NET_CLIENT_DRIVER_TAP);
+
+    return tap_fd_set_steering_ebpf(s->fd, prog_fd) == 0;
+}
+
 int tap_get_fd(NetClientState *nc)
 {
     TAPState *s = DO_UPCAST(TAPState, nc, nc);
@@ -362,6 +370,7 @@ static NetClientInfo net_tap_info = {
     .set_vnet_hdr_len = tap_set_vnet_hdr_len,
     .set_vnet_le = tap_set_vnet_le,
     .set_vnet_be = tap_set_vnet_be,
+    .set_steering_ebpf = tap_set_steering_ebpf,
 };
 
 static TAPState *net_tap_fd_init(NetClientState *peer,
diff --git a/net/tap_int.h b/net/tap_int.h
index 225a49ea48..547f8a5a28 100644
--- a/net/tap_int.h
+++ b/net/tap_int.h
@@ -44,5 +44,6 @@ int tap_fd_set_vnet_be(int fd, int vnet_is_be);
 int tap_fd_enable(int fd);
 int tap_fd_disable(int fd);
 int tap_fd_get_ifname(int fd, char *ifname);
+int tap_fd_set_steering_ebpf(int fd, int prog_fd);
 
 #endif /* NET_TAP_INT_H */
-- 
2.30.0


