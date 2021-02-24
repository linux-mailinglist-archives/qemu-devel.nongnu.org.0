Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00162323DBC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 14:20:09 +0100 (CET)
Received: from localhost ([::1]:58192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEu5I-0006BA-W2
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 08:20:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEu0Y-0004AV-2Y
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:15:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEu0R-0005jq-Gz
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:15:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614172506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lmnyfIbPyy7DxT/Gn6LmF1DAVQG4g//yGveYaJvNomA=;
 b=cgvQjtB1Xoh+UtbmDQy68jLHueK3eUUNtosxHT0t0LrhfDVwW/bGivxDUrR+iQ3ZcItL85
 xM7zEsvKIWsg0mP3jGViqIOuscdLGa4m+xdN4kXchY5iRNyM1qVImpve5LopmCaAnNOM2b
 qOuO698B2YvXUy3NRVEL53Vk8Uv5knQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-sJohmesmO_ihd8RIcmlFgQ-1; Wed, 24 Feb 2021 08:15:04 -0500
X-MC-Unique: sJohmesmO_ihd8RIcmlFgQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7B69107ACE6;
 Wed, 24 Feb 2021 13:15:02 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-119.ams2.redhat.com
 [10.36.115.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3C031002388;
 Wed, 24 Feb 2021 13:14:41 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/14] chardev: reject use of 'wait' flag for socket client
 chardevs
Date: Wed, 24 Feb 2021 13:11:36 +0000
Message-Id: <20210224131142.1952027-9-berrange@redhat.com>
In-Reply-To: <20210224131142.1952027-1-berrange@redhat.com>
References: <20210224131142.1952027-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This only makes sense conceptually when used with listener chardevs.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 chardev/char-socket.c            | 12 ++++--------
 docs/system/deprecated.rst       |  6 ------
 docs/system/removed-features.rst |  6 ++++++
 3 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 9061981f6d..b24618b581 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1336,14 +1336,10 @@ static bool qmp_chardev_validate_socket(ChardevSocket *sock,
             return false;
         }
         if (sock->has_wait) {
-            warn_report("'wait' option is deprecated with "
-                        "socket in client connect mode");
-            if (sock->wait) {
-                error_setg(errp, "%s",
-                           "'wait' option is incompatible with "
-                           "socket in client connect mode");
-                return false;
-            }
+            error_setg(errp, "%s",
+                       "'wait' option is incompatible with "
+                       "socket in client connect mode");
+            return false;
         }
     }
 
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 78474f0845..c69887dca8 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -192,12 +192,6 @@ Since the ``dirty-bitmaps`` field is optionally present in both the old and
 new locations, clients must use introspection to learn where to anticipate
 the field if/when it does appear in command output.
 
-chardev client socket with ``wait`` option (since 4.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-Character devices creating sockets in client mode should not specify
-the 'wait' field, which is only applicable to sockets in server mode
-
 ``nbd-server-add`` and ``nbd-server-remove`` (since 5.2)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 7942c2e513..870a222062 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -106,6 +106,12 @@ The ``query-cpus`` command is replaced by the ``query-cpus-fast`` command.
 The ``arch`` output member of the ``query-cpus-fast`` command is
 replaced by the ``target`` output member.
 
+chardev client socket with ``wait`` option (removed in 6.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Character devices creating sockets in client mode should not specify
+the 'wait' field, which is only applicable to sockets in server mode
+
 Human Monitor Protocol (HMP) commands
 -------------------------------------
 
-- 
2.29.2


