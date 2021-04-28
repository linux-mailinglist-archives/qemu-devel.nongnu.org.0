Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1034236DD9E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:55:37 +0200 (CEST)
Received: from localhost ([::1]:47580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnTM-0001K7-0b
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lbnLt-00048j-EM
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:47:53 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:42578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lbnLm-0006gg-VE
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:47:53 -0400
Received: by mail-lf1-x135.google.com with SMTP id d27so43489633lfv.9
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 09:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v3yo78votzBUx2BxhduTni1w+nb0etUonkzgNxiZBWQ=;
 b=KTfCIAXpI44HBo9jnKj4yV7bUPL+rl1hjPsecUxP+hzp0Bau8Ey1+5Ysps196EWgf6
 WJyb8TgPfc6Z8c+CDXgJgnQnt9O2hsHlxj+FLMw+dno1Zth7+Jl4Q3Cd3tdNbNqN0Mmj
 8rGHPbGbIdKrfaq2KoXRhrS7tjp3x6MVOuvv+6u2xr6cUjtvWh+xvJn83muyMldiadrC
 WRinJ/D63WvCxHrpCxUTo17SsO4nW1mRkeTe7G51Hk+vMSCx+D7HqFiUIFP76UCVVE2z
 6Fz/D1a0r1qybUAHwkpT0DG8BNX7LHIi3dtb54woXan5SAPyKoykYgWxjL/J/Fq9VaUl
 l68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v3yo78votzBUx2BxhduTni1w+nb0etUonkzgNxiZBWQ=;
 b=VVTldlL8FlsZn1+Tgm9BMMqIa7keNCumW71BbvkElJlJsS+bkyLYPoPexCw8j1OWi/
 mDUg5rXLnORHDTC61+EYE1jcAxK5iNnxwcXONaJoEMJmzzCuX1gT0nRujr2QugwY2oxr
 Fk7zuCZ8NRODmPtrRtnIC6KbYpEb/JPSmut5Qyft8cT4+WRdjXhV1YX1qsyFz9ghaUAe
 3aowj0u9RC17AXB9ncimcPW6dQBEjnTxB2lwAINrMd51edSm87AHcBXr5k4A0+pyDQ9i
 xZcqDVEQkvifm2rRBopBufctLKojbY01VXEsjV3aelbaXfGjZLhb5HBFn2ix7lJWeMEw
 KQyA==
X-Gm-Message-State: AOAM5328UicQ1wWBazjHfVWwivstkqfb8NcSRVwszEQRWftBTDbYKKTP
 98FzRiA58NC6eviIU+wKclIGbg==
X-Google-Smtp-Source: ABdhPJzQKNwa4ra7E+qbqbAaE8BJnRp0Pfijq0CqgGzEcukklGLfBo+fehGpFg0lRrKjyMJoRWfs8g==
X-Received: by 2002:a05:6512:34cb:: with SMTP id
 w11mr21390093lfr.267.1619628464923; 
 Wed, 28 Apr 2021 09:47:44 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id v24sm86302lfp.195.2021.04.28.09.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 09:47:44 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [PATCH v7 2/7] net: Added SetSteeringEBPF method for NetClientState.
Date: Wed, 28 Apr 2021 19:47:28 +0300
Message-Id: <20210428164733.56547-3-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210428164733.56547-1-andrew@daynix.com>
References: <20210428164733.56547-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::135;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x135.google.com
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
index 1ef536d771..5d1508081f 100644
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
index bae895e287..f5686bbf77 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -347,6 +347,14 @@ static void tap_poll(NetClientState *nc, bool enable)
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
@@ -372,6 +380,7 @@ static NetClientInfo net_tap_info = {
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
2.31.1


