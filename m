Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A683D4105
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 21:41:47 +0200 (CEST)
Received: from localhost ([::1]:49814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m713K-0003BP-C8
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 15:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m70wv-0006ah-KM
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:35:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m70wr-0002Tb-OC
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:35:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627068905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cgE+pvg8R5s4SHNQFQzuWvFk/uzjmRfZhE2Kfnw38pE=;
 b=NERryiga/tMYOR6qrVmn8DzAGQUUYl9vsy6Nd3Sy0smJ8d6/QPQuw4eV81n0lRnvR84Vr1
 KxCwlqir03Qczz2ho5aOWWVdae+8h9hNro07TnBDDCcHWI4eltzHmMyna6Dspc464VbGSn
 EcMn7tfTuEU6CYhYO9YXuqjLnAhXglw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-L4ONzdobO3WioQ5VIHchHg-1; Fri, 23 Jul 2021 15:35:04 -0400
X-MC-Unique: L4ONzdobO3WioQ5VIHchHg-1
Received: by mail-qv1-f69.google.com with SMTP id
 gg10-20020a056214252ab02902f3a4c41d77so2388145qvb.18
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 12:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cgE+pvg8R5s4SHNQFQzuWvFk/uzjmRfZhE2Kfnw38pE=;
 b=ni0wziH6cGInzcOkpuJKdEAvvqfFJ6yxuwxhjwRNhCyTHw/NNqOjwLTc/DZxmCUU4F
 DHyvkrG0MdcxYQWICcVBpCLu7stonVHz6RDKF+K+m4WOgjnrDv1D10DLEFTTB2HClJ9b
 ibTnxm5J3jrPvqmurTEUpK2dYWX0S2Q5f89gZ/eaT2l8RKKWMPu0t3f1+t+a+5zxVGWw
 pa/CV8b2rwaFWENL7qcjf70VQm4TT+V49TQyL3uajsTW6yJHq9D0yMofWe/042DIWg3c
 fPQAHXK9wcHTS4NtKjxSEM/8Zx45nsExPsZ5JgMhoxaBZF+6objKvEw/yWS9HyP4ESxo
 TbEw==
X-Gm-Message-State: AOAM531T9vWf8rlofmmD67qxJrScbM/Mtf/y0zJY/3EiMABhdqGKFMWR
 AvGReymGZHhTG51lBC2ruZWxV3b3FtQuILqBlJEXe5LF6YamI+U0dAdtOTY21UjLUL51AorBTPJ
 42ygNxGZQpP0v/awpMVYdQZdJxa0cs6loiuT0uCvQXleeYisHqRA+mdgLT5TU2B4U
X-Received: by 2002:ae9:ef10:: with SMTP id d16mr6221479qkg.264.1627068903285; 
 Fri, 23 Jul 2021 12:35:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3v4szRKKyZvFCXF17io+sQcR8o99rvmJzp6qfRKRgE7hIwBxJr/VHLbbF+CUzruP7EyDV9w==
X-Received: by 2002:ae9:ef10:: with SMTP id d16mr6221454qkg.264.1627068903027; 
 Fri, 23 Jul 2021 12:35:03 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id o2sm12659104qkm.109.2021.07.23.12.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 12:35:01 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 9/9] memory: Delay the transaction pop() until commit
 completed
Date: Fri, 23 Jul 2021 15:34:44 -0400
Message-Id: <20210723193444.133412-10-peterx@redhat.com>
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

This should be functionally the same as before, but this allows the
memory_region_transaction_depth to be non-zero during commit, which can help us
to do sanity check on misuses.

Since at it, fix an indentation issue on the bracket.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/memory.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 08327c22e2..cf7943c02c 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1114,8 +1114,7 @@ void memory_region_transaction_commit(void)
     assert(memory_region_transaction_depth);
     assert(qemu_mutex_iothread_locked());
 
-    memory_region_transaction_pop();
-    if (!memory_region_transaction_depth) {
+    if (memory_region_transaction_depth == 1) {
         if (memory_region_update_pending) {
             flatviews_reset();
 
@@ -1134,7 +1133,14 @@ void memory_region_transaction_commit(void)
             }
             ioeventfd_update_pending = false;
         }
-   }
+    }
+
+    /*
+     * Pop the depth at last, so that memory_region_transaction_depth will
+     * still be non-zero during committing.  This can help us to do some sanity
+     * check within the process of committing.
+     */
+    memory_region_transaction_pop();
 }
 
 static void memory_region_destructor_none(MemoryRegion *mr)
-- 
2.31.1


