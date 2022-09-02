Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EE15AB70B
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 19:00:51 +0200 (CEST)
Received: from localhost ([::1]:53518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUA2E-0000M6-EK
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 13:00:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oU9tg-0002xD-96
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:52:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oU9te-0003T3-Tw
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:51:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662137517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bb43OuFk+UC3tWHwCAfVz9BoPpGiX+3mhdgvJ5wM8MA=;
 b=JM1KNET7flSZOWAc4kAJJfpyN6iNFpcQwEY1lPjzIbn0WN4Aiwax9skUnDYzy9ZXVsMvR6
 YX2Y5lFFK44dfEFLKBWpG+3OQrnTzFmS1qA68DCr4mQpweGw6R5DsM2zLvs34iFIwC1xbS
 MGw6lypNFN8xcTwj7MFbFgOLcp1NOhM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-cpUb-EJCOTCTCUf2hA4vxg-1; Fri, 02 Sep 2022 12:51:52 -0400
X-MC-Unique: cpUb-EJCOTCTCUf2hA4vxg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9AA780A0B9;
 Fri,  2 Sep 2022 16:51:51 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEFA92026D4C;
 Fri,  2 Sep 2022 16:51:48 +0000 (UTC)
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
Subject: [PATCH 6/8] tests: Fix error strings
Date: Fri,  2 Sep 2022 18:51:24 +0200
Message-Id: <20220902165126.1482-7-quintela@redhat.com>
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

They were copy-pasted from e1000e and never changed.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/e1000-test.c  | 2 +-
 tests/qtest/es1370-test.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/e1000-test.c b/tests/qtest/e1000-test.c
index c387984ef6..4e0d7a5607 100644
--- a/tests/qtest/e1000-test.c
+++ b/tests/qtest/e1000-test.c
@@ -35,7 +35,7 @@ static void *e1000_get_driver(void *obj, const char *interface)
         return &e1000->dev;
     }
 
-    fprintf(stderr, "%s not present in e1000e\n", interface);
+    fprintf(stderr, "%s not present in e1000\n", interface);
     g_assert_not_reached();
 }
 
diff --git a/tests/qtest/es1370-test.c b/tests/qtest/es1370-test.c
index adccdac1be..97ab65c435 100644
--- a/tests/qtest/es1370-test.c
+++ b/tests/qtest/es1370-test.c
@@ -28,7 +28,7 @@ static void *es1370_get_driver(void *obj, const char *interface)
         return &es1370->dev;
     }
 
-    fprintf(stderr, "%s not present in e1000e\n", interface);
+    fprintf(stderr, "%s not present in es1370\n", interface);
     g_assert_not_reached();
 }
 
-- 
2.37.2


