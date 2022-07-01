Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD85B562FB1
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 11:18:42 +0200 (CEST)
Received: from localhost ([::1]:38094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7CnR-0007yb-PU
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 05:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o7CkL-0005kg-GZ
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:15:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o7CkG-0007Qv-4b
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:15:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656666922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=sXh22aMWtsyR9qegXEU6LWzzxPeHK9GWo4bTTJ+/ibk=;
 b=fDhu4mdbZtQRdSfaEDHt0DV9m/g6LWuPbkT6Eh9IXOXlSEbhHMKggAc8XEyl8NtiwSYM9c
 7rIS3t8/GE8DwyAYVmfKUFHPeeovMb91ZnXHF0hCUvyXAgCf42mTx8LEVynEQLRcID2IM3
 q9AYTAZc/1lQIr9jGeKIk0BF+5oMYIM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-I-KBrWhIORGKUELSv-mo1Q-1; Fri, 01 Jul 2022 05:15:18 -0400
X-MC-Unique: I-KBrWhIORGKUELSv-mo1Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59C43801E80;
 Fri,  1 Jul 2022 09:15:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D7A22166B26;
 Fri,  1 Jul 2022 09:15:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4A9DD180091D; Fri,  1 Jul 2022 11:15:16 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Sergio Lopez <slp@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2] microvm: turn off io reservations for pcie root ports
Date: Fri,  1 Jul 2022 11:15:16 +0200
Message-Id: <20220701091516.43489-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 hw/i386/microvm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 4b3b1dd262f1..06f779e1aaee 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -667,6 +667,14 @@ static void microvm_machine_initfn(Object *obj)
     qemu_register_powerdown_notifier(&mms->powerdown_req);
 }
 
+GlobalProperty microvm_properties[] = {
+    /*
+     * pcie host bridge (gpex) on microvm has no io address window,
+     * so reserving io space is not going to work.  Turn it off.
+     */
+    { "pcie-root-port", "io-reserve", "0" },
+};
+
 static void microvm_class_init(ObjectClass *oc, void *data)
 {
     X86MachineClass *x86mc = X86_MACHINE_CLASS(oc);
@@ -757,6 +765,9 @@ static void microvm_class_init(ObjectClass *oc, void *data)
         "Set off to disable adding virtio-mmio devices to the kernel cmdline");
 
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
+
+    compat_props_add(mc->compat_props, microvm_properties,
+                     G_N_ELEMENTS(microvm_properties));
 }
 
 static const TypeInfo microvm_machine_info = {
-- 
2.36.1


