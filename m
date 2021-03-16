Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076CC33D9DF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:55:04 +0100 (CET)
Received: from localhost ([::1]:35496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMCyE-0006MX-HZ
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMCpR-0008Ca-MH
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:45:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMCpP-0004cu-EN
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615913154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PQXkdMZHZYfVPaT+krFaS/GltQoEP3KpjsMh0t+Bi1s=;
 b=YOBN9NpvZHDz+o6yc2ggMsbibhOa8Kgf908uIU0AFZYTor6DM6A+1vFhhX328Kz2OakBJU
 +KSKtXX3p+QcZw8CLvzSpUmzSYIiPOJevhGYzFRucrjWN+UdO4+WFIK0d1x5c7shhOm7Tc
 lHklC3wtxxwY+ux5sM8bgBZADAISu0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-0NEl7nT3MCKDgevi5OqYVg-1; Tue, 16 Mar 2021 12:45:52 -0400
X-MC-Unique: 0NEl7nT3MCKDgevi5OqYVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDB8480006E;
 Tue, 16 Mar 2021 16:45:50 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-185.ams2.redhat.com
 [10.36.115.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E23875C1A1;
 Tue, 16 Mar 2021 16:45:24 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/13] monitor: remove 'query-events' QMP command
Date: Tue, 16 Mar 2021 16:43:45 +0000
Message-Id: <20210316164355.150519-4-berrange@redhat.com>
In-Reply-To: <20210316164355.150519-1-berrange@redhat.com>
References: <20210316164355.150519-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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

The code comment suggests removing QAPIEvent_(str|lookup) symbols too,
however, these are both auto-generated as standard for any enum in
QAPI. As such it they'll exist whether we use them or not.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/system/deprecated.rst       |  6 -----
 docs/system/removed-features.rst |  6 +++++
 monitor/qmp-cmds-control.c       | 24 -----------------
 qapi/control.json                | 45 --------------------------------
 4 files changed, 6 insertions(+), 75 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 269fe2bcac..9fb347724c 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -250,12 +250,6 @@ The ``query-cpus`` command is replaced by the ``query-cpus-fast`` command.
 The ``arch`` output member of the ``query-cpus-fast`` command is
 replaced by the ``target`` output member.
 
-``query-events`` (since 4.0)
-''''''''''''''''''''''''''''
-
-The ``query-events`` command has been superseded by the more powerful
-and accurate ``query-qmp-schema`` command.
-
 chardev client socket with ``wait`` option (since 4.0)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 5fbec3b963..408cc340d2 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -70,6 +70,12 @@ documentation of ``query-hotpluggable-cpus`` for additional details.
 
 Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.
 
+``query-events`` (removed in 6.0)
+'''''''''''''''''''''''''''''''''
+
+The ``query-events`` command has been superseded by the more powerful
+and accurate ``query-qmp-schema`` command.
+
 Human Monitor Protocol (HMP) commands
 -------------------------------------
 
diff --git a/monitor/qmp-cmds-control.c b/monitor/qmp-cmds-control.c
index 509ae870bd..513b547233 100644
--- a/monitor/qmp-cmds-control.c
+++ b/monitor/qmp-cmds-control.c
@@ -130,30 +130,6 @@ CommandInfoList *qmp_query_commands(Error **errp)
     return list;
 }
 
-EventInfoList *qmp_query_events(Error **errp)
-{
-    /*
-     * TODO This deprecated command is the only user of
-     * QAPIEvent_str() and QAPIEvent_lookup[].  When the command goes,
-     * they should go, too.
-     */
-    EventInfoList *ev_list = NULL;
-    QAPIEvent e;
-
-    for (e = 0 ; e < QAPI_EVENT__MAX ; e++) {
-        const char *event_name = QAPIEvent_str(e);
-        EventInfo *info;
-
-        assert(event_name != NULL);
-        info = g_malloc0(sizeof(*info));
-        info->name = g_strdup(event_name);
-
-        QAPI_LIST_PREPEND(ev_list, info);
-    }
-
-    return ev_list;
-}
-
 /*
  * Minor hack: generated marshalling suppressed for this command
  * ('gen': false in the schema) so we can parse the JSON string
diff --git a/qapi/control.json b/qapi/control.json
index 2615d5170b..71a838d49e 100644
--- a/qapi/control.json
+++ b/qapi/control.json
@@ -159,51 +159,6 @@
 { 'command': 'query-commands', 'returns': ['CommandInfo'],
   'allow-preconfig': true }
 
-##
-# @EventInfo:
-#
-# Information about a QMP event
-#
-# @name: The event name
-#
-# Since: 1.2
-##
-{ 'struct': 'EventInfo', 'data': {'name': 'str'} }
-
-##
-# @query-events:
-#
-# Return information on QMP events.
-#
-# Features:
-# @deprecated: This command is deprecated, because its output doesn't
-#              reflect compile-time configuration.  Use 'query-qmp-schema'
-#              instead.
-#
-# Returns: A list of @EventInfo.
-#
-# Since: 1.2
-#
-# Example:
-#
-# -> { "execute": "query-events" }
-# <- {
-#      "return": [
-#          {
-#             "name":"SHUTDOWN"
-#          },
-#          {
-#             "name":"RESET"
-#          }
-#       ]
-#    }
-#
-# Note: This example has been shortened as the real response is too long.
-#
-##
-{ 'command': 'query-events', 'returns': ['EventInfo'],
-  'features': [ 'deprecated' ] }
-
 ##
 # @quit:
 #
-- 
2.30.2


