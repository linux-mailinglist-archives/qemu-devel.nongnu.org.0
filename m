Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E463495DD
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:44:43 +0100 (CET)
Received: from localhost ([::1]:36666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPSA6-0001bJ-6C
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lPS2W-00009U-89
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:36:52 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:46915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lPS2T-0006tk-Oi
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:36:51 -0400
Received: by mail-lj1-x231.google.com with SMTP id u20so3635556lja.13
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 08:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QkAzwIR60weIBpGJ4LkI1saFJIlM+A/otLgE1NANx5I=;
 b=c93I17JAH3wrXQLGDZG7oDEHPLT552qnADclUeqWAb2mOqqmbld+d91QiESIp6/siv
 CFe70EbdMZtB8QHx3W6Bvoana9VgGbQQ1AC6XE3JkWNuExpft2I5ysY/4Hqnw7622yDB
 casJK+5hh118vl0Vod0RGSMjrgbiM+L+iRmHWR7boCoApRCf5kPQp4tz1QvzRc6jCkVv
 3YujKT8vTlv4Z/wCtQbD/Zn7tXYSGpdkpr+4wlitpsyAMECWqF9jYJq0hfsow8KF9HkT
 SW33myedlJPJ5cbQOssg3+YteXnuQHEvMCOd1Fc2O5SlYxPDS3KZf48j0xqk5gifc5Un
 A1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QkAzwIR60weIBpGJ4LkI1saFJIlM+A/otLgE1NANx5I=;
 b=nIhCunD0iREpMK5EJNfe16SQ35987qaWv4pkIRxrV7a4T8RPatVbcu9TkbkI1UDyKI
 wNuh0ea4XK/X6Q/t5+35XzfyCdCKxowpZAHnZkJiML219UUTwyHz4QWbAA3l8joEQtcZ
 +dYQnV4SyjuBxAC6X7Ah1Zv0UAx2H6YYh13/vQBZbMqkfjWCpJ3L0mfyn3bIebf6Xofl
 j6qHk/Rpr+hzrvFh0UGcmHLfhItb/pHMQhZn4oK89g7D63CGWqm71kMB6VjrVJNR8gnA
 YbmsxkTyI03gSrgdNSDe/OpLLUp2YZDazpb7KkABlXKEqpwlvTs5v6YO2YoEe3cxxwlJ
 W1AA==
X-Gm-Message-State: AOAM533hoKHenOaT0hwQjrQBrHt2CYjTYmg79tssmOkISz1Mxrvs8oj3
 ndVLl2iQ3Ry4TSOnBxV9aTbMoQ==
X-Google-Smtp-Source: ABdhPJzzjOQ0TbJQ4S+bJORigr36dfNwb9l/yqISfgfdXZ1sXsFRz77racBTjgAVsU6d3xK7cYgdPw==
X-Received: by 2002:a2e:300d:: with SMTP id w13mr6321586ljw.199.1616686608262; 
 Thu, 25 Mar 2021 08:36:48 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id w23sm796694lji.127.2021.03.25.08.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 08:36:47 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [PATCH v5 2/7] net: Added SetSteeringEBPF method for NetClientState.
Date: Thu, 25 Mar 2021 17:35:24 +0200
Message-Id: <20210325153529.75831-3-andrew@daynix.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210325153529.75831-1-andrew@daynix.com>
References: <20210325153529.75831-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::231;
 envelope-from=andrew@daynix.com; helo=mail-lj1-x231.google.com
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
index a02949f6db..fc617b2f8c 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -63,6 +63,7 @@ typedef int (SetVnetBE)(NetClientState *, bool);
 typedef struct SocketReadState SocketReadState;
 typedef void (SocketReadStateFinalize)(SocketReadState *rs);
 typedef void (NetAnnounce)(NetClientState *);
+typedef bool (SetSteeringEBPF)(NetClientState *, int);
 
 typedef struct NetClientInfo {
     NetClientDriver type;
@@ -84,6 +85,7 @@ typedef struct NetClientInfo {
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
index 12a08d54fe..ea65ed9e19 100644
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
2.31.0


