Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361194032EC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 05:32:01 +0200 (CEST)
Received: from localhost ([::1]:40920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNoJc-00012a-8q
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 23:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mNoEU-0004hB-VT
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 23:26:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mNoER-0004g1-VZ
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 23:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631071598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hnKoI6cp1QJAs0ChyRvdHqGPuT+uHEFcveZqYISKPI8=;
 b=Y6Qnv32sFFJEhapoTp3qK1ui2SeFeGza3emUj0FYrbddwgweQ00vRktSDpq8w42Q7wA3i0
 KYPFLiIuJ0pMYZk3Xez/1LpVm1KYcf1xC6VUwm1LN49G1HnA3SrlMiwspDZcOMo+BPrQBH
 P1Ql0o4eFR+FpG4ltboAeHKPfupvs8w=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-QE4_7otTPPinZm59R9FE-g-1; Tue, 07 Sep 2021 23:26:37 -0400
X-MC-Unique: QE4_7otTPPinZm59R9FE-g-1
Received: by mail-yb1-f198.google.com with SMTP id
 b84-20020a253457000000b0059e6b730d45so857659yba.6
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 20:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hnKoI6cp1QJAs0ChyRvdHqGPuT+uHEFcveZqYISKPI8=;
 b=MLuPyNMe/HP3ubkT3w/RnMSi3Wql/cYnjwxSosQaCgEQSnRqt1uAP7L6jlwetHDKAE
 SjdaVsaw+uCqw1jWuMWwB9jyHbJzfGz77vXxDawzwAHl8Rx7+di5wZNPqKDCQJYLNVFM
 dv8J/3yglDRygfcoVVtURPoydTuWl3GKYgrZ6X73oWq3mbcNBbvkG0E+tJqQWc/1WSZW
 /cFjtZBcNp4TAfeRf88ZZuwmv7AQzctFaSeXtb7sv1D/JxBv3cy1YYS125hguP3QRCNr
 Ca3BRhDikfwiLcOmy5U/z4LoBO/YJPTQpyLxI2Jyx8WRWnIJyi1VnnwPVtASq9Uh0Gwm
 yS1A==
X-Gm-Message-State: AOAM533a30xkmYn8N+HSg/6HF7NPO8osikPQy9hecQt7bHjV7LgsPQFZ
 lreeYPojMKH8ZHaVnciNmWdJFNuohWaLsde8lV+LcjGvB2p959Xo1di+G9Ik71yhWTPrK8GBLHd
 MTVvCZIjcPoz4vjWFe+qjWEk6UC83RD8=
X-Received: by 2002:a25:b98b:: with SMTP id r11mr2097927ybg.189.1631071596727; 
 Tue, 07 Sep 2021 20:26:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy7f3On/wQ+m2cjdGx0Z6oxp5XQPU/2r3cUGI8tNyW6lTbO6G1IghRH6E+lluXn8//TCdK58sCdxq0JdAS29Y=
X-Received: by 2002:a25:b98b:: with SMTP id r11mr2097912ybg.189.1631071596520; 
 Tue, 07 Sep 2021 20:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com>
 <YS4rulGV9eueB04H@redhat.com>
 <CAJ6HWG5cH_33GDTo_v=8zZDZMJNf4k5+Y79Pt1A_7LmxXBx9bQ@mail.gmail.com>
 <YTewN8JZLbpL1Gcf@t490s>
 <CACGkMEuH+Ndh3cckaGfsit=uOLQ=gk39xptGm8bhPWWMzxEDJg@mail.gmail.com>
 <YTgs08NlzFlnzXsH@xz-m1.local>
In-Reply-To: <YTgs08NlzFlnzXsH@xz-m1.local>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 8 Sep 2021 11:26:25 +0800
Message-ID: <CACGkMEthN+onLg3u=DceUmE61o86BuADSOGttthEVE5PzLtL7Q@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] migration: multifd: Enable zerocopy
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
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
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Leonardo Bras Soares Passos <leobras@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Jagannathan Raman <jag.raman@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 8, 2021 at 11:24 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Sep 08, 2021 at 10:59:57AM +0800, Jason Wang wrote:
> > On Wed, Sep 8, 2021 at 2:32 AM Peter Xu <peterx@redhat.com> wrote:
> > >
> > > On Thu, Sep 02, 2021 at 04:22:55AM -0300, Leonardo Bras Soares Passos wrote:
> > > > > I don't think it is valid to unconditionally enable this feature due to the
> > > > > resource usage implications
> > > > >
> > > > > https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html
> > > > >
> > > > >   "A zerocopy failure will return -1 with errno ENOBUFS. This happens
> > > > >    if the socket option was not set, the socket exceeds its optmem
> > > > >    limit or the user exceeds its ulimit on locked pages."
> > > >
> > > > You are correct, I unfortunately missed this part in the docs :(
> > > >
> > > > > The limit on locked pages is something that looks very likely to be
> > > > > exceeded unless you happen to be running a QEMU config that already
> > > > > implies locked memory (eg PCI assignment)
> > > >
> > > > Do you mean the limit an user has on locking memory?
> > > >
> > > > If so, that makes sense. I remember I needed to set the upper limit of locked
> > > > memory for the user before using it, or adding a capability to qemu before.
> > >
> > > So I'm a bit confused on why MSG_ZEROCOPY requires checking RLIMIT_MEMLOCK.
> > >
> > > The thing is IIUC that's accounting for pinned pages only with either mlock()
> > > (FOLL_MLOCK) or vfio (FOLL_PIN).
> > >
> > > I don't really think MSG_ZEROCOPY is doing that at all...  I'm looking at
> > > __zerocopy_sg_from_iter() -> iov_iter_get_pages().
> >
> > It happens probably here:
> >
> > E.g
> >
> > __ip_append_data()
> >     msg_zerocopy_realloc()
> >         mm_account_pinned_pages()
>
> Right. :)
>
> But my previous question is more about the reason behind it - I thought that's
> a common GUP and it shouldn't rely on locked_vm because it should still be
> temporary GUP rather than a long time GUP, IMHO that's how we use locked_vm (we
> don't account for temp GUPs but only longterm ones). IOW, I'm wondering whether
> all the rest of iov_iter_get_pages() callers should check locked_vm too, and
> AFAIU they're not doing that right now..

You are probably right, but I'm not sure if it's too late to fix that.
(E.g it will break existing userspace)

Thanks

>
> Thanks,
>
> --
> Peter Xu
>


