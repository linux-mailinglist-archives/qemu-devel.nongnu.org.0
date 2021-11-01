Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763FF442343
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:18:02 +0100 (CET)
Received: from localhost ([::1]:59144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhfcv-0000i8-IB
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUj-00072i-6J
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUh-0000c8-4p
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635804570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eb45pt+rx+z3d/QNqQ0ka/rPHoe06plBoXsL9wFgC3A=;
 b=XtbMSMGTQZvMco2cqRvB6sMNp2kXWpDgubhBSI/o3ct+u0hRuPelBE3jucBTFg1jjr/Why
 kLLoLyLGU6A1J7RIr1r7Aw5eUqFBllDRjog5qJtscdAYk0Pcq6YnQA8umpeYe5Vf8y85l5
 1KXLUFCxkvc4P7/ZD47YRfIPjKRP2l4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-4zV4UmhQP1Kv9h6m1v3EoQ-1; Mon, 01 Nov 2021 18:09:29 -0400
X-MC-Unique: 4zV4UmhQP1Kv9h6m1v3EoQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so5666205wrc.22
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 15:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eb45pt+rx+z3d/QNqQ0ka/rPHoe06plBoXsL9wFgC3A=;
 b=efzSGMi44O4O3bFvfgla/B6CiYBMguJiCeYTTGspR4k/XDHuoNvN/YkKqjJu3sJzib
 mVDIv1YSgS0w3Vhh+kRctRU1f5BFRaYI+rZTqn5VAsqQLwmQyObYMUnnarsoZBKbAblz
 mN+xkTJFaQEu/kFh9J8kdRDB1qIfS7Mproff0MQYzeq0kS3ItQiaH+DyypEGzWzrP/Bj
 B5bbYHa8bSo3nqmqISJ6s2XGav9tWEz0ApzlHWKOtIcDYrMcPJYW30qcM7L/lB/Atnw+
 y6YToGyrtEDNMH1/FBgpRGcPtpuoVi4kssRP3IzSZcZGImhqp11Z3XDXsBicGDfaI3he
 rkTw==
X-Gm-Message-State: AOAM530rM7WCWjLuPIF5weUgxitjfDMZ5X3vGPvY5C+KGE+sxMBqj0/l
 AfbA5Vd3EoxXeUXoIxRrjCCzOd6zp2cOr8IC/ObmZE91Y5DKf87RWMcKtgh7zloQC2CeUuNJkxT
 L2YHGBv6TaikIiXuBc3p1iCAWPy6HGe51SJA1vDKh9X40cgKjWjL7wwFIyoPWwiUSZH0=
X-Received: by 2002:adf:e387:: with SMTP id e7mr30508164wrm.412.1635804568032; 
 Mon, 01 Nov 2021 15:09:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTDcj674kEGI9dl471cqGKZI5Q3j6okD5bAskecUMcRegbtpEz5VGFYHzxKsv8krfzx5uJsg==
X-Received: by 2002:adf:e387:: with SMTP id e7mr30508114wrm.412.1635804567768; 
 Mon, 01 Nov 2021 15:09:27 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id o17sm685550wmq.11.2021.11.01.15.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:27 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/20] dump-guest-memory: Block live migration
Date: Mon,  1 Nov 2021 23:09:02 +0100
Message-Id: <20211101220912.10039-11-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101220912.10039-1-quintela@redhat.com>
References: <20211101220912.10039-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Both dump-guest-memory and live migration caches vm state at the beginning.
Either of them entering the other one will cause race on the vm state, and even
more severe on that (please refer to the crash report in the bug link).

Let's block live migration in dump-guest-memory, and that'll also block
dump-guest-memory if it detected that we're during a live migration.

Side note: migrate_del_blocker() can be called even if the blocker is not
inserted yet, so it's safe to unconditionally delete that blocker in
dump_cleanup (g_slist_remove allows no-entry-found case).

Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1996609
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 dump/dump.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/dump/dump.c b/dump/dump.c
index ab625909f3..662d0a62cd 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -29,6 +29,7 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "hw/misc/vmcoreinfo.h"
+#include "migration/blocker.h"
 
 #ifdef TARGET_X86_64
 #include "win_dump.h"
@@ -47,6 +48,8 @@
 
 #define MAX_GUEST_NOTE_SIZE (1 << 20) /* 1MB should be enough */
 
+static Error *dump_migration_blocker;
+
 #define ELF_NOTE_SIZE(hdr_size, name_size, desc_size)   \
     ((DIV_ROUND_UP((hdr_size), 4) +                     \
       DIV_ROUND_UP((name_size), 4) +                    \
@@ -101,6 +104,7 @@ static int dump_cleanup(DumpState *s)
             qemu_mutex_unlock_iothread();
         }
     }
+    migrate_del_blocker(dump_migration_blocker);
 
     return 0;
 }
@@ -2005,6 +2009,21 @@ void qmp_dump_guest_memory(bool paging, const char *file,
         return;
     }
 
+    if (!dump_migration_blocker) {
+        error_setg(&dump_migration_blocker,
+                   "Live migration disabled: dump-guest-memory in progress");
+    }
+
+    /*
+     * Allows even for -only-migratable, but forbid migration during the
+     * process of dump guest memory.
+     */
+    if (migrate_add_blocker_internal(dump_migration_blocker, errp)) {
+        /* Remember to release the fd before passing it over to dump state */
+        close(fd);
+        return;
+    }
+
     s = &dump_state_global;
     dump_state_prepare(s);
 
-- 
2.33.1


