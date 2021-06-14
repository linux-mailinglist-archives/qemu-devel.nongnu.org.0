Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E9E3A68E3
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:22:04 +0200 (CEST)
Received: from localhost ([::1]:34388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnTX-0005HX-ON
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lsnO5-0003eP-1U
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:16:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lsnO2-0007p4-UA
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623680182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yd5d2rLmFJaosKaaq29Ixv8bBGbbx0rjk1eit7ZkOtI=;
 b=gjokhw4ysRjJg1yN0P4OwYpwOFeDc72Z/M2bkdtvAJAo/8BaX4LchReWjTjesX67mt2IOH
 I2e1wF7g9zmbhCLHffky3OgEZEUxGFpf5caoE8KndMypSHN3QWQwfAUSUnWeWBwvq2ksPK
 GMk2xJkA6B+kLP33H2TTbfMouhWtdn0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-5U7WdAskOGmBTfySjO2nRQ-1; Mon, 14 Jun 2021 10:16:19 -0400
X-MC-Unique: 5U7WdAskOGmBTfySjO2nRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09E41100C668;
 Mon, 14 Jun 2021 14:16:18 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-55.ams2.redhat.com
 [10.36.115.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B794519C46;
 Mon, 14 Jun 2021 14:16:08 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/13] docs: document usage of the authorization framework
Date: Mon, 14 Jun 2021 15:15:39 +0100
Message-Id: <20210614141549.100410-4-berrange@redhat.com>
In-Reply-To: <20210614141549.100410-1-berrange@redhat.com>
References: <20210614141549.100410-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The authorization framework provides a way to control access to network
services after a client has been authenticated. This documents how to
actually use it.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/system/authz.rst | 263 ++++++++++++++++++++++++++++++++++++++++++
 docs/system/index.rst |   1 +
 2 files changed, 264 insertions(+)
 create mode 100644 docs/system/authz.rst

diff --git a/docs/system/authz.rst b/docs/system/authz.rst
new file mode 100644
index 0000000000..942af39602
--- /dev/null
+++ b/docs/system/authz.rst
@@ -0,0 +1,263 @@
+.. _client authorization:
+
+Client authorization
+--------------------
+
+When configuring a QEMU network backend with either TLS certificates or SASL
+authentication, access will be granted if the client successfully proves
+their identity. If the authorization identity database is scoped to the QEMU
+client this may be sufficient. It is common, however, for the identity database
+to be much broader and thus authentication alone does not enable sufficient
+access control. In this case QEMU provides a flexible system for enforcing
+finer grained authorization on clients post-authentication.
+
+Identity providers
+~~~~~~~~~~~~~~~~~~
+
+At the time of writing there are two authentication frameworks used by QEMU
+that emit an identity upon completion.
+
+ * TLS x509 certificate distinguished name.
+
+   When configuring the QEMU backend as a network server with TLS, there
+   are a choice of credentials to use. The most common scenario is to utilize
+   x509 certificates. The simplest configuration only involves issuing
+   certificates to the servers, allowing the client to avoid a MITM attack
+   against their intended server.
+
+   It is possible, however, to enable mutual verification by requiring that
+   the client provide a certificate to the server to prove its own identity.
+   This is done by setting the property ``verify-peer=yes`` on the
+   ``tls-creds-x509`` object, which is in fact the default.
+
+   When peer verification is enabled, client will need to be issued with a
+   certificate by the same certificate authority as the server. If this is
+   still not sufficiently strong access control the Distinguished Name of
+   the certificate can be used as an identity in the QEMU authorization
+   framework.
+
+ * SASL username.
+
+   When configuring the QEMU backend as a network server with SASL, upon
+   completion of the SASL authentication mechanism, a username will be
+   provided. The format of this username will vary depending on the choice
+   of mechanism configured for SASL. It might be a simple UNIX style user
+   ``joebloggs``, while if using Kerberos/GSSAPI it can have a realm
+   attached ``joebloggs@QEMU.ORG``.  Whatever format the username is presented
+   in, it can be used with the QEMU authorization framework.
+
+Authorization drivers
+~~~~~~~~~~~~~~~~~~~~~
+
+The QEMU authorization framework is a general purpose design with choice of
+user customizable drivers. These are provided as objects that can be
+created at startup using the ``-object`` argument, or at runtime using the
+``object_add`` monitor command.
+
+Simple
+^^^^^^
+
+This authorization driver provides a simple mechanism for granting access
+based on an exact match against a single identity. This is useful when it is
+known that only a single client is to be allowed access.
+
+A possible use case would be when configuring QEMU for an incoming live
+migration. It is known exactly which source QEMU the migration is expected
+to arrive from. The x509 certificate associated with this source QEMU would
+thus be used as the identity to match against. Alternatively if the virtual
+machine is dedicated to a specific tenant, then the VNC server would be
+configured with SASL and the username of only that tenant listed.
+
+To create an instance of this driver via QMP:
+
+::
+
+   {
+     "execute": "object-add",
+     "arguments": {
+       "qom-type": "authz-simple",
+       "id": "authz0",
+       "props": {
+         "identity": "fred"
+       }
+     }
+   }
+
+
+Or via the command line
+
+::
+
+   -object authz-simple,id=authz0,identity=fred
+
+
+List
+^^^^
+
+In some network backends it will be desirable to grant access to a range of
+clients. This authorization driver provides a list mechanism for granting
+access by matching identities against a list of permitted one. Each match
+rule has an associated policy and a catch all policy applies if no rule
+matches. The match can either be done as an exact string comparison, or can
+use the shell-like glob syntax, which allows for use of wildcards.
+
+To create an instance of this class via QMP:
+
+::
+
+   {
+     "execute": "object-add",
+     "arguments": {
+       "qom-type": "authz-list",
+       "id": "authz0",
+       "props": {
+         "rules": [
+            { "match": "fred", "policy": "allow", "format": "exact" },
+            { "match": "bob", "policy": "allow", "format": "exact" },
+            { "match": "danb", "policy": "deny", "format": "exact" },
+            { "match": "dan*", "policy": "allow", "format": "glob" }
+         ],
+         "policy": "deny"
+       }
+     }
+   }
+
+
+Due to the way this driver requires setting nested properties, creating
+it on the command line will require use of the JSON syntax for ``-object``.
+In most cases, however, the next driver will be more suitable.
+
+List file
+^^^^^^^^^
+
+This is a variant on the previous driver that allows for a more dynamic
+access control policy by storing the match rules in a standalone file
+that can be reloaded automatically upon change.
+
+To create an instance of this class via QMP:
+
+::
+
+   {
+     "execute": "object-add",
+     "arguments": {
+       "qom-type": "authz-list-file",
+       "id": "authz0",
+       "props": {
+         "filename": "/etc/qemu/myvm-vnc.acl",
+         "refresh": true
+       }
+     }
+   }
+
+
+If ``refresh`` is ``yes``, inotify is used to monitor for changes
+to the file and auto-reload the rules.
+
+The ``myvm-vnc.acl`` file should contain the match rules in a format that
+closely matches the previous driver:
+
+::
+
+   {
+     "rules": [
+       { "match": "fred", "policy": "allow", "format": "exact" },
+       { "match": "bob", "policy": "allow", "format": "exact" },
+       { "match": "danb", "policy": "deny", "format": "exact" },
+       { "match": "dan*", "policy": "allow", "format": "glob" }
+     ],
+     "policy": "deny"
+   }
+
+
+The object can be created on the command line using
+
+::
+
+   -object authz-list-file,id=authz0,\
+           filename=/etc/qemu/myvm-vnc.acl,refresh=on
+
+
+PAM
+^^^
+
+In some scenarios it might be desirable to integrate with authorization
+mechanisms that are implemented outside of QEMU. In order to allow maximum
+flexibility, QEMU provides a driver that uses the ``PAM`` framework.
+
+To create an instance of this class via QMP:
+
+::
+
+   {
+     "execute": "object-add",
+     "arguments": {
+       "qom-type": "authz-pam",
+       "id": "authz0",
+       "parameters": {
+         "service": "qemu-vnc-tls"
+       }
+     }
+   }
+
+
+The driver only uses the PAM "account" verification
+subsystem. The above config would require a config
+file /etc/pam.d/qemu-vnc-tls. For a simple file
+lookup it would contain
+
+::
+
+   account requisite  pam_listfile.so item=user sense=allow \
+           file=/etc/qemu/vnc.allow
+
+
+The external file would then contain a list of usernames.
+If x509 cert was being used as the username, a suitable
+entry would match the distinguished name:
+
+::
+
+   CN=laptop.berrange.com,O=Berrange Home,L=London,ST=London,C=GB
+
+
+On the command line it can be created using
+
+::
+
+   -object authz-pam,id=authz0,service=qemu-vnc-tls
+
+
+There are a variety of PAM plugins that can be used which are not illustrated
+here, and it is possible to implement brand new plugins using the PAM API.
+
+
+Connecting backends
+~~~~~~~~~~~~~~~~~~~
+
+The authorization driver is created using the ``-object`` argument and then
+needs to be associated with a network service. The authorization driver object
+will be given a unique ID that needs to be referenced.
+
+The property to set in the network service will vary depending on the type of
+identity to verify. By convention, any network server backend that uses TLS
+will provide ``tls-authz`` property, while any server using SASL will provide
+a ``sasl-authz`` property.
+
+Thus an example using SASL and authorization for the VNC server would look
+like:
+
+::
+
+   $QEMU --object authz-simple,id=authz0,identity=fred \
+         --vnc 0.0.0.0:1,sasl,sasl-authz=authz0
+
+While to validate both the x509 certificate and SASL username:
+
+::
+
+   echo "CN=laptop.qemu.org,O=QEMU Project,L=London,ST=London,C=GB" >> tls.acl
+   $QEMU --object authz-simple,id=authz0,identity=fred \
+         --object authz-list-file,id=authz1,filename=tls.acl \
+	 --object tls-creds-x509,id=tls0,dir=/etc/qemu/tls,verify-peer=yes \
+         --vnc 0.0.0.0:1,sasl,sasl-authz=auth0,tls-creds=tls0,tls-authz=authz1
diff --git a/docs/system/index.rst b/docs/system/index.rst
index 6aa2f8c05c..6092eb2d91 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -31,6 +31,7 @@ Contents:
    vnc-security
    tls
    secrets
+   authz
    gdb
    managed-startup
    cpu-hotplug
-- 
2.31.1


