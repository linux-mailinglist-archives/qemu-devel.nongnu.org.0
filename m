Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B0837588C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:37:57 +0200 (CEST)
Received: from localhost ([::1]:49006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leh0d-00016E-LP
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1legW6-0004Yw-0C
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:06:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1legW1-0003fK-Fk
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:06:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620317176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H1vFXx+gF0iNExiOY7cdBT8+TWNFWXHTAf1t0sfNuhI=;
 b=Npeo6kPngg8lP5b5fMp4LTUSDfMi3R+UPyXyFXvydbKYd/Y3wNPgxKy65nbu4sef0yl1AJ
 Qp7F3SrMMKFKuHADONs8napXk3hjCxmCNdDBowDV3XsP96sUndN3ZgdTaQsAIK10vpmsSy
 juRNuhu1fwwLz3g1O4YQGWCHTxktD2w=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-TiYWgXnSOCON3rGPDdXq4g-1; Thu, 06 May 2021 12:06:14 -0400
X-MC-Unique: TiYWgXnSOCON3rGPDdXq4g-1
Received: by mail-qv1-f70.google.com with SMTP id
 a18-20020a0cca920000b02901d3c6996bb7so4497219qvk.6
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 09:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H1vFXx+gF0iNExiOY7cdBT8+TWNFWXHTAf1t0sfNuhI=;
 b=TPqE9VgFlXN6jTgE/vP4k5A8ltTNMVV8LpT19ngtDbJ4UV5TaG6whenDgIjxyRUxFl
 gcEW1xx/RjlKpN/22+oawas+OFNQP6UccrvpOMRCxhm77LBw0iqHHDsQpLzgcXaTItLT
 CRFsUQPCqzlZ1NPQxMM2wzMlUE41ypVaNEWJ43sqLFwVA7lTrmENH1+ZMGyJyVOoIthV
 lEgBnhLOfCEf5E1HVeM47JROdytAsFYFJ+ppNPy04gHp6TWiPLb/UevF+ksI7ng+jj+B
 +Qfb4Q7TMbQh5ED7HMij2T6sjttFUIEnKdwl7kdzmon19kxfxN+ahK7KXCv3Cgk307Kd
 9Lig==
X-Gm-Message-State: AOAM533lYiVRBnJLE6TYrXc1/jCZd3tt0GXKTmHBp+kkyOBs6uMQt+ui
 pOdrKF/yJXXO9uuT1w/+Tj93aRDHYiWAlJAfT1ASMBN2LDfo68jNhyhtSe1pSo+4HIWnrZ2D9o5
 KT6M65WuOcHRITdUE0SODYAbkH4GQRVa0ATePKKq1ABB5ovzza9yRBWlhDjoGKvCT
X-Received: by 2002:a0c:d6cc:: with SMTP id l12mr5426492qvi.47.1620317172389; 
 Thu, 06 May 2021 09:06:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhCc5fPz+AJvb9qn+/+oJxVVEVfVb99vKQ3TCoVOaTwbeuowOvTwM5euzqSfc/9CloJHIy4Q==
X-Received: by 2002:a0c:d6cc:: with SMTP id l12mr5426458qvi.47.1620317172126; 
 Thu, 06 May 2021 09:06:12 -0700 (PDT)
Received: from t490s.redhat.com
 (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca. [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id y84sm2194131qkb.134.2021.05.06.09.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 09:06:10 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 09/10] KVM: Disable manual dirty log when dirty ring enabled
Date: Thu,  6 May 2021 12:05:48 -0400
Message-Id: <20210506160549.130416-10-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506160549.130416-1-peterx@redhat.com>
References: <20210506160549.130416-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
index e438e5d26ad..2404c941784 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2167,20 +2167,29 @@ static int kvm_init(MachineState *ms)
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
2.31.1


