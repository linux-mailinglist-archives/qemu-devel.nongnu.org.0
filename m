Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B373B2DC81A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 22:03:56 +0100 (CET)
Received: from localhost ([::1]:53170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpdxj-0008Q6-AA
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 16:03:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kpdwS-0007wJ-Nz
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 16:02:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kpdwP-000694-4u
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 16:02:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608152551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=huYyzdAPAQh58+2K0R1Kz/Pcb6/QRJMuqbnB76c34Qo=;
 b=a/fVN2ToROaDZ2Ki8AJ94LFbz2XwfuQ8adNmAc90hf4IAau3ZXcO/sfdBKD7nk7r6zMyHz
 bhteHVsS8HVsvIAniqoRUhLCa9XuKSULx3jgs5wBSk3YSRcMoTm6QbjXup1xRECUZbKO81
 LcY+dTF6m+g66zQGhROO1RsB3vakblM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-2YDto8EZOfei6trOBT29ZQ-1; Wed, 16 Dec 2020 16:02:30 -0500
X-MC-Unique: 2YDto8EZOfei6trOBT29ZQ-1
Received: by mail-qt1-f200.google.com with SMTP id f33so18913664qtb.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 13:02:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=huYyzdAPAQh58+2K0R1Kz/Pcb6/QRJMuqbnB76c34Qo=;
 b=e4liahiThGRT3n7VqxaiDeC3uT4EIYMg1xgmGjWHfQDqEOVxdQP96lm/hMMOfOS7+u
 gZbPMa4QxhWCxnc1vKhadsLfK9RacwTw5Vqfi8rHu5WkKfkt9aLcMF8zQc+BgWnJWccp
 cTk7coOJ0D0ciQNII1UYpikiMJEfYZrRBmhG/qstLGK++oqDWqnr7dPU78vQsM2bio1f
 +HZ7ux+Rh4aoMXT5k7mm2x9uEv2TsMtGKGRLNKdKUyN2cU4M4wqYyCcRpGAfPzSL8TnS
 bBBBl3NS1COxBTmo+AQ9DfSGCkzkd099Vh28YQ2Xdf+dClhkzIXzZ2kgPZ9WfFSo7c6C
 hS0A==
X-Gm-Message-State: AOAM5337nbWwMVEvDSUBd7nttvVjRzYTHx8GtOkAcba2dATu6SMDo4kG
 5HUIHWtvU3I/sDslpcAcIxBhL4Lx5eJeEaDU0xj7SNLb8aPAnYAH2TI0fD9Wmo2ZP2EcjBlefVn
 97BaZbr0VLQfYjeM=
X-Received: by 2002:ac8:36a3:: with SMTP id a32mr46546485qtc.90.1608152549485; 
 Wed, 16 Dec 2020 13:02:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0juKJtf4PmKStm6xqCoWo+oqQhAYkZPs2+DdB9gbJluI++f/tXi9RH9u9YMFgZq0KxHxY6Q==
X-Received: by 2002:ac8:36a3:: with SMTP id a32mr46546456qtc.90.1608152549219; 
 Wed, 16 Dec 2020 13:02:29 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id j124sm1932693qkf.113.2020.12.16.13.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 13:02:28 -0800 (PST)
Date: Wed, 16 Dec 2020 16:02:26 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v6 0/4] migration: UFFD write-tracking migration/snapshots
Message-ID: <20201216210226.GB39844@xz-x1>
References: <20201209100811.190316-1-andrey.gruzdev@virtuozzo.com>
 <3f19b8d2-0b4b-95e3-8a1f-a1cfe791a4e1@virtuozzo.com>
 <20201211150940.GC6520@xz-x1>
 <2a1f164c-94ab-0d35-96c0-792524d9ef30@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <2a1f164c-94ab-0d35-96c0-792524d9ef30@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 15, 2020 at 10:53:13PM +0300, Andrey Gruzdev wrote:
