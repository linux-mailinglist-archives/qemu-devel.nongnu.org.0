Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA57E1733D7
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 10:25:59 +0100 (CET)
Received: from localhost ([::1]:44050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7buA-0008FR-P5
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 04:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50387)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j7bsw-0006QT-VG
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 04:24:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j7bsv-0003mh-Sz
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 04:24:42 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:22624
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j7bsv-0003mT-PE
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 04:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582881881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gx+cEo7Pl1tG1EDHA9aMk96amwXvma1Lxo6JP0PBaGY=;
 b=YUrs5BR3zXUwkWpeQjlYIfATQrwUxt9TBdbLSS6yfLLCeVfUk0Z9PMBIHXyC5nn9e6nJ58
 +iCizj26H5Cl8QjaxZwMqcDtUBElsn65oIYzAuaEf3JtIpPAPJNxSUU1fTvkfCjthTVcyW
 L24xwYzitglQl0jbOeYplsNiBHgca4Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-6QLTFsOfMXudeJp3GSBQnA-1; Fri, 28 Feb 2020 04:24:39 -0500
X-MC-Unique: 6QLTFsOfMXudeJp3GSBQnA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 387FD18A8C81;
 Fri, 28 Feb 2020 09:24:38 +0000 (UTC)
Received: from secure.mitica (ovpn-116-211.ams2.redhat.com [10.36.116.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6BE660BE0;
 Fri, 28 Feb 2020 09:24:32 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/15] migration: Add support for modules
Date: Fri, 28 Feb 2020 10:24:07 +0100
Message-Id: <20200228092420.103757-3-quintela@redhat.com>
In-Reply-To: <20200228092420.103757-1-quintela@redhat.com>
References: <20200228092420.103757-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So we don't have to compile everything in, or have ifdefs

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/qemu/module.h | 2 ++
 softmmu/vl.c          | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/qemu/module.h b/include/qemu/module.h
index 684753d808..011ae1ae76 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -40,6 +40,7 @@ static void __attribute__((constructor)) do_qemu_init_ ##=
 function(void)    \
 #endif
=20
 typedef enum {
+    MODULE_INIT_MIGRATION,
     MODULE_INIT_BLOCK,
     MODULE_INIT_OPTS,
     MODULE_INIT_QOM,
@@ -59,6 +60,7 @@ typedef enum {
 #define libqos_init(function) module_init(function, MODULE_INIT_LIBQOS)
 #define fuzz_target_init(function) module_init(function, \
                                                MODULE_INIT_FUZZ_TARGET)
+#define migration_init(function) module_init(function, MODULE_INIT_MIGRATI=
ON)
 #define block_module_load_one(lib) module_load_one("block-", lib)
 #define ui_module_load_one(lib) module_load_one("ui-", lib)
 #define audio_module_load_one(lib) module_load_one("audio-", lib)
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 16ff5a16a3..705ee6f841 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2858,6 +2858,7 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_init_exec_dir(argv[0]);
=20
     module_call_init(MODULE_INIT_QOM);
+    module_call_init(MODULE_INIT_MIGRATION);
=20
     qemu_add_opts(&qemu_drive_opts);
     qemu_add_drive_opts(&qemu_legacy_drive_opts);
--=20
2.24.1


