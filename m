Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4958A2D78D9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:12:12 +0100 (CET)
Received: from localhost ([::1]:33810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knk5b-0005ks-18
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:12:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1knk3L-0004Aa-HV
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:09:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1knk3G-0000Y1-Jx
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:09:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607699385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8aRwaiUmW/i/Vcul3m7aFoGLwlsjZRwKJTzFcR9h7Jk=;
 b=X1RxvHdwWuK8gfRPcQRDhxwy3Q0fAN2dHVzE+n/sibaXlhmxMU0MBhempMJ6oFUhyX5Uce
 VLIjQMKQbo+mpLrUkziuAh36hHUr8Yr51Ze1Glisw+lH6oTU23A104sQ8qsX2Lbh/1O7+Y
 b8dAbXdDVp1imO70ecDVRSifoMygCjg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-PhQLnDPhPmO_6oQw8YorOQ-1; Fri, 11 Dec 2020 10:09:43 -0500
X-MC-Unique: PhQLnDPhPmO_6oQw8YorOQ-1
Received: by mail-qt1-f197.google.com with SMTP id z43so6751538qtb.0
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 07:09:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8aRwaiUmW/i/Vcul3m7aFoGLwlsjZRwKJTzFcR9h7Jk=;
 b=A+yVkej2sqf2SUwIypejC8sj15qMcA1jPSYOQD89tgwKn5j1FZxjqcEwHQmWEdMbmP
 VfkmsAMyWL/gj4GyGcRkON85Hdh+PFheqmfrB0ykk7hI8wIpLbTJIwQOLWmgkFGGA515
 fRinVqITJq/VKihlt0+GZrtfqf5gDDOvqmiGHwnso4mGiHbdSdvb1YLzVoPRrgQLzTEu
 wv1Wmm2IMVsI5iNFZ3JC5ZT9aIIU5vKxjOk0ThGJge2Cx68muGgYz6ce+JG7wmHRoQci
 SffkgjXYSgMx+AznsBfLhzTr0VDHg7ibSBvtdbvcFglpNo5hT6MsPMN008Q5zu5V/ohp
 S+Yw==
X-Gm-Message-State: AOAM530OitNjODPL7rXWgPRTAUpICWNheeXRP3TRmGKusQUk0pPnK7Nl
 4bwnZ2BkFCbcD1NU1gOqdD0RbOP/blnzmc4gFbrgCE1iH6HZAwQSL+dNbkk+zY0R/GHtieJoLQ1
 0PLw2XwM01xd90AA=
X-Received: by 2002:a37:5242:: with SMTP id g63mr16281821qkb.317.1607699383221; 
 Fri, 11 Dec 2020 07:09:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzl7rnqkYM2alV0l4dr6DPT+cNU1Y8YJhkeK9t+T4bfLZqJUPhnokcEBDzDebv88xiynIjPlw==
X-Received: by 2002:a37:5242:: with SMTP id g63mr16281784qkb.317.1607699382930; 
 Fri, 11 Dec 2020 07:09:42 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id o21sm6207814qko.9.2020.12.11.07.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 07:09:41 -0800 (PST)
Date: Fri, 11 Dec 2020 10:09:40 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v6 0/4] migration: UFFD write-tracking migration/snapshots
Message-ID: <20201211150940.GC6520@xz-x1>
References: <20201209100811.190316-1-andrey.gruzdev@virtuozzo.com>
 <3f19b8d2-0b4b-95e3-8a1f-a1cfe791a4e1@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <3f19b8d2-0b4b-95e3-8a1f-a1cfe791a4e1@virtuozzo.com>
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

On Fri, Dec 11, 2020 at 04:13:02PM +0300, Andrey Gruzdev wrote:
> I've also made wr-fault resolution latency measurements, for the case when migration
> stream is dumped to a file in cached mode.. Should approximately match saving to the
> file fd directly though I used 'migrate exec:<>' using a hand-written tool.
> 
> VM config is 6 vCPUs + 16GB RAM, qcow2 image on Seagate 7200.11 series 1.5TB HDD,
> snapshot goes to the same disk. Guest is Windows 10.
> 
> The test scenario is playing full-HD youtube video in Firefox while saving snapshot.
> 
> Latency measurement begin/end points are fs/userfaultfd.c:handle_userfault() and
> mm/userfaultfd.c:mwriteprotect_range(), respectively. For any faulting page, the
> oldest wr-fault timestamp is accounted.
> 
> The whole time to take snapshot was ~30secs, file size is around 3GB.
> So far seems to be not a very bad picture.. However 16-255msecs range is worrying
> me a bit, seems it causes audio backend buffer underflows sometimes.
> 
> 
>      msecs               : count     distribution
>          0 -> 1          : 111755   |****************************************|
>          2 -> 3          : 52       |                                        |
>          4 -> 7          : 105      |                                        |
>          8 -> 15         : 428      |                                        |
>         16 -> 31         : 335      |                                        |
>         32 -> 63         : 4        |                                        |
>         64 -> 127        : 8        |                                        |
>        128 -> 255        : 5        |                                        |

Great test!  Thanks for sharing these information.

Yes it's good enough for a 1st version, so it's already better than
functionally work. :)

So did you try your last previous patch to see whether it could improve in some
way?  Again we can gradually optimize upon your current work.

Btw, you reminded me that why not we track all these from kernel? :) That's a
good idea.  So, how did you trace it yourself?  Something like below should
work with bpftrace, but I feel like you were done in some other way, so just
fyi:

        # cat latency.bpf
        kprobe:handle_userfault
        {
                @start[tid] = nsecs;
        }

        kretprobe:handle_userfault
        {
                if (@start[tid]) {
                        $delay = nsecs - @start[tid];
                        delete(@start[tid]);
                        @delay_us = hist($delay / 1000);
                }
        }
        # bpftrace latency.bpf

Tracing return of handle_userfault() could be more accurate in that it also
takes the latency between UFFDIO_WRITEPROTECT until vcpu got waked up again.
However it's inaccurate because after a recent change to this code path in
commit f9bf352224d7 ("userfaultfd: simplify fault handling", 2020-08-03)
handle_userfault() could return even before page fault resolved.  However it
should be good enough in most cases because even if it happens, it'll fault
into handle_userfault() again, then we just got one more count.

Thanks!

-- 
Peter Xu


