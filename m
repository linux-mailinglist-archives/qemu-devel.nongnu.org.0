Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAC4368B7D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 05:19:27 +0200 (CEST)
Received: from localhost ([::1]:57088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZmLl-00044y-Lm
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 23:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lZmKh-0003fl-32
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 23:18:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lZmKd-00016o-JN
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 23:18:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619147892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xbVL+rALQih5dq/39Ivmk4tFNMWZRph09PoldeHJ3hk=;
 b=KAwvu7QdAbMZNyDPZqXIpMhQFM9JiN8EYjmxvAT+vl3IfQ+m4UBTMv/UUkcr9MyLwfb/Vf
 7l8yW3og1sjQByglaxzcvpW7VpoS4ChIKQ9NXClzOUPe3uVFh5FBUZC7IXrU5RH3+7Bw/K
 HmdqIzLmng78PaDmy1V2dzcMnkiE/uA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-RSIdX4ouMaCRnE1HyfY2Xg-1; Thu, 22 Apr 2021 23:18:10 -0400
X-MC-Unique: RSIdX4ouMaCRnE1HyfY2Xg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7492118397A3;
 Fri, 23 Apr 2021 03:18:09 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-225.pek2.redhat.com
 [10.72.13.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE4345D9C6;
 Fri, 23 Apr 2021 03:18:05 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: jasowang@redhat.com, samuel.thibault@ens-lyon.org, sw@weilnetz.de,
 qemu-devel@nongnu.org
Subject: [PATCH for 6.0] net: check the existence of peer before trying to pad
Date: Fri, 23 Apr 2021 11:18:03 +0800
Message-Id: <20210423031803.1479-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, bmeng.cn@gmail.com, philmd@redhat.com,
 crobinso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There could be case that peer is NULL. This can happen when during
network device hot-add where net device needs to be added first. So
the patch check the existence of peer before trying to do the pad.

Fixes: 969e50b61a285 ("net: Pad short frames to minimum size before sending from SLiRP/TAP")
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/net/net.h | 5 +++++
 net/slirp.c       | 2 +-
 net/tap-win32.c   | 2 +-
 net/tap.c         | 2 +-
 4 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index eff24519d2..1ef536d771 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -241,4 +241,9 @@ uint32_t net_crc32_le(const uint8_t *p, int len);
     .offset     = vmstate_offset_macaddr(_state, _field),            \
 }
 
+static inline bool net_peer_needs_padding(NetClientState *nc)
+{
+  return nc->peer && !nc->peer->do_not_pad;
+}
+
 #endif
diff --git a/net/slirp.c b/net/slirp.c
index a01a0fccd3..7a4e96db5c 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -119,7 +119,7 @@ static ssize_t net_slirp_send_packet(const void *pkt, size_t pkt_len,
     uint8_t min_pkt[ETH_ZLEN];
     size_t min_pktsz = sizeof(min_pkt);
 
-    if (!s->nc.peer->do_not_pad) {
+    if (net_peer_needs_padding(&s->nc)) {
         if (eth_pad_short_frame(min_pkt, &min_pktsz, pkt, pkt_len)) {
             pkt = min_pkt;
             pkt_len = min_pktsz;
diff --git a/net/tap-win32.c b/net/tap-win32.c
index 897bd18e32..6096972f5d 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -696,7 +696,7 @@ static void tap_win32_send(void *opaque)
     if (size > 0) {
         orig_buf = buf;
 
-        if (!s->nc.peer->do_not_pad) {
+        if (net_peer_needs_padding(&s->nc)) {
             if (eth_pad_short_frame(min_pkt, &min_pktsz, buf, size)) {
                 buf = min_pkt;
                 size = min_pktsz;
diff --git a/net/tap.c b/net/tap.c
index 7d53cedaec..820872fde8 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -203,7 +203,7 @@ static void tap_send(void *opaque)
             size -= s->host_vnet_hdr_len;
         }
 
-        if (!s->nc.peer->do_not_pad) {
+        if (net_peer_needs_padding(&s->nc)) {
             if (eth_pad_short_frame(min_pkt, &min_pktsz, buf, size)) {
                 buf = min_pkt;
                 size = min_pktsz;
-- 
2.25.1


