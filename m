Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAA757A2E8
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 17:25:51 +0200 (CEST)
Received: from localhost ([::1]:35310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDp6b-0004EY-KR
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 11:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oDp3K-0007je-T0
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 11:22:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oDp3I-0001iP-IG
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 11:22:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658244143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wHge7lg9kyG9GFqnIq7GMVPVOE709StAygb/UJqshEQ=;
 b=Rt5QAsX9FR+ssysiScve9cV5Nl3W+D1XOYwGrE4g03NjyljvjFLhZtUixoTP8Z9rCQWMDj
 cWgwiShT/uMH4mr+wS2Re6V2fulLxd1MXN7ETj+ddxa/LnCMgZsvSr0Z5s13as1xjWfN/G
 CynRnYqa6tLsoXAXracFK2fjKJlc5LQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-uvF9199HPd2GXRvd43e8qw-1; Tue, 19 Jul 2022 11:22:22 -0400
X-MC-Unique: uvF9199HPd2GXRvd43e8qw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9392C806017;
 Tue, 19 Jul 2022 15:22:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 530AD492CA4;
 Tue, 19 Jul 2022 15:22:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BEC3018003A3; Tue, 19 Jul 2022 17:22:18 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Robinson@redhat.com, Cole <crobinso@redhat.com>
Subject: [PULL 1/6] dbus-display: fix test race when initializing p2p
 connection
Date: Tue, 19 Jul 2022 17:22:13 +0200
Message-Id: <20220719152218.825707-2-kraxel@redhat.com>
In-Reply-To: <20220719152218.825707-1-kraxel@redhat.com>
References: <20220719152218.825707-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The D-Bus connection starts processing messages before QEMU has the time
to set the object manager server. This is causing dbus-display-test to
fail randomly with:

ERROR:../tests/qtest/dbus-display-test.c:68:test_dbus_display_vm:
assertion failed
(qemu_dbus_display1_vm_get_name(QEMU_DBUS_DISPLAY1_VM(vm)) ==
"dbus-test"): (NULL == "dbus-test") ERROR

Use the delayed message processing flag and method to avoid that
situation.

(the bus connection doesn't need a fix, as the initialization is done
synchronously)

Reported-by: Robinson, Cole <crobinso@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Tested-by: Cole Robinson <crobinso@redhat.com>
Message-Id: <20220609152647.870373-1-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/dbus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/ui/dbus.c b/ui/dbus.c
index 7a87612379e8..32d88dc94a7e 100644
--- a/ui/dbus.c
+++ b/ui/dbus.c
@@ -268,6 +268,7 @@ dbus_display_add_client_ready(GObject *source_object,
     }
 
     g_dbus_object_manager_server_set_connection(dbus_display->server, conn);
+    g_dbus_connection_start_message_processing(conn);
 }
 
 
@@ -300,7 +301,8 @@ dbus_display_add_client(int csock, Error **errp)
 
     g_dbus_connection_new(G_IO_STREAM(conn),
                           guid,
-                          G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER,
+                          G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER |
+                          G_DBUS_CONNECTION_FLAGS_DELAY_MESSAGE_PROCESSING,
                           NULL,
                           dbus_display->add_client_cancellable,
                           dbus_display_add_client_ready,
-- 
2.36.1


