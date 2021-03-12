Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4BB3385DD
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 07:27:51 +0100 (CET)
Received: from localhost ([::1]:51108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKbH4-0006wr-Sq
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 01:27:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lKb6X-0000TB-TH
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:16:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lKb6V-0005qK-39
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:16:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615529814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RyNIINoBz1Hi6Rbx/YwEruYvIrkhCW2bFy+35okkCBk=;
 b=Cgqq9WjPXXBrDyi7wzK+esjo3b2ZXQHWJW/NVUsuT5x4+dPeb0416C3LQ4Vgtb/4X4ZMf0
 tTJhM52O7cFqOVlcE+evf5exBOWF6+kYDi6YctpuN6YhVlHdiieHf4jkb+sXvOgYda9XeW
 bKTJBbKM5bsSrlVmR5eyIZAWE538dRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-Y3ADGl_0OY2Bv25XCaGY-w-1; Fri, 12 Mar 2021 01:16:52 -0500
X-MC-Unique: Y3ADGl_0OY2Bv25XCaGY-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53C24107ACCD;
 Fri, 12 Mar 2021 06:16:51 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-126.pek2.redhat.com
 [10.72.12.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65EC7101F501;
 Fri, 12 Mar 2021 06:16:49 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 09/16] msf2-mac: switch to use qemu_receive_packet() for
 loopback
Date: Fri, 12 Mar 2021 14:16:19 +0800
Message-Id: <1615529786-30763-10-git-send-email-jasowang@redhat.com>
In-Reply-To: <1615529786-30763-1-git-send-email-jasowang@redhat.com>
References: <1615529786-30763-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Prasad J Pandit <ppandit@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch switches to use qemu_receive_packet() which can detect
reentrancy and return early.

This is intended to address CVE-2021-3416.

Cc: Prasad J Pandit <ppandit@redhat.com>
Cc: qemu-stable@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/msf2-emac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/msf2-emac.c b/hw/net/msf2-emac.c
index 32ba9e8..3e62060 100644
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
2.7.4


