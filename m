Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3CF2971F2
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 17:08:45 +0200 (CEST)
Received: from localhost ([::1]:36422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVygO-0002yO-5Z
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 11:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kVydA-0001Pw-Q2
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 11:05:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kVyd7-0006jw-A3
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 11:05:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603465520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z+WGKzV4+Sbs0xEq//8HOafTBRVoRyzD1+CnlO6EdlM=;
 b=FPSYcw2gHZuKWxQrkd/47h4YQdyQ3/CaQU1ZISxf/W+uSAP7TuzDMxSsT3u8mJ0Jlxk5Vn
 dT+f3FKrWyn+Lk0/LanQ0sKijvLrQ17qpNJb4AnQo7muV81DcqBVL3rVV4l1d9CENqUNVh
 3ohSarKBBHsHHG7iFNoVsEGbIJcZGmA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-7O3ttrJLO9iUwgxwbv1VvQ-1; Fri, 23 Oct 2020 11:05:17 -0400
X-MC-Unique: 7O3ttrJLO9iUwgxwbv1VvQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 438A780BCA3;
 Fri, 23 Oct 2020 15:05:16 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D294F5B4AC;
 Fri, 23 Oct 2020 15:05:15 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Makefile: separate meson rerun from the rest of the ninja
 invocation
Date: Fri, 23 Oct 2020 11:05:14 -0400
Message-Id: <20201023150514.2734046-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 01:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Havard Skinnemoen <hskinnemoen@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The rules to build Makefile.mtest are suffering from the "tunnel vision"
problem that is common with recursive makefiles.  Makefile.mtest depends
on build.ninja, but Make does not know when build.ninja needs to be
rebuilt before creating Makefile.mtest.

To fix this, separate the ninja invocation into the "regenerate build
files" phase and the QEMU build phase.  Sentinel files such as
meson-private/coredata.dat or build.ninja are used to figure out the
phases that haven't run yet; however, because those files' timestamps
are not guaranteed to be touched, the usual makefile stamp-file trick
is used on top.

Reported-by: Havard Skinnemoen <hskinnemoen@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 42 +++++++++++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index 18f026eac3..007ad4d863 100644
--- a/Makefile
+++ b/Makefile
@@ -92,6 +92,8 @@ endif
 ifeq ($(NINJA),)
 .PHONY: config-host.mak
 x := $(shell rm -rf meson-private meson-info meson-logs)
+else
+export NINJA
 endif
 ifeq ($(wildcard build.ninja),)
 .PHONY: config-host.mak
@@ -100,31 +102,46 @@ endif
 
 # 1. ensure config-host.mak is up-to-date
 config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/pc-bios $(SRC_PATH)/VERSION
-	@echo $@ is out-of-date, running configure
+	@echo config-host.mak is out-of-date, running configure
 	@if test -f meson-private/coredata.dat; then \
 	  ./config.status --skip-meson; \
 	else \
-	  ./config.status; \
+	  ./config.status && touch build.ninja.stamp; \
 	fi
 
-# 2. ensure generated build files are up-to-date
+# 2. meson.stamp exists if meson has run at least once (so ninja reconfigure
+# works), but otherwise never needs to be updated
+meson-private/coredata.dat: meson.stamp
+meson.stamp: config-host.mak
+	@touch meson.stamp
+
+# 3. ensure generated build files are up-to-date
 
-ifneq ($(NINJA),)
 # A separate rule is needed for Makefile dependencies to avoid -n
-export NINJA
+ifneq ($(MESON),)
+build.ninja: build.ninja.stamp
+build.ninja.stamp: meson.stamp
+	$(NINJA) $(if $V,-v,) reconfigure && touch $@
+endif
+
+ifneq ($(NINJA),)
 Makefile.ninja: build.ninja
-	$(quiet-@){ echo 'ninja-targets = \'; $(NINJA) -t targets all | sed 's/:.*//; $$!s/$$/ \\/'; } > $@
+	$(quiet-@){ \
+	  echo 'ninja-targets = \'; \
+	  $(NINJA) -t targets all | sed 's/:.*//; $$!s/$$/ \\/'; \
+	  echo 'build-files = \'; \
+	  $(NINJA) -t query build.ninja | sed -n '1,/^  input:/d; /^  outputs:/q; s/$$/ \\/p'; \
+	} > $@.tmp && mv $@.tmp $@
 -include Makefile.ninja
 endif
 
 ifneq ($(MESON),)
-# The dependency on config-host.mak ensures that meson has run
-Makefile.mtest: build.ninja scripts/mtest2make.py config-host.mak
+Makefile.mtest: build.ninja scripts/mtest2make.py
 	$(MESON) introspect --targets --tests --benchmarks | $(PYTHON) scripts/mtest2make.py > $@
 -include Makefile.mtest
 endif
 
-# 3. Rules to bridge to other makefiles
+# 4. Rules to bridge to other makefiles
 
 ifneq ($(NINJA),)
 NINJAFLAGS = $(if $V,-v,) \
@@ -135,7 +152,10 @@ ninja-cmd-goals = $(or $(MAKECMDGOALS), all)
 ninja-cmd-goals += $(foreach t, $(.tests), $(.test.deps.$t))
 
 makefile-targets := build.ninja ctags TAGS cscope dist clean uninstall
-ninja-targets := $(filter-out $(makefile-targets), $(ninja-targets))
+# "ninja -t targets" also lists all prerequisites.  If build system
+# files are marked as PHONY, however, Make will always try to execute
+# "ninja reconfigure" to rebuild build.ninja.
+ninja-targets := $(filter-out $(build-files) $(makefile-targets), $(ninja-targets))
 .PHONY: $(ninja-targets) run-ninja
 $(ninja-targets): run-ninja
 
@@ -214,7 +234,7 @@ distclean: clean
 	rm -f qemu-plugins-ld.symbols qemu-plugins-ld64.symbols
 	rm -f *-config-target.h *-config-devices.mak *-config-devices.h
 	rm -rf meson-private meson-logs meson-info compile_commands.json
-	rm -f Makefile.ninja Makefile.mtest
+	rm -f Makefile.ninja Makefile.mtest build.ninja.stamp meson.stamp
 	rm -f config.log
 	rm -f linux-headers/asm
 	rm -Rf .sdk
-- 
2.26.2


