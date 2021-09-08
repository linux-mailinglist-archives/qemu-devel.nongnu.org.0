Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8618F4032CA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 05:02:07 +0200 (CEST)
Received: from localhost ([::1]:49390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNnqg-0003Tn-25
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 23:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mNnou-0002am-4I
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 23:00:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mNnor-0007NL-Ci
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 23:00:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631070012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MByo7lqNgjr+I8VLjzify++5Lk1d6EEQb6kbeNlONhE=;
 b=A1RKGSfUCrOhfymZSgfsIr8Fs/s5fNyq6WQ719y73DWATFGNgTYhjlKkxyOiWsbQdZV4Ag
 LKZIGFgTTO+HzRsoBe9wyRoxwvarmEEmraEJ7ZsUp32v2JdRJ96LCZWvGtZsC/zaAzDtZ1
 SXk5UjBAEu/NpCewyXmKQX3Igi7Ucgg=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-A0GPYbO2OhyM_frZ7je48g-1; Tue, 07 Sep 2021 23:00:09 -0400
X-MC-Unique: A0GPYbO2OhyM_frZ7je48g-1
Received: by mail-yb1-f197.google.com with SMTP id
 131-20020a251489000000b0059bdeb10a84so759050ybu.15
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 20:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MByo7lqNgjr+I8VLjzify++5Lk1d6EEQb6kbeNlONhE=;
 b=gwYLUQtXpLTl62vE/TyRjXXsOn5xKTS7yj2SutQwg7FT03GzWznxo2E0K6Ql6d6JVO
 p8Wd3IqZHsFFsGaZTYaR3tYgQhJcG5ImpBOqf/ntCz3il3Fu9ZZcfei2NvaSsixhKVsd
 SaaedhU22mjNXa2yVvnw2TevJd9VRuoDUVG/NqTwbITZ8HxNhM4FBD7CogMfYjEyq/8t
 MN00lTErbusb6ewULZSCwwNjcjepp4hW0OUsqTUUU91Pu7tQfy4PxzH3lnKmrTtj90cq
 nzx54s0iJ2ND5eRQ9cjHxCCeMiv1B9KkgcypjsTFiKRd1iPmqVm51OEg441lqtpjyF+9
 Xv5Q==
X-Gm-Message-State: AOAM532c1aLr240JqmOKwXxQ/TizccJl2CjyJWbOglUb5n6kgmF2Ffve
 IxfQ3DRHqBR7Ig2z05MmUuKkA7A57c+i1IYc6H3DgGysGHzDQHVXB5DmciACPDxZwTMwWpLVFC4
 MmMHUIO3b/BUkj0O9rf71ban2JAzqCJ4=
X-Received: by 2002:a25:ac7:: with SMTP id 190mr2048948ybk.260.1631070008530; 
 Tue, 07 Sep 2021 20:00:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhhlFYCXmYmEyyhAKK/Uy4m4rRMPdPKL7bJ6Zo9TJvQMwvIma/KkUAARTJvlP2VODYzxTGV2hRhT8gGb5d2Vw=
X-Received: by 2002:a25:ac7:: with SMTP id 190mr2048931ybk.260.1631070008281; 
 Tue, 07 Sep 2021 20:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com>
 <YS4rulGV9eueB04H@redhat.com>
 <CAJ6HWG5cH_33GDTo_v=8zZDZMJNf4k5+Y79Pt1A_7LmxXBx9bQ@mail.gmail.com>
 <YTewN8JZLbpL1Gcf@t490s>
In-Reply-To: <YTewN8JZLbpL1Gcf@t490s>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 8 Sep 2021 10:59:57 +0800
Message-ID: <CACGkMEuH+Ndh3cckaGfsit=uOLQ=gk39xptGm8bhPWWMzxEDJg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] migration: multifd: Enable zerocopy
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Wed, Sep 8, 2021 at 2:32 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Thu, Sep 02, 2021 at 04:22:55AM -0300, Leonardo Bras Soares Passos wrote:
> > > I don't think it is valid to unconditionally enable this feature due to the
> > > resource usage implications
> > >
> > > https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html
> > >
> > >   "A zerocopy failure will return -1 with errno ENOBUFS. This happens
> > >    if the socket option was not set, the socket exceeds its optmem
> > >    limit or the user exceeds its ulimit on locked pages."
> >
> > You are correct, I unfortunately missed this part in the docs :(
> >
> > > The limit on locked pages is something that looks very likely to be
> > > exceeded unless you happen to be running a QEMU config that already
> > > implies locked memory (eg PCI assignment)
> >
> > Do you mean the limit an user has on locking memory?
> >
> > If so, that makes sense. I remember I needed to set the upper limit of locked
> > memory for the user before using it, or adding a capability to qemu before.
>
> So I'm a bit confused on why MSG_ZEROCOPY requires checking RLIMIT_MEMLOCK.
>
> The thing is IIUC that's accounting for pinned pages only with either mlock()
> (FOLL_MLOCK) or vfio (FOLL_PIN).
>
> I don't really think MSG_ZEROCOPY is doing that at all...  I'm looking at
> __zerocopy_sg_from_iter() -> iov_iter_get_pages().

It happens probably here:

E.g

__ip_append_data()
    msg_zerocopy_realloc()
        mm_account_pinned_pages()

Thanks

>
> Say, I think there're plenty of iov_iter_get_pages() callers and normal GUPs, I
> think most of them do no need such accountings.
>
> --
> Peter Xu
>


