Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0884848E226
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 02:34:19 +0100 (CET)
Received: from localhost ([::1]:60772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8BTt-0004DO-Jf
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 20:34:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1n8BQ0-0002jW-Fn
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 20:30:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1n8BPv-0005O7-EE
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 20:30:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642123808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=u3OXl0FTJ5rTjyhmpGyboP8ZPbI3HYMAaPhMjNgU8gY=;
 b=TJ0bCwn20vuEMSvxXmoz3+BF4tNCu2J2SesrWTv/o1DpKTCBzfp5BEsrSDQv9xhKn0jvmR
 iNO3Dylya7UfOt6fOIupPAUGd7nT2Z5KLhiGCpVkwnYzQ45IpncF6l0chMd1Oua7oHhG7H
 XB8h0Lz4VwkDIzm2h0XJ9bETISlzsag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-qn0SW4XJOSWzAYu0-RBDxA-1; Thu, 13 Jan 2022 20:30:07 -0500
X-MC-Unique: qn0SW4XJOSWzAYu0-RBDxA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37ED31926DA4
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 01:30:06 +0000 (UTC)
Received: from fenrir.redhat.com (unknown [10.22.11.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FC361002390;
 Fri, 14 Jan 2022 01:30:05 +0000 (UTC)
From: Jon Maloy <jmaloy@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] fdc: check for illegal dma length calculation
Date: Thu, 13 Jan 2022 20:33:19 -0500
Message-Id: <20220114013319.348012-1-jmaloy@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jmaloy@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jmaloy@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jmaloy@redhat.com, jasowang@redhat.com, pjp@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function fdctrl_start_transfer() calculates the dma data length
wrongly when certain boundary conditions are fulfilled. We have
noticed that the if ((fdctrl->fifo[5] - fdctrl->fifo[6]) > 1) we get
a dma length that will be interpreted as negative by the next function
in the chain, fdctrl_transfer_handler(). This leads to a crash.

Rather than trying to fix this obscure calculation, we just check if
the harmful condition is fulfilled, and return without action if that
is the case. Since this is a condition that can only be created by a
malicious user we deem this solution safe.

This fix is intended to address CVE-2021-3507.

Signed-off-by: Jon Maloy <jmaloy@redhat.com>
---
 hw/block/fdc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 21d18ac2e3..80a1f1750a 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -1532,6 +1532,11 @@ static void fdctrl_start_transfer(FDCtrl *fdctrl, int direction)
         if (fdctrl->fifo[0] & 0x80)
             tmp += fdctrl->fifo[6];
         fdctrl->data_len *= tmp;
+        if (tmp < 0) {
+            FLOPPY_DPRINTF("calculated illegal data_len=%u, tmp=%i\n",
+                           fdctrl->data_len, tmp);
+            return;
+        }
     }
     fdctrl->eot = fdctrl->fifo[6];
     if (fdctrl->dor & FD_DOR_DMAEN) {
-- 
2.31.1


