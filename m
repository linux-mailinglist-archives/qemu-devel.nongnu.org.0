Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908432DD8B5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 19:51:51 +0100 (CET)
Received: from localhost ([::1]:42290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpyNS-0002sK-I9
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 13:51:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpyIK-0006Fy-R2
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:46:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpyII-0001vr-Qc
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608230790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jrhsHMCO5pQrzqq8qVK2oAOVXtrbFpYPkBkZSlqw28o=;
 b=OsveKNHVY8UqRZycwEoGZdMpAc8MVs9LpQQe6trhPgfWOgWzPfm1p+H83JPQy2zsvOG9Fi
 VGIrwfbAikXe1cP8UQ+4NESJByMdFq3IV3CwPgNY4CuMGqZLSHaPLybqGdyeLWRjWXLAA+
 345R3GikXOr28ZfUxrBcFM58J/v6fos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-COf15jiqMvy3XGlv2XajQw-1; Thu, 17 Dec 2020 13:46:27 -0500
X-MC-Unique: COf15jiqMvy3XGlv2XajQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F23D91081B21;
 Thu, 17 Dec 2020 18:46:25 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B802660D01;
 Thu, 17 Dec 2020 18:46:25 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 03/17] i386: move hax accel files into hax/
Date: Thu, 17 Dec 2020 13:46:06 -0500
Message-Id: <20201217184620.3945917-4-ehabkost@redhat.com>
In-Reply-To: <20201217184620.3945917-1-ehabkost@redhat.com>
References: <20201217184620.3945917-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201212155530.23098-4-cfontana@suse.de>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/{ => hax}/hax-cpus.h      | 0
 target/i386/{ => hax}/hax-i386.h      | 6 +++---
 target/i386/{ => hax}/hax-interface.h | 0
 target/i386/{ => hax}/hax-posix.h     | 0
 target/i386/{ => hax}/hax-windows.h   | 0
 MAINTAINERS                           | 2 +-
 target/i386/{ => hax}/hax-all.c       | 0
 target/i386/{ => hax}/hax-cpus.c      | 0
 target/i386/{ => hax}/hax-mem.c       | 0
 target/i386/{ => hax}/hax-posix.c     | 0
 target/i386/{ => hax}/hax-windows.c   | 0
 target/i386/hax/meson.build           | 7 +++++++
 target/i386/meson.build               | 8 +-------
 13 files changed, 12 insertions(+), 11 deletions(-)
 rename target/i386/{ => hax}/hax-cpus.h (100%)
 rename target/i386/{ => hax}/hax-i386.h (95%)
 rename target/i386/{ => hax}/hax-interface.h (100%)
 rename target/i386/{ => hax}/hax-posix.h (100%)
 rename target/i386/{ => hax}/hax-windows.h (100%)
 rename target/i386/{ => hax}/hax-all.c (100%)
 rename target/i386/{ => hax}/hax-cpus.c (100%)
 rename target/i386/{ => hax}/hax-mem.c (100%)
 rename target/i386/{ => hax}/hax-posix.c (100%)
 rename target/i386/{ => hax}/hax-windows.c (100%)
 create mode 100644 target/i386/hax/meson.build

diff --git a/target/i386/hax-cpus.h b/target/i386/hax/hax-cpus.h
similarity index 100%
rename from target/i386/hax-cpus.h
rename to target/i386/hax/hax-cpus.h
diff --git a/target/i386/hax-i386.h b/target/i386/hax/hax-i386.h
similarity index 95%
rename from target/i386/hax-i386.h
rename to target/i386/hax/hax-i386.h
index 48c4abe14e..efbb346238 100644
--- a/target/i386/hax-i386.h
+++ b/target/i386/hax/hax-i386.h
@@ -84,13 +84,13 @@ void hax_memory_init(void);
 
 
 #ifdef CONFIG_POSIX
-#include "target/i386/hax-posix.h"
+#include "hax-posix.h"
 #endif
 
 #ifdef CONFIG_WIN32
-#include "target/i386/hax-windows.h"
+#include "hax-windows.h"
 #endif
 
-#include "target/i386/hax-interface.h"
+#include "hax-interface.h"
 
 #endif
diff --git a/target/i386/hax-interface.h b/target/i386/hax/hax-interface.h
similarity index 100%
rename from target/i386/hax-interface.h
rename to target/i386/hax/hax-interface.h
diff --git a/target/i386/hax-posix.h b/target/i386/hax/hax-posix.h
similarity index 100%
rename from target/i386/hax-posix.h
rename to target/i386/hax/hax-posix.h
diff --git a/target/i386/hax-windows.h b/target/i386/hax/hax-windows.h
similarity index 100%
rename from target/i386/hax-windows.h
rename to target/i386/hax/hax-windows.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 6f29b37834..e03615d76c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -492,7 +492,7 @@ W: https://github.com/intel/haxm/issues
 S: Maintained
 F: accel/stubs/hax-stub.c
 F: include/sysemu/hax.h
-F: target/i386/hax-*
+F: target/i386/hax/
 
 Hosts
 -----
diff --git a/target/i386/hax-all.c b/target/i386/hax/hax-all.c
similarity index 100%
rename from target/i386/hax-all.c
rename to target/i386/hax/hax-all.c
diff --git a/target/i386/hax-cpus.c b/target/i386/hax/hax-cpus.c
similarity index 100%
rename from target/i386/hax-cpus.c
rename to target/i386/hax/hax-cpus.c
diff --git a/target/i386/hax-mem.c b/target/i386/hax/hax-mem.c
similarity index 100%
rename from target/i386/hax-mem.c
rename to target/i386/hax/hax-mem.c
diff --git a/target/i386/hax-posix.c b/target/i386/hax/hax-posix.c
similarity index 100%
rename from target/i386/hax-posix.c
rename to target/i386/hax/hax-posix.c
diff --git a/target/i386/hax-windows.c b/target/i386/hax/hax-windows.c
similarity index 100%
rename from target/i386/hax-windows.c
rename to target/i386/hax/hax-windows.c
diff --git a/target/i386/hax/meson.build b/target/i386/hax/meson.build
new file mode 100644
index 0000000000..77ea431b30
--- /dev/null
+++ b/target/i386/hax/meson.build
@@ -0,0 +1,7 @@
+i386_softmmu_ss.add(when: 'CONFIG_HAX', if_true: files(
+  'hax-all.c',
+  'hax-mem.c',
+  'hax-cpus.c',
+))
+i386_softmmu_ss.add(when: ['CONFIG_HAX', 'CONFIG_POSIX'], if_true: files('hax-posix.c'))
+i386_softmmu_ss.add(when: ['CONFIG_HAX', 'CONFIG_WIN32'], if_true: files('hax-windows.c'))
diff --git a/target/i386/meson.build b/target/i386/meson.build
index 62cd042915..284d52ab81 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -27,15 +27,9 @@ i386_softmmu_ss.add(files(
   'machine.c',
   'monitor.c',
 ))
-i386_softmmu_ss.add(when: 'CONFIG_HAX', if_true: files(
-  'hax-all.c',
-  'hax-mem.c',
-  'hax-cpus.c',
-))
-i386_softmmu_ss.add(when: ['CONFIG_HAX', 'CONFIG_POSIX'], if_true: files('hax-posix.c'))
-i386_softmmu_ss.add(when: ['CONFIG_HAX', 'CONFIG_WIN32'], if_true: files('hax-windows.c'))
 
 subdir('kvm')
+subdir('hax')
 subdir('whpx')
 subdir('hvf')
 
-- 
2.28.0


