Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F7E2B904C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 11:43:49 +0100 (CET)
Received: from localhost ([::1]:56446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfhPn-0002Ug-Oh
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 05:43:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kfhNC-0000mn-DX
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:41:06 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:46128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kfhN7-0001sz-Pt
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:41:06 -0500
Received: by mail-lf1-x141.google.com with SMTP id v144so7483994lfa.13
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 02:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xMzQNsjUhrYSskEJqjPDYk8dZ7vaaHdiTf81eJ7Pjs0=;
 b=zQkWjgp+b/7aJ05niLC7aWjLctJu6FyK0xQ19FO8OtrAOrzEqId0Ky6OaiNHTzQp4z
 v7uIQui02WNvs23j3BL9PBTuDHR8jSw4qpJzgkNyzPGd5DJayZWcmXeTeDgs5alQ0dka
 xvreuShFx+qkzUFqFCwn14d/EATDqd+x6w6tfI74d4o9GqJHOSOcTI6uo4x6jAMxyeDv
 6H9c9xSe5T04KrZcu1MGkfsRcWtq2ZLad3vIC6B0huuVYlHqrLAdEwjerd/926pxNt1t
 jwjeyKQW3qCfCo6CKOE/829gWyBlZ0RzSGBWnI2QUQ1UsqQBPuOWcjYhrlYSveLp1ghV
 2kGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xMzQNsjUhrYSskEJqjPDYk8dZ7vaaHdiTf81eJ7Pjs0=;
 b=gqbAbn9cdS+nOx3/akaJbz38sJ9fBl+z5h77f8CbQrr/Vf2lKaSdXJs60dic0ZbUqS
 7y7zFl9cOYXiFZqDPOScJoSCM5RHJgY+PXw8io0gLgcnwA63dyvDki/1pFfoB9yrOJ9J
 rLdEUrNA25WAroWkkSJ2WKSmRaU4JeustBSfu+rX8lNz9bY/uTWECW3vw0S65AI9ZJBf
 7s7HSY1ekpiSme01k5K8sB+knZL6uZZRXE06usnHZrSGEJIHJfSQ4P3RaOYu6Fu6Dimn
 B307bxFZHhasJGcfhtRCZBQP+wwdEd9t7WIj63WHQauLhK4Rc+K6Sef/tP6WCHi/59Mq
 04Hw==
X-Gm-Message-State: AOAM530sYwFfHC7DTCqh5RHBXsqL46GVMewbl/Q/xwm/cegQWsjTkaMm
 qUuvTejC1KqcOGxRc3cPeXfg0g==
X-Google-Smtp-Source: ABdhPJyRupuJywGN/WkJmsVsRFRi6f8ciG4pcCNueWX3gjvuMlu5o7j/45EwC7MsjwwUkt0ZVtfW3g==
X-Received: by 2002:ac2:53a1:: with SMTP id j1mr5239136lfh.236.1605782458838; 
 Thu, 19 Nov 2020 02:40:58 -0800 (PST)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id h6sm3912667lfj.108.2020.11.19.02.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 02:40:58 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH v2 1/5] net: Added SetSteeringEBPF method for
 NetClientState.
Date: Thu, 19 Nov 2020 13:13:01 +0200
Message-Id: <20201119111305.485202-2-andrew@daynix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119111305.485202-1-andrew@daynix.com>
References: <20201119111305.485202-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::141;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com, qemu-devel@nongnu.org
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
 net/tap-linux.h   |  1 +
 net/tap-solaris.c |  5 +++++
 net/tap-stub.c    |  5 +++++
 net/tap.c         |  9 +++++++++
 net/tap_int.h     |  1 +
 8 files changed, 41 insertions(+)

diff --git a/include/net/net.h b/include/net/net.h
index 897b2d7595..d8a41fb010 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -60,6 +60,7 @@ typedef int (SetVnetBE)(NetClientState *, bool);
 typedef struct SocketReadState SocketReadState;
 typedef void (SocketReadStateFinalize)(SocketReadState *rs);
 typedef void (NetAnnounce)(NetClientState *);
+typedef bool (SetSteeringEBPF)(NetClientState *, int);
 
 typedef struct NetClientInfo {
     NetClientDriver type;
@@ -81,6 +82,7 @@ typedef struct NetClientInfo {
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
diff --git a/net/tap-linux.h b/net/tap-linux.h
index 2f36d100fc..1d06fe0de6 100644
--- a/net/tap-linux.h
+++ b/net/tap-linux.h
@@ -31,6 +31,7 @@
 #define TUNSETQUEUE  _IOW('T', 217, int)
 #define TUNSETVNETLE _IOW('T', 220, int)
 #define TUNSETVNETBE _IOW('T', 222, int)
+#define TUNSETSTEERINGEBPF _IOR('T', 224, int)
 
 #endif
 
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
index c46ff66184..81f50017bd 100644
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
2.29.2


