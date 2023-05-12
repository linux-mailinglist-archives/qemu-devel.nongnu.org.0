Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D7E70086A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 14:49:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxSC0-0003KL-Ga; Fri, 12 May 2023 08:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pxSBm-0003DK-HF
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:48:03 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pxSBj-0000LF-Ca
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:48:02 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-965f7bdab6bso1661068666b.3
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 05:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683895677; x=1686487677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BK6Y5uWSc9cgj4CUjrGcDoWUO4wUbSZhdqcsWjWklA8=;
 b=U2gUHxWgHagPa/tqtPEFGRs1xb0LprcCpsim6ZdsknTwpDz8SfJuQNWCLtHoAfvnRu
 Kf53wiBXPSYD3F3RfQ5anhDzuQzvC9EQTxZ76PeJyDTZWXCA4msrHz+6TkX04r1ncpP/
 ZKveeqqySXXGq09jyslN678LAEaR7s7mO0jXcw+jBvSkLFC0lct1sNJjeN2q7WsDbWWG
 eyb7EntcEnFQzuuSxaaGcUd+uvhFCzJ8OEyuOnvX9I4QuQ+y8leEzrZPA5s1sAjt22Ps
 bImAwPj1FllwArekB4c9h1mnzsh2RLlm0jSOiw1oe1YO57EsxcYES4z4H9hH2uwwsLkb
 ++5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683895677; x=1686487677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BK6Y5uWSc9cgj4CUjrGcDoWUO4wUbSZhdqcsWjWklA8=;
 b=LNHOGksf9m51wPQ2gE9J6WSP0BU4/1UIJeKN/Rj6YvzDDx9KP0fnMR+pQBh3scJv/Q
 OXWNIZr9o8KVzuMUoixmh7uENSKmP9VIOCpq35c03D2ti2MbEy0Z9WYgx/+Ef4RTaNoi
 VN8K4ZpVWcnsmrIva/v6OBFjrSCyFFHYmJbBc1RGT03V7btbD3r232m0IV119jkKIuZd
 +k0OZXG6usgswChgIhoh0XPlHHqoMZrtrBkyjMb2Pi72BnRRcDsfasR90/fx8Acm30Gx
 HxECB9a8s6t8Kgz/MB+Ysp3BtH89JuGl/ysg1FFZ4j8u0C9tTZKw7PeGZcEg8JiVQzAe
 e6LQ==
X-Gm-Message-State: AC+VfDzvyRoFGZhGUq54S4DIjOmZd7CtAi6yzatdAnTcuq4MkxE6vIWn
 DZQJdKdEXVu7mBHfOvugnIs9/A==
X-Google-Smtp-Source: ACHHUZ5sGrACqhZWlXsP4h19xniPO0DE3SlUYGGaVXJsUz6hicTv05A9ufuOAkloMmlFbAYNbV/a9g==
X-Received: by 2002:a17:907:368b:b0:95f:2065:83c0 with SMTP id
 bi11-20020a170907368b00b0095f206583c0mr23955896ejc.62.1683895677399; 
 Fri, 12 May 2023 05:47:57 -0700 (PDT)
Received: from localhost.localdomain (178-133-109-64.mobile.vf-ua.net.
 [178.133.109.64]) by smtp.gmail.com with ESMTPSA id
 ze11-20020a170906ef8b00b00965b0eb7b0csm5322585ejb.103.2023.05.12.05.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 05:47:57 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com, mst@redhat.com, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, berrange@redhat.com
Cc: yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [PATCH v2 3/6] virtio-net: Added property to load eBPF RSS with fds.
Date: Fri, 12 May 2023 15:28:59 +0300
Message-Id: <20230512122902.34345-4-andrew@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230512122902.34345-1-andrew@daynix.com>
References: <20230512122902.34345-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::635;
 envelope-from=andrew@daynix.com; helo=mail-ej1-x635.google.com
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
 hw/net/virtio-net.c            | 55 ++++++++++++++++++++++++++++++----
 include/hw/virtio/virtio-net.h |  1 +
 2 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 53e1c326433..a62d7936948 100644
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
@@ -1305,14 +1306,55 @@ static void virtio_net_detach_epbf_rss(VirtIONet *n)
     virtio_net_attach_ebpf_to_backend(n->nic, -1);
 }
 
-static bool virtio_net_load_ebpf(VirtIONet *n)
+static bool virtio_net_load_ebpf_fds(VirtIONet *n, Error **errp)
 {
-    if (!virtio_net_attach_ebpf_to_backend(n->nic, -1)) {
-        /* backend does't support steering ebpf */
-        return false;
+    int fds[EBPF_RSS_MAX_FDS] = { [0 ... EBPF_RSS_MAX_FDS - 1] = -1};
+    int nfds = 0;
+    int ret = true;
+    int i = 0;
+    g_autofree char **fds_strs = g_strsplit(n->ebpf_rss_fds, ":", 0);
+
+    ERRP_GUARD();
+
+    if (g_strv_length(fds_strs) != EBPF_RSS_MAX_FDS) {
+        error_setg(errp,
+                  "Expected %d file descriptors but got %d",
+                  EBPF_RSS_MAX_FDS, g_strv_length(fds_strs));
+       return false;
+   }
+
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
+        for (i = 0; i < nfds && fds[i] != -1; i++) {
+            close(fds[i]);
+        }
     }
 
-    return ebpf_rss_load(&n->ebpf_rss);
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
@@ -3738,7 +3780,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     net_rx_pkt_init(&n->rx_pkt);
 
     if (virtio_has_feature(n->host_features, VIRTIO_NET_F_RSS)) {
-        virtio_net_load_ebpf(n);
+        virtio_net_load_ebpf(n, errp);
     }
 }
 
@@ -3900,6 +3942,7 @@ static Property virtio_net_properties[] = {
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


