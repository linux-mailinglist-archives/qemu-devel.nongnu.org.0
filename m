Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7739528B479
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 14:18:46 +0200 (CEST)
Received: from localhost ([::1]:47294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRwmr-0005Dj-Hg
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 08:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRwk2-0003x7-L6
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 08:15:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRwk0-0004NX-4r
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 08:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602504947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VljrrgYZ6yThKHfd9uj04aHsD9sMK+domcRaiReXGvI=;
 b=gZsihNLKc3zL4SsAFEHlPJUIKolIqrb/s799lJjEzmEPKEP0/6AHyi1o0e2iZQSHPOAphL
 I6sa7/1brmlfmMmmsOoWftMD2zsPIkCyeiSohNikc7uxg/+gRRp/kwNpUON/ZqwUoPd7QU
 Iv9vF0DNSiTKlh9tL/+HnWJNvpqJROQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-NrKZw5yqPjyasMnlCh1MhQ-1; Mon, 12 Oct 2020 08:15:45 -0400
X-MC-Unique: NrKZw5yqPjyasMnlCh1MhQ-1
Received: by mail-wr1-f69.google.com with SMTP id q15so396512wrw.8
 for <qemu-devel@nongnu.org>; Mon, 12 Oct 2020 05:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VljrrgYZ6yThKHfd9uj04aHsD9sMK+domcRaiReXGvI=;
 b=Y1AcHeyuFufQQXztv+nUeVKW4G5GEHOXAjm/toZLezEkMPctjpyEvjD59gcnruM5eW
 4xU4QPD6eBTxD/JNwkL0kzDWCn9hxfHxnC838TxHUetz7KvH8HoZzjDljVtAM+zAT45Y
 zvtH6AkzioTDITD+yBQegD7lm74qwbB5tJmLXSlg1xSLSJWpqLcrQBmhGWu99DxwylOE
 2NL7dJYqVsCnPr+y2vzTidcYEe0O5fRX/IFgm/b/wIMrtWMfURN5mKXyA8XKR6I/mRHM
 4JNj6z0gcolveFuPee5HTM6Ej9Bp4Dr1yzo3faj0DzqbI/Rkdco4k/amVkoapSX5uAXF
 6ouA==
X-Gm-Message-State: AOAM5335Gz+cxFGQ6Wa2PG3bel+laTOCwNfmutzPLxYqilKcF6I7R7Wm
 0VN692NMg5a96Ku3MCEl7Y6dpTgnmEv3u1UZNKURC++8EsFKclG5LfhAaipjnrPiR76j7CFZsVg
 F4+Tbgm1tqXe3p2w=
X-Received: by 2002:a1c:8106:: with SMTP id c6mr10246652wmd.115.1602504943467; 
 Mon, 12 Oct 2020 05:15:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzh3ZneB/UaUdSoyR60V43L1kyczsgzSaFKhjYzwTNzI2F3Pio1H9f6yUbIk64TiICjXP1PeA==
X-Received: by 2002:a1c:8106:: with SMTP id c6mr10246635wmd.115.1602504943284; 
 Mon, 12 Oct 2020 05:15:43 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id h3sm20166066wrw.78.2020.10.12.05.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 05:15:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v2 1/5] qapi: Restrict 'inject-nmi' command to machine code
Date: Mon, 12 Oct 2020 14:15:32 +0200
Message-Id: <20201012121536.3381997-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012121536.3381997-1-philmd@redhat.com>
References: <20201012121536.3381997-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 23:52:29
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restricting 'inject-nmi' to machine.json pulls slightly
less QAPI-generated code into user-mode and tools.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/machine.json | 20 ++++++++++++++++++++
 qapi/misc.json    | 20 --------------------
 softmmu/cpus.c    |  1 +
 3 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 756dacb06fd..073b1c98b26 100644
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
index 7d1e2e9aaef..3fe9cc21b4b 100644
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
index 47cceddd805..e46ac68ad09 100644
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


