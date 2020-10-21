Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3432946FD
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 05:34:54 +0200 (CEST)
Received: from localhost ([::1]:50906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kV4tp-0005p8-5v
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 23:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kV4s4-0004Gn-Ql
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 23:33:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kV4s3-0001Y7-4r
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 23:33:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603251182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uni1qvjGHMaANTbnZtIIi8Nfns0CbkGHuXPIotwgEcs=;
 b=MFfLAxTDHgD4Lka6ZWlJCNqIdhs8cN1lhfVvkZTo64h/ClpA/Ijn/iKuejbw07qTh4Npid
 0hT2NQriZ84WkUyMfBS245FXyoy60AuknK1laa+qCaoVXIZXoznE39FtndV2X6exMvMu6N
 zkH/jVkYmN1joke6b+6/Jt5CQKsmowc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-ewZOdjprNUK5kRiL189ypw-1; Tue, 20 Oct 2020 23:33:00 -0400
X-MC-Unique: ewZOdjprNUK5kRiL189ypw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15A981006C91;
 Wed, 21 Oct 2020 03:32:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D781A5C1C7;
 Wed, 21 Oct 2020 03:32:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 782BC11329AD; Wed, 21 Oct 2020 05:32:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] qapi: Restrict 'inject-nmi' command to machine code
Date: Wed, 21 Oct 2020 05:32:53 +0200
Message-Id: <20201021033257.2126624-2-armbru@redhat.com>
In-Reply-To: <20201021033257.2126624-1-armbru@redhat.com>
References: <20201021033257.2126624-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 22:40:15
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Restricting 'inject-nmi' to machine.json pulls slightly
less QAPI-generated code into user-mode and tools.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201012121536.3381997-2-philmd@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/machine.json | 20 ++++++++++++++++++++
 qapi/misc.json    | 20 --------------------
 softmmu/cpus.c    |  1 +
 3 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 756dacb06f..073b1c98b2 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -484,6 +484,26 @@
 { 'enum': 'LostTickPolicy',
   'data': ['discard', 'delay', 'slew' ] }
 
+##
+# @inject-nmi:
+#
+# Injects a Non-Maskable Interrupt into the default CPU (x86/s390) or all CPUs (ppc64).
+# The command fails when the guest doesn't support injecting.
+#
+# Returns:  If successful, nothing
+#
+# Since:  0.14.0
+#
+# Note: prior to 2.1, this command was only supported for x86 and s390 VMs
+#
+# Example:
+#
+# -> { "execute": "inject-nmi" }
+# <- { "return": {} }
+#
+##
+{ 'command': 'inject-nmi' }
+
 ##
 # @NumaOptionsType:
 #
diff --git a/qapi/misc.json b/qapi/misc.json
index 7d1e2e9aae..3fe9cc21b4 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -341,26 +341,6 @@
 ##
 { 'command': 'system_wakeup' }
 
-##
-# @inject-nmi:
-#
-# Injects a Non-Maskable Interrupt into the default CPU (x86/s390) or all CPUs (ppc64).
-# The command fails when the guest doesn't support injecting.
-#
-# Returns:  If successful, nothing
-#
-# Since:  0.14.0
-#
-# Note: prior to 2.1, this command was only supported for x86 and s390 VMs
-#
-# Example:
-#
-# -> { "execute": "inject-nmi" }
-# <- { "return": {} }
-#
-##
-{ 'command': 'inject-nmi' }
-
 ##
 # @human-monitor-command:
 #
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 47cceddd80..e46ac68ad0 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -26,6 +26,7 @@
 #include "qemu-common.h"
 #include "monitor/monitor.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-events-run-state.h"
 #include "qapi/qmp/qerror.h"
-- 
2.26.2


