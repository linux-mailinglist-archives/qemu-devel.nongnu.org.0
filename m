Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A113024E9
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 13:27:02 +0100 (CET)
Received: from localhost ([::1]:45826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l40xR-00064o-ME
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 07:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l40u0-00031b-PY
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 07:23:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l40tz-0007uG-1r
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 07:23:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611577402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7hHfDZ2RcIUnVWRCkZBOrLDzrIEoqdZ+sv/eDpbf5T8=;
 b=TT25y21NYafhT0VWoxAtCvHEX9gAUh0QExgxzTRVeE1wcwxbaxu1I04QrjerNoufzhXW9s
 TiKFVZQl/mP4DUmLClsPdlKoAJHW0NQaK1gm5YutEGjsnv9lMzlLcrXnndo8n8ol3x9QOx
 45VMI7IPxaPPekKGOUomDiV97maM4Uc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-YmbrQFTJNre46Leexs8Vmg-1; Mon, 25 Jan 2021 07:23:20 -0500
X-MC-Unique: YmbrQFTJNre46Leexs8Vmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 776098145E0;
 Mon, 25 Jan 2021 12:23:19 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-126.pek2.redhat.com
 [10.72.12.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45B4319C44;
 Mon, 25 Jan 2021 12:23:16 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [RESEND PULL 3/4] net: checksum: Add IP header checksum calculation
Date: Mon, 25 Jan 2021 20:23:06 +0800
Message-Id: <1611577387-4296-4-git-send-email-jasowang@redhat.com>
In-Reply-To: <1611577387-4296-1-git-send-email-jasowang@redhat.com>
References: <1611577387-4296-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, Yabing Liu <yabing.liu@windriver.com>,
 Jason Wang <jasowang@redhat.com>, Guishan Qin <guishan.qin@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guishan Qin <guishan.qin@windriver.com>

At present net_checksum_calculate() only calculates TCP/UDP checksum
in an IP packet, but assumes the IP header checksum to be provided
by the software, e.g.: Linux kernel always calculates the IP header
checksum. However this might not always be the case, e.g.: for an IP
checksum offload enabled stack like VxWorks, the IP header checksum
can be zero.

This adds the checksum calculation of the IP header.

Signed-off-by: Guishan Qin <guishan.qin@windriver.com>
Signed-off-by: Yabing Liu <yabing.liu@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/checksum.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/checksum.c b/net/checksum.c
index 5cb8b2c..dabd290 100644
--- a/net/checksum.c
+++ b/net/checksum.c
@@ -61,6 +61,7 @@ void net_checksum_calculate(uint8_t *data, int length)
 {
     int mac_hdr_len, ip_len;
     struct ip_header *ip;
+    uint16_t csum;
 
     /*
      * Note: We cannot assume "data" is aligned, so the all code uses
@@ -106,6 +107,11 @@ void net_checksum_calculate(uint8_t *data, int length)
         return; /* not IPv4 */
     }
 
+    /* Calculate IP checksum */
+    stw_he_p(&ip->ip_sum, 0);
+    csum = net_raw_checksum((uint8_t *)ip, IP_HDR_GET_LEN(ip));
+    stw_be_p(&ip->ip_sum, csum);
+
     if (IP4_IS_FRAGMENT(ip)) {
         return; /* a fragmented IP packet */
     }
@@ -122,7 +128,6 @@ void net_checksum_calculate(uint8_t *data, int length)
     switch (ip->ip_p) {
     case IP_PROTO_TCP:
     {
-        uint16_t csum;
         tcp_header *tcp = (tcp_header *)(ip + 1);
 
         if (ip_len < sizeof(tcp_header)) {
@@ -143,7 +148,6 @@ void net_checksum_calculate(uint8_t *data, int length)
     }
     case IP_PROTO_UDP:
     {
-        uint16_t csum;
         udp_header *udp = (udp_header *)(ip + 1);
 
         if (ip_len < sizeof(udp_header)) {
-- 
2.7.4


