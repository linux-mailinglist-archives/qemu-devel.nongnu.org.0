Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D278D438EC8
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 07:28:16 +0200 (CEST)
Received: from localhost ([::1]:33578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mesWt-0007uZ-G8
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 01:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mesUb-0005Ho-Us
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 01:25:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mesUY-0005EB-6w
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 01:25:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635139549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfkvYTXckKlIyjskAjoVWTuQ1jsWsPt9FpT5FqL7JSw=;
 b=DwXCEIYfRp3OP/J9HmagIh1uBEAvzlQK24oXIEooD0L++k/g45JqhQvXooNCDbA7jLLYd1
 LvQy7tn2Y8vW3YKas/bpGUVCBY35fMfpr0VDJbqqDZqTR3h5VYdFaVu4CYe1C538gORUAO
 ehuh4U6pYn3a4eeky01lD4l4R16o/DY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-7QWFazfHMFCLpfzKNGC41Q-1; Mon, 25 Oct 2021 01:25:45 -0400
X-MC-Unique: 7QWFazfHMFCLpfzKNGC41Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFECA8066F4;
 Mon, 25 Oct 2021 05:25:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 483EC1037F38;
 Mon, 25 Oct 2021 05:25:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D82E711380BA; Mon, 25 Oct 2021 07:25:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] qapi: Eliminate QCO_NO_OPTIONS for a slight simplification
Date: Mon, 25 Oct 2021 07:25:26 +0200
Message-Id: <20211025052532.3859634-4-armbru@redhat.com>
In-Reply-To: <20211025052532.3859634-1-armbru@redhat.com>
References: <20211025052532.3859634-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 dgilbert@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
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


