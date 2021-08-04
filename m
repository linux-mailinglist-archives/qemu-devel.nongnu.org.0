Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881443E038D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 16:42:32 +0200 (CEST)
Received: from localhost ([::1]:53274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBI6J-0003XB-KC
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 10:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBI38-0004xU-A9
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:39:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBI35-0002XL-91
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628087950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/5yJ4dUR6Y5xKen0NrSuTLIszSPFdr6hFKaZrrITNQ=;
 b=jTI+jRlzk1JuliJmH8CvTXof5q3jhbCVnrsOdYNNezOFY4HBNNc2KkOEJpU/MiA4sD4ezQ
 mRlFSZHQVQ86ykFhzU1Itqa7QLefi/4M6XF7vcOXX4U6EYQmZePyccN5EE4IYmonL1x6qB
 Z9y5JAS2M6SdSzhsRCjzzoSx+DGW/Fk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-KfxzEZ11Mo-zPgRTXBPo-Q-1; Wed, 04 Aug 2021 10:39:09 -0400
X-MC-Unique: KfxzEZ11Mo-zPgRTXBPo-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8ED487D541;
 Wed,  4 Aug 2021 14:39:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DCA81981F;
 Wed,  4 Aug 2021 14:38:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5F2B2180098A; Wed,  4 Aug 2021 16:38:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] tcg/module: add some infrastructure for modular tcg.
Date: Wed,  4 Aug 2021 16:38:23 +0200
Message-Id: <20210804143826.3402872-5-kraxel@redhat.com>
In-Reply-To: <20210804143826.3402872-1-kraxel@redhat.com>
References: <20210804143826.3402872-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create tcg-module.[ch] files, with struct TCGModuleOps, empty for now.

Followup patches will add function pointers to the struct and stub
functions to tcg-module.c.  That will effectively will switch stubs from
compile-time to runtime, which is needed to build tcg as module.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/tcg/tcg-module.h | 8 ++++++++
 accel/tcg/tcg-module.c   | 5 +++++
 accel/tcg/meson.build    | 4 ++++
 3 files changed, 17 insertions(+)
 create mode 100644 include/tcg/tcg-module.h
 create mode 100644 accel/tcg/tcg-module.c

diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
new file mode 100644
index 000000000000..7e87aecb2357
--- /dev/null
+++ b/include/tcg/tcg-module.h
@@ -0,0 +1,8 @@
+#ifndef TCG_MODULE_H
+#define TCG_MODULE_H
+
+struct TCGModuleOps {
+};
+extern struct TCGModuleOps tcg;
+
+#endif /* TCG_MODULE_H */
diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
new file mode 100644
index 000000000000..e864fb20c141
--- /dev/null
+++ b/accel/tcg/tcg-module.c
@@ -0,0 +1,5 @@
+#include "qemu/osdep.h"
+#include "tcg/tcg-module.h"
+
+struct TCGModuleOps tcg = {
+};
diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index c1ee9dcaed1f..eaaf7168ffb6 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -1,3 +1,7 @@
+specific_ss.add(files(
+  'tcg-module.c',
+))
+
 specific_ss.add(when: 'CONFIG_TCG', if_true: files(
   'cpu-exec-common.c',
 ))
-- 
2.31.1


