Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C596F2F2E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 09:41:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptO8S-00055Z-BC; Mon, 01 May 2023 03:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1ptO8F-00053O-CO
 for qemu-devel@nongnu.org; Mon, 01 May 2023 03:39:36 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1ptO8D-0004lC-JC
 for qemu-devel@nongnu.org; Mon, 01 May 2023 03:39:35 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-94a342f7c4cso452894366b.0
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 00:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682926772; x=1685518772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n2/gpTCcdVZvaGm5qCKQW9zPN2NSzQB7j6lkzHyyke0=;
 b=l1axo1BCtVIXdbIgedyrSiX1itFEhO81vv0XOmqprz4Io6gZdFQsQV0jUksTGsWp7M
 4y8/vUk2uUBPzJbYutzJQNLBErGBLhBFGG8m2SJJLUv7o+ZeuBA8wj8ipldJoAH5+ouP
 mCZCJTHoK+E+4QB9OisZXsc5O0ujc1nWNMogO7l/uVTd4NIb72O4HaWW/hSRUc751MOr
 KVaweQQpxZTTAuS1PD0JF/Nfkctm7zQ4ctdXZs4Gy3Rvn1UyhS1IJYkAmvEPtZh10FxM
 8NSrDopDlq98rhqQ8onJkX1AOd0kHSyliTqFS/kCnFY2HXwiLDmITj4wvjCJIYoxwdLX
 j5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682926772; x=1685518772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n2/gpTCcdVZvaGm5qCKQW9zPN2NSzQB7j6lkzHyyke0=;
 b=bYkiP9KCqNP2KJIqKwze83nG1r1CL4k5ZfWM0ioSS846QPAuYfdKtpkqbAkvBzdZE5
 jBCAMy4TnQM7bs3DMU5JF0oRLbgc04MFAup3WKf4YKbuZbDNnTlFn06K9hoZhxMTTIvn
 5u4GW9s4hLa4PG4hdrgnAg9jCmeQAq1ru86ATptNvF8sKS664r6z70HeeKZLmvVcYYWT
 JYMsC3RrM+9RJIaRm1E6KXSO2Oy+VfAU+kvXb3K84BSEUeA14/5WaYFWh4T8SxGCSzhx
 ZmRy6m4esvRnHEOEYH6IzZOsqy0QQbqCzmXthAv06NzOowadRNgONik/qoP1CRRlUKKi
 9VPg==
X-Gm-Message-State: AC+VfDwVDnTMp1hRG050KDEqX8WmaG8AFPeifwOKRsrvO7IJ/iSf/aAw
 x7/k/F5L2PFZhpg8ue49b9/42Q==
X-Google-Smtp-Source: ACHHUZ4TAvGwnUGtPb8ci/qjU91fEqJ2mXHPCoYEG2LXwq7F0Rzi8q1etD3/Dwf3U+HPLXFxmdb8yA==
X-Received: by 2002:a17:907:368d:b0:953:1f45:3ced with SMTP id
 bi13-20020a170907368d00b009531f453cedmr11564132ejc.8.1682926771973; 
 Mon, 01 May 2023 00:39:31 -0700 (PDT)
Received: from localhost.localdomain (178-133-125-224.mobile.vf-ua.net.
 [178.133.125.224]) by smtp.gmail.com with ESMTPSA id
 d21-20020aa7c1d5000000b005027d31615dsm11708182edp.62.2023.05.01.00.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 00:39:31 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com, mst@redhat.com, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, berrange@redhat.com
Cc: yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [PATCH 2/5] virtio-net: Added property to load eBPF RSS with fds.
Date: Mon,  1 May 2023 10:20:58 +0300
Message-Id: <20230501072101.22890-3-andrew@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230501072101.22890-1-andrew@daynix.com>
References: <20230501072101.22890-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::62f;
 envelope-from=andrew@daynix.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

eBPF RSS program and maps may now be passed during initialization.
Initially was implemented for libvirt to launch qemu without permissions,
and initialized eBPF program through the helper.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 hw/net/virtio-net.c            | 96 +++++++++++++++++++++++++++++++---
 include/hw/virtio/virtio-net.h |  1 +
 2 files changed, 91 insertions(+), 6 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 53e1c326433..9b3a997d872 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -42,6 +42,7 @@
 #include "sysemu/sysemu.h"
 #include "trace.h"
 #include "monitor/qdev.h"
+#include "monitor/monitor.h"
 #include "hw/pci/pci_device.h"
 #include "net_rx_pkt.h"
 #include "hw/virtio/vhost.h"
