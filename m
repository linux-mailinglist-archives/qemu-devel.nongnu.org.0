Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70E63480F5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:52:13 +0100 (CET)
Received: from localhost ([::1]:35150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8c0-0000D4-O2
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP8QO-0007MU-Sz
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:40:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP8QN-0006c3-5J
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:40:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616611210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E9n43tAu28BWttdNlvE7I8oKA+ER66k2/i43qMD9Z2I=;
 b=IiZNQwRwI60bG0TDnktV9D6QB0vOP+WZyiTN5OJ0P6/g1/KLjZbg8WjiPPQEPQabUKLMSC
 5eS8+DQPdLLzP7YDnRXiT3mJCJmnJCq8QGlUpS8B3C4BGOCcVhJHPxrk8Uw19K77F61mgv
 K8aU5EV6jJLA+gKXRZHl3X4QwtQr45s=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-6XcOVNA-PxWtIIe7uLxtbA-1; Wed, 24 Mar 2021 14:40:08 -0400
X-MC-Unique: 6XcOVNA-PxWtIIe7uLxtbA-1
Received: by mail-qt1-f199.google.com with SMTP id t5so1844725qti.5
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E9n43tAu28BWttdNlvE7I8oKA+ER66k2/i43qMD9Z2I=;
 b=iDfcOmMDgqpnyLtJbJpsZrmdeFGOCPKm2IJN6BdIpG+gcXtvhNSKbmfgkPD/ewjB5Q
 riqyGbqtUgTwLvCiLlMlKRENBp6MSBDeNrTbux6LP4XtsUGnIpL6uEw5bSNZ3ZsIxqNP
 0WK3KnhXBGURCAcV4EiSRzn0ikd6KzAztVwOH+FgGbiduql/F6h2C6sA6cdLlZ7H3uxG
 o86Y63L2q4kNOehyZ3bomk60TYkjkkTs4lEi9kF4IvVapuxESpsXQ+kgDwNQzN3LzzRr
 iaofFqLyxs/nfY9PpshFMG0/Qgy5TveKEGu9NvBza5hJKMH2C0bMgVGS3dRKONHV+XPf
 8Jzg==
X-Gm-Message-State: AOAM532hV4CYw1+tOZ0JnOuhuSIHz0TU0xNOhV6RoSM96SZo+9EyPua5
 iG6bnxNoCvVw6AHXX9kCVotEjZMuLlmSMA5vB9By3mYSCF6fHIeWPoJSEqrjOmw9v6HjDKx396N
 d3MN7dBF2R7n34mBaDeWpqHJ4KwCoRG93XsG8n9DLnolk9hrex+fduV9Uf+bNxCNL
X-Received: by 2002:a0c:a951:: with SMTP id z17mr4333453qva.1.1616611207211;
 Wed, 24 Mar 2021 11:40:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7Hx+1a0Ihr050SJNuJbuRu80/8npsiYZerdQoPmQ699TE0NIezLB6QrmlYOxd8SycshHMSg==
X-Received: by 2002:a0c:a951:: with SMTP id z17mr4333422qva.1.1616611206883;
 Wed, 24 Mar 2021 11:40:06 -0700 (PDT)
Received: from xz-x1.redhat.com
 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca. [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id t24sm2001083qto.23.2021.03.24.11.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 11:40:06 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 06/10] KVM: Simplify dirty log sync in kvm_set_phys_mem
Date: Wed, 24 Mar 2021 14:39:50 -0400
Message-Id: <20210324183954.345629-7-peterx@redhat.com>
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

kvm_physical_sync_dirty_bitmap() on the whole section is inaccurate, because
the section can be a superset of the memslot that we're working on.  The result
is that if the section covers multiple kvm memslots, we could be doing the
synchronization for multiple times for each kvmslot in the section.

With the two helpers that we just introduced, it's very easy to do it right now
by calling the helpers.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 57a43e6a6b2..e8795d04f85 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1163,7 +1163,8 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
                 goto out;
             }
             if (mem->flags & KVM_MEM_LOG_DIRTY_PAGES) {
-                kvm_physical_sync_dirty_bitmap(kml, section);
+                kvm_slot_get_dirty_log(kvm_state, mem);
+                kvm_slot_sync_dirty_pages(mem);
             }
 
             /* unregister the slot */
-- 
2.26.2


