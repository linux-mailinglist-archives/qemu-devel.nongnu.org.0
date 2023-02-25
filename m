Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927846A2AB8
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 17:33:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVxSw-0006wr-DL; Sat, 25 Feb 2023 11:32:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pVxSs-0006uZ-Av
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 11:32:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pVxSo-0007lM-Mh
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 11:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677342712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZVbXKBk+5YoJXuxsPRNLuFZCQaYMraNe+LiCnLIuD5I=;
 b=PAbAfw+zo6o64/h+EvsqlALLgeQcZktmPf+U2MJ3mwKqRGaMHwHqubYT9DUm85mgETkZ2D
 Zpk3QRL1FrUQbjYJzZHxm+XZsO0jhBj6IQkAJxRaCYjeSFqJ7jPvX2SWT+1ykvy8uigpUF
 OdmjhhLxMnZYbOW9Gc+lhHqEEoZ/1r8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-510-0pzsIGMXOfSNCEuv-HPS3w-1; Sat, 25 Feb 2023 11:31:50 -0500
X-MC-Unique: 0pzsIGMXOfSNCEuv-HPS3w-1
Received: by mail-qv1-f70.google.com with SMTP id
 jy22-20020a0562142b5600b005710b856106so1069494qvb.0
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 08:31:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677342707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZVbXKBk+5YoJXuxsPRNLuFZCQaYMraNe+LiCnLIuD5I=;
 b=vxF0HeSCFtzZiRlZ93ffiWT0FlCAvA5rrhDKjlHTweSfRN18ehVid73jma0rTxv2O/
 JtlPwhJxF2Pnv+xD0mjWaPfOLuHp9ZdXmuGcwOf8zBDJt0ut73vMVICaYCTdZAO2pnhM
 oO9TOZAFyds5GK33qih8PKMoziet8AKQ/aTyjMCLTnEKy/fj+pV5ojREkhNTLnbp63tH
 3ff/7Vg9EcVzVz901cErxaDgpgOlHe0b3XU4npf7q2rrgD/aHV9G3yCwKy+yYxTOyi7N
 Sx5kTPmTYwYE2d3CQKbQ6x9HVqdfutwkKg0tc9wtsAd0Iw1T0f/d0FUlN/PPTdsomsM6
 EPVw==
X-Gm-Message-State: AO0yUKVyPstY+BntrOP72b37IbAuYwiKu+EcroCPLaknp31mNuVYfFjz
 kbFFlPs6pccb8u3rqPG2x3ddqG9YqXHEkzqqbeJDqOQJ3IXWTsKoICDVqz+0Ru9mwv8C48Byd0G
 Tj9AlqD+djMnrJRYqI+FpRV2KarJ19bLqfsBC+n8RQzV35/5q9IaKtPGuN5TqMCiMUmaprA==
X-Received: by 2002:ac8:5995:0:b0:3bd:1c0f:74f3 with SMTP id
 e21-20020ac85995000000b003bd1c0f74f3mr37663025qte.2.1677342707412; 
 Sat, 25 Feb 2023 08:31:47 -0800 (PST)
X-Google-Smtp-Source: AK7set9hJZ6h0JepQGiVNijPwhwXgorVfOEVrqze3rqEYiDmpFG2Azp5t7kSO8f3fPFnKOEjDubc+g==
X-Received: by 2002:ac8:5995:0:b0:3bd:1c0f:74f3 with SMTP id
 e21-20020ac85995000000b003bd1c0f74f3mr37662956qte.2.1677342706927; 
 Sat, 25 Feb 2023 08:31:46 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 t8-20020ac85888000000b003bb8c60cdf1sm1558142qta.78.2023.02.25.08.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 08:31:45 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Maxim Levitsky <mlevitsk@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Chuang Xu <xuchuangxclwt@bytedance.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 peterx@redhat.com
Subject: [PATCH RFC 1/4] memory: Make memory_listeners RCU-safe for real
Date: Sat, 25 Feb 2023 11:31:38 -0500
Message-Id: <20230225163141.1209368-2-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230225163141.1209368-1-peterx@redhat.com>
References: <20230225163141.1209368-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I think the plan was making memory_listeners rcu-safe, but maybe not
really.  This patch does it for real, by using RCU variances of qtailq
helpers when modifying memory_listeners.  The modification should be
serialized by BQL, add assertions to register/unregister functions.

Wait for a quiecent period before returning from unregister of memory
listener to make sure any rcu reader is accessing valid listeners.

AddressSpace.listeners are protected in the same way, so do the same.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/memory.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 9d64efca26..a63e0bcbb7 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -3016,30 +3016,32 @@ void memory_listener_register(MemoryListener *listener, AddressSpace *as)
 
     /* Only one of them can be defined for a listener */
     assert(!(listener->log_sync && listener->log_sync_global));
+    /* Ownership of memory_listeners & as->listeners for modifications */
+    assert(qemu_mutex_iothread_locked());
 
     listener->address_space = as;
     if (QTAILQ_EMPTY(&memory_listeners)
         || listener->priority >= QTAILQ_LAST(&memory_listeners)->priority) {
-        QTAILQ_INSERT_TAIL(&memory_listeners, listener, link);
+        QTAILQ_INSERT_TAIL_RCU(&memory_listeners, listener, link);
     } else {
         QTAILQ_FOREACH(other, &memory_listeners, link) {
             if (listener->priority < other->priority) {
                 break;
             }
         }
-        QTAILQ_INSERT_BEFORE(other, listener, link);
+        QTAILQ_INSERT_BEFORE_RCU(other, listener, link);
     }
 
     if (QTAILQ_EMPTY(&as->listeners)
         || listener->priority >= QTAILQ_LAST(&as->listeners)->priority) {
-        QTAILQ_INSERT_TAIL(&as->listeners, listener, link_as);
+        QTAILQ_INSERT_TAIL_RCU(&as->listeners, listener, link_as);
     } else {
         QTAILQ_FOREACH(other, &as->listeners, link_as) {
             if (listener->priority < other->priority) {
                 break;
             }
         }
-        QTAILQ_INSERT_BEFORE(other, listener, link_as);
+        QTAILQ_INSERT_BEFORE_RCU(other, listener, link_as);
     }
 
     listener_add_address_space(listener, as);
@@ -3051,9 +3053,14 @@ void memory_listener_unregister(MemoryListener *listener)
         return;
     }
 
+    /* Ownership of memory_listeners & as->listeners for modifications */
+    assert(qemu_mutex_iothread_locked());
+
     listener_del_address_space(listener, listener->address_space);
-    QTAILQ_REMOVE(&memory_listeners, listener, link);
-    QTAILQ_REMOVE(&listener->address_space->listeners, listener, link_as);
+    QTAILQ_REMOVE_RCU(&memory_listeners, listener, link);
+    QTAILQ_REMOVE_RCU(&listener->address_space->listeners, listener, link_as);
+    /* Wait for RCU readers to finish.  NOTE!  this may release BQL */
+    drain_call_rcu();
     listener->address_space = NULL;
 }
 
-- 
2.39.1