@@ -1305,14 +1306,96 @@ static void virtio_net_detach_epbf_rss(VirtIONet *n)
     virtio_net_attach_ebpf_to_backend(n->nic, -1);
 }
 
-static bool virtio_net_load_ebpf(VirtIONet *n)
+static int virtio_net_get_ebpf_rss_fds(char *str, char *fds[], int nfds,
+                                       Error **errp)
 {
-    if (!virtio_net_attach_ebpf_to_backend(n->nic, -1)) {
-        /* backend does't support steering ebpf */
-        return false;
+    char *ptr = str;
+    char *cur = NULL;
+    size_t len = strlen(str);
+    int i = 0;
+
+    for (; i < nfds && ptr < str + len;) {
+        cur = strchr(ptr, ':');
+
+        if (cur == NULL) {
+            fds[i] = g_strdup(ptr);
+        } else {
+            fds[i] = g_strndup(ptr, cur - ptr);
+        }
+
+        i++;
+        if (cur == NULL) {
+            break;
+        } else {
+            ptr = cur + 1;
+        }
+    }
+
+    if (cur != NULL) {
+        /* the string contains more arguments */
+        error_setg(errp,
+                   "Too many eBPF file descriptors for RSS provided.");
+    } else if (i < nfds) {
+        error_setg(errp,
+                   "Not enough eBPF file descriptors for RSS were provided.");
+    }
+
+    return i;
+}
+
+static bool virtio_net_load_ebpf_fds(VirtIONet *n, Error **errp)
+{
+    char *fds_strs[EBPF_RSS_MAX_FDS];
+    int fds[EBPF_RSS_MAX_FDS];
+    int nfds;
+    int ret = true;
+    int i = 0;
+
+    ERRP_GUARD();
+
+    nfds = virtio_net_get_ebpf_rss_fds(n->ebpf_rss_fds,
+                                       fds_strs, EBPF_RSS_MAX_FDS, errp);
+    if (*errp) {
+        ret = false;
+        goto exit;
     }
 
-    return ebpf_rss_load(&n->ebpf_rss);
+    for (i = 0; i < nfds; i++) {
+        fds[i] = monitor_fd_param(monitor_cur(), fds_strs[i], errp);
+        if (*errp) {
+            ret = false;
+            goto exit;
+        }
+    }
+
+    ret = ebpf_rss_load_fds(&n->ebpf_rss, fds[0], fds[1], fds[2], fds[3]);
+
+exit:
+    if (!ret || *errp) {
+        for (i = 0; i < nfds; i++) {
+            close(fds[i]);
+        }
+    }
+
+    for (i = 0; i < nfds; i++) {
+        g_free(fds_strs[i]);
+    }
+
+    return ret;
+}
+
+static bool virtio_net_load_ebpf(VirtIONet *n, Error **errp)
+{
+    bool ret = false;
+
+    if (virtio_net_attach_ebpf_to_backend(n->nic, -1)) {
+        if (!(n->ebpf_rss_fds
+                && virtio_net_load_ebpf_fds(n, errp))) {
+            ret = ebpf_rss_load(&n->ebpf_rss);
+        }
+    }
+
+    return ret;
 }
 
 static void virtio_net_unload_ebpf(VirtIONet *n)
@@ -3738,7 +3821,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     net_rx_pkt_init(&n->rx_pkt);
 
     if (virtio_has_feature(n->host_features, VIRTIO_NET_F_RSS)) {
-        virtio_net_load_ebpf(n);
+        virtio_net_load_ebpf(n, errp);
     }
 }
 
@@ -3900,6 +3983,7 @@ static Property virtio_net_properties[] = {
                     VIRTIO_NET_F_RSS, false),
     DEFINE_PROP_BIT64("hash", VirtIONet, host_features,
                     VIRTIO_NET_F_HASH_REPORT, false),
+    DEFINE_PROP_STRING("ebpf_rss_fds", VirtIONet, ebpf_rss_fds),
     DEFINE_PROP_BIT64("guest_rsc_ext", VirtIONet, host_features,
                     VIRTIO_NET_F_RSC_EXT, false),
     DEFINE_PROP_UINT32("rsc_interval", VirtIONet, rsc_timeout,
diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index ef234ffe7ef..e10ce88f918 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -219,6 +219,7 @@ struct VirtIONet {
     VirtioNetRssData rss_data;
     struct NetRxPkt *rx_pkt;
     struct EBPFRSSContext ebpf_rss;
+    char *ebpf_rss_fds;
 };
 
 size_t virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
-- 
2.39.1


