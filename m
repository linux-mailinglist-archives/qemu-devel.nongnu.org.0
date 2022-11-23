Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A9E636239
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 15:47:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxqzj-0004G0-PS; Wed, 23 Nov 2022 09:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oxqzh-0004Fd-Uc
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:44:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oxqzg-0002wu-Fn
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:44:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669214695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CFJmsVGFRZoFr6oEdGcy/0jBFL6EKJZVl6FrLKF4sA4=;
 b=BNnPbdXG1qZnLp8+2Dj9DfSEReKPKm250P/H24U+1NgEjXzdDTcNyvlfVmlPS55V16QfDb
 vMUwGWel88z4ZcCwiH/+QkmqxfoB+cn6GVLBhnMHtLyuDS7rSALPFNfZN8KoT24Pn66Ize
 3xwK7gfIptCNutP9dcjMXLleAMr2lMQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-53e-JvYfOzGFPsCJyjrqPg-1; Wed, 23 Nov 2022 09:44:52 -0500
X-MC-Unique: 53e-JvYfOzGFPsCJyjrqPg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17E69811E67;
 Wed, 23 Nov 2022 14:44:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5227492B07;
 Wed, 23 Nov 2022 14:44:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 20EC21800622; Wed, 23 Nov 2022 15:44:37 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 6/7] hw/audio/intel-hda: don't reset codecs twice
Date: Wed, 23 Nov 2022 15:44:35 +0100
Message-Id: <20221123144436.2141069-7-kraxel@redhat.com>
In-Reply-To: <20221123144436.2141069-1-kraxel@redhat.com>
References: <20221123144436.2141069-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Maydell <peter.maydell@linaro.org>

Currently the intel-hda device has a reset method which manually
resets all the codecs by calling device_legacy_reset() on them.  This
means they get reset twice, once because child devices on a qbus get
reset before the parent device's reset method is called, and then
again because we're manually resetting them.

Drop the manual reset call, and ensure that codecs are still reset
when the guest does a reset via ICH6_GCTL_RESET by using
device_cold_reset() (which resets all the devices on the qbus as well
as the device itself) instead of a direct call to the reset function.

This is a slight ordering change because the (only) codec reset now
happens before the controller registers etc are reset, rather than
once before and then once after, but the codec reset function
hda_audio_reset() doesn't care.

This lets us drop a use of device_legacy_reset(), which is
deprecated.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221014142632.2092404-2-peter.maydell@linaro.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/audio/intel-hda.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index f38117057b9b..38cfa20262e2 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -516,7 +516,7 @@ static void intel_hda_notify_codecs(IntelHDAState *d, uint32_t stream, bool runn
 static void intel_hda_set_g_ctl(IntelHDAState *d, const IntelHDAReg *reg, uint32_t old)
 {
     if ((d->g_ctl & ICH6_GCTL_RESET) == 0) {
-        intel_hda_reset(DEVICE(d));
+        device_cold_reset(DEVICE(d));
     }
 }
 
@@ -1083,11 +1083,9 @@ static void intel_hda_reset(DeviceState *dev)
     intel_hda_regs_reset(d);
     d->wall_base_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 
-    /* reset codecs */
     QTAILQ_FOREACH(kid, &d->codecs.qbus.children, sibling) {
         DeviceState *qdev = kid->child;
         cdev = HDA_CODEC_DEVICE(qdev);
-        device_legacy_reset(DEVICE(cdev));
         d->state_sts |= (1 << cdev->cad);
     }
     intel_hda_update_irq(d);
-- 
2.38.1


