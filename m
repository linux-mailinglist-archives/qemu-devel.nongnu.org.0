Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C26E30F878
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 17:51:16 +0100 (CET)
Received: from localhost ([::1]:33676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7hqd-0003dO-HM
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 11:51:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1l7hbl-00030l-HX
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:35:53 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:41903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1l7hbi-0002Sy-F6
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:35:53 -0500
Received: by mail-lj1-x22c.google.com with SMTP id y14so4144707ljn.8
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 08:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cP5ueAi9y+O3krqgK3UyLK5m0SKkF5/Zu4Expc80iEI=;
 b=S5t1ioK7SaiODl7ycSCAQ6/cFd5zttCAva6SHYmn+fViICLJ7PezoCtphIlzw1a2Uv
 8NWv1kcaYHQYDgs3Jv30qcOrsfOV8KV+2p67pFlbma8rUqwpSLcHXM4iikzpqcI0LCh6
 88EspThFqnclqy6Dvg4LBpJMs36CZXOiU5To6kLA9eUF5hTAWVpIAObO8cuWNOEGk2fy
 M424nN3TOJhFH5crSlJt3rRyqYJ4TFJNbf3jcv/35GTm4m98T9nEMPKEhGP/hDaaD+WX
 n1eUoUeLWH/3ASoFXdr1kDw0uk/RW8H5Wv+00wdqe/z4z69r8VOH9A3tvENKTI7HpLqF
 uY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cP5ueAi9y+O3krqgK3UyLK5m0SKkF5/Zu4Expc80iEI=;
 b=ltqhh51G+ctnMM+RvfAiz1nZ7Q2ZSG6NLXiMtmPb7Mi+HRdiX8nT1NyGxcwhW+8yD+
 whZsLp27anNs4fufRBBMaUl4tbr5ZztxEHLdvdKvvH7tMrI+mB7knBNKz08DChUXPvXB
 COv+Yd5hu2uF1xMRkJ7zMsxv6aQE+r3apUMx3PmCjgtRZPWUIUbU0joWTNqWkLUiedeG
 TePOiX3E+YJ+y3aHqVKSARzORIVnFFakQZbf7rOqrt0g8/Djlbzg2P4wb4pksw+1/4Xi
 PkfA8hr4eqI83aFuo7GNwKOL4WRMHAbzAk2ZirSh0CpWTcaCjyGKCPstsJtTc2f6Lhz8
 bC8g==
X-Gm-Message-State: AOAM532hhdtuVlACH8PjPn8d7nKNtkgTtZB/zdL1iJ40cBTvekGNn6OW
 NHpZrQm8kgBm09UM+ncMLtQZpA==
X-Google-Smtp-Source: ABdhPJwWbM6avGr6YHUPumwr9pWvyqrb4tUZWBv/OQJnph4Edwtq8SGoe71Z979nlOgPrwC6y7jWwg==
X-Received: by 2002:a05:651c:2049:: with SMTP id
 t9mr104431ljo.505.1612456545555; 
 Thu, 04 Feb 2021 08:35:45 -0800 (PST)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id c123sm668172lfd.95.2021.02.04.08.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 08:35:44 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH v4 2/7] net: Added SetSteeringEBPF method for
 NetClientState.
Date: Thu,  4 Feb 2021 19:09:46 +0200
Message-Id: <20210204170951.91805-3-andrew@daynix.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204170951.91805-1-andrew@daynix.com>
References: <20210204170951.91805-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::22c;
 envelope-from=andrew@daynix.com; helo=mail-lj1-x22c.google.com
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


