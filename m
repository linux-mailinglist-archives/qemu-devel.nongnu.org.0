Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66670276DF1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 11:53:55 +0200 (CEST)
Received: from localhost ([::1]:46078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLNwo-0000TF-FF
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 05:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNU0-0001cc-DE
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:24:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNTx-00068B-KZ
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:24:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600939444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mxyU2UsYIapLWeI/m9pnErkY5BZXXfsVIe9axCDHUxk=;
 b=b696snEzJJZuHXOB6m4MK9dt9bxXQa8tUe6bqRqL/m3xLAQXk9D9xYF8fPw/5WWu7AQEoN
 EvJfL5cQjq3lUbOc84QX8Ep0iY+Xi+n2ZYnjco9xJpu66Q7j2o0Xa9aaXZmK6fD2WuAuxh
 BW1MLeR5qPczyAf+5jEe+gUgDJ0hC8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-ubHXz8zSPzqVS_2AJf7cqQ-1; Thu, 24 Sep 2020 05:24:03 -0400
X-MC-Unique: ubHXz8zSPzqVS_2AJf7cqQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A7021007471;
 Thu, 24 Sep 2020 09:24:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC23C5C1DC;
 Thu, 24 Sep 2020 09:24:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 58/92] tests/tcg: reinstate or replace desired parts of
 rules.mak
Date: Thu, 24 Sep 2020 05:22:40 -0400
Message-Id: <20200924092314.1722645-59-pbonzini@redhat.com>
In-Reply-To: <20200924092314.1722645-1-pbonzini@redhat.com>
References: <20200924092314.1722645-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 660f79309303d696531ffb394719dfab3e0c42c0 was a bit overzealous
with respect to tests/tcg, which needed quiet-command and $(BUILD_DIR).
Reinstate quiet-command, and replace $(BUILD_DIR) with just the
current directory.

Reported-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/Makefile.qemu | 13 ++++++++++++-
 tests/tcg/configure.sh  |  4 ++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/tests/tcg/Makefile.qemu b/tests/tcg/Makefile.qemu
index 0332bad10f..c096c611a2 100644
--- a/tests/tcg/Makefile.qemu
+++ b/tests/tcg/Makefile.qemu
@@ -11,9 +11,20 @@
 # The configure script fills in extra information about
 # useful docker images or alternative compiler flags.
 
+# Usage: $(call quiet-command,command and args,"NAME","args to print")
+# This will run "command and args", and either:
+#  if V=1 just print the whole command and args
+#  otherwise print the 'quiet' output in the format "  NAME     args to print"
+# NAME should be a short name of the command, 7 letters or fewer.
+# If called with only a single argument, will print nothing in quiet mode.
+quiet-command-run = $(if $(V),,$(if $2,printf "  %-7s %s\n" $2 $3 && ))$1
+quiet-@ = $(if $(V),,@)
+quiet-command = $(quiet-@)$(call quiet-command-run,$1,$2,$3)
+
 CROSS_CC_GUEST:=
 DOCKER_IMAGE:=
--include $(BUILD_DIR)/tests/tcg/config-$(TARGET).mak
+
+-include tests/tcg/config-$(TARGET).mak
 
 GUEST_BUILD=
 TCG_MAKE=../Makefile.target
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 598a50cd4f..be51bdb5a4 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -193,11 +193,11 @@ for target in $target_list; do
   case $target in
     *-linux-user | *-bsd-user)
       echo "CONFIG_USER_ONLY=y" >> $config_target_mak
-      echo "QEMU=\$(BUILD_DIR)/qemu-$arch" >> $config_target_mak
+      echo "QEMU=$PWD/qemu-$arch" >> $config_target_mak
       ;;
     *-softmmu)
       echo "CONFIG_SOFTMMU=y" >> $config_target_mak
-      echo "QEMU=\$(BUILD_DIR)/qemu-system-$arch" >> $config_target_mak
+      echo "QEMU=$PWD/qemu-system-$arch" >> $config_target_mak
       ;;
   esac
 
-- 
2.26.2



