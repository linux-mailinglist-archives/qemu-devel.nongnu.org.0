Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A063334802F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:15:54 +0100 (CET)
Received: from localhost ([::1]:56276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP82r-0005uh-KX
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP7vc-0003Y0-9m
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:08:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP7vQ-0006QP-7S
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:08:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616609288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S8lGg8ZSvRdDHcuKhxzStDzkxt83SnTPFelb3b9HwFQ=;
 b=INsQoWorcBD2xwvY3vDfSmkjyOY6MD2jeZAy0afKLC+DxXhLSCpntcBbXzcM1K9X0zv0IM
 Lv5Qx5ruN/g/wSLhH9eYqWiRVDjhAaZV99hM6ywGOUAkmzpu1wsT+Udi+Losk4DZpVoqzp
 roSui4buBMIxKUtoQ3rArU7bGno/uJI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-h6f26RaLOqiW8BJeMVg8vg-1; Wed, 24 Mar 2021 14:08:06 -0400
X-MC-Unique: h6f26RaLOqiW8BJeMVg8vg-1
Received: by mail-qv1-f72.google.com with SMTP id ev19so1933582qvb.7
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S8lGg8ZSvRdDHcuKhxzStDzkxt83SnTPFelb3b9HwFQ=;
 b=b/iWk0VdBUiGyp8cWJaNlcRWghoUmCEqINA86+1r2ttpe3NlLq6vbzOupv8XpebQFl
 niSsWyh7yPNcEBXPyMH1i4RZiMq8vf5gmQwdLk7ZYk5IFI7jVz8COpLd3NuIDJAqSuiH
 kzEU/iZdPhu4H9kYZVG9c70tDBwVfDI/201tw8yaFPi35aWUxfaaSX5L+px2ciG93QTp
 8kLkZ/FxWni6pRjjbgbgWyKQSNewMtHXmV1F+1tgFxTvDPNyOtOTJI1AJqdxImJ3gmIC
 MXlFJcX+My/QXrCsE/wE6lvCntqqUO78LyFQslZ9XQS1371C8nTBJmJhwPs5hc+80ccc
 VibA==
X-Gm-Message-State: AOAM533RfFes3IIFocRQvyjVyv3t7JtTF2RWPu2s5AWA2+jt7tGJT2FT
 51hYcWtc1yJ4rl97aYpGLEF9wv3oBpFcrX//19K7KtJRSyAW3Gx8AEFWCSRurfki5nUlKWQiXpc
 +6n1o3tKP/S686Cw=
X-Received: by 2002:a37:6191:: with SMTP id v139mr4388566qkb.32.1616609285501; 
 Wed, 24 Mar 2021 11:08:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYkYTCV4Kas1FbLhg4OPAFQVyg6m4vsD8kdy0SEGyOvKzsuCqGxHSuQac6yNtWVC4PX/5ppw==
X-Received: by 2002:a37:6191:: with SMTP id v139mr4388534qkb.32.1616609285126; 
 Wed, 24 Mar 2021 11:08:05 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca.
 [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id z24sm2270979qkz.65.2021.03.24.11.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 11:08:04 -0700 (PDT)
Date: Wed, 24 Mar 2021 14:08:03 -0400
From: Peter Xu <peterx@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5 02/10] KVM: Use a big lock to replace per-kml slots_lock
Message-ID: <20210324180803.GD219069@xz-x1>
References: <20210310203301.194842-1-peterx@redhat.com>
 <20210310203301.194842-3-peterx@redhat.com>
 <71e85a52-7385-e88a-f51f-9371bc371d06@huawei.com>
 <b1f2727e-2583-6bfc-bb34-4ebd8da1216d@redhat.com>
 <20210322162754.GC16645@xz-x1>
MIME-Version: 1.0
In-Reply-To: <20210322162754.GC16645@xz-x1>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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

On Mon, Mar 22, 2021 at 12:27:54PM -0400, Peter Xu wrote:
> On Mon, Mar 22, 2021 at 02:54:30PM +0100, Paolo Bonzini wrote:
> > On 22/03/21 11:47, Keqian Zhu wrote:
> > > > +    qemu_mutex_init(&kml_slots_lock);
> > > As you said, x86 has two address spaces, is it a problem that we may have multi initialization for kml_slots_lock?
> > 
> > Agreed, the lock can be initialized (if only for cleanliness) in kvm_init.
> 
> Definitely, I'm surprised why I didn't see this... :) Paolo, do you want me to
> add another patch (as attached)?
> 
> -- 
> Peter Xu

