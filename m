Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC2C31BA2B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:20:12 +0100 (CET)
Received: from localhost ([::1]:53210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdnP-0007An-Ls
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:20:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjs-0005Pk-Qj
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:32 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:36816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjq-0005TE-Mz
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:32 -0500
Received: by mail-ed1-x52b.google.com with SMTP id l12so7986452edt.3
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FR1nDuMgguk9xv0/pf+gg1LCjCOE4sCVlVest7n7PBs=;
 b=p0uspELXrlmv8YdI/bwQQD66KrcRZKFoHrgVSah6ZBu/XbJDZ83PDU8wjjV0BSFM9y
 Rwdv7OMsvsV8OhDG2cimKM5ckApJ3qzdzJPbd6XjNwgH/oHXKlgUEIIpzPrB3VH2QCq5
 N5V8E1OgwWxwWXgqpd5UrJ6xedTO+GwFbyXzLcnlqFf9nbc6Vttq5ju+ajS8sCed7Ri5
 Fo9Stx9irV0XjntGTjZhRYFboVlUc1jeHUGzvwohC7T8p+gQ+cidSXSfXpdghhzwnZDa
 oymDegBuvvNM9EC1s3MQh/5fR+wr0nrUQLFBTF9ubGCZlr0T2iv1oTTMJderXYfqI/7B
 tLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FR1nDuMgguk9xv0/pf+gg1LCjCOE4sCVlVest7n7PBs=;
 b=R5uzdqhp3sL1CCfQsqFkmhMBXPw1+Nhy/j3b65EpjYXp0Z/9WnTeGIB2N6r9nkPIZG
 NbcEgsE/LZNlIzHigIKjzovH5DvGf9eb7/j5ZJVq1gRHgilnH06nXkD8TQGaVACkLYec
 XOKITN/7Px9XNGpBRn3TAxjFJ/e6f5z6d7gLH/Kz9iRL3uwRjJhcbxDXxYs6Sh3i/iCT
 rgeF3YkGcLPXkHrQa/JftOQ6SjbP5Wi+0XEeBk2JbTCRBIbrjpGgVzlvGaAN08xAEkbe
 t+atIhMSAvxpvw5vBKo6wDAtcw6Wa/NoI7fg/4kLtQ+o8mcX20QOcF2Xd6DAT87zz+gj
 4jXg==
X-Gm-Message-State: AOAM533fMC1udFFXphQ7zbk/QQEckF9RIw4RUifFTsCmWU8S4j5X/68I
 B4MErDpMlbEYhDRmSu+rTM3NtahedDk=
X-Google-Smtp-Source: ABdhPJxweENtI/b8T4Z9RPwK12VyNaY6DBrdQK48BuoW+LVqG6eD6YKa1T86tVbjDC7y/7l0Hridwg==
X-Received: by 2002:a05:6402:270d:: with SMTP id
 y13mr15499138edd.149.1613394989240; 
 Mon, 15 Feb 2021 05:16:29 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o4sm9950184edw.78.2021.02.15.05.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 05:16:28 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/19] sev: update sev-inject-launch-secret to make gpa optional
Date: Mon, 15 Feb 2021 14:16:09 +0100
Message-Id: <20210215131626.65640-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215131626.65640-1-pbonzini@redhat.com>
References: <20210215131626.65640-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: James Bottomley <jejb@linux.ibm.com>

If the gpa isn't specified, it's value is extracted from the OVMF
properties table located below the reset vector (and if this doesn't
exist, an error is returned).  OVMF has defined the GUID for the SEV
secret area as 4c2eb361-7d9b-4cc3-8081-127c90d3d294 and the format of
the <data> is: <base>|<size> where both are uint32_t.  We extract
<base> and use it as the gpa for the injection.

Note: it is expected that the injected secret will also be GUID
described but since qemu can't interpret it, the format is left
undefined here.

Signed-off-by: James Bottomley <jejb@linux.ibm.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20210204193939.16617-3-jejb@linux.ibm.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/misc-target.json |  2 +-
 target/i386/monitor.c | 23 ++++++++++++++++++++++-
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 06ef8757f0..0c7491cd82 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -216,7 +216,7 @@
 #
 ##
 { 'command': 'sev-inject-launch-secret',
-  'data': { 'packet-header': 'str', 'secret': 'str', 'gpa': 'uint64' },
+  'data': { 'packet-header': 'str', 'secret': 'str', '*gpa': 'uint64' },
   'if': 'defined(TARGET_I386)' }
 
 ##
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 1bc91442b1..5994408bee 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -34,6 +34,7 @@
 #include "sev_i386.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qapi-commands-misc.h"
+#include "hw/i386/pc.h"
 
 /* Perform linear address sign extension */
 static hwaddr addr_canonical(CPUArchState *env, hwaddr addr)
@@ -730,9 +731,29 @@ SevCapability *qmp_query_sev_capabilities(Error **errp)
     return sev_get_capabilities(errp);
 }
 
+#define SEV_SECRET_GUID "4c2eb361-7d9b-4cc3-8081-127c90d3d294"
+struct sev_secret_area {
+    uint32_t base;
+    uint32_t size;
+};
+
 void qmp_sev_inject_launch_secret(const char *packet_hdr,
-                                  const char *secret, uint64_t gpa,
+                                  const char *secret,
+                                  bool has_gpa, uint64_t gpa,
                                   Error **errp)
 {
+    if (!has_gpa) {
+        uint8_t *data;
+        struct sev_secret_area *area;
+
+        if (!pc_system_ovmf_table_find(SEV_SECRET_GUID, &data, NULL)) {
+            error_setg(errp, "SEV: no secret area found in OVMF,"
+                       " gpa must be specified.");
+            return;
+        }
+        area = (struct sev_secret_area *)data;
+        gpa = area->base;
+    }
+
     sev_inject_launch_secret(packet_hdr, secret, gpa, errp);
 }
-- 
2.29.2



