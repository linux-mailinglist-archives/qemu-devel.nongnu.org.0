Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB49BCAF2
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 17:15:11 +0200 (CEST)
Received: from localhost ([::1]:46860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCmWz-0007ta-4S
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 11:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37349)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Fan_Yang@sjtu.edu.cn>) id 1iClV2-00049c-Ke
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 10:09:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Fan_Yang@sjtu.edu.cn>) id 1iClV0-0005W7-NE
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 10:09:04 -0400
Received: from smtp180.sjtu.edu.cn ([202.120.2.180]:57504)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Fan_Yang@sjtu.edu.cn>)
 id 1iClV0-0005Df-7Y
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 10:09:02 -0400
Received: from proxy01.sjtu.edu.cn (unknown [202.112.26.54])
 by smtp180.sjtu.edu.cn (Postfix) with ESMTPS id 8B48B1008CA20
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 22:08:29 +0800 (CST)
Received: from localhost (localhost [127.0.0.1])
 by proxy01.sjtu.edu.cn (Postfix) with ESMTP id 8401B2052028B
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 22:08:29 +0800 (CST)
X-Virus-Scanned: amavisd-new at proxy01.sjtu.edu.cn
Received: from proxy01.sjtu.edu.cn ([127.0.0.1])
 by localhost (proxy01.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 69UsR19zBrOp for <qemu-devel@nongnu.org>;
 Tue, 24 Sep 2019 22:08:29 +0800 (CST)
Received: from Fans-Air.ipads-lab.se.sjtu.edu.cn (unknown [202.120.40.82])
 (Authenticated sender: Fan_Yang)
 by proxy01.sjtu.edu.cn (Postfix) with ESMTPSA id 5BE2E20520278
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 22:08:29 +0800 (CST)
From: Fan Yang <Fan_Yang@sjtu.edu.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH] COLO-compare: Fix incorrect `if` logic
Date: Tue, 24 Sep 2019 22:08:29 +0800
Message-ID: <m2y2yd9482.fsf@Fans-Air.ipads-lab.se.sjtu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 202.120.2.180
X-Mailman-Approved-At: Tue, 24 Sep 2019 11:06:27 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'colo_mark_tcp_pkt' should return 'true' when packets are the same, and
'false' otherwise.  However, it returns 'true' when
'colo_compare_packet_payload' returns non-zero while
'colo_compare_packet_payload' is just a 'memcmp'.  The result is that
COLO-compare reports inconsistent TCP packets when they are actually
the same.

Signed-off-by: Fan Yang <Fan_Yang@sjtu.edu.cn>
---
 net/colo-compare.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 7489840bde..7ee17f2cf8 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -319,7 +319,7 @@ static bool colo_mark_tcp_pkt(Packet *ppkt, Packet *spkt,
     *mark = 0;
 
     if (ppkt->tcp_seq == spkt->tcp_seq && ppkt->seq_end == spkt->seq_end) {
-        if (colo_compare_packet_payload(ppkt, spkt,
+        if (!colo_compare_packet_payload(ppkt, spkt,
                                         ppkt->header_size, spkt->header_size,
                                         ppkt->payload_size)) {
             *mark = COLO_COMPARE_FREE_SECONDARY | COLO_COMPARE_FREE_PRIMARY;
@@ -329,7 +329,7 @@ static bool colo_mark_tcp_pkt(Packet *ppkt, Packet *spkt,
 
     /* one part of secondary packet payload still need to be compared */
     if (!after(ppkt->seq_end, spkt->seq_end)) {
-        if (colo_compare_packet_payload(ppkt, spkt,
+        if (!colo_compare_packet_payload(ppkt, spkt,
                                         ppkt->header_size + ppkt->offset,
                                         spkt->header_size + spkt->offset,
                                         ppkt->payload_size - ppkt->offset)) {
@@ -348,7 +348,7 @@ static bool colo_mark_tcp_pkt(Packet *ppkt, Packet *spkt,
         /* primary packet is longer than secondary packet, compare
          * the same part and mark the primary packet offset
          */
-        if (colo_compare_packet_payload(ppkt, spkt,
+        if (!colo_compare_packet_payload(ppkt, spkt,
                                         ppkt->header_size + ppkt->offset,
                                         spkt->header_size + spkt->offset,
                                         spkt->payload_size - spkt->offset)) {
-- 
2.17.1


