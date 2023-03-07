Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54516AD842
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:18:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZRUO-0006hA-Se; Tue, 07 Mar 2023 02:12:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRTr-0005og-Ab
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:11:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRTp-0005tM-Ni
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:11:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678173084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HLLjG5kOCNoyaewDXrK36oNt9Rl+dEqttWCJ+eMA080=;
 b=cmzzdtZ6GUSnjg5LmSBdbXHD49Eu0NZEuYuucy6NE7ndpqRkMchxHhk82ixU04qpKkWRKN
 4mcd+XnyfESsp1iqr4DYnR1KItvxxJwU9/GYnYDvTXElfL9/Bsh/MXGz3/WLsKtdz0IL6V
 KnHZVRBghTYZu49k7r3YGEOliQs4058=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-JpOXkSc7MXatiKaiRnY8tw-1; Tue, 07 Mar 2023 02:11:22 -0500
X-MC-Unique: JpOXkSc7MXatiKaiRnY8tw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E8612808E62;
 Tue,  7 Mar 2023 07:11:22 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA7E8400F8FA;
 Tue,  7 Mar 2023 07:11:20 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 51/51] hw/net/eepro100: Replace DO_UPCAST(EEPRO100State) by
 EEPRO100()
Date: Tue,  7 Mar 2023 15:08:16 +0800
Message-Id: <20230307070816.34833-52-jasowang@redhat.com>
In-Reply-To: <20230307070816.34833-1-jasowang@redhat.com>
References: <20230307070816.34833-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Use the EEPRO100() QOM type-checking macro to avoid DO_UPCAST().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/eepro100.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index bce3776..6db15f1 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -1834,7 +1834,7 @@ static const VMStateDescription vmstate_eepro100 = {
 
 static void pci_nic_uninit(PCIDevice *pci_dev)
 {
-    EEPRO100State *s = DO_UPCAST(EEPRO100State, dev, pci_dev);
+    EEPRO100State *s = EEPRO100(pci_dev);
 
     vmstate_unregister(VMSTATE_IF(&pci_dev->qdev), s->vmstate, s);
     g_free(s->vmstate);
@@ -1850,7 +1850,7 @@ static NetClientInfo net_eepro100_info = {
 
 static void e100_nic_realize(PCIDevice *pci_dev, Error **errp)
 {
-    EEPRO100State *s = DO_UPCAST(EEPRO100State, dev, pci_dev);
+    EEPRO100State *s = EEPRO100(pci_dev);
 
     TRACE(OTHER, logout("\n"));
 
@@ -1891,7 +1891,7 @@ static void e100_nic_realize(PCIDevice *pci_dev, Error **errp)
 
 static void eepro100_instance_init(Object *obj)
 {
-    EEPRO100State *s = DO_UPCAST(EEPRO100State, dev, PCI_DEVICE(obj));
+    EEPRO100State *s = EEPRO100(obj);
     device_add_bootindex_property(obj, &s->conf.bootindex,
                                   "bootindex", "/ethernet-phy@0",
                                   DEVICE(s));
-- 
2.7.4


