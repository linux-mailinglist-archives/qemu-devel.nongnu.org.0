Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AEF261FA1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 22:05:47 +0200 (CEST)
Received: from localhost ([::1]:51206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFjsA-0000ge-M8
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 16:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kFjoO-00016e-BI
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 16:01:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28268
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kFjoK-0004Kz-I3
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 16:01:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599595307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5tuYsEn7fRAhBlpic8/P0vcDXHQRkx4XR6wS5S1U8z0=;
 b=JvVFrCAlmK7kyLvvfrl83z1LaOut43iB1aP9S30Nqzk+VgE87UmFcMBc0poES0+Iz+6WhR
 N/u7Yam5txHhfni9zzruGng71TkSvbCjh1TXAEQdnxEYP0yQ7iQxfDBACvV9+3J5Mmf2JI
 TqF6ui33NH4DzxXq/DXgoqfFcmodhag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-X8uBWUa1PuaTgFKpP8UCMQ-1; Tue, 08 Sep 2020 16:01:45 -0400
X-MC-Unique: X8uBWUa1PuaTgFKpP8UCMQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C52318B9ED3;
 Tue,  8 Sep 2020 20:01:44 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3188460C15;
 Tue,  8 Sep 2020 20:01:43 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 13/34] Use OBJECT_DECLARE_SIMPLE_TYPE when possible
Date: Tue,  8 Sep 2020 16:01:02 -0400
Message-Id: <20200908200123.3402311-14-ehabkost@redhat.com>
In-Reply-To: <20200908200123.3402311-1-ehabkost@redhat.com>
References: <20200908200123.3402311-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 02:10:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Generated using:

 $ ./scripts/codeconverter/converter.py -i \
   --pattern=ObjectDeclareType $(git grep -l '' -- '*.[ch]')

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20200831210740.126168-19-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/authz/list.h                | 7 ++-----
 include/authz/listfile.h            | 7 ++-----
 include/authz/pamacct.h             | 7 ++-----
 include/authz/simple.h              | 7 ++-----
 include/crypto/secret_keyring.h     | 7 ++-----
 include/io/dns-resolver.h           | 7 ++-----
 include/io/net-listener.h           | 7 ++-----
 include/sysemu/vhost-user-backend.h | 7 ++-----
 backends/dbus-vmstate.c             | 7 ++-----
 ui/input-barrier.c                  | 7 ++-----
 ui/input-linux.c                    | 7 ++-----
 11 files changed, 22 insertions(+), 55 deletions(-)

diff --git a/include/authz/list.h b/include/authz/list.h
index e4e1040472..5676bb375c 100644
--- a/include/authz/list.h
+++ b/include/authz/list.h
@@ -27,8 +27,8 @@
 
 #define TYPE_QAUTHZ_LIST "authz-list"
 
-OBJECT_DECLARE_TYPE(QAuthZList, QAuthZListClass,
-                    qauthz_list, QAUTHZ_LIST)
+OBJECT_DECLARE_SIMPLE_TYPE(QAuthZList, qauthz_list,
+                           QAUTHZ_LIST, QAuthZClass)
 
 
 
@@ -68,9 +68,6 @@ struct QAuthZList {
 };
 
 
