Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9764015CF
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 06:57:06 +0200 (CEST)
Received: from localhost ([::1]:56846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mN6gq-0002e6-E8
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 00:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mN6fS-0001Bb-CF
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 00:55:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mN6fO-0003c3-Ol
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 00:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630904132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kpsXOEp6nHTVSNmlud4LOiGEbv5zoGmB3vhFN6ZWJ7k=;
 b=A4EXTbRtFuSabS8p/gWolCnaraooTFqv0lW75uzH+YlTSwtJbZqPjhMy/1rtb2WJixAEf2
 WZd+Z1BF96V8YqN3YgNGOUQuI5ahSVpVKhZgcExu1FVCyIhuBMjNFhIT8cYyP6ov6YpMaI
 FgJQskDUFaO5U5zMUF+g/QzSGGmLOac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-k5XsDvKpO42vGx5uuU_DpQ-1; Mon, 06 Sep 2021 00:55:29 -0400
X-MC-Unique: k5XsDvKpO42vGx5uuU_DpQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FFF6107ACC7;
 Mon,  6 Sep 2021 04:55:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4208D5D9CA;
 Mon,  6 Sep 2021 04:55:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8B0A018007A6; Mon,  6 Sep 2021 06:55:23 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] usb-storage: tag usb_msd_csw as packed struct
Date: Mon,  6 Sep 2021 06:55:23 +0200
Message-Id: <20210906045523.1259629-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: vintagepc404@protonmail.com, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without this the struct has the wrong size: sizeof() evaluates
to 16 instead of 13.  In most cases the bug is hidden by the
fact that guests submits a buffer which is exactly 13 bytes
long, so the padding added by the compiler is simply ignored.

But sometimes guests submit a larger buffer and expect a short
transfer, which does not work properly with the wrong struct
size.

Cc: vintagepc404@protonmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/usb/msd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/usb/msd.h b/include/hw/usb/msd.h
index 7538c54569bf..54e9f38bda46 100644
--- a/include/hw/usb/msd.h
+++ b/include/hw/usb/msd.h
@@ -17,7 +17,7 @@ enum USBMSDMode {
     USB_MSDM_CSW /* Command Status.  */
 };
 
-struct usb_msd_csw {
+struct QEMU_PACKED usb_msd_csw {
     uint32_t sig;
     uint32_t tag;
     uint32_t residue;
-- 
2.31.1


