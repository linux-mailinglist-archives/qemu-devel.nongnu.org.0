Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4044035FE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 10:21:05 +0200 (CEST)
Received: from localhost ([::1]:47192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNspM-0001KM-7k
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 04:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mNsnx-0000MO-Ih
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:19:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mNsnt-0007NR-OV
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631089172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=17np8mZlw4IimNZQT8p8c+yEUr2HXOT2yvTYhaaqYPE=;
 b=B6EzQFHlAwputqjSVYfq4DmOlxs2g9POoQEL3P8gafA3wbjAdbTUbQ4Da0z/O17YhjY2Uc
 iQLkd/HQULG1Wuq0ut5PgBOAuAVAbiRQR41PX/t7mMH3vFg9M6yGCpAjCr1hYwqyy+Knro
 JNFcHgeS2S3U5HBG4GUqF/XKgiD6gzQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-0Od6rjS3NwmZn4QuLBtdhw-1; Wed, 08 Sep 2021 04:19:31 -0400
X-MC-Unique: 0Od6rjS3NwmZn4QuLBtdhw-1
Received: by mail-wr1-f71.google.com with SMTP id
 v6-20020adfe4c6000000b001574f9d8336so264388wrm.15
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 01:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=17np8mZlw4IimNZQT8p8c+yEUr2HXOT2yvTYhaaqYPE=;
 b=7OJWdZkcnT6vh7Fz4SHovkL7FWHYrZU1lXka/L+AvxKe3IK4Qd8fs5qQpvBwHjhzSm
 d6K/5Yv6VH7FWr+k1uS+EvnjKPvsLKP/lVKJ/DrFl0Gul7E4G+2W564CnV59tG6nF+LI
 rXQ76xZYsgy/9SZVkbe2vgMgwcxgfEB87yJ3uOb+bU5NvpuC86dniRZY51ZNU4Q/wdCp
 3VeVx0IH5xxOIetnvAF9GS2Usp4B0axcTTGn2ubtvwdmsKfAggfublRzqVWQMkgnmzEa
 PHnt7Zot7E/hsPNWR9kFlU7V2fDM1kS4BLkaXPBF0uWQVM/vlE8jxgfBKCR33Qm8rh/3
 r4SA==
X-Gm-Message-State: AOAM530q0MwhMh+D6d9aLY4WOoLb08xqL18O+I9WmkhuSqRt7Jo24giO
 K3r/L08ARMonnVI9nsV9btHXBx3F2Kfx4k1HNaTvGe0Vha815j+G8mW9WKQLwmDXfrvfR/CEPG1
 dDuVqspDAbSYd4YA=
X-Received: by 2002:adf:80eb:: with SMTP id 98mr2581001wrl.348.1631089170662; 
 Wed, 08 Sep 2021 01:19:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXprNCVJqseTIJluh0KuLg+7aZN+ixLQNKuK8Czry1YBkg1QDfyyourk7NqSDGenjb+CR+DA==
X-Received: by 2002:adf:80eb:: with SMTP id 98mr2580964wrl.348.1631089170438; 
 Wed, 08 Sep 2021 01:19:30 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id q7sm1389294wrc.55.2021.09.08.01.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 01:19:29 -0700 (PDT)
Date: Wed, 8 Sep 2021 09:19:27 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v1 3/3] migration: multifd: Enable zerocopy
Message-ID: <YThyDzq+fiBW75Q/@work-vm>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com>
 <YS4rulGV9eueB04H@redhat.com>
 <CAJ6HWG5cH_33GDTo_v=8zZDZMJNf4k5+Y79Pt1A_7LmxXBx9bQ@mail.gmail.com>
 <YTewN8JZLbpL1Gcf@t490s>
 <CACGkMEuH+Ndh3cckaGfsit=uOLQ=gk39xptGm8bhPWWMzxEDJg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEuH+Ndh3cckaGfsit=uOLQ=gk39xptGm8bhPWWMzxEDJg@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras Soares Passos <leobras@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Jagannathan Raman <jag.raman@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Jason Wang (jasowang@redhat.com) wrote:
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

When do they get uncounted?  i.e. is it just the data that's in flight
that's marked as pinned?

Dave

> Thanks
> 
> >
> > Say, I think there're plenty of iov_iter_get_pages() callers and normal GUPs, I
> > think most of them do no need such accountings.
> >
> > --
> > Peter Xu
> >
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


