Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D363D1F03
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 09:29:35 +0200 (CEST)
Received: from localhost ([::1]:51966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6T9C-0006n3-SZ
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 03:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6T7s-00065F-FW
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:28:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6T7m-0000dn-46
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:28:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626938884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O2hQ93LY7EH2va1oPR66FR5O25vZGvwoFpk+WC+x/jE=;
 b=hISW2RL4LvFEGKx996krC2Kne+fgjED1Wvyel1vqCbnkqDCKdLiXtIJpt0+56SmmBxL0aP
 btTYoiqtxYNYLQmIzZSvLeZ0ibhP2uCfuJgfAMPdglxhTST1ywjHjM3pOMlKwzzPWlTbNP
 DDEUM8DpwfHqat3Q99JDTv6FgkRv7dU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-CuKlWSiuPxegbq1mJRarvw-1; Thu, 22 Jul 2021 03:28:02 -0400
X-MC-Unique: CuKlWSiuPxegbq1mJRarvw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 108ED100E421
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 07:28:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CF3817C5F;
 Thu, 22 Jul 2021 07:27:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B636A18000B2; Thu, 22 Jul 2021 09:27:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] usbredir: fix free call
Date: Thu, 22 Jul 2021 09:27:56 +0200
Message-Id: <20210722072756.647673-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

data might point into the middle of a larger buffer, there is a separate
free_on_destroy pointer passed into bufp_alloc() to handle that.  It is
only used in the normal workflow though, not when dropping packets due
to the queue being full.  Fix that.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/491
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/redirect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 4ec9326e0582..1ec909a63a80 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -476,7 +476,7 @@ static int bufp_alloc(USBRedirDevice *dev, uint8_t *data, uint16_t len,
     if (dev->endpoint[EP2I(ep)].bufpq_dropping_packets) {
         if (dev->endpoint[EP2I(ep)].bufpq_size >
                 dev->endpoint[EP2I(ep)].bufpq_target_size) {
-            free(data);
+            free(free_on_destroy);
             return -1;
         }
         dev->endpoint[EP2I(ep)].bufpq_dropping_packets = 0;
-- 
2.31.1


