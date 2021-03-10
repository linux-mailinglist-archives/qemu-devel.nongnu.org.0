Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2352B334919
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 21:48:28 +0100 (CET)
Received: from localhost ([::1]:38530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK5kp-0005EE-6Y
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 15:48:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lK5WC-000604-JJ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:33:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lK5W9-0000ga-Cb
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:33:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615408396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O+AomLI9wrG5xhM1xQmZ+/NRUp82zimm1r3k6Rcg5v0=;
 b=KGXA5xaRxYYXIUP4z4xYmexGZVBb8dbOmBc3tTMmnbxGILs1wih8fk53T0DZwx8zQSLeqW
 Gmr5G3T6e2FuG4mWf/iQz0h5O6H5EGZXyj8Uk0/AuG9ZnHa3WTO1kqRNWnjDSaHfs2P267
 207Q+VojcqlDqik0T/B1h2GkqpIoduo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-4mMdSS7LOxaVQtMAmeG-ug-1; Wed, 10 Mar 2021 15:33:15 -0500
X-MC-Unique: 4mMdSS7LOxaVQtMAmeG-ug-1
Received: by mail-qv1-f69.google.com with SMTP id da16so13597839qvb.2
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 12:33:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O+AomLI9wrG5xhM1xQmZ+/NRUp82zimm1r3k6Rcg5v0=;
 b=MkK23KRBR/SIVtX3bdYNxQRYXqxmjI/FPaE2fQfPAWgEZL7Oeobjb6SWlwaWh7GcFb
 0MiPDvQAsGRBRnkZIO/xyMp8cjO4Z9PtgE1Xwu1YdLwCiAOdoLMAZwQYpt8wjR6wvvIf
 Y1vzvjGZPzuk8popQWFPHbHRBtlouHfJwi5Sd9fKxPKzsagHYQqiyp8uGtR6HD6OwmIO
 AzsCJX4AdlSO947Jbdw7+VCRbN+A5eSD7NvxoV/oNUUsCGGxiJboh5BPHxEO6xxIzQyF
 2hEmZCaYESXIsL529eTNhDteb1cb7J0n3n4tKiMGG2hcZLosSCHl93Hk9MlPnV18CP4l
 nPPA==
X-Gm-Message-State: AOAM532AxvUWeDrn9Y4dn9qDi4DpzYdqnvmY+r+vIPc9i196LW7Vtb9i
 T6xM/O547CoH2i9bEuaJKIMLDJlk6+c73bKepqYhSqBE75s9jxbS9CXgc1lNOSYWxQ2h0bs1hpz
 sEOvonoRRh9+KpFspZhs2yhyZYatZDTQB69qFhrlo6n/vH6P4M5sYe1UXWsCkY/Eu
X-Received: by 2002:a05:620a:16b9:: with SMTP id
 s25mr4390205qkj.500.1615408394445; 
 Wed, 10 Mar 2021 12:33:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz87UpWZXa71qQfE6+9PWke738LMs2yURI+AFAFujWokvcUMdkiNvzsLvHb060UoSBlFkSunA==
X-Received: by 2002:a05:620a:16b9:: with SMTP id
 s25mr4390183qkj.500.1615408394132; 
 Wed, 10 Mar 2021 12:33:14 -0800 (PST)
Received: from xz-x1.redhat.com ([142.126.89.138])
 by smtp.gmail.com with ESMTPSA id z89sm306746qtd.5.2021.03.10.12.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 12:33:13 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/10] KVM: Disable manual dirty log when dirty ring enabled
Date: Wed, 10 Mar 2021 15:33:00 -0500
Message-Id: <20210310203301.194842-10-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310203301.194842-1-peterx@redhat.com>
References: <20210310203301.194842-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
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
index 10137b6af11..ae9393266b2 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2173,20 +2173,29 @@ static int kvm_init(MachineState *ms)
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


