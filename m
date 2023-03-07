Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6326AD7FF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:10:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZRSV-00016d-E1; Tue, 07 Mar 2023 02:10:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRSS-00012V-HN
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:10:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRSQ-0005VW-Ox
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:10:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678172998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qXn9/2GiqSyQmfcNr+QM084DhjBQtlYvWAtQV3RBiDo=;
 b=h1k4qQydKTSp+fcYL5fMmsJNTs+Ka+I/Tb9XEtpph8iqiTcd3iHHIxRcE6j8NQ4l7HpCEB
 DZb8w0P++JvlRf55bzrb0JU1Ppd4fkegXe0vDm9yUFdpR1hA2BOKh4/I5NWnRVMNk2iXTy
 5J6J8HwUnDyXKGrLFZ6PVL8fB9tH9gw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-C-V1-gdROCWZLWBpcIw6gQ-1; Tue, 07 Mar 2023 02:09:55 -0500
X-MC-Unique: C-V1-gdROCWZLWBpcIw6gQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A32EF2808E60;
 Tue,  7 Mar 2023 07:09:54 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CF6D400F8FA;
 Tue,  7 Mar 2023 07:09:52 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 21/51] net: Strip virtio-net header when dumping
Date: Tue,  7 Mar 2023 15:07:46 +0800
Message-Id: <20230307070816.34833-22-jasowang@redhat.com>
In-Reply-To: <20230307070816.34833-1-jasowang@redhat.com>
References: <20230307070816.34833-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

filter-dump specifiees Ethernet as PCAP LinkType, which does not expect
virtio-net header. Having virtio-net header in such PCAP file breaks
PCAP unconsumable. Unfortunately currently there is no LinkType for
virtio-net so for now strip virtio-net header to convert the output to
Ethernet.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/net/net.h |  6 ++++++
 net/dump.c        | 11 +++++++----
 net/net.c         | 18 ++++++++++++++++++
 net/tap.c         | 16 ++++++++++++++++
 4 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index 1d88621..1448d00 100644
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
@@ -185,9 +189,11 @@ void qemu_format_nic_info_str(NetClientState *nc, uint8_t macaddr[6]);
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
index 6a63b15..7d05f16 100644
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
index ebc7ce0..6492ad5 100644
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
index 7d7bc1d..1bf085d 100644
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
2.7.4


