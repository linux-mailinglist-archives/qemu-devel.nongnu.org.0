Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EAE2516B9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 12:41:18 +0200 (CEST)
Received: from localhost ([::1]:37064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAWOE-0005oh-2b
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 06:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAWM0-0002Kl-Lq
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 06:39:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAWLy-0007KQ-FC
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 06:39:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598351937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MpcHxk8758d3DgHfyNyPjIbcobjL0YHSZ/QxOyHXdiQ=;
 b=GOyf9IJ/pJujjOPYXj5+65CtGfzCt3mtjKnXS2DXg/Og4sEtNwCPL0f1gY6k6UTb3dMb8G
 t5Y5TqMgJfBR0LagDAWMF2dL7I3eQpXHkxFs93F0odiZsswvHdJnaOMrRFrpsV9Oam7lH/
 RVJJCdh9DYxZJ/Sd62nS8b9EJZN9rA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-9dK0jJ_TOd2KG_PWW0lSbA-1; Tue, 25 Aug 2020 06:38:55 -0400
X-MC-Unique: 9dK0jJ_TOd2KG_PWW0lSbA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA86C805EE3;
 Tue, 25 Aug 2020 10:38:54 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-231.ams2.redhat.com
 [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4800A5C1CF;
 Tue, 25 Aug 2020 10:38:53 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] block: add missing socket_init() calls to tools
Date: Tue, 25 Aug 2020 11:38:48 +0100
Message-Id: <20200825103850.119911-2-berrange@redhat.com>
In-Reply-To: <20200825103850.119911-1-berrange@redhat.com>
References: <20200825103850.119911-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 02:03:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Any tool that uses sockets needs to call socket_init() in order to work
on the Windows platform.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qemu-img.c | 2 ++
 qemu-io.c  | 2 ++
 qemu-nbd.c | 1 +
 3 files changed, 5 insertions(+)

diff --git a/qemu-img.c b/qemu-img.c
index 5308773811..eb2fc1f862 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -41,6 +41,7 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
+#include "qemu/sockets.h"
 #include "qemu/units.h"
 #include "qom/object_interfaces.h"
 #include "sysemu/block-backend.h"
@@ -5410,6 +5411,7 @@ int main(int argc, char **argv)
     signal(SIGPIPE, SIG_IGN);
 #endif
 
+    socket_init();
     error_init(argv[0]);
     module_call_init(MODULE_INIT_TRACE);
     qemu_init_exec_dir(argv[0]);
diff --git a/qemu-io.c b/qemu-io.c
index 3adc5a7d0d..7cc832b3d6 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -25,6 +25,7 @@
 #include "qemu/config-file.h"
 #include "qemu/readline.h"
 #include "qemu/log.h"
+#include "qemu/sockets.h"
 #include "qapi/qmp/qstring.h"
 #include "qapi/qmp/qdict.h"
 #include "qom/object_interfaces.h"
@@ -542,6 +543,7 @@ int main(int argc, char **argv)
     signal(SIGPIPE, SIG_IGN);
 #endif
 
+    socket_init();
     error_init(argv[0]);
     module_call_init(MODULE_INIT_TRACE);
     qemu_init_exec_dir(argv[0]);
diff --git a/qemu-nbd.c b/qemu-nbd.c
index d2657b8db5..b102874f0f 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -599,6 +599,7 @@ int main(int argc, char **argv)
     signal(SIGPIPE, SIG_IGN);
 #endif
 
+    socket_init();
     error_init(argv[0]);
     module_call_init(MODULE_INIT_TRACE);
     qcrypto_init(&error_fatal);
-- 
2.26.2


