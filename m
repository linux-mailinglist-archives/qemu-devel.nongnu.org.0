Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5DC37586A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:26:16 +0200 (CEST)
Received: from localhost ([::1]:51058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legpJ-0006Pd-No
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1legW1-0004Tt-PB
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:06:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1legVt-0003d8-EA
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620317168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4rCrAN+h0wgJgjBJic1rm3cOtCEsNSz3UJTGf5unUhs=;
 b=RBIafxBSWjKLObUUVFRzvSIylGYfRNAoH6Tb3JxlnTj+br19lHYrIA/X6fEJy4DxmfXIHB
 /YCIVAfEStBcMT2Jeq98bjakyqu0ARLdS2OKRiQdaUgXHn87nnScuxqFwLXs3QwAUF34LC
 lFFnpDjv06rT9AxMzpYSJmXNIyZBbxM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-hfXF7RSLMQOFRSa_3WJWtQ-1; Thu, 06 May 2021 12:06:06 -0400
X-MC-Unique: hfXF7RSLMQOFRSa_3WJWtQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 h4-20020ac858440000b029019d657b9f21so3869645qth.9
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 09:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4rCrAN+h0wgJgjBJic1rm3cOtCEsNSz3UJTGf5unUhs=;
 b=gCFhpKVYWmGSj1zRLjTZHiy+n7Qbd7xbZo7MPUw5xgI033HYhWa3VwUL1Q2qFi2B62
 9S00Stk9u3efiJsBbM1h74FzoEKhU6tBAsHNNccuO2Yr918pOHWE4Kz9utsy9opWpKcb
 BRv1q59/zSSxeVwZuzblL2T9MfAX5MoHr7OtbKaNMpJOJa5XdftywEDGjg0W/kPcKzzc
 +joQ7OmCxJKUlvDlmx3EGDMEnYA36URPXXUKI5FvYIXPq0Fm1B3ZkSGgzZFxQ1VhBgwD
 blgtzwqnAHPpy7Dpiha3EzfXH9T35B2KXipqym2jp8AdzlQ/VKcbLImA8eVW7BhHdOYM
 Jzfw==
X-Gm-Message-State: AOAM533J7Bv8NBZUDA0wsMm347xa3KxlmO8SJ23IbqeQmafw7B6RRmyP
 QHHRtfd1DayqZUBWT9S/e6XIdB+a9tMYoAA7o07gDN+/Dkqar5bbNZYGPqZdcI0E1/euVMckVn7
 tUQmBY4DhePlIpNNkb4DaDlNqcrrjj7/aa6s7lNObfuKxOKJl+HtH15i0ZIyftOWz
X-Received: by 2002:a37:a604:: with SMTP id p4mr4605255qke.215.1620317165090; 
 Thu, 06 May 2021 09:06:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxs8CIHKxm4yPk38+sq3ELsDBvLBk7WBncz0U4cuUYJexUUR0+qcEBWlUnw64Uh414BksFqtA==
X-Received: by 2002:a37:a604:: with SMTP id p4mr4605191qke.215.1620317164493; 
 Thu, 06 May 2021 09:06:04 -0700 (PDT)
Received: from t490s.redhat.com
 (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca. [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id y84sm2194131qkb.134.2021.05.06.09.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 09:06:03 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 06/10] KVM: Simplify dirty log sync in kvm_set_phys_mem
Date: Thu,  6 May 2021 12:05:45 -0400
Message-Id: <20210506160549.130416-7-peterx@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
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
index 1025701f557..4b786240a04 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1161,7 +1161,8 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
                 goto out;
             }
             if (mem->flags & KVM_MEM_LOG_DIRTY_PAGES) {
-                kvm_physical_sync_dirty_bitmap(kml, section);
+                kvm_slot_get_dirty_log(kvm_state, mem);
+                kvm_slot_sync_dirty_pages(mem);
             }
 
             /* unregister the slot */
-- 
2.31.1


