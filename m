Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAEF5AB6FC
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 18:57:49 +0200 (CEST)
Received: from localhost ([::1]:33200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU9zI-0004am-Iu
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 12:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oU9tS-0002JJ-EN
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:51:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oU9tR-0003RC-1o
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:51:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662137504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MLb6rWreHs8dbcYGYB6VjIROg0IydKNv/Kp8c/Bnzww=;
 b=eo4w7m2IV0J+YQgaNjws8fYiLdlR0zCLSpPGIenJMTSNcYDdE6+dlmW6uO7x6PGa555c7L
 wml6u9Z5uAvJG1Z9xqYqO284U2fTO6TIXJZE+HmbhroSvTBlVcSlu1SzSIMMdKnndin3OK
 /INpNtpJ4JoZZquyr7WGN/Jj+b5pngk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-ftzGXaIFOJGHkk4-IToeSw-1; Fri, 02 Sep 2022 12:51:38 -0400
X-MC-Unique: ftzGXaIFOJGHkk4-IToeSw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C45F029AA388;
 Fri,  2 Sep 2022 16:51:37 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B58C22026D4C;
 Fri,  2 Sep 2022 16:51:34 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>
Subject: [PATCH 2/8] qtest: Set "-net none" in qtest_init()
Date: Fri,  2 Sep 2022 18:51:20 +0200
Message-Id: <20220902165126.1482-3-quintela@redhat.com>
In-Reply-To: <20220902165126.1482-1-quintela@redhat.com>
References: <20220902165126.1482-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This way, we don't have networking by default.  If test needs it,
configure it.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/bios-tables-test.c | 2 +-
 tests/qtest/libqtest.c         | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 9c68f3658a..a0853744ae 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -725,7 +725,7 @@ static char *test_acpi_create_args(test_data *data, const char *params,
         }
     } else {
         args = g_strdup_printf("-machine %s %s -accel tcg "
-            "-net none %s "
+            "%s "
             "-drive id=hd0,if=none,file=%s,format=raw "
             "-device %s,drive=hd0 ",
              data->machine, data->tcg_only ? "" : "-accel kvm",
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 7c9fc07de4..ee84dbfc36 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -290,6 +290,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
                               "-chardev socket,path=%s,id=char0 "
                               "-mon chardev=char0,mode=control "
                               "-display none "
+                              "-net none "
                               "%s"
                               " -accel qtest",
                               qemu_binary, tracearg, socket_path,
-- 
2.37.2


