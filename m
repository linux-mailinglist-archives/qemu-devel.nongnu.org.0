Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358D73D40FD
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 21:39:34 +0200 (CEST)
Received: from localhost ([::1]:45392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m711B-00008c-8Q
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 15:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m70wr-0006Zm-PD
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:35:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m70wp-0002SS-Tq
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627068903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n60YpD2jRfME+kNkqr3g07wbTXEad9D8JchKCn5/hoA=;
 b=iyTP3rYqRZ8+xKjyjrNKlm+Cog4YCpOAW9QUu4XhBELOfR6RfCdYaL15FEm9LYK10EVjx9
 lSlDSfigV7Bw6ArxQb5Y32gwr/Yi296UfYUQd0uOt7+smIQJDZRS0DqlEBESgsa/hGfiK0
 kUzHumQoa+j1+Knf0CgCVl0qdnAiX34=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-b0Mb_9OBMeGaAjrhS8Nxzw-1; Fri, 23 Jul 2021 15:35:02 -0400
X-MC-Unique: b0Mb_9OBMeGaAjrhS8Nxzw-1
Received: by mail-qk1-f198.google.com with SMTP id
 bm25-20020a05620a1999b02903a9c3f8b89fso1954680qkb.2
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 12:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n60YpD2jRfME+kNkqr3g07wbTXEad9D8JchKCn5/hoA=;
 b=Hcwo1Tfzp/uPP4zbnYtYpC1rjn241faz6LiRhl9z/BAMtTS/yshzm9C0FyS/Sh9ds9
 1KC/8KDNZ2AbqmlKwagC7zibBii6Dt0W+iE2oaDRjXEGno0k6p6juyXqHo/z+P0woP3K
 NqIFYrUVUQMRmPlPNn/hfs32GsAxUCmPHwph/Jjtxu/QIzB+7Q4ZsSM9Et8Wg+SAbnwF
 4p5edaoS9aD92CvyZQOI2vHW4+9dcWIbV/sTFVYUh5xL4ZZZV9ajp69C+gASfm3CoXfq
 V5kTwU4BKu0d52T+aNWjeuMAaCH5S9VXGeoippiGJlxXQDQ0hINE3zU1BTw7bTlJafL7
 ZYvQ==
X-Gm-Message-State: AOAM532A/H2Qtvh6LGkyG8lfSdbE4Uh3yxmiLkZstvKcxJz6ii1U7ggw
 qcjKBjwkiJdnbFTcQIEk8PHuEkypdVxeRTRyxOCBEEZ73WGwDM7T9re17tk79leLOrbjoq23Hyh
 I4r9jAljxau33zOXZVTWBcDYjEfe0q3JoA+WJSZegphK8PC14C5+rUogvaknK2ak3
X-Received: by 2002:a37:a004:: with SMTP id j4mr6056020qke.499.1627068901581; 
 Fri, 23 Jul 2021 12:35:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVbMrmd/d7C9Rp+Q9dZEWzGkMxXzQlHED0HbByvYXvbD4Ri0a6G59ZjvzFdsSPxOUoIxWUbQ==
X-Received: by 2002:a37:a004:: with SMTP id j4mr6055996qke.499.1627068901341; 
 Fri, 23 Jul 2021 12:35:01 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id o2sm12659104qkm.109.2021.07.23.12.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 12:35:00 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/9] memory: Assert on no ongoing memory transaction before
 release BQL
Date: Fri, 23 Jul 2021 15:34:43 -0400
Message-Id: <20210723193444.133412-9-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723193444.133412-1-peterx@redhat.com>
References: <20210723193444.133412-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 peterx@redhat.com, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make sure we don't have any more ongoing memory transaction when releasing the
BQL.  This will trigger an abort if we misuse the QEMU memory model, e.g., when
calling run_on_cpu() during a memory commit.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/exec/memory-internal.h | 1 +
 softmmu/cpus.c                 | 2 ++
 softmmu/memory.c               | 6 ++++++
 3 files changed, 9 insertions(+)

diff --git a/include/exec/memory-internal.h b/include/exec/memory-internal.h
index 9fcc2af25c..3124b91c4b 100644
--- a/include/exec/memory-internal.h
+++ b/include/exec/memory-internal.h
@@ -35,6 +35,7 @@ static inline AddressSpaceDispatch *address_space_to_dispatch(AddressSpace *as)
 
 FlatView *address_space_get_flatview(AddressSpace *as);
 void flatview_unref(FlatView *view);
+bool memory_region_has_pending_transaction(void);
 
 extern const MemoryRegionOps unassigned_mem_ops;
 
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 6085f8edbe..14a50289f8 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -31,6 +31,7 @@
 #include "qapi/qapi-events-run-state.h"
 #include "qapi/qmp/qerror.h"
 #include "exec/gdbstub.h"
+#include "exec/memory-internal.h"
 #include "sysemu/hw_accel.h"
 #include "exec/exec-all.h"
 #include "qemu/thread.h"
@@ -68,6 +69,7 @@ static QemuMutex qemu_global_mutex;
 
 static void qemu_mutex_unlock_iothread_prepare(void)
 {
+    assert(!memory_region_has_pending_transaction());
 }
 
 bool cpu_is_stopped(CPUState *cpu)
diff --git a/softmmu/memory.c b/softmmu/memory.c
index dfce4a2bda..08327c22e2 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -176,6 +176,12 @@ static bool memory_region_has_pending_update(void)
     return memory_region_update_pending || ioeventfd_update_pending;
 }
 
+bool memory_region_has_pending_transaction(void)
+{
+    return memory_region_transaction_depth ||
+        memory_region_has_pending_update();
+}
+
 static bool memory_region_ioeventfd_before(MemoryRegionIoeventfd *a,
                                            MemoryRegionIoeventfd *b)
 {
-- 
2.31.1


