Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0276CF846
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 02:34:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phgED-00083e-V7; Wed, 29 Mar 2023 20:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1phgEA-00082P-6n
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 20:33:18 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1phgE8-0004EY-Ee
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 20:33:17 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso10741966wmo.0
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 17:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1680136395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DslxHK6KBlhiVdu3Lr2KxbgUyV3iiwJejUtCbzhCHrg=;
 b=T0T9a0W3OxmGQCDZ3ZHNTMdYPDNI9uFtU0l0puMFU0oIkA182wWikRX9RbcTUcXCok
 MfLlijCwySfxTWrjqW7N56KzLr0bmE1e7ynPE+PMHUtbh32pSTObGRwN0LTeuhHXY4ob
 z6BBdSM5W0Hdp4UlXfRQB+2T0MhzPX+LZqfMI7EMhS+3GPPQziIdeK5RIY7tHwceS0ms
 8dydQN+JssttR4+RFWCt/CSETssVLStHR5tdJIUnE46GrKqgXQdZoUahNrel2HMS3yjf
 kJ+Lpq0Euom8BUGtQgvpKdcD9rGthx9/RNaFd60L9yTQlqagQiNAsiaKOjroYLqzN3sN
 SRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680136395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DslxHK6KBlhiVdu3Lr2KxbgUyV3iiwJejUtCbzhCHrg=;
 b=rrL4VHv4isfmlb1bkyLBrYqJ9AjowbBsGbA6LndTgMFEzFcCI5/U/jrb9DWAwf/cQE
 JI+zAQUEfjWoCQwXS61Rg+LbUuv4QWMfruNPet98wmwxzgQxVQn97w6goD+sLqhlgsJJ
 8Jy+4j13rw44og2i3ozMjcXBZnzSda6czt8J6Z3zAPqjcjdJUfuoaAG0FtEs/FQYg++0
 HIZ/Xa1fx0NDdsJdFXb6oojsMHSjD2Bv4i2lTu3Heu2e1ebXPwd3ra9ej8DHZuo0g+4p
 +Merd3RFxNm1ZFl2BSbd/vxP+IHXgjAhTVyWYrE+ZIrjgwXrHI3LKCgI4U8Ha1uVgVsR
 OPlw==
X-Gm-Message-State: AO0yUKUqsNCZrM0AtC7P+asu6DG4D24jgwNCv6ndXwamuBVHeXBevHyE
 FCl5Qh37F8j5qQ+3vIEPzpgWaw==
X-Google-Smtp-Source: AK7set8MHCyaAWXwJ7MPIPrZv9/2wF1R25dO+guq3iAA7Y+It9qy2+eGf1qHwIMy4nicddSd65Fotg==
X-Received: by 2002:a1c:7c17:0:b0:3ed:2ae9:6c75 with SMTP id
 x23-20020a1c7c17000000b003ed2ae96c75mr16062757wmc.37.1680136395091; 
 Wed, 29 Mar 2023 17:33:15 -0700 (PDT)
Received: from localhost.localdomain (178-133-100-41.mobile.vf-ua.net.
 [178.133.100.41]) by smtp.gmail.com with ESMTPSA id
 n19-20020a7bcbd3000000b003ef684c5e32sm3724480wmi.48.2023.03.29.17.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 17:33:14 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, toke@redhat.com, mprivozn@redhat.com
Cc: yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [RFC PATCH 2/5] virtio-net: Added property to load eBPF RSS with fds.
Date: Thu, 30 Mar 2023 03:15:19 +0300
Message-Id: <20230330001522.120774-3-andrew@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230330001522.120774-1-andrew@daynix.com>
References: <20230330001522.120774-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::32c;
 envelope-from=andrew@daynix.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 hw/net/virtio-net.c            | 77 ++++++++++++++++++++++++++++++++--
 include/hw/virtio/virtio-net.h |  1 +
 2 files changed, 74 insertions(+), 4 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 53e1c32643..45d448a83d 100644
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
@@ -1305,14 +1306,81 @@ static void virtio_net_detach_epbf_rss(VirtIONet *n)
     virtio_net_attach_ebpf_to_backend(n->nic, -1);
 }
 
-static bool virtio_net_load_ebpf(VirtIONet *n)
+static int virtio_net_get_ebpf_rss_fds(char *str, char *fds[], int nfds)
+{
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
+    return i;
+}
+
+static bool virtio_net_load_ebpf_fds(VirtIONet *n)
 {
-    if (!virtio_net_attach_ebpf_to_backend(n->nic, -1)) {
-        /* backend does't support steering ebpf */
+    char *fds_strs[EBPF_RSS_MAX_FDS];
+    int fds[EBPF_RSS_MAX_FDS];
+    int nfds;
+    int ret = false;
+    Error *errp;
+    int i = 0;
+
+    if (n == NULL || !n->ebpf_rss_fds) {
         return false;
     }
 
-    return ebpf_rss_load(&n->ebpf_rss);
+    nfds = virtio_net_get_ebpf_rss_fds(n->ebpf_rss_fds,
+                                       fds_strs, EBPF_RSS_MAX_FDS);
+    for (i = 0; i < nfds; i++) {
+        fds[i] = monitor_fd_param(monitor_cur(), fds_strs[i], &errp);
+    }
+
+    if (nfds == EBPF_RSS_MAX_FDS) {
+        ret = ebpf_rss_load_fds(&n->ebpf_rss, fds[0], fds[1], fds[2], fds[3]);
+    }
+
+    if (!ret) {
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
+static bool virtio_net_load_ebpf(VirtIONet *n)
+{
+    bool ret = true;
+
+    if (virtio_net_attach_ebpf_to_backend(n->nic, -1)) {
+        if (!(n->ebpf_rss_fds
+                && virtio_net_load_ebpf_fds(n))) {
+            ret = ebpf_rss_load(&n->ebpf_rss);
+        }
+    }
+
+    return ret;
 }
 
 static void virtio_net_unload_ebpf(VirtIONet *n)
@@ -3900,6 +3968,7 @@ static Property virtio_net_properties[] = {
                     VIRTIO_NET_F_RSS, false),
     DEFINE_PROP_BIT64("hash", VirtIONet, host_features,
                     VIRTIO_NET_F_HASH_REPORT, false),
+    DEFINE_PROP_STRING("ebpf_rss_fds", VirtIONet, ebpf_rss_fds),
     DEFINE_PROP_BIT64("guest_rsc_ext", VirtIONet, host_features,
                     VIRTIO_NET_F_RSC_EXT, false),
     DEFINE_PROP_UINT32("rsc_interval", VirtIONet, rsc_timeout,
diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index ef234ffe7e..e10ce88f91 100644
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


