Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AAB54CDCD
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 18:08:31 +0200 (CEST)
Received: from localhost ([::1]:58062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1VZF-0000uV-Vm
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 12:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o1VLj-0003xn-GF
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:54:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o1VLe-0007Im-OV
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:54:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655308466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SSzrVtCg3W3bZXNP42vlBubeRd+Vq6/Te6yNxrH4wnQ=;
 b=g2IYFgJzgbne2gckejTHywbMgJuC50PPo3Zhpu9+joBu3H1T+HarKZqqtEX5pTqLTSaIHy
 tHGdK7jgyTN6eqx4ztMarMINPhAkgj1V+DNPu2dtoezwtNjDG59Z46akESVnzDn4zww20S
 CCp2Ufbj6ZqYyqM3yT77TLHQK0PqVFs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-wRbKsYWGPrCd7iD0Xz7maA-1; Wed, 15 Jun 2022 11:54:21 -0400
X-MC-Unique: wRbKsYWGPrCd7iD0Xz7maA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0199838005C9;
 Wed, 15 Jun 2022 15:54:21 +0000 (UTC)
Received: from localhost (unknown [10.39.192.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7917240CF8E7;
 Wed, 15 Jun 2022 15:54:20 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 <qemu-block@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, virtio-fs@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Julia Suvorova <jusual@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>
Subject: [PULL 05/18] remote/machine: add vfio-user property
Date: Wed, 15 Jun 2022 16:51:16 +0100
Message-Id: <20220615155129.1025811-6-stefanha@redhat.com>
In-Reply-To: <20220615155129.1025811-1-stefanha@redhat.com>
References: <20220615155129.1025811-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Jagannathan Raman <jag.raman@oracle.com>

Add vfio-user to x-remote machine. It is a boolean, which indicates if
the machine supports vfio-user protocol. The machine configures the bus
differently vfio-user and multiprocess protocols, so this property
informs it on how to configure the bus.

This property should be short lived. Once vfio-user fully replaces
multiprocess, this property could be removed.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 5d51a152a419cbda35d070b8e49b772b60a7230a.1655151679.git.jag.raman@oracle.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/machine.h |  2 ++
 hw/remote/machine.c         | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
index 2a2a33c4b2..8d0fa98d33 100644
--- a/include/hw/remote/machine.h
+++ b/include/hw/remote/machine.h
@@ -22,6 +22,8 @@ struct RemoteMachineState {
 
     RemotePCIHost *host;
     RemoteIOHubState iohub;
+
+    bool vfio_user;
 };
 
 /* Used to pass to co-routine device and ioc. */
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index a97e53e250..9f3cdc55c3 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -58,6 +58,25 @@ static void remote_machine_init(MachineState *machine)
     qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
 }
 
+static bool remote_machine_get_vfio_user(Object *obj, Error **errp)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    return s->vfio_user;
+}
+
+static void remote_machine_set_vfio_user(Object *obj, bool value, Error **errp)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    if (phase_check(PHASE_MACHINE_CREATED)) {
+        error_setg(errp, "Error enabling vfio-user - machine already created");
+        return;
+    }
+
+    s->vfio_user = value;
+}
+
 static void remote_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -67,6 +86,10 @@ static void remote_machine_class_init(ObjectClass *oc, void *data)
     mc->desc = "Experimental remote machine";
 
     hc->unplug = qdev_simple_device_unplug_cb;
+
+    object_class_property_add_bool(oc, "vfio-user",
+                                   remote_machine_get_vfio_user,
+                                   remote_machine_set_vfio_user);
 }
 
 static const TypeInfo remote_machine = {
-- 
2.36.1


