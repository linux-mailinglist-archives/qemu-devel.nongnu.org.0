Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C6838A00B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:44:20 +0200 (CEST)
Received: from localhost ([::1]:34990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljeHz-00041U-6c
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxm-0005RV-Ol
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:29 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:45022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxf-0001Xl-1R
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:24 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 y184-20020a1ce1c10000b02901769b409001so4671242wmg.3
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 01:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9/dX3PC3FCiO5p7uuZf1RyQ9MDHL5qIlrYK5aAJJIeY=;
 b=FVTer/RJhNN4vLa0lm9lSSm7+lL5wAyRn5BQZ5IG2RCgGcX4aJixkFw66Y5EXMb/k5
 qYgDs0CfQFN9e+zzPYWOEgZ68AV8Xf1YHo9TXFVDVTScswyinz7Royv2T34dgVhYELOp
 nKVehjm/7F/+VcJE74u+cS/h4ZPuUW8ZfwrIJAldtCLWMgftmOLj9KMsEJZyY7P2o2mD
 m09y59BPkTlsANTVJX+QCYOdNc7X6EVKn/l8r2UqP0cIAgLtDPW8KqDuNKgTNUCJoB+G
 9dVinB4GtznXaLpwtTfuZNNx1N1jI9TRRnNNcud7MZTdfW95Ue8V280KL5g6FCWoxk0y
 ygZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9/dX3PC3FCiO5p7uuZf1RyQ9MDHL5qIlrYK5aAJJIeY=;
 b=V2KRZAbtUPUvqZrVk2IJOcRZ6q1Ynt+tB0FhEspklQZcWgUfCGZUvUGrp1FulHgt5f
 aQSsgsC+66PYGTYsehcbJS07fsryBkLE5GUN9XonvwdrwZa0+PqThv9tDhlrf6VUNGq1
 RH7TYeMhhf5fJcspfXSWsZnjw/oNTialQLxzoYcbl60rQc3PwwP05r402KjIUac1sZly
 jBVSv8CuYtvHun7X4Mf4BR9XSYPhqHvQSCHC94SNyFnjGeePts1NWzn57/3v1THXmHhp
 RAnzrA2cFjG5yw+ReVtWTz8lsUuwoAQVGQxccSp0Ub0nsKo8BuMxTxu9+shW0+eVMUGS
 Io8g==
X-Gm-Message-State: AOAM5336Zc253K4aWV4XA1yIQzWNiB0J+pZpmV3kJuWlMCo1Ilhr1xf7
 Ny2elm5X1Pkd6PB8gZEDQpiK5Z5+KjYkfA==
X-Google-Smtp-Source: ABdhPJzoWqW+BUvItzVLsj8dsAj6wmxcY4QRbN3eEh37FE0+fLnLcatdFaLzVPiCoyh2TTTjOHog5A==
X-Received: by 2002:a05:600c:da:: with SMTP id
 u26mr2346821wmm.128.1621498988402; 
 Thu, 20 May 2021 01:23:08 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:23:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/26] KVM: Simplify dirty log sync in kvm_set_phys_mem
Date: Thu, 20 May 2021 10:22:46 +0200
Message-Id: <20210520082257.187061-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
References: <20210520082257.187061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

kvm_physical_sync_dirty_bitmap() on the whole section is inaccurate, because
the section can be a superset of the memslot that we're working on.  The result
is that if the section covers multiple kvm memslots, we could be doing the
synchronization for multiple times for each kvmslot in the section.

With the two helpers that we just introduced, it's very easy to do it right now
by calling the helpers.

Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210506160549.130416-7-peterx@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 7031dd4250..0ba6d48120 100644
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



