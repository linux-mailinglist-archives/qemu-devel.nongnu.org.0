Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED8E43DF24
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 12:43:30 +0200 (CEST)
Received: from localhost ([::1]:51022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg2sb-00051w-K3
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 06:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mg2bb-0007L0-70
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 06:25:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mg2bW-000308-C2
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 06:25:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635416745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/3F/IDi7lK5xLdRB4Iz1gGna/YMFTcZfSublsfCzYZU=;
 b=YqAtnyyTwtFCy/90XrWT7qeu+q2gan7lAqUsV0Ru43jWZydD6YkzLqe7DyDIZb1cnquJm3
 D5NwSPjZmRFKFNmVe9sHB2+Fnj3D0/45FqW93GNfVc3o2mO15sl8rVNrJHEpsECfvisfK6
 Ax1NqmOaYCGML6uHo1hPnmHDYvevB2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-ANv3yUDAPFK9vthxqtIyew-1; Thu, 28 Oct 2021 06:25:44 -0400
X-MC-Unique: ANv3yUDAPFK9vthxqtIyew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11D14362F9;
 Thu, 28 Oct 2021 10:25:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 128D64180;
 Thu, 28 Oct 2021 10:25:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4186211380BA; Thu, 28 Oct 2021 12:25:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/9] qapi: Eliminate QCO_NO_OPTIONS for a slight
 simplification
Date: Thu, 28 Oct 2021 12:25:14 +0200
Message-Id: <20211028102520.747396-4-armbru@redhat.com>
In-Reply-To: <20211028102520.747396-1-armbru@redhat.com>
References: <20211028102520.747396-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, kchamart@redhat.com,
 mdroth@linux.vnet.ibm.com, dgilbert@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, philmd@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 include/qapi/qmp/dispatch.h | 1 -
 monitor/misc.c              | 3 +--
 scripts/qapi/commands.py    | 5 +----
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
index 075203dc67..0ce88200b9 100644
--- a/include/qapi/qmp/dispatch.h
+++ b/include/qapi/qmp/dispatch.h
@@ -21,7 +21,6 @@ typedef void (QmpCommandFunc)(QDict *, QObject **, Error **);
 
 typedef enum QmpCommandOptions
 {
-    QCO_NO_OPTIONS            =  0x0,
     QCO_NO_SUCCESS_RESP       =  (1U << 0),
     QCO_ALLOW_OOB             =  (1U << 1),
     QCO_ALLOW_PRECONFIG       =  (1U << 2),
diff --git a/monitor/misc.c b/monitor/misc.c
index ffe7966870..3556b177f6 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -230,8 +230,7 @@ static void monitor_init_qmp_commands(void)
 
     qmp_init_marshal(&qmp_commands);
 
-    qmp_register_command(&qmp_commands, "device_add", qmp_device_add,
-                         QCO_NO_OPTIONS);
+    qmp_register_command(&qmp_commands, "device_add", qmp_device_add, 0);
 
     QTAILQ_INIT(&qmp_cap_negotiation_commands);
     qmp_register_command(&qmp_cap_negotiation_commands, "qmp_capabilities",
diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 3654825968..c8a975528f 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -229,15 +229,12 @@ def gen_register_command(name: str,
     if coroutine:
         options += ['QCO_COROUTINE']
 
-    if not options:
-        options = ['QCO_NO_OPTIONS']
-
     ret = mcgen('''
     qmp_register_command(cmds, "%(name)s",
                          qmp_marshal_%(c_name)s, %(opts)s);
 ''',
                 name=name, c_name=c_name(name),
-                opts=" | ".join(options))
+                opts=' | '.join(options) or 0)
     return ret
 
 
-- 
2.31.1


