Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 449B34ADDC2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 16:56:17 +0100 (CET)
Received: from localhost ([::1]:50624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHSqm-0001lQ-Aa
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 10:56:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nHRjy-00048u-N4
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:45:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nHRjv-0001ht-EK
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644331505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MBLSF4wMVv/UfkJb2xcYNzkciWKslCxtAdXAzNNthZ4=;
 b=a0U/+b/JKXLcoqFGM6CemBFblRRGYL36w6VLwNrqMtrp4YkhVjf87dnc99fBUTLzeb3Ynk
 HqtjEofTqCH8oIbLqRREodJX0HiR2NbT+xW+7h/sAc4ndngzR5nZw7/4mYz6AtPnk01dHr
 dAPr2SGpheR8kDLrv0ZI/e/oorLMec4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-khO2MFcTNXuBxLaMHnHFWQ-1; Tue, 08 Feb 2022 09:45:02 -0500
X-MC-Unique: khO2MFcTNXuBxLaMHnHFWQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86F7794DD4;
 Tue,  8 Feb 2022 14:45:01 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEFDB7D3CE;
 Tue,  8 Feb 2022 14:45:00 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/3] net: initialize global variables early
Date: Tue,  8 Feb 2022 09:44:57 -0500
Message-Id: <20220208144458.1079634-3-pbonzini@redhat.com>
In-Reply-To: <20220208144458.1079634-1-pbonzini@redhat.com>
References: <20220208144458.1079634-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: damien.hedde@greensocs.com, berrange@redhat.com, mark.burton@greensocs.com,
 armbru@redhat.com, f4bug@amsat.org, mirela.grujic@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Initialize global variables separately from net_init_clients, so
that calling net_cleanup does not crash miserably.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/net/xen_nic.c   | 20 ++++++++++----------
 include/net/net.h  |  1 +
 net/net.c          |  5 ++++-
 softmmu/runstate.c |  1 +
 4 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index 5c815b4f0c..cd8f1edb29 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -275,7 +275,7 @@ static NetClientInfo net_xen_info = {
     .receive = net_rx_packet,
 };
 
-static int net_init(struct XenLegacyDevice *xendev)
+static int xen_net_init(struct XenLegacyDevice *xendev)
 {
     struct XenNetDev *netdev = container_of(xendev, struct XenNetDev, xendev);
 
@@ -307,7 +307,7 @@ static int net_init(struct XenLegacyDevice *xendev)
     return 0;
 }
 
-static int net_connect(struct XenLegacyDevice *xendev)
+static int xen_net_connect(struct XenLegacyDevice *xendev)
 {
     struct XenNetDev *netdev = container_of(xendev, struct XenNetDev, xendev);
     int rx_copy;
@@ -362,7 +362,7 @@ static int net_connect(struct XenLegacyDevice *xendev)
     return 0;
 }
 
-static void net_disconnect(struct XenLegacyDevice *xendev)
+static void xen_net_disconnect(struct XenLegacyDevice *xendev)
 {
     struct XenNetDev *netdev = container_of(xendev, struct XenNetDev, xendev);
 
@@ -378,14 +378,14 @@ static void net_disconnect(struct XenLegacyDevice *xendev)
     }
 }
 
-static void net_event(struct XenLegacyDevice *xendev)
+static void xen_net_event(struct XenLegacyDevice *xendev)
 {
     struct XenNetDev *netdev = container_of(xendev, struct XenNetDev, xendev);
     net_tx_packets(netdev);
     qemu_flush_queued_packets(qemu_get_queue(netdev->nic));
 }
 
-static int net_free(struct XenLegacyDevice *xendev)
+static int xen_net_free(struct XenLegacyDevice *xendev)
 {
     struct XenNetDev *netdev = container_of(xendev, struct XenNetDev, xendev);
 
@@ -403,9 +403,9 @@ static int net_free(struct XenLegacyDevice *xendev)
 struct XenDevOps xen_netdev_ops = {
     .size       = sizeof(struct XenNetDev),
     .flags      = DEVOPS_FLAG_NEED_GNTDEV,
-    .init       = net_init,
-    .initialise    = net_connect,
-    .event      = net_event,
-    .disconnect = net_disconnect,
-    .free       = net_free,
+    .init       = xen_net_init,
+    .initialise    = xen_net_connect,
+    .event      = xen_net_event,
+    .disconnect = xen_net_disconnect,
+    .free       = xen_net_free,
 };
diff --git a/include/net/net.h b/include/net/net.h
index 523136c7ac..463a2c6de5 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -216,6 +216,7 @@ extern const char *host_net_devices[];
 /* from net.c */
 int net_client_parse(QemuOptsList *opts_list, const char *str);
 void show_netdevs(void);
+void net_init(void);
 int net_init_clients(Error **errp);
 void net_check_clients(void);
 void net_cleanup(void);
diff --git a/net/net.c b/net/net.c
index f0d14dbfc1..82406a1851 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1551,13 +1551,16 @@ out:
     return ret;
 }
 
-int net_init_clients(Error **errp)
+void net_init(void)
 {
     net_change_state_entry =
         qemu_add_vm_change_state_handler(net_vm_change_state_handler, NULL);
 
     QTAILQ_INIT(&net_clients);
+}
 
+int net_init_clients(Error **errp)
+{
     if (qemu_opts_foreach(qemu_find_opts("netdev"),
                           net_init_netdev, NULL, errp)) {
         return -1;
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 10d9b7365a..0ba7828155 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -776,6 +776,7 @@ void qemu_init_subsystems(void)
 
     bdrv_init_with_whitelist();
     socket_init();
+    net_init();
 }
 
 
-- 
2.31.1



