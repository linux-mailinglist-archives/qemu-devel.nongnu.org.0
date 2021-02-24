Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED739323DC3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 14:21:45 +0100 (CET)
Received: from localhost ([::1]:33114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEu6q-0007TU-UN
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 08:21:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEtyk-0002c6-4B
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:13:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEtyi-000509-9R
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:13:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614172399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8SI05MdPS4f/GzogNORcXrpyFidB7MvFz60k/mjgfRo=;
 b=F2k1NPIg+Oz+wnGxPxyt1Ue8ya8G9LiAdr4BeYOm3Uuk86pIpz6twP7rUd7F1b69GpPGlN
 v6LL6Bz48jFT3zCrOlzXyvj6kXYCJmhWupczehf/+21RLpzVtgdIk/OIuw0+ZXl435FuCW
 NedvKtl8v6sQYx3nOiBAD28u98oJTu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-Ngv4pszZMP6VqxIMH9Pn0Q-1; Wed, 24 Feb 2021 08:13:18 -0500
X-MC-Unique: Ngv4pszZMP6VqxIMH9Pn0Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F250418957EC;
 Wed, 24 Feb 2021 13:13:15 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-119.ams2.redhat.com
 [10.36.115.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 438C81002388;
 Wed, 24 Feb 2021 13:12:55 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/14] monitor: remove 'query-events' QMP command
Date: Wed, 24 Feb 2021 13:11:31 +0000
Message-Id: <20210224131142.1952027-4-berrange@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/system/deprecated.rst       |  6 -----
 docs/system/removed-features.rst |  6 +++++
 monitor/qmp-cmds-control.c       | 24 -----------------
 qapi/control.json                | 45 --------------------------------
 4 files changed, 6 insertions(+), 75 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index dfd8a8c497..611adf60f7 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -222,12 +222,6 @@ The ``query-cpus`` command is replaced by the ``query-cpus-fast`` command.
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
index 3ca13d2844..dc63581fe5 100644
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
2.29.2


