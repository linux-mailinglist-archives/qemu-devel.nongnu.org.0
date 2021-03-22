Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CAB344B64
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:32:21 +0100 (CET)
Received: from localhost ([::1]:58340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONTX-0002Kg-Cn
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lONPQ-0008Op-M7
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:28:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lONPO-0006HE-Sw
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616430481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I8+ywKrNLIVPG/dFxiVIx8E83BewvjippQPoaCGXKHg=;
 b=Z6FjcL/hPLWc2biEVjs80aCOee5vToIYT5qrWFp3g43sMyqjuJYUYGVk/d+WN0TVBsXxcQ
 qvnqWHQRwfvrVIL4SIYGPmboWJ8L7cmoLrJVMjC5Xah96AIW3ijGuuFBdM/5urvkTsERIV
 FwgIkZUb7khbx1PVRv/u5e9FUlaJhsQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-VbRMhtlHMYyPIjlY3qcS-g-1; Mon, 22 Mar 2021 12:27:57 -0400
X-MC-Unique: VbRMhtlHMYyPIjlY3qcS-g-1
Received: by mail-qk1-f197.google.com with SMTP id k188so21989637qkb.5
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 09:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ggZHaG2uIzm1Zs6upbKxr80Rb9tvi9pAMIeOH4GFcus=;
 b=RdhSO23c+XFba+ZnMJOkvNn0xHD0EeQC4rUFEYNpo76lIn1jEjKDNsorwsvxjjjJwG
 U4Dekyo7Bs/DZ9455vtQJDYpuFkxnEJAiHurWDHbKBvqOrZ3iuR8gSZGNMn/+uvPyZ01
 NjMGrIu3f7Br/XHPUZMTYem084R96/0YFI3+hs6YFy+vbXoFHMMRVQPY/JJ94ryILUI3
 F8iQJmug69zhNojAqLMe+dNk3q5wTgvhR0T3LyqM3ETJx1uuvqRg6v8Weumy54ZwCKxk
 /Qec8x3Fm8SkaVhw7nRJEztBJWZ5TFxb3zT+BqTAuW6RdWRSsusKSqIrGGY/Xgfg2AOq
 ZIFg==
X-Gm-Message-State: AOAM531Y9WV5I38Fyh2ZOoIExDT6ToGTvRnoubXAQ2tvL99TGRO76gAc
 ET+0/IKirdDe2KpJujj3YLXXA3IwE5oXU8+Lx7/sn+Qx9adYId/+xenMviJhQFOO+xY8K0eqVis
 0FDfI4RpS2TfU1N8=
X-Received: by 2002:a05:622a:216:: with SMTP id
 b22mr646844qtx.263.1616430476957; 
 Mon, 22 Mar 2021 09:27:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwBeMoSMeP8efzqjjedTZOaQ3AbGd5uiMsuGUVlmNuhrNk7R7zqHbjQbTDOdGbOo6qYkcgCg==
X-Received: by 2002:a05:622a:216:: with SMTP id
 b22mr646824qtx.263.1616430476755; 
 Mon, 22 Mar 2021 09:27:56 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca.
 [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id h11sm9167757qtp.24.2021.03.22.09.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 09:27:55 -0700 (PDT)
Date: Mon, 22 Mar 2021 12:27:54 -0400
From: Peter Xu <peterx@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5 02/10] KVM: Use a big lock to replace per-kml slots_lock
Message-ID: <20210322162754.GC16645@xz-x1>
References: <20210310203301.194842-1-peterx@redhat.com>
 <20210310203301.194842-3-peterx@redhat.com>
 <71e85a52-7385-e88a-f51f-9371bc371d06@huawei.com>
 <b1f2727e-2583-6bfc-bb34-4ebd8da1216d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b1f2727e-2583-6bfc-bb34-4ebd8da1216d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline
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
Cc: Hyman <huangy81@chinatelecom.cn>, Keqian Zhu <zhukeqian1@huawei.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Mar 22, 2021 at 02:54:30PM +0100, Paolo Bonzini wrote:
> On 22/03/21 11:47, Keqian Zhu wrote:
> > > +    qemu_mutex_init(&kml_slots_lock);
> > As you said, x86 has two address spaces, is it a problem that we may have multi initialization for kml_slots_lock?
> 
> Agreed, the lock can be initialized (if only for cleanliness) in kvm_init.

Definitely, I'm surprised why I didn't see this... :) Paolo, do you want me to
add another patch (as attached)?

-- 
Peter Xu

--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0001-qemu-thread-Assert-and-check-mutex-re-initialize.patch"

From 0cb7124d111426f255113814cb8395620276cc1f Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Mon, 22 Mar 2021 12:25:18 -0400
Subject: [PATCH] qemu-thread: Assert and check mutex re-initialize

qemu_mutex_post_init() sets mutex->initialized but not check it yet.  Add it,
so as to detect re-initialization of mutexes.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 util/qemu-thread-common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/util/qemu-thread-common.h b/util/qemu-thread-common.h
index 2af6b120853..e02059845d8 100644
--- a/util/qemu-thread-common.h
+++ b/util/qemu-thread-common.h
@@ -15,6 +15,7 @@
 
 #include "qemu/thread.h"
 #include "trace.h"
+#include <assert.h>
 
 static inline void qemu_mutex_post_init(QemuMutex *mutex)
 {
@@ -22,6 +23,7 @@ static inline void qemu_mutex_post_init(QemuMutex *mutex)
     mutex->file = NULL;
     mutex->line = 0;
 #endif
+    assert(!mutex->initialized);
     mutex->initialized = true;
 }
 
-- 
2.26.2


--jI8keyz6grp/JLjh--