> First are series of runs without scan-rate-limiting.patch.
> Windows 10:
> 
>      msecs               : count     distribution
>          0 -> 1          : 131913   |****************************************|
>          2 -> 3          : 106      |                                        |
>          4 -> 7          : 362      |                                        |
>          8 -> 15         : 619      |                                        |
>         16 -> 31         : 28       |                                        |
>         32 -> 63         : 1        |                                        |
>         64 -> 127        : 2        |                                        |
> 
> 
>      msecs               : count     distribution
>          0 -> 1          : 199273   |****************************************|
>          2 -> 3          : 190      |                                        |
>          4 -> 7          : 425      |                                        |
>          8 -> 15         : 927      |                                        |
>         16 -> 31         : 69       |                                        |
>         32 -> 63         : 3        |                                        |
>         64 -> 127        : 16       |                                        |
>        128 -> 255        : 2        |                                        |
> 
> Ubuntu 20.04:
> 
>      msecs               : count     distribution
>          0 -> 1          : 104954   |****************************************|
>          2 -> 3          : 9        |                                        |
> 
>      msecs               : count     distribution
>          0 -> 1          : 147159   |****************************************|
>          2 -> 3          : 13       |                                        |
>          4 -> 7          : 0        |                                        |
>          8 -> 15         : 0        |                                        |
>         16 -> 31         : 0        |                                        |
>         32 -> 63         : 0        |                                        |
>         64 -> 127        : 1        |                                        |
> 
> 
> Here are runs with scan-rate-limiting.patch.
> Windows 10:
> 
>      msecs               : count     distribution
>          0 -> 1          : 234492   |****************************************|
>          2 -> 3          : 66       |                                        |
>          4 -> 7          : 219      |                                        |
>          8 -> 15         : 109      |                                        |
>         16 -> 31         : 0        |                                        |
>         32 -> 63         : 0        |                                        |
>         64 -> 127        : 1        |                                        |
> 
>      msecs               : count     distribution
>          0 -> 1          : 183171   |****************************************|
>          2 -> 3          : 109      |                                        |
>          4 -> 7          : 281      |                                        |
>          8 -> 15         : 444      |                                        |
>         16 -> 31         : 3        |                                        |
>         32 -> 63         : 1        |                                        |
> 
> Ubuntu 20.04:
> 
>      msecs               : count     distribution
>          0 -> 1          : 92224    |****************************************|
>          2 -> 3          : 9        |                                        |
>          4 -> 7          : 0        |                                        |
>          8 -> 15         : 0        |                                        |
>         16 -> 31         : 1        |                                        |
>         32 -> 63         : 0        |                                        |
>         64 -> 127        : 1        |                                        |
> 
>      msecs               : count     distribution
>          0 -> 1          : 97021    |****************************************|
>          2 -> 3          : 7        |                                        |
>          4 -> 7          : 0        |                                        |
>          8 -> 15         : 0        |                                        |
>         16 -> 31         : 0        |                                        |
>         32 -> 63         : 0        |                                        |
>         64 -> 127        : 0        |                                        |
>        128 -> 255        : 1        |                                        |
> 
> So, initial variant of rate-limiting makes some positive effect, but not very
> noticible. Interesting is the case of Windows guest, why the difference is so large,
> compared to Linux. The reason (theoretically) might be some of virtio or QXL drivers,
> hard to say. At least Windows VM has been configured with a set of Hyper-V
> enlightments, there's nothing to improve in domain config.
> 
> For Linux guests latencies are good enough without any additional efforts.

Interesting...

> 
> Also, I've missed some code to deal with snapshotting of suspended guest, so I'll made
> v7 series with the fix and also try to add more effective solution to reduce millisecond-grade
> latencies.
> 
> And yes, I've used bpftrace-like tool - BCC from iovisor with python frontend. Seems a bit more
> friendly then bpftrace.

Do you think it's a good idea to also include your measurement script when
posting v7?  It could be a well fit for scripts/, I think.

Seems 6.0 dev window is open; hopefully Dave or Juan would have time to look at
this series soon.

Thanks,

-- 
Peter Xu


