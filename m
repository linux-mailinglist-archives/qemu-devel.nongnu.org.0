Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A0F67C915
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 11:50:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKzoR-0004tN-7B; Thu, 26 Jan 2023 05:48:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKznr-0003jb-EG
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:48:23 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKznp-0005fa-HJ
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:48:23 -0500
Received: by mail-pl1-x62a.google.com with SMTP id be8so1476927plb.7
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 02:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EvxROB9lrXSfSw27Ce9ZPGZ8VT7Veq+eQFf4W+3a7D8=;
 b=mqy4AfHtvw2MCv9wS9y7zZHPhRxkSKr5zDbwcQR2ruKwuC203KD5UUaYEFJBnfV5eQ
 TJPH+L9NtndiC2cw6Q0qi90tyFXXaGvpUQ0wjOM8qnSZoKvdlnlR4OAbCM7yy9Q1VNtA
 oGG+kE83AeQR0UEpuODhsBD4ToXBuy/XR1y6sX9BRzS6CpLjXhB4oy/dZms6LoBXBJeG
 QAaWJcAZXmXQ5wQeB0IUMOoHeqCpCZLrNBxAn6ZWBn0Wbs6DOPw0R0C/lzUlwJbowhRi
 tQ9uvuGIuZJdACzzH2mm7FoYF2U3pBKs7Br4orZ3poHKEg8DsYcVTpk/TtcTu6mV8eu+
 MWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EvxROB9lrXSfSw27Ce9ZPGZ8VT7Veq+eQFf4W+3a7D8=;
 b=HzXyyQD9BUyS2M2YI8ed47NDywVjymQEH9alxC+3rwnGryL5SpewcZflmbc3NsYTxa
 TZciukYZIL+LTt7chAd0AgyZzhkQdg5pxtvi0e+BeWswnpIiNAIdgKsE82vGpT14rfEK
 d7eXWzAc+EC5WyUr0Dbh8IORNP7e4KeOr8AX5jkQIPAi/QtbxtPuSdg0HhuysAcyyykY
 gbYfP378h9+lGhvixopgIdvsdxk6KI0hY+5GrldipsTtWoiKFEeLRYVBVLs+dXz5FQLe
 eoxPsQ8Yd66iYM7gS9ONAvyF1Tt+ZXp7JDDM2QndxlfLTNkcm1V4u8JBY+lSqqowVUNQ
 ocWQ==
X-Gm-Message-State: AO0yUKXAc2uAnpYhI+JEclXAEM9ik36oS4BRWPTVadcV9GnyXaDFXolg
 BFFLllDMLsqc+lxZnyfC/ciKHQ==
X-Google-Smtp-Source: AK7set8cfdll+fYeF60xiTTfHKgub+LxKom5G9eSkLGLxwwCVyuCfeAOFPL7a9BCx9WrgwzsRDe5ag==
X-Received: by 2002:a05:6a21:8ccc:b0:bb:ccef:f896 with SMTP id
 ta12-20020a056a218ccc00b000bbcceff896mr5242265pzb.12.1674730100111; 
 Thu, 26 Jan 2023 02:48:20 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a63af48000000b0046b1dabf9a8sm496789pgo.70.2023.01.26.02.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 02:48:19 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 20/26] net: Strip virtio-net header when dumping
Date: Thu, 26 Jan 2023 19:46:59 +0900
Message-Id: <20230126104705.35023-21-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126104705.35023-1-akihiko.odaki@daynix.com>
References: <20230126104705.35023-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

