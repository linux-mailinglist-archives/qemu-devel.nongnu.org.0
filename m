Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 599F64032EB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 05:30:45 +0200 (CEST)
Received: from localhost ([::1]:38046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNoIO-0007Ub-Co
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 23:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mNoC6-0002D5-5U
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 23:24:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mNoC1-00028g-EF
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 23:24:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631071448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vDvTW8BHLBkCx6V3XUr11hj8c7IOJHaqQ/zxtHLMNaI=;
 b=coIva0w1AwuBFRTMw16m4/T5sUSv4haHIjiWUS1SiFdODFgv1MjoDXQil8lpu96EEwOpSX
 552NOMDFNfi0Ss9wq0Q5QxLC1OsEf+N5aHraPt/Sv6sksqIdbie9NVsXnRTvHnDSV+4od0
 b1hg9fSwQ7UFMoFEo4KwWiYu8kXaWYg=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-ysL2KJ44N-SMloXj4CThhg-1; Tue, 07 Sep 2021 23:24:07 -0400
X-MC-Unique: ysL2KJ44N-SMloXj4CThhg-1
Received: by mail-io1-f71.google.com with SMTP id
 d23-20020a056602281700b005b5b34670c7so784595ioe.12
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 20:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vDvTW8BHLBkCx6V3XUr11hj8c7IOJHaqQ/zxtHLMNaI=;
 b=EIeT0BVbLhbhATjhMn9o3TGUtY7FPb/YmBakFuRwqanxdq4QRW/0nJ5EIwmTYgalrr
 0Rr7/q/xK8XbW9dPPFgpLl9VjKYNwIKcnE2zyPyD965MzjxabZWkpiXHwno2MrcJ5PzM
 4OCQ5eokWtoi3obkJA9WL3HS1NWycYG6oFkELGs6N1fzwt86myUmZRIxwbgZTBFhSQbE
 KUR9MmcWPkG5LvPFrUrszK/BmLECpaex6zKUJD2PtVWDO8Q/q/br++HwTswqaXK80tx+
 eZMRvQEsE7oOhrZf/q1Q5+2T8TQ+y5tkujz8RsnDf/MSYVpjYp2z38vs+5z1MM/4HE8G
 M4yA==
X-Gm-Message-State: AOAM533/MQJnBDjACFOqAxImjLpIDe+GOHBKvhAck9ah9z5b6YpaPfri
 Eudv+ExHqdztkSa0fgm79OOF9T3NhkMjg5wM6DI5kWqthCkOTo2I151LZzU6etbSR2D5Wwfzi5A
 87ICg9OzSLNXNoDQ=
X-Received: by 2002:a92:444e:: with SMTP id a14mr1247750ilm.152.1631071446602; 
 Tue, 07 Sep 2021 20:24:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHcaM7iz2vbITrwyPOz2s7ReVOEEHiT/afUjD7cVonq3sGB4r4t3hgMTJ8HfQEl6PGW5mXAA==
X-Received: by 2002:a92:444e:: with SMTP id a14mr1247727ilm.152.1631071446387; 
 Tue, 07 Sep 2021 20:24:06 -0700 (PDT)
Received: from xz-m1.local ([2607:fea8:56a3:500:f917:5e1f:6e63:74cd])
 by smtp.gmail.com with ESMTPSA id g12sm470422iok.32.2021.09.07.20.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 20:24:05 -0700 (PDT)
Date: Tue, 7 Sep 2021 23:24:03 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v1 3/3] migration: multifd: Enable zerocopy
Message-ID: <YTgs08NlzFlnzXsH@xz-m1.local>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com>
 <YS4rulGV9eueB04H@redhat.com>
 <CAJ6HWG5cH_33GDTo_v=8zZDZMJNf4k5+Y79Pt1A_7LmxXBx9bQ@mail.gmail.com>
 <YTewN8JZLbpL1Gcf@t490s>
 <CACGkMEuH+Ndh3cckaGfsit=uOLQ=gk39xptGm8bhPWWMzxEDJg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEuH+Ndh3cckaGfsit=uOLQ=gk39xptGm8bhPWWMzxEDJg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Leonardo Bras Soares Passos <leobras@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Jagannathan Raman <jag.raman@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 10:59:57AM +0800, Jason Wang wrote:
> On Wed, Sep 8, 2021 at 2:32 AM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Thu, Sep 02, 2021 at 04:22:55AM -0300, Leonardo Bras Soares Passos wrote:
> > > > I don't think it is valid to unconditionally enable this feature due to the
> > > > resource usage implications
> > > >
> > > > https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html
> > > >
> > > >   "A zerocopy failure will return -1 with errno ENOBUFS. This happens
> > > >    if the socket option was not set, the socket exceeds its optmem
> > > >    limit or the user exceeds its ulimit on locked pages."
> > >
> > > You are correct, I unfortunately missed this part in the docs :(
> > >
> > > > The limit on locked pages is something that looks very likely to be
> > > > exceeded unless you happen to be running a QEMU config that already
> > > > implies locked memory (eg PCI assignment)
> > >
> > > Do you mean the limit an user has on locking memory?
> > >
> > > If so, that makes sense. I remember I needed to set the upper limit of locked
> > > memory for the user before using it, or adding a capability to qemu before.
> >
> > So I'm a bit confused on why MSG_ZEROCOPY requires checking RLIMIT_MEMLOCK.
> >
> > The thing is IIUC that's accounting for pinned pages only with either mlock()
> > (FOLL_MLOCK) or vfio (FOLL_PIN).
> >
> > I don't really think MSG_ZEROCOPY is doing that at all...  I'm looking at
> > __zerocopy_sg_from_iter() -> iov_iter_get_pages().
> 
> It happens probably here:
> 
> E.g
> 
> __ip_append_data()
>     msg_zerocopy_realloc()
>         mm_account_pinned_pages()

Right. :)

But my previous question is more about the reason behind it - I thought that's
a common GUP and it shouldn't rely on locked_vm because it should still be
temporary GUP rather than a long time GUP, IMHO that's how we use locked_vm (we
don't account for temp GUPs but only longterm ones). IOW, I'm wondering whether
all the rest of iov_iter_get_pages() callers should check locked_vm too, and
AFAIU they're not doing that right now..

Thanks,

-- 
Peter Xu


