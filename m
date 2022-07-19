Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F37657A2FF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 17:28:47 +0200 (CEST)
Received: from localhost ([::1]:42850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDp9S-0000ob-CR
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 11:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oDp3O-0007kF-BJ
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 11:22:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oDp3L-0001ii-70
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 11:22:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658244146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qbvpSIwa3ALCoxv0SS09yZzG1VnLC8BcpzDfMnD9TBY=;
 b=SfpJNAjSDGV3S6tibMX/g+Ly+s0MHhvpxbTFL5OPsbUT9FHB4UERlot5wveiYkgID+DU7e
 9uudG+WD3ueVAZq0HGj0YfnRkDVe54yN+JXlWSfc0eTwoX+iHLCH4bsLQj+HoLb/4wIloj
 Vxdu8cbRckDerOZKEe2D5psmy3k32wM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-fUMjKE5BPkay7AKWP0YnLA-1; Tue, 19 Jul 2022 11:22:23 -0400
X-MC-Unique: fUMjKE5BPkay7AKWP0YnLA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2E1394AB61;
 Tue, 19 Jul 2022 15:22:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EFEF1121314;
 Tue, 19 Jul 2022 15:22:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CC467180060D; Tue, 19 Jul 2022 17:22:18 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 2/6] microvm: turn off io reservations for pcie root ports
Date: Tue, 19 Jul 2022 17:22:14 +0200
Message-Id: <20220719152218.825707-3-kraxel@redhat.com>
In-Reply-To: <20220719152218.825707-1-kraxel@redhat.com>
References: <20220719152218.825707-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Message-Id: <20220701091516.43489-1-kraxel@redhat.com>
---
 hw/i386/microvm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 754f1d0593e5..dc929727dcbc 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -631,6 +631,14 @@ static void microvm_machine_initfn(Object *obj)
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
@@ -707,6 +715,9 @@ static void microvm_class_init(ObjectClass *oc, void *data)
         "Set off to disable adding virtio-mmio devices to the kernel cmdline");
 
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
+
+    compat_props_add(mc->compat_props, microvm_properties,
+                     G_N_ELEMENTS(microvm_properties));
 }
 
 static const TypeInfo microvm_machine_info = {
-- 
2.36.1