filter-dump specifiees Ethernet as PCAP LinkType, which does not expect
virtio-net header. Having virtio-net header in such PCAP file breaks
PCAP unconsumable. Unfortunately currently there is no LinkType for
virtio-net so for now strip virtio-net header to convert the output to
Ethernet.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/net/net.h |  6 ++++++
 net/dump.c        | 11 +++++++----
 net/net.c         | 18 ++++++++++++++++++
 net/tap.c         | 16 ++++++++++++++++
 4 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index dc20b31e9f..4b2d72b3fc 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -56,8 +56,10 @@ typedef RxFilterInfo *(QueryRxFilter)(NetClientState *);
 typedef bool (HasUfo)(NetClientState *);
 typedef bool (HasVnetHdr)(NetClientState *);
 typedef bool (HasVnetHdrLen)(NetClientState *, int);
+typedef bool (GetUsingVnetHdr)(NetClientState *);
 typedef void (UsingVnetHdr)(NetClientState *, bool);
 typedef void (SetOffload)(NetClientState *, int, int, int, int, int);
+typedef int (GetVnetHdrLen)(NetClientState *);
 typedef void (SetVnetHdrLen)(NetClientState *, int);
 typedef int (SetVnetLE)(NetClientState *, bool);
 typedef int (SetVnetBE)(NetClientState *, bool);
