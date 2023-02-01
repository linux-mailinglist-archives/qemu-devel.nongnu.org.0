Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CB6685E03
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 04:38:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN3vb-0007qV-Fj; Tue, 31 Jan 2023 22:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3va-0007qF-2d
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:36:54 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3vY-0000YA-9r
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:36:53 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 cl23-20020a17090af69700b0022c745bfdc3so691296pjb.3
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 19:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=08HI+/g3J/zU/4EQGD9UqV5IbiaomXGENBnHx0g0yIg=;
 b=J2zLQb7TjcbNbMrKB6YBWyduishRC6iDPMhRgrFtJL7DLeiop3fmJ2CXvgUV+LrXxF
 NauBM2EVKPCWs/ScbBvjGqBg17aPDyzLWoZbNWSAUQWitgWtMWcAvpciQeZF3q3Qwt1T
 UzK+suO/5HXKC/CUlur+iuAC1oZPHJIt4w426sTJj5IvmAKTlrweovRbfiS8rcBueWXq
 qmA7dbBQRBPUWpB/YrGyrga0hh/63zKjRQ6Ks0pslRKPXeG6b4wnbVMgTQJSHJ8ELchG
 HXDYa77/Fk4kfeiaifyJTlW0ZHGwB06IM7F9UW6a28VkSEyOMIx60cJj0X94yjAsnn8N
 V2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=08HI+/g3J/zU/4EQGD9UqV5IbiaomXGENBnHx0g0yIg=;
 b=ZVQGxLN6HdfEq007aIrCskwnP1S8WL+ijIIrE6HKJLmJIVU8f5vLuiirEv//sLb4AI
 j4CL6dsHCZi6kKYr3T34qh65u0cxtaPKq5VCLV6bta5z+UfJg34Z0GMQWFb2orzzJ45N
 8gl7F9V/ZBlfrR572ThUmcKcUBCdUPcSLTkJ0OnhSrFl62/sKB2hnU7ODcyQylz190AW
 rLiJgX0CgEjDkvFmtAdMqx36j+5T02/R0YL2S89rMlWqDCGkoIDXtHv42tW7+vXWHwwL
 er0DbHb0BuSuAzQWiGFYHTOhvMtF3Q3QD2vjeWoipy9feGBjFVXuYT0Aqw3I5KrHVcHN
 e9eg==
X-Gm-Message-State: AO0yUKUpS3A5ie22UlpbC9iwi8urpBX5ALsAS08E8s61tpwUuyUy8oDy
 3lmLMULj7UgixNICY09KBG3kNA==
X-Google-Smtp-Source: AK7set/ULqgqhfPPlwzbOaj6ClPVHlR0WvWOWJq+VBvMNN1XV68QJtZM/mhk4hGYLlh8Zqmn85WRkg==
X-Received: by 2002:a17:903:214d:b0:196:8292:e879 with SMTP id
 s13-20020a170903214d00b001968292e879mr1136053ple.1.1675222610848; 
 Tue, 31 Jan 2023 19:36:50 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b001968b529c98sm4185557plg.128.2023.01.31.19.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 19:36:50 -0800 (PST)
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
 Alexander Bulekov <alxndr@bu.edu>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v5 20/29] net: Strip virtio-net header when dumping
Date: Wed,  1 Feb 2023 12:35:30 +0900
Message-Id: <20230201033539.30049-21-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201033539.30049-1-akihiko.odaki@daynix.com>
References: <20230201033539.30049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102b.google.com
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
2.39.1


