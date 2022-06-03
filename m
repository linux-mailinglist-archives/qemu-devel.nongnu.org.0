Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E8E53C740
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 11:09:07 +0200 (CEST)
Received: from localhost ([::1]:51008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx3In-0002sN-It
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 05:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nx39W-0000kI-Oe
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 04:59:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nx39T-00035x-Qc
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 04:59:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654246766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=g0v6HeLHmHtxMtcpiFN8qqLfh0ob5f/MsWkQ/UWSMlc=;
 b=iVYUCsN9ZdNaMsn1xkIahZ1OR5qvXKm98ZkIFV1R7AhvOCsVpM6JbLOxKI52AvOuL0BvFQ
 FB8s6Vi9Gw19I5edEceVbE6erOpCVoQSC0/tv7kZ+QlHnDYo0kg8PzkQlyz2YwfDsniknt
 t5X7fur1VgWrC3C4/wZ3n7TgSqR2BcA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-ztWCGlXiPTyKe1WwjwpTrQ-1; Fri, 03 Jun 2022 04:59:22 -0400
X-MC-Unique: ztWCGlXiPTyKe1WwjwpTrQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8387D802809;
 Fri,  3 Jun 2022 08:59:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BCC41121314;
 Fri,  3 Jun 2022 08:59:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 543EF18009C4; Fri,  3 Jun 2022 10:59:20 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] microvm: turn off io reservations for pcie root ports
Date: Fri,  3 Jun 2022 10:59:20 +0200
Message-Id: <20220603085920.604323-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pcie host bridge has no io window on microvm,
so io reservations will not work.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/microvm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 4b3b1dd262f1..f01d972f5d28 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -757,6 +757,12 @@ static void microvm_class_init(ObjectClass *oc, void *data)
         "Set off to disable adding virtio-mmio devices to the kernel cmdline");
 
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
+
+    /*
+     * pcie host bridge (gpex) on microvm has no io address window,
+     * so reserving io space is not going to work.  Turn it off.
+     */
+    object_register_sugar_prop("pcie-root-port", "io-reserve", "0", true);
 }
 
 static const TypeInfo microvm_machine_info = {
-- 
2.36.1


