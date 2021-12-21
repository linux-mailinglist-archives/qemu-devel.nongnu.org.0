Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DD047BA65
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:02:53 +0100 (CET)
Received: from localhost ([::1]:56234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZAh-0003HT-04
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:02:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZ7U-0001Ha-63
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 01:59:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZ7R-0001db-HJ
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 01:59:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640069968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=03CeoIGOe6igCvSlLszqsEglPU2lZ3zSzXY24jpw39M=;
 b=BScEfBok7EaAjOkINnd4oXZoiDQNB8MSzB/rxXbBVYnxgNTDjM6BHy5yyBE2gF5Crx4SHT
 IdoPMH4mcgBhj9KM8aUgyCfvcxTarW5dA57apJG69kqU2fZkw1DBr+ff83RfR64FPmSbmu
 FoIPM0Wm7lC20mIrlPrjV5IyD5eV3R0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-YwDO59v1PjOpJDqcV_beiQ-1; Tue, 21 Dec 2021 01:59:25 -0500
X-MC-Unique: YwDO59v1PjOpJDqcV_beiQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5051136393;
 Tue, 21 Dec 2021 06:59:24 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86DCD7E8EF;
 Tue, 21 Dec 2021 06:59:15 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 01/36] ui/vdagent: add CHECK_SPICE_PROTOCOL_VERSION
Date: Tue, 21 Dec 2021 10:58:20 +0400
Message-Id: <20211221065855.142578-2-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 meson.build  | 5 +++++
 ui/vdagent.c | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/meson.build b/meson.build
index f45ecf31bdbe..1c70839bbf17 100644
--- a/meson.build
+++ b/meson.build
@@ -1497,6 +1497,11 @@ config_host_data.set('CONFIG_ZSTD', zstd.found())
 config_host_data.set('CONFIG_FUSE', fuse.found())
 config_host_data.set('CONFIG_FUSE_LSEEK', fuse_lseek.found())
 config_host_data.set('CONFIG_SPICE_PROTOCOL', spice_protocol.found())
+if spice_protocol.found()
+config_host_data.set('CONFIG_SPICE_PROTOCOL_MAJOR', spice_protocol.version().split('.')[0])
+config_host_data.set('CONFIG_SPICE_PROTOCOL_MINOR', spice_protocol.version().split('.')[1])
+config_host_data.set('CONFIG_SPICE_PROTOCOL_MICRO', spice_protocol.version().split('.')[2])
+endif
 config_host_data.set('CONFIG_SPICE', spice.found())
 config_host_data.set('CONFIG_X11', x11.found())
 config_host_data.set('CONFIG_CFI', get_option('cfi'))
diff --git a/ui/vdagent.c b/ui/vdagent.c
index 19e8fbfc96f1..1f8fc77ee8f3 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -17,6 +17,14 @@
 
 #include "spice/vd_agent.h"
 
+#define CHECK_SPICE_PROTOCOL_VERSION(major, minor, micro) \
+    (CONFIG_SPICE_PROTOCOL_MAJOR > (major) ||             \
+     (CONFIG_SPICE_PROTOCOL_MAJOR == (major) &&           \
+      CONFIG_SPICE_PROTOCOL_MINOR > (minor)) ||           \
+     (CONFIG_SPICE_PROTOCOL_MAJOR == (major) &&           \
+      CONFIG_SPICE_PROTOCOL_MINOR == (minor) &&           \
+      CONFIG_SPICE_PROTOCOL_MICRO >= (micro)))
+
 #define VDAGENT_BUFFER_LIMIT (1 * MiB)
 #define VDAGENT_MOUSE_DEFAULT true
 #define VDAGENT_CLIPBOARD_DEFAULT false
-- 
2.34.1.8.g35151cf07204


