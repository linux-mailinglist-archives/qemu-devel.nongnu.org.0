Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24125323712
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 06:58:55 +0100 (CET)
Received: from localhost ([::1]:58882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEnCI-0006dT-6g
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 00:58:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lEn81-0001oJ-B0
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 00:54:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lEn7y-0003zP-9p
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 00:54:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614146063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lm+a4178H+3hkO+VnoW4j/iVA9y5OThloemwpEoGRfA=;
 b=M6qZko8NQQfMknLPtW6SV4zUiAnwCkLN0jYT3YVFmGjeUhogMxV/IAEVUOEs97j+jAR7Cy
 Uof8OZ9XcPHGvXIudzQrGUYlqO6cWCJH86KHw1Qb+PIuPTOeiCZWBGGojggPkRjHTHF/bz
 5ipjswqtJfgjA3831Ao9xuL+h9rFHWU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-kHFYM4oiNwOgdjQRSMMUAA-1; Wed, 24 Feb 2021 00:54:21 -0500
X-MC-Unique: kHFYM4oiNwOgdjQRSMMUAA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3196801975
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 05:54:20 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-164.pek2.redhat.com [10.72.13.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E67D5709B8;
 Wed, 24 Feb 2021 05:54:15 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 4/6] msf2-mac: switch to use qemu_receive_packet() for loopback
Date: Wed, 24 Feb 2021 13:53:59 +0800
Message-Id: <20210224055401.492407-5-jasowang@redhat.com>
In-Reply-To: <20210224055401.492407-1-jasowang@redhat.com>
References: <20210224055401.492407-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch switches to use qemu_receive_packet() which can detect
reentrancy and return early.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/msf2-emac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/msf2-emac.c b/hw/net/msf2-emac.c
index 32ba9e8412..3e6206044f 100644
--- a/hw/net/msf2-emac.c
+++ b/hw/net/msf2-emac.c
@@ -158,7 +158,7 @@ static void msf2_dma_tx(MSF2EmacState *s)
          * R_CFG1 bit 0 is set.
          */
         if (s->regs[R_CFG1] & R_CFG1_LB_EN_MASK) {
-            nc->info->receive(nc, buf, size);
+            qemu_receive_packet(nc, buf, size);
         } else {
             qemu_send_packet(nc, buf, size);
         }
-- 
2.25.1