> From 0cb7124d111426f255113814cb8395620276cc1f Mon Sep 17 00:00:00 2001
> From: Peter Xu <peterx@redhat.com>
> Date: Mon, 22 Mar 2021 12:25:18 -0400
> Subject: [PATCH] qemu-thread: Assert and check mutex re-initialize
> 
> qemu_mutex_post_init() sets mutex->initialized but not check it yet.  Add it,
> so as to detect re-initialization of mutexes.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  util/qemu-thread-common.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/util/qemu-thread-common.h b/util/qemu-thread-common.h
> index 2af6b120853..e02059845d8 100644
> --- a/util/qemu-thread-common.h
> +++ b/util/qemu-thread-common.h
> @@ -15,6 +15,7 @@
>  
>  #include "qemu/thread.h"
>  #include "trace.h"
> +#include <assert.h>
>  
>  static inline void qemu_mutex_post_init(QemuMutex *mutex)
>  {
> @@ -22,6 +23,7 @@ static inline void qemu_mutex_post_init(QemuMutex *mutex)
>      mutex->file = NULL;
>      mutex->line = 0;
>  #endif
> +    assert(!mutex->initialized);
>      mutex->initialized = true;
>  }

I got coredumps after applying this patch when make check:

#1  0x00007fce1090b895 in __GI_abort
#2  0x00007fce1090b769 in __assert_fail_base
#3  0x00007fce1091ae86 in __GI___assert_fail
#4  0x0000563e3e407248 in qemu_mutex_post_init
#5  0x0000563e3e407491 in qemu_mutex_init
#6  0x0000563e3e410ca4 in rcu_init_complete
#7  0x0000563e3e410e13 in rcu_init_child
#8  0x00007fce1096d60b in __run_fork_handlers
#9  0x00007fce109b42cc in __libc_fork
#10 0x0000563e3e3b5006 in qtest_init_without_qmp_handshake
#11 0x0000563e3e3b51a1 in qtest_init
#12 0x0000563e3e3b116b in test_acpi_one
#13 0x0000563e3e3b1264 in test_acpi_piix4_tcg
#14 0x00007fce10ebe29e in g_test_run_suite_internal
#15 0x00007fce10ebe09b in g_test_run_suite_internal
#16 0x00007fce10ebe09b in g_test_run_suite_internal
#17 0x00007fce10ebe78a in g_test_run_suite
#18 0x00007fce10ebe7a5 in g_test_run
#19 0x0000563e3e3b32b4 in main

Then I saw this commit:

    commit 21b7cf9e07e5991c57b461181cfb5bbb6fe7a9d6
    Author: Paolo Bonzini <pbonzini@redhat.com>
    Date:   Thu Mar 5 16:53:48 2015 +0100

    rcu: handle forks safely
    
    After forking, only the calling thread is duplicated in the child process.
    The call_rcu thread has to be recreated in the child.  Exploit the fact
    that only one thread exists (same as when constructors run), and just redo
    the entire initialization to ensure the threads are in the proper state.
    
    The only additional things to do are emptying the list of threads
    registered with RCU, and unlocking the lock that was taken in the prepare
    callback (implementations are allowed to fail pthread_mutex_init()
    if the mutex is still locked).

It seems we depend on the capability to have pthread_mutex_init() be able to
detect an initialized (especially locked) lock?  I didn't dig deeper yet,
instead for simplicity I'll just drop the extra assertion patch.

Thanks,

-- 
Peter Xu


