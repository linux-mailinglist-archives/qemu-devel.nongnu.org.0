Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1462DD8BE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 19:53:59 +0100 (CET)
Received: from localhost ([::1]:50044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpyPW-0005yj-J5
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 13:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpyIL-0006Gf-9w
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:46:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpyIJ-0001wh-Eu
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:46:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608230790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sejUtraOyoKT+WaQuyu0RHJYyz12mZnGIlTA6njMqf4=;
 b=jHeZNsjYPuBG1FaizRTAyZbGcv4Q26K3Jutwy474TsEgXptm0Do48d4HNTQXGJajz0gECX
 iMcCvE7qRXlgsQli4QUctij9tQbmwwLNZBpDbtT0o5w0vrWqnNekVLevlLv4Bx4JOSxTNe
 kYv2DC++M88InprHBsNatF+iHShiS14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-vYEJ6mi6OQCHaen7MulWdQ-1; Thu, 17 Dec 2020 13:46:26 -0500
X-MC-Unique: vYEJ6mi6OQCHaen7MulWdQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB7B6192CC40;
 Thu, 17 Dec 2020 18:46:24 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EBA21B473;
 Thu, 17 Dec 2020 18:46:24 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 02/17] i386: move whpx accel files into whpx/
Date: Thu, 17 Dec 2020 13:46:05 -0500
Message-Id: <20201217184620.3945917-3-ehabkost@redhat.com>
In-Reply-To: <20201217184620.3945917-1-ehabkost@redhat.com>
References: <20201217184620.3945917-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Message-Id: <20201212155530.23098-3-cfontana@suse.de>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/{ => whpx}/whp-dispatch.h | 0
 target/i386/{ => whpx}/whpx-cpus.h    | 0
 MAINTAINERS                           | 6 +-----
 target/i386/meson.build               | 6 +-----
 target/i386/whpx/meson.build          | 5 +++++
 target/i386/{ => whpx}/whpx-all.c     | 0
 target/i386/{ => whpx}/whpx-apic.c    | 0
 target/i386/{ => whpx}/whpx-cpus.c    | 0
 8 files changed, 7 insertions(+), 10 deletions(-)
 rename target/i386/{ => whpx}/whp-dispatch.h (100%)
 rename target/i386/{ => whpx}/whpx-cpus.h (100%)
 create mode 100644 target/i386/whpx/meson.build
 rename target/i386/{ => whpx}/whpx-all.c (100%)
 rename target/i386/{ => whpx}/whpx-apic.c (100%)
 rename target/i386/{ => whpx}/whpx-cpus.c (100%)

diff --git a/target/i386/whp-dispatch.h b/target/i386/whpx/whp-dispatch.h
similarity index 100%
rename from target/i386/whp-dispatch.h
rename to target/i386/whpx/whp-dispatch.h
diff --git a/target/i386/whpx-cpus.h b/target/i386/whpx/whpx-cpus.h
similarity index 100%
rename from target/i386/whpx-cpus.h
rename to target/i386/whpx/whpx-cpus.h
diff --git a/MAINTAINERS b/MAINTAINERS
index a77553833a..6f29b37834 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -452,11 +452,7 @@ F: include/sysemu/hvf.h
 WHPX CPUs
 M: Sunil Muthuswamy <sunilmut@microsoft.com>
 S: Supported
-F: target/i386/whpx-all.c
-F: target/i386/whpx-apic.c
-F: target/i386/whpx-cpus.c
-F: target/i386/whp-dispatch.h
-F: accel/stubs/whpx-stub.c
+F: target/i386/whpx/
 F: include/sysemu/whpx.h
 
 Guest CPU Cores (Xen)
diff --git a/target/i386/meson.build b/target/i386/meson.build
index 5363757131..62cd042915 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -27,11 +27,6 @@ i386_softmmu_ss.add(files(
   'machine.c',
   'monitor.c',
 ))
-i386_softmmu_ss.add(when: 'CONFIG_WHPX', if_true: files(
-  'whpx-all.c',
-  'whpx-cpus.c',
-  'whpx-apic.c',
-))
 i386_softmmu_ss.add(when: 'CONFIG_HAX', if_true: files(
   'hax-all.c',
   'hax-mem.c',
@@ -41,6 +36,7 @@ i386_softmmu_ss.add(when: ['CONFIG_HAX', 'CONFIG_POSIX'], if_true: files('hax-po
 i386_softmmu_ss.add(when: ['CONFIG_HAX', 'CONFIG_WIN32'], if_true: files('hax-windows.c'))
 
 subdir('kvm')
+subdir('whpx')
 subdir('hvf')
 
 target_arch += {'i386': i386_ss}
diff --git a/target/i386/whpx/meson.build b/target/i386/whpx/meson.build
new file mode 100644
index 0000000000..d8aa683999
--- /dev/null
+++ b/target/i386/whpx/meson.build
@@ -0,0 +1,5 @@
+i386_softmmu_ss.add(when: 'CONFIG_WHPX', if_true: files(
+  'whpx-all.c',
+  'whpx-apic.c',
+  'whpx-cpus.c',
+))
diff --git a/target/i386/whpx-all.c b/target/i386/whpx/whpx-all.c
similarity index 100%
rename from target/i386/whpx-all.c
rename to target/i386/whpx/whpx-all.c
diff --git a/target/i386/whpx-apic.c b/target/i386/whpx/whpx-apic.c
similarity index 100%
rename from target/i386/whpx-apic.c
rename to target/i386/whpx/whpx-apic.c
diff --git a/target/i386/whpx-cpus.c b/target/i386/whpx/whpx-cpus.c
similarity index 100%
rename from target/i386/whpx-cpus.c
rename to target/i386/whpx/whpx-cpus.c
-- 
2.28.0