@@ -84,8 +86,10 @@ typedef struct NetClientInfo {
     HasUfo *has_ufo;
     HasVnetHdr *has_vnet_hdr;
     HasVnetHdrLen *has_vnet_hdr_len;
+    GetUsingVnetHdr *get_using_vnet_hdr;
     UsingVnetHdr *using_vnet_hdr;
     SetOffload *set_offload;
+    GetVnetHdrLen *get_vnet_hdr_len;
     SetVnetHdrLen *set_vnet_hdr_len;
     SetVnetLE *set_vnet_le;
     SetVnetBE *set_vnet_be;
@@ -183,9 +187,11 @@ void qemu_format_nic_info_str(NetClientState *nc, uint8_t macaddr[6]);
 bool qemu_has_ufo(NetClientState *nc);
 bool qemu_has_vnet_hdr(NetClientState *nc);
 bool qemu_has_vnet_hdr_len(NetClientState *nc, int len);
+bool qemu_get_using_vnet_hdr(NetClientState *nc);
 void qemu_using_vnet_hdr(NetClientState *nc, bool enable);
 void qemu_set_offload(NetClientState *nc, int csum, int tso4, int tso6,
                       int ecn, int ufo);
+int qemu_get_vnet_hdr_len(NetClientState *nc);
 void qemu_set_vnet_hdr_len(NetClientState *nc, int len);
 int qemu_set_vnet_le(NetClientState *nc, bool is_le);
 int qemu_set_vnet_be(NetClientState *nc, bool is_be);
diff --git a/net/dump.c b/net/dump.c
index 6a63b15359..7d05f16ca7 100644
--- a/net/dump.c
+++ b/net/dump.c
@@ -61,12 +61,13 @@ struct pcap_sf_pkthdr {
     uint32_t len;
 };
 
-static ssize_t dump_receive_iov(DumpState *s, const struct iovec *iov, int cnt)
+static ssize_t dump_receive_iov(DumpState *s, const struct iovec *iov, int cnt,
+                                int offset)
 {
     struct pcap_sf_pkthdr hdr;
     int64_t ts;
     int caplen;
-    size_t size = iov_size(iov, cnt);
+    size_t size = iov_size(iov, cnt) - offset;
     struct iovec dumpiov[cnt + 1];
 
     /* Early return in case of previous error. */
@@ -84,7 +85,7 @@ static ssize_t dump_receive_iov(DumpState *s, const struct iovec *iov, int cnt)
 
     dumpiov[0].iov_base = &hdr;
     dumpiov[0].iov_len = sizeof(hdr);
-    cnt = iov_copy(&dumpiov[1], cnt, iov, cnt, 0, caplen);
+    cnt = iov_copy(&dumpiov[1], cnt, iov, cnt, offset, caplen);
 
     if (writev(s->fd, dumpiov, cnt + 1) != sizeof(hdr) + caplen) {
         error_report("network dump write error - stopping dump");
@@ -153,8 +154,10 @@ static ssize_t filter_dump_receive_iov(NetFilterState *nf, NetClientState *sndr,
                                        int iovcnt, NetPacketSent *sent_cb)
 {
     NetFilterDumpState *nfds = FILTER_DUMP(nf);
+    int offset = qemu_get_using_vnet_hdr(nf->netdev) ?
+                 qemu_get_vnet_hdr_len(nf->netdev) : 0;
 
-    dump_receive_iov(&nfds->ds, iov, iovcnt);
+    dump_receive_iov(&nfds->ds, iov, iovcnt, offset);
     return 0;
 }
 
diff --git a/net/net.c b/net/net.c
index 2d01472998..03f17de5fc 100644
--- a/net/net.c
+++ b/net/net.c
@@ -513,6 +513,15 @@ bool qemu_has_vnet_hdr_len(NetClientState *nc, int len)
     return nc->info->has_vnet_hdr_len(nc, len);
 }
 
+bool qemu_get_using_vnet_hdr(NetClientState *nc)
+{
+    if (!nc || !nc->info->get_using_vnet_hdr) {
+        return false;
+    }
+
+    return nc->info->get_using_vnet_hdr(nc);
+}
+
 void qemu_using_vnet_hdr(NetClientState *nc, bool enable)
 {
     if (!nc || !nc->info->using_vnet_hdr) {
@@ -532,6 +541,15 @@ void qemu_set_offload(NetClientState *nc, int csum, int tso4, int tso6,
     nc->info->set_offload(nc, csum, tso4, tso6, ecn, ufo);
 }
 
+int qemu_get_vnet_hdr_len(NetClientState *nc)
+{
+    if (!nc || !nc->info->get_vnet_hdr_len) {
+        return 0;
+    }
+
+    return nc->info->get_vnet_hdr_len(nc);
+}
+
 void qemu_set_vnet_hdr_len(NetClientState *nc, int len)
 {
     if (!nc || !nc->info->set_vnet_hdr_len) {
diff --git a/net/tap.c b/net/tap.c
index 7d7bc1dc5f..1bf085d422 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -255,6 +255,13 @@ static bool tap_has_vnet_hdr_len(NetClientState *nc, int len)
     return !!tap_probe_vnet_hdr_len(s->fd, len);
 }
 
+static int tap_get_vnet_hdr_len(NetClientState *nc)
+{
+    TAPState *s = DO_UPCAST(TAPState, nc, nc);
+
+    return s->host_vnet_hdr_len;
+}
+
 static void tap_set_vnet_hdr_len(NetClientState *nc, int len)
 {
     TAPState *s = DO_UPCAST(TAPState, nc, nc);
@@ -268,6 +275,13 @@ static void tap_set_vnet_hdr_len(NetClientState *nc, int len)
     s->host_vnet_hdr_len = len;
 }
 
+static bool tap_get_using_vnet_hdr(NetClientState *nc)
+{
+    TAPState *s = DO_UPCAST(TAPState, nc, nc);
+
+    return s->using_vnet_hdr;
+}
+
 static void tap_using_vnet_hdr(NetClientState *nc, bool using_vnet_hdr)
 {
     TAPState *s = DO_UPCAST(TAPState, nc, nc);
@@ -372,8 +386,10 @@ static NetClientInfo net_tap_info = {
     .has_ufo = tap_has_ufo,
     .has_vnet_hdr = tap_has_vnet_hdr,
     .has_vnet_hdr_len = tap_has_vnet_hdr_len,
+    .get_using_vnet_hdr = tap_get_using_vnet_hdr,
     .using_vnet_hdr = tap_using_vnet_hdr,
     .set_offload = tap_set_offload,
+    .get_vnet_hdr_len = tap_get_vnet_hdr_len,
     .set_vnet_hdr_len = tap_set_vnet_hdr_len,
     .set_vnet_le = tap_set_vnet_le,
     .set_vnet_be = tap_set_vnet_be,
-- 
2.39.0


