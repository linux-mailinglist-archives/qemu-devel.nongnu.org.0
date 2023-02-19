Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B944369C15B
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Feb 2023 17:39:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTmhW-0006NQ-JA; Sun, 19 Feb 2023 11:38:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pTmhU-0006Mc-HA
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 11:38:08 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pTmhS-0006kQ-QY
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 11:38:08 -0500
Received: by mail-ed1-x531.google.com with SMTP id i31so1423535eda.12
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 08:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cS2SfuOZUDUCnHCsD2utKdDjr/whiLBUbqxQeAy3dWs=;
 b=cTE8Bqd9WSkh7BTr0Ex07aec9q/A3Ut21NJaCIaXKLFdkwqdlIAiGrAe0p9Ti2T2lB
 5rXt2OSz0XMfuAqOAP/iPY3sIKAVgJfuwuRba24jsHOpqZ0TDawNMQOx3goi+Fy4MIs8
 fK/qRQuXzYjFLCW72ACe316eQLMtZnkIOhV9Z3UqN4XlpeYp2FcjKF+0FRYxP/dKxaXN
 3sbFhPCXc+4ltB/mwlk9RkgM9y6GIf/t1+24Vc54mVUIe3ILNd1GaB8oAn5rxQqiruiH
 8pCYnG7K2xLn51O4g+v744jeIuiR45bfFl5t/14ABv1dhQC0W25exG5b10xS76xlepMp
 y/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cS2SfuOZUDUCnHCsD2utKdDjr/whiLBUbqxQeAy3dWs=;
 b=GGhS/mD9ysX4t0pzZEe5IatzxZ2oTmaHHJRw6YPegWA4msVIlxo7SrCYyXzzYoJT6H
 EMH5OlA47l1wxoAHdZsIkUX/CpLs0ZpsbxrHQBMHuBxb2IeRInMINMU8S3a8Cdcbzjwm
 Ew3aKzOGq4ZJsocUZy2Gh/GWy2yhASTdmwotJXaz5q29jJeTLfWeCXzxgbA1XnSpH9XG
 PV2krc7K0rzricu+Rqd0Vh6tgHLEg7Ro8JLV3ONIQO+MmamTEf00zjY7YQS8P7xFYhAT
 HB3BxQoO7hgbvp4rDrZmI40x30odiyeMl7PrgK0a0gjNHoHB5RkDn0fkFO4+sn6uvVNu
 A4ww==
X-Gm-Message-State: AO0yUKVmyJdKPH7ddqY71Iy+FXzQ0UXBwvCn1Mn0S2NFyaOGOIAV09KC
 AkHTOXIry/X0SZkvQMzqZK9Mog==
X-Google-Smtp-Source: AK7set+Mp6ggUZ67UvudCmv/WbjDXTe5Po9NMtdVjJcZsNfv2yDAf5akeWLM5wxRSbnaCcziI/Qbeg==
X-Received: by 2002:a17:906:af1a:b0:880:a42d:dfb4 with SMTP id
 lx26-20020a170906af1a00b00880a42ddfb4mr5287323ejb.16.1676824685205; 
 Sun, 19 Feb 2023 08:38:05 -0800 (PST)
Received: from localhost.localdomain ([193.33.38.48])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a1709066b8d00b008cdb0628991sm647516ejr.57.2023.02.19.08.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 08:38:03 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, toke@redhat.com, mprivozn@redhat.com
Cc: yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [PATCH 2/5] virtio-net: Added property to load eBPF RSS with fds.
Date: Sun, 19 Feb 2023 18:20:57 +0200
Message-Id: <20230219162100.174318-3-andrew@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230219162100.174318-1-andrew@daynix.com>
References: <20230219162100.174318-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::531;
 envelope-from=andrew@daynix.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
index 3ae909041a..0ab2cf33f9 100644
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
@@ -1290,14 +1291,81 @@ static void virtio_net_detach_epbf_rss(VirtIONet *n)
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
@@ -3868,6 +3936,7 @@ static Property virtio_net_properties[] = {
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


