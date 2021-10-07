Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C7D4257F6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:28:00 +0200 (CEST)
Received: from localhost ([::1]:35702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWFT-000613-Ow
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW6G-00054t-0U
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW6E-0005IK-9M
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NtntxYjzk/c/tBnUjs6wx6H836yPN9/32v9yVgz+JmI=;
 b=QQU6WV8iv3GO9mFbzedap0hOlQCiI4Yy8UMD88eyjc4u2mwfzns3mM4/0Vhj6Wo89MC3vD
 035HsxLBtWHpolxQQ3AHnDJ0nHm34dugNiLMh4o4OweEWxucYLCxjloCAmR5V0wPXtdcUe
 bn/qI4WQzDO8IYdLOXRW47sdben12lc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-gvXUHGMJOrq4GJ1WReP7oA-1; Thu, 07 Oct 2021 12:18:24 -0400
X-MC-Unique: gvXUHGMJOrq4GJ1WReP7oA-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso5130891wrc.2
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NtntxYjzk/c/tBnUjs6wx6H836yPN9/32v9yVgz+JmI=;
 b=Hh/0CrBU3lUYck5qPzzeHTBRk+iwtTsr+zgfqX2mgQqR9UqWdg8nHWavCVpWIaXdcM
 NV7s5zoLt/VwOIB7hHU2+pC0YBNWMpMwvqo0i/1fvHb3UQJHASiRRC4/bZMYBHDoUSVN
 MyAbUrnBRx6ffcUwyvs+N87d2VFy2sZL3GcQUTHRumJ1H/qVTdk95DQqoY5ErdwlypLz
 Og6TAqap8oYEOtFC+r0YSkHxNamGKlDnLjPloon3PTR3WvA2rz4nLj3BOA7xZCPA9Tfe
 DqrOVO24Nly1jrFW8QRG1SAfggn+fn6AJnsOO1K8ID55sEdm60xKlzyHzgrcmc/7HQek
 EIsg==
X-Gm-Message-State: AOAM5310CNSINdeRvbGXRVlJrfIAN3lAS0N5flBgrjjWulCydxd1SftQ
 zplNM+fm3FrpItFfBzT4HqSeydC51wPnZDebqDJwd1fL5GM3JAZUwu96GBMt3moqWFXHzQttG4c
 fIH1mHNIBMeaUJPWk5AXDgP9dgN2+42r6i/vjbQPommImXtl5hdCFaX9ZKy4YtIar
X-Received: by 2002:a05:600c:2057:: with SMTP id
 p23mr5628916wmg.67.1633623502879; 
 Thu, 07 Oct 2021 09:18:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbpkjWZoIcEo8CCNOMP08Kf3tAZlemKrKuxafvy6AWFRjok6953SFiC/moJkDRbEWcDARxSQ==
X-Received: by 2002:a05:600c:2057:: with SMTP id
 p23mr5628876wmg.67.1633623502591; 
 Thu, 07 Oct 2021 09:18:22 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id v10sm93782wri.29.2021.10.07.09.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:18:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/23] target/i386/sev: Rename sev_i386.h -> sev.h
Date: Thu,  7 Oct 2021 18:17:07 +0200
Message-Id: <20211007161716.453984-15-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007161716.453984-1-philmd@redhat.com>
References: <20211007161716.453984-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SEV is a x86 specific feature, and the "sev_i386.h" header
is already in target/i386/. Rename it as "sev.h" to simplify.

Patch created mechanically using:

  $ git mv target/i386/sev_i386.h target/i386/sev.h
  $ sed -i s/sev_i386.h/sev.h/ $(git grep -l sev_i386.h)

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/{sev_i386.h => sev.h} | 0
 hw/i386/x86.c                     | 2 +-
 target/i386/cpu.c                 | 2 +-
 target/i386/kvm/kvm.c             | 2 +-
 target/i386/monitor.c             | 2 +-
 target/i386/sev-stub.c            | 2 +-
 target/i386/sev-sysemu-stub.c     | 2 +-
 target/i386/sev.c                 | 2 +-
 8 files changed, 7 insertions(+), 7 deletions(-)
 rename target/i386/{sev_i386.h => sev.h} (100%)

diff --git a/target/i386/sev_i386.h b/target/i386/sev.h
similarity index 100%
rename from target/i386/sev_i386.h
rename to target/i386/sev.h
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 0c7c054e3a0..76de7e2265e 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -47,7 +47,7 @@
 #include "hw/i386/fw_cfg.h"
 #include "hw/intc/i8259.h"
 #include "hw/rtc/mc146818rtc.h"
-#include "target/i386/sev_i386.h"
+#include "target/i386/sev.h"
 
 #include "hw/acpi/cpu_hotplug.h"
 #include "hw/irq.h"
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b54b98551e9..8289dc87bd5 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -26,7 +26,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/hvf.h"
 #include "kvm/kvm_i386.h"
-#include "sev_i386.h"
+#include "sev.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-machine.h"
 #include "qapi/qmp/qerror.h"
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index f25837f63f4..a5f6ff63c81 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -28,7 +28,7 @@
 #include "sysemu/kvm_int.h"
 #include "sysemu/runstate.h"
 #include "kvm_i386.h"
-#include "sev_i386.h"
+#include "sev.h"
 #include "hyperv.h"
 #include "hyperv-proto.h"
 
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index ea836678f51..109e4e61c0a 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -32,7 +32,7 @@
 #include "sysemu/kvm.h"
 #include "sysemu/sev.h"
 #include "qapi/error.h"
-#include "sev_i386.h"
+#include "sev.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qapi-commands-misc.h"
 #include "hw/i386/pc.h"
diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index 170e9f50fee..7e8b6f9a259 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -13,7 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "sev_i386.h"
+#include "sev.h"
 
 bool sev_enabled(void)
 {
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
index d556b4f091f..8082781febf 100644
--- a/target/i386/sev-sysemu-stub.c
+++ b/target/i386/sev-sysemu-stub.c
@@ -14,7 +14,7 @@
 #include "qemu/osdep.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/error.h"
-#include "sev_i386.h"
+#include "sev.h"
 
 SevInfo *sev_get_info(void)
 {
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 5cbbcf0bb93..e43bbf3a17d 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -25,7 +25,7 @@
 #include "qemu/uuid.h"
 #include "crypto/hash.h"
 #include "sysemu/kvm.h"
-#include "sev_i386.h"
+#include "sev.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
 #include "trace.h"
-- 
2.31.1


