Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EA9443336
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:39:50 +0100 (CET)
Received: from localhost ([::1]:35056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwpB-0005E5-1i
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mhwci-0006Ow-AW
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:26:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mhwcW-0002bY-FL
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:26:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635870403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ss/Hz3Amunh7qd04Lf0rLRk/NM7TeE6BsChzCFgfXdg=;
 b=BadeNDIVhzfcjUzAbTQpauJlhN6EEbriqlw0bZFuPDDoDI/2dc13ehuLJp4uKF5sr7t7u9
 GXId8Tk5S0pZGw5BkkCTalyrv/+vCQcYaqIzK/XVuT2v7Z+I2J7frT++IOl5q5im3VN3vs
 LhJy/MiB++d74gJwZGfl8laEJ+pigVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-M1ROmAkMMRaLOwq8OdQMtQ-1; Tue, 02 Nov 2021 12:26:40 -0400
X-MC-Unique: M1ROmAkMMRaLOwq8OdQMtQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 972F6100CFB0;
 Tue,  2 Nov 2021 16:26:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35F38100751A;
 Tue,  2 Nov 2021 16:26:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 16A881805CB8; Tue,  2 Nov 2021 17:26:20 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/10] usb-storage: tag usb_msd_csw as packed struct
Date: Tue,  2 Nov 2021 17:26:19 +0100
Message-Id: <20211102162619.2760593-11-kraxel@redhat.com>
In-Reply-To: <20211102162619.2760593-1-kraxel@redhat.com>
References: <20211102162619.2760593-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 vintagepc404@protonmail.com, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
Fixes: a917d384ac0 ("SCSI TCQ support.")
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210906045523.1259629-1-kraxel@redhat.com>
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


