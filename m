Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AD466A8C9
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 03:56:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGWgN-0005iy-1q; Fri, 13 Jan 2023 21:54:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGWgH-0005iS-Sk
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 21:54:06 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGWgF-0003Ja-Mb
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 21:54:05 -0500
Received: by mail-pl1-x630.google.com with SMTP id b17so17732299pld.7
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 18:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rCPt717xBbgVVKdZfqm3W1n0XMjuCSA2J4DOfI9hEtY=;
 b=VUq0MT8cp4Nltn46sNT4Hz2c/dY52TzrJpNmMjwBmD/gIjTzMUU3zgYtLV+IZZptWo
 VfaymXs0kvH3CgKdXz9hgbjuBis1CGSU7XAPSIlRxWnEotqorc6X+9eH82KV2RFt/KzT
 8pA4EvJAogVYPZwwomTv42wTnvQwXtmYeAa5Ry/kyUTIsudhhJEPmJ1jxRmoPfpWTxHu
 hDm+/Lhzf2tYigsqm8v0aA/+NiaSUOmCaX7G7hS5AwdztwteCQFGGf9YJnUa3GIWVfLo
 hpkMZvR6EBL3BItJqjsdu0Znl131qarbsX+ewqxhupJK54TDeijecFZVXIFRWdPr1nVp
 mjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rCPt717xBbgVVKdZfqm3W1n0XMjuCSA2J4DOfI9hEtY=;
 b=kWJ4xnFerZMttGayUEhZiIKJTB2+D0mI8ziNvU94Y9tY6zQCTcyQs/caprKQp9MAGT
 w1buqyz856FfzLoyXhkcebD53FOBbIpPzGT6JNCaUgpdtKWQHnDwEcL191J0ohXFCY7Q
 G7bWvfxvoZhL/XIoYgO7/HLbAY/Eqi6JpcgHobsRuBijjO/xrXp5hPdrC79N6V6tLaET
 6atAjyZO+oRng6RBztrZqT1Zt0bThaKA5Y+hT6hk2x4yCulBsSPw5Dd5d/lF9gqfBXxS
 F9PmzKiVu5iYACy+eDB+MhDr78kYHEVwAkod6J635jxRwPrTc5VEYJ//lnlmqMAFRaB8
 XAgg==
X-Gm-Message-State: AFqh2koha6yXOnrhmg12OU18T8vATJrn4hWdTiZvpePx9Esnn0JHIm4Z
 fXQx8zl++JyreF3Sm0NrcijUiA==
X-Google-Smtp-Source: AMrXdXuvSns3hXTJ7QyOu/rrwZXaq3fR4CNPwBMzkMG+ZKswTtCmL+RGSW84ZBekDfh0VOQY1i43PA==
X-Received: by 2002:a17:902:c10d:b0:186:8568:be7e with SMTP id
 13-20020a170902c10d00b001868568be7emr89006428pli.15.1673664841776; 
 Fri, 13 Jan 2023 18:54:01 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a170902b21000b0018996404dd5sm14891618plr.109.2023.01.13.18.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 18:54:01 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>, Luigi Rizzo <rizzo@iet.unipi.it>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>,
 Vincenzo Maffione <v.maffione@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2] net: Strip virtio-net header when dumping
Date: Sat, 14 Jan 2023 11:53:39 +0900
Message-Id: <20230114025339.4874-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x630.google.com
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
index e28ceb078f..daa7e0a042 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -257,6 +257,13 @@ static bool tap_has_vnet_hdr_len(NetClientState *nc, int len)
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
@@ -270,6 +277,13 @@ static void tap_set_vnet_hdr_len(NetClientState *nc, int len)
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
@@ -374,8 +388,10 @@ static NetClientInfo net_tap_info = {
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


