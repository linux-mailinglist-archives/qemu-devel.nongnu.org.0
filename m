Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79683A0FEF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:07:37 +0200 (CEST)
Received: from localhost ([::1]:51250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqv7Y-0003AU-PN
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lqv5E-0000JE-CC
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:05:12 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:34582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lqv5B-0006si-Jj
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:05:12 -0400
Received: by mail-lf1-x12d.google.com with SMTP id f30so37161412lfj.1
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 03:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VZcva1w0YsTCDAr5AsPAqXS01llpV02/KrLMUdw59do=;
 b=CRAWMytEarY4Q2Uc+mb1jp3lAQIbFP060ceWuOp8ZM8O1zUjglgjDBF9BXNRvqQTme
 X4JuawgxfXxTkcj00RSL+vgor9lGvqAQpSs3ORMadec+YgKH8wX5bQyrQSPzY/zafIsr
 tMvwF92vRXMacT7vPDr3FstuK+uaj2TgJOyecoKX0ANapQQm8EEMyRiLmjuakZjlJAPC
 JK06bOjuJyyNaqgiH+wWa8cIpqixa+l+Kh8ERNgtgF0AvgF0ZhGIA0tyvGNF1Q1SdNSr
 oG6ZTpl5OQnI6aqy8qq5i6IfI0DE75ZVou7lF6ZuMn9nqyuV2wIre7SC7ShQs+KbpTFt
 fAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VZcva1w0YsTCDAr5AsPAqXS01llpV02/KrLMUdw59do=;
 b=RKopUoBYpWBXjfR/uTV1EOMV7/1N+jI753bLsisd8E+DpcL1DxqrPBV/7R/vhahShi
 0GLYxfZY/5S0lkHzth8oRotCEFt9XecJBKyJVMcfubhQR/4aHaXQjOXmSK3BX2jn1jkZ
 AmPShPowZfF5mMYIQ4MfXp3TEUPAYY+nhShOD2vepRDOg59VDR7cjaaDDtTY7MLaUlpk
 R7KUnToZofuf3/11x8DhHsJI+KXCr1Q9FccS0T0xqLxDNLA/Su68EsnD67yOL1wbpjYk
 7l1OV83Op3G/rPeu97kXP2wMc1DkzQXizfbL+g11V4woj3gDs+b7+SBu4Hw7xiUTItX1
 POqw==
X-Gm-Message-State: AOAM530UUpbKLFvfiac2l9iiazbqy/d28HU2M2Z0n2UfAKDnZSgM3EtW
 f6252Qf5ekyR4zrIkMpAg9wjcQ==
X-Google-Smtp-Source: ABdhPJyr1w5wog8cFfH4Bcc1ngwHRw019apf4s7yuhDwmx/ximlRsEemsXASGeoa69aVICso27sHlQ==
X-Received: by 2002:a19:4096:: with SMTP id n144mr9013465lfa.433.1623233108091; 
 Wed, 09 Jun 2021 03:05:08 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id l12sm333590lfk.10.2021.06.09.03.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 03:05:07 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: mst@redhat.com, yuri.benditovich@daynix.com, jasowang@redhat.com,
 armbru@redhat.com, eblake@redhat.com, berrange@redhat.com
Subject: [RFC PATCH 2/5] virtio-net: Added property to load eBPF RSS with fds.
Date: Wed,  9 Jun 2021 13:04:54 +0300
Message-Id: <20210609100457.142570-3-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609100457.142570-1-andrew@daynix.com>
References: <20210609100457.142570-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::12d;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x12d.google.com
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
Cc: yan@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

eBPF RSS program and maps now may be passed during initialization.
Initially was implemented for libvirt to launch qemu without permissions.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 hw/net/virtio-net.c            | 77 ++++++++++++++++++++++++++++++++--
 include/hw/virtio/virtio-net.h |  1 +
 2 files changed, 74 insertions(+), 4 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index bd7958b9f0..0602b1772e 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -41,6 +41,7 @@
 #include "sysemu/sysemu.h"
 #include "trace.h"
 #include "monitor/qdev.h"
+#include "monitor/monitor.h"
 #include "hw/pci/pci.h"
 #include "net_rx_pkt.h"
 #include "hw/virtio/vhost.h"
@@ -1223,14 +1224,81 @@ static void virtio_net_detach_epbf_rss(VirtIONet *n)
     virtio_net_attach_ebpf_to_backend(n->nic, -1);
 }
 
-static bool virtio_net_load_ebpf(VirtIONet *n)
+static int virtio_net_get_ebpf_rss_fds(char *str, char *fds[], int nfds)
 {
-    if (!virtio_net_attach_ebpf_to_backend(n->nic, -1)) {
-        /* backend does't support steering ebpf */
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
+{
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
@@ -3605,6 +3673,7 @@ static Property virtio_net_properties[] = {
                     VIRTIO_NET_F_RSS, false),
     DEFINE_PROP_BIT64("hash", VirtIONet, host_features,
                     VIRTIO_NET_F_HASH_REPORT, false),
+    DEFINE_PROP_STRING("ebpf_rss_fds", VirtIONet, ebpf_rss_fds),
     DEFINE_PROP_BIT64("guest_rsc_ext", VirtIONet, host_features,
                     VIRTIO_NET_F_RSC_EXT, false),
     DEFINE_PROP_UINT32("rsc_interval", VirtIONet, rsc_timeout,
diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index 824a69c23f..993f2f3036 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -213,6 +213,7 @@ struct VirtIONet {
     VirtioNetRssData rss_data;
     struct NetRxPkt *rx_pkt;
     struct EBPFRSSContext ebpf_rss;
+    char *ebpf_rss_fds;
 };
 
 void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
-- 
2.31.1