-struct QAuthZListClass {
-    QAuthZClass parent_class;
-};
 
 
 QAuthZList *qauthz_list_new(const char *id,
diff --git a/include/authz/listfile.h b/include/authz/listfile.h
index 89c5eafbfa..b491227bbe 100644
--- a/include/authz/listfile.h
+++ b/include/authz/listfile.h
@@ -27,8 +27,8 @@
 
 #define TYPE_QAUTHZ_LIST_FILE "authz-list-file"
 
-OBJECT_DECLARE_TYPE(QAuthZListFile, QAuthZListFileClass,
-                    qauthz_list_file, QAUTHZ_LIST_FILE)
+OBJECT_DECLARE_SIMPLE_TYPE(QAuthZListFile, qauthz_list_file,
+                           QAUTHZ_LIST_FILE, QAuthZClass)
 
 
 
@@ -87,9 +87,6 @@ struct QAuthZListFile {
 };
 
 
-struct QAuthZListFileClass {
-    QAuthZClass parent_class;
-};
 
 
 QAuthZListFile *qauthz_list_file_new(const char *id,
diff --git a/include/authz/pamacct.h b/include/authz/pamacct.h
index 44bb5ff28d..7804853ddf 100644
--- a/include/authz/pamacct.h
+++ b/include/authz/pamacct.h
@@ -27,8 +27,8 @@
 
 #define TYPE_QAUTHZ_PAM "authz-pam"
 
-OBJECT_DECLARE_TYPE(QAuthZPAM, QAuthZPAMClass,
-                    qauthz_pam, QAUTHZ_PAM)
+OBJECT_DECLARE_SIMPLE_TYPE(QAuthZPAM, qauthz_pam,
+                           QAUTHZ_PAM, QAuthZClass)
 
 
 
@@ -79,9 +79,6 @@ struct QAuthZPAM {
 };
 
 
-struct QAuthZPAMClass {
-    QAuthZClass parent_class;
-};
 
 
 QAuthZPAM *qauthz_pam_new(const char *id,
diff --git a/include/authz/simple.h b/include/authz/simple.h
index ba4a5ec5ea..346fcb0c6c 100644
--- a/include/authz/simple.h
+++ b/include/authz/simple.h
@@ -26,8 +26,8 @@
 
 #define TYPE_QAUTHZ_SIMPLE "authz-simple"
 
-OBJECT_DECLARE_TYPE(QAuthZSimple, QAuthZSimpleClass,
-                    qauthz_simple, QAUTHZ_SIMPLE)
+OBJECT_DECLARE_SIMPLE_TYPE(QAuthZSimple, qauthz_simple,
+                           QAUTHZ_SIMPLE, QAuthZClass)
 
 
 
@@ -62,9 +62,6 @@ struct QAuthZSimple {
 };
 
 
-struct QAuthZSimpleClass {
-    QAuthZClass parent_class;
-};
 
 
 QAuthZSimple *qauthz_simple_new(const char *id,
diff --git a/include/crypto/secret_keyring.h b/include/crypto/secret_keyring.h
index cc2c7397db..73d2a8f501 100644
--- a/include/crypto/secret_keyring.h
+++ b/include/crypto/secret_keyring.h
@@ -26,8 +26,8 @@
 #include "crypto/secret_common.h"
 
 #define TYPE_QCRYPTO_SECRET_KEYRING "secret_keyring"
-OBJECT_DECLARE_TYPE(QCryptoSecretKeyring, QCryptoSecretKeyringClass,
-                    qcrypto_secret_keyring, QCRYPTO_SECRET_KEYRING)
+OBJECT_DECLARE_SIMPLE_TYPE(QCryptoSecretKeyring, qcrypto_secret_keyring,
+                           QCRYPTO_SECRET_KEYRING, QCryptoSecretCommonClass)
 
 
 struct QCryptoSecretKeyring {
@@ -36,8 +36,5 @@ struct QCryptoSecretKeyring {
 };
 
 
-struct QCryptoSecretKeyringClass {
-    QCryptoSecretCommonClass parent;
-};
 
 #endif /* QCRYPTO_SECRET_KEYRING_H */
diff --git a/include/io/dns-resolver.h b/include/io/dns-resolver.h
index 8ae4857e05..e248fba5bd 100644
--- a/include/io/dns-resolver.h
+++ b/include/io/dns-resolver.h
@@ -26,8 +26,8 @@
 #include "io/task.h"
 
 #define TYPE_QIO_DNS_RESOLVER "qio-dns-resolver"
-OBJECT_DECLARE_TYPE(QIODNSResolver, QIODNSResolverClass,
-                    qio_dns_resolver, QIO_DNS_RESOLVER)
+OBJECT_DECLARE_SIMPLE_TYPE(QIODNSResolver, qio_dns_resolver,
+                           QIO_DNS_RESOLVER, ObjectClass)
 
 
 /**
@@ -133,9 +133,6 @@ struct QIODNSResolver {
     Object parent;
 };
 
-struct QIODNSResolverClass {
-    ObjectClass parent;
-};
 
 
 /**
diff --git a/include/io/net-listener.h b/include/io/net-listener.h
index 4f0847ff19..60fad29ff4 100644
--- a/include/io/net-listener.h
+++ b/include/io/net-listener.h
@@ -25,8 +25,8 @@
 #include "qom/object.h"
 
 #define TYPE_QIO_NET_LISTENER "qio-net-listener"
-OBJECT_DECLARE_TYPE(QIONetListener, QIONetListenerClass,
-                    qio_net_listener, QIO_NET_LISTENER)
+OBJECT_DECLARE_SIMPLE_TYPE(QIONetListener, qio_net_listener,
+                           QIO_NET_LISTENER, ObjectClass)
 
 
 typedef void (*QIONetListenerClientFunc)(QIONetListener *listener,
@@ -58,9 +58,6 @@ struct QIONetListener {
     GDestroyNotify io_notify;
 };
 
-struct QIONetListenerClass {
-    ObjectClass parent;
-};
 
 
 /**
diff --git a/include/sysemu/vhost-user-backend.h b/include/sysemu/vhost-user-backend.h
index 76ca06cf40..23205edeb8 100644
--- a/include/sysemu/vhost-user-backend.h
+++ b/include/sysemu/vhost-user-backend.h
@@ -22,13 +22,10 @@
 #include "io/channel.h"
 
 #define TYPE_VHOST_USER_BACKEND "vhost-user-backend"
-OBJECT_DECLARE_TYPE(VhostUserBackend, VhostUserBackendClass,
-                    vhost_user_backend, VHOST_USER_BACKEND)
+OBJECT_DECLARE_SIMPLE_TYPE(VhostUserBackend, vhost_user_backend,
+                           VHOST_USER_BACKEND, ObjectClass)
 
 
-struct VhostUserBackendClass {
-    ObjectClass parent_class;
-};
 
 struct VhostUserBackend {
     /* private */
diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
index 0ca9d52ae5..a13461edea 100644
--- a/backends/dbus-vmstate.c
+++ b/backends/dbus-vmstate.c
@@ -23,12 +23,9 @@
 
 
 #define TYPE_DBUS_VMSTATE "dbus-vmstate"
-OBJECT_DECLARE_TYPE(DBusVMState, DBusVMStateClass,
-                    dbus_vmstate, DBUS_VMSTATE)
+OBJECT_DECLARE_SIMPLE_TYPE(DBusVMState, dbus_vmstate,
+                           DBUS_VMSTATE, ObjectClass)
 
-struct DBusVMStateClass {
-    ObjectClass parent_class;
-};
 
 struct DBusVMState {
     Object parent;
diff --git a/ui/input-barrier.c b/ui/input-barrier.c
index c7a8dc19a7..87543a3399 100644
--- a/ui/input-barrier.c
+++ b/ui/input-barrier.c
@@ -20,8 +20,8 @@
 #include "input-barrier.h"
 
 #define TYPE_INPUT_BARRIER "input-barrier"
-OBJECT_DECLARE_TYPE(InputBarrier, InputBarrierClass,
-                    input_barrier, INPUT_BARRIER)
+OBJECT_DECLARE_SIMPLE_TYPE(InputBarrier, input_barrier,
+                           INPUT_BARRIER, ObjectClass)
 
 
 #define MAX_HELLO_LENGTH 1024
@@ -44,9 +44,6 @@ struct InputBarrier {
     char buffer[MAX_HELLO_LENGTH];
 };
 
-struct InputBarrierClass {
-    ObjectClass parent_class;
-};
 
 static const char *cmd_names[] = {
     [barrierCmdCNoop]          = "CNOP",
diff --git a/ui/input-linux.c b/ui/input-linux.c
index a95269cc25..5d501c8360 100644
--- a/ui/input-linux.c
+++ b/ui/input-linux.c
@@ -31,8 +31,8 @@ static bool linux_is_button(unsigned int lnx)
 }
 
 #define TYPE_INPUT_LINUX "input-linux"
-OBJECT_DECLARE_TYPE(InputLinux, InputLinuxClass,
-                    input_linux, INPUT_LINUX)
+OBJECT_DECLARE_SIMPLE_TYPE(InputLinux, input_linux,
+                           INPUT_LINUX, ObjectClass)
 
 
 struct InputLinux {
@@ -65,9 +65,6 @@ struct InputLinux {
     QTAILQ_ENTRY(InputLinux) next;
 };
 
-struct InputLinuxClass {
-    ObjectClass parent_class;
-};
 
 static QTAILQ_HEAD(, InputLinux) inputs = QTAILQ_HEAD_INITIALIZER(inputs);
 
-- 
2.26.2


