Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDAA3480E3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:47:55 +0100 (CET)
Received: from localhost ([::1]:53132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8Xp-0004Ba-Sp
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP8QS-0007TB-Gf
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:40:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP8QQ-0006f4-Pm
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:40:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616611214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z8Azwhwk/zF/WlHWQkj7ts5ZdeHu5O2AXyHc/eoiIgU=;
 b=SfXYpo77DGX1LW/gy3RYCKeScuIb2KgvwzHlWGdhiO6SqtNm6/PBmaql+yrAR/ItGusvQ+
 JUW9pGP8ICFlZnO6z80lE2+4uGqN42tAGrfy+9dMtELEIjKkRNrbA0h9Nn34Ei6UQ3co0R
 ZP7ZC1GyCpN4RfIXBsjka18/SyzU08I=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-PisMivrAMOGqkaTIDvCtSQ-1; Wed, 24 Mar 2021 14:40:12 -0400
X-MC-Unique: PisMivrAMOGqkaTIDvCtSQ-1
Received: by mail-qk1-f200.google.com with SMTP id j14so2276250qka.7
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z8Azwhwk/zF/WlHWQkj7ts5ZdeHu5O2AXyHc/eoiIgU=;
 b=d1hQIjGjZ+eM6z7ElM4icILpLx8f1aACFoqwdUADkr3m8yU1/9JKEH0VFRAF9Hug1B
 L3fO6o1S4l2S5StrWNEaNHEjyo5HAmc5sO6KUO/Ns2pUvfXKfeM7OgNPgaaJQcF2gycO
 Ya+VohuHLRpLM2MNHBN3ANjnPgtHqWL5oqs1u77pepfJt382krtbtDCvNc3z1vkEkfQX
 rxjgJs1AAHeCWlI7C7qEReZXZhJhQaKqm/3JtMrWcEaM8fMgAUFOSd6Lqk2yTaeLTTl+
 MUUA65p894Zs8T2CFIb1nIW1kRguR7XnRq2KtgBbiCCb8u6xV+iEh1Glm/jjWxKI9DbH
 cUMQ==
X-Gm-Message-State: AOAM532b3mvVlZ+cuZmRKcdRhAgwwGZgCTQj1pQ181/8VqM2rfkcBBed
 IETb/Zx5ScTv9w0K41aueQFUiZY3tFfMdqMEjLGItfnjI1YTNEl1w6Mf1zYvt1e3KpR28pB3a/w
 20RWxhI3awR/dyP00K0gQb6aq/0PJzhfS29dPAUmBbMogcxNh77pnFErwwIVrDZTV
X-Received: by 2002:a37:92c4:: with SMTP id u187mr4327465qkd.113.1616611211233; 
 Wed, 24 Mar 2021 11:40:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdhmLcJH3LFs1Q8hRH1pyRSXmlm6Xw7XLz1QHWf4QTfR2pCjYsFBq3K3jwkmpdvv2V5fR4Iw==
X-Received: by 2002:a37:92c4:: with SMTP id u187mr4327428qkd.113.1616611210887; 
 Wed, 24 Mar 2021 11:40:10 -0700 (PDT)
Received: from xz-x1.redhat.com
 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca. [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id t24sm2001083qto.23.2021.03.24.11.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 11:40:10 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 09/10] KVM: Disable manual dirty log when dirty ring enabled
Date: Wed, 24 Mar 2021 14:39:53 -0400
Message-Id: <20210324183954.345629-10-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210324183954.345629-1-peterx@redhat.com>
References: <20210324183954.345629-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 is for KVM_CLEAR_DIRTY_LOG, which is only
useful for KVM_GET_DIRTY_LOG.  Skip enabling it for kvm dirty ring.

More importantly, KVM_DIRTY_LOG_INITIALLY_SET will not wr-protect all the pages
initially, which is against how kvm dirty ring is used - there's no way for kvm
dirty ring to re-protect a page before it's notified as being written first
with a GFN entry in the ring!  So when KVM_DIRTY_LOG_INITIALLY_SET is enabled
with dirty ring, we'll see silent data loss after migration.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 8baa002c009..daf59836ae2 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2169,20 +2169,29 @@ static int kvm_init(MachineState *ms)
         }
     }
 
-    dirty_log_manual_caps =
-        kvm_check_extension(s, KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2);
-    dirty_log_manual_caps &= (KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE |
-                              KVM_DIRTY_LOG_INITIALLY_SET);
-    s->manual_dirty_log_protect = dirty_log_manual_caps;
-    if (dirty_log_manual_caps) {
-        ret = kvm_vm_enable_cap(s, KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2, 0,
-                                   dirty_log_manual_caps);
-        if (ret) {
-            warn_report("Trying to enable capability %"PRIu64" of "
-                        "KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 but failed. "
-                        "Falling back to the legacy mode. ",
-                        dirty_log_manual_caps);
-            s->manual_dirty_log_protect = 0;
+    /*
+     * KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 is not needed when dirty ring is
+     * enabled.  More importantly, KVM_DIRTY_LOG_INITIALLY_SET will assume no
+     * page is wr-protected initially, which is against how kvm dirty ring is
+     * usage - kvm dirty ring requires all pages are wr-protected at the very
+     * beginning.  Enabling this feature for dirty ring causes data corruption.
+     */
+    if (!s->kvm_dirty_ring_enabled) {
+        dirty_log_manual_caps =
+            kvm_check_extension(s, KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2);
+        dirty_log_manual_caps &= (KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE |
+                                  KVM_DIRTY_LOG_INITIALLY_SET);
+        s->manual_dirty_log_protect = dirty_log_manual_caps;
+        if (dirty_log_manual_caps) {
+            ret = kvm_vm_enable_cap(s, KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2, 0,
+                                    dirty_log_manual_caps);
+            if (ret) {
+                warn_report("Trying to enable capability %"PRIu64" of "
+                            "KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 but failed. "
+                            "Falling back to the legacy mode. ",
+                            dirty_log_manual_caps);
+                s->manual_dirty_log_protect = 0;
+            }
         }
     }
 
-- 
2.26.2


