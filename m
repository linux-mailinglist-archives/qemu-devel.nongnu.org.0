Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E57038F1E5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 18:59:37 +0200 (CEST)
Received: from localhost ([::1]:42500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llDvU-0000Sm-GN
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 12:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeR-0004rv-8P
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:59 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:35626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeI-0004O7-LN
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:58 -0400
Received: by mail-ed1-x536.google.com with SMTP id y7so15207876eda.2
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GBwYk/KWMuO+/yxHf80rqOKUhqHBFBQaoC17YufQN2w=;
 b=cvg47CIKca5UqC4HEj+1V2AjBKAN007zFW0KlGh9u2nva5RKBUl9iHz1Vbl13g82bz
 ZOpNfl7Yw0Dl0YIRSOqTAYOAPwEr3MJKfdci89oyC0TfoZmORwfxgBfU2ksHwI1w8n9u
 5ZyZfJUr7u2ejkVV+JesiK2DmL+GNglFc+dGX90wh3/FxfAeJue8qfZnObrg5yhFN3il
 CtRZFx3HwgoXi45kehF7dPjJ6dnseFqSbfTxaLDQDcnVXCegt+gNeevaOY+h7UYFF2RI
 vuE+UUIokOYsRDoIGnRpb0oD4JLjW3cVGt8W2o0TZMIvEj+0tdM/G0p7I+pFOlg2G414
 R45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GBwYk/KWMuO+/yxHf80rqOKUhqHBFBQaoC17YufQN2w=;
 b=tX3m7NWurIs4kVxdyBdujm0nSPJ+CY6r1mnNZqHpnybwVwN0Qs3qIVsz0k/3FmaGlp
 JZQGsvnSssQZfquPgZGhIiunfP+9Kfkr1TwNRQ+hdjcQAcGrfK+YNuXwZtrmquxzJXVc
 JqFF6TPxE3CPSljyQGhAqob7epE2+WHMSoIbDrJ78tuGk78QmnwmeeUCapoQ/w7RM0am
 uEicBfQeKp6fR/4kZrf4UbvJmL+9vgp/wrv6JzG8zKbHaBsqOkxgfBpTrT7/y0AH6u4I
 vO99ZXHDI+NIt0IbkEv9sHrDozpF1iAfKl/BhlgAB9DU+5mNBY5F3ABMmR2eryTiwiBU
 cICA==
X-Gm-Message-State: AOAM531UC3RElNWVNiSmmP9CJ0x5e7UD/TodEsR7MsKKLdlvtUNHNWvT
 BHmL2dT3NMFGYamXmK7YTbfqtCIKFfKn9g==
X-Google-Smtp-Source: ABdhPJxNTaSg4ZWSRbXceWj/44pdmC85SV1ISWlb2pRZNdzcuYELwHZyslSkCqV+WRt9W5djFfwIfQ==
X-Received: by 2002:a05:6402:50b:: with SMTP id
 m11mr27720416edv.367.1621874504249; 
 Mon, 24 May 2021 09:41:44 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/28] KVM: Disable manual dirty log when dirty ring enabled
Date: Mon, 24 May 2021 18:41:20 +0200
Message-Id: <20210524164131.383778-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
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
Cc: Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 is for KVM_CLEAR_DIRTY_LOG, which is only
useful for KVM_GET_DIRTY_LOG.  Skip enabling it for kvm dirty ring.

More importantly, KVM_DIRTY_LOG_INITIALLY_SET will not wr-protect all the pages
initially, which is against how kvm dirty ring is used - there's no way for kvm
dirty ring to re-protect a page before it's notified as being written first
with a GFN entry in the ring!  So when KVM_DIRTY_LOG_INITIALLY_SET is enabled
with dirty ring, we'll see silent data loss after migration.

Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210506160549.130416-10-peterx@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 5afe15ae66..e1a6c7c89b 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2131,20 +2131,29 @@ static int kvm_init(MachineState *ms)
     s->coalesced_pio = s->coalesced_mmio &&
                        kvm_check_extension(s, KVM_CAP_COALESCED_PIO);
 
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
+    if (!s->kvm_dirty_ring_size) {
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



