Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABF6403C6A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:20:55 +0200 (CEST)
Received: from localhost ([::1]:51146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzNe-0001cD-A8
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mNzM4-0000lx-3Z
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:19:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mNzM1-0006tD-6h
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:19:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631114352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8IpePUycnd9T2UnmC+qGDa3NT/TDw009Sb2Rd/G4H3o=;
 b=ONrVwK+WRtQyhB05hjq1IAJYn4Kd76/adLLv7tCjwlaJcydRbx7Y5CBttKy5a24Gru2wP2
 XaQ3NAkV4v0+akT1iV/CKcEma41O/QM70z7Of1KxaaTBSBwHcKZRxna7nYzxLzr7iT5Cp0
 mzUBXukzXmJhxShBGg60gOYtpuAC0Zg=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-1bikecVhMvaQLvkX22NBlQ-1; Wed, 08 Sep 2021 11:19:11 -0400
X-MC-Unique: 1bikecVhMvaQLvkX22NBlQ-1
Received: by mail-il1-f198.google.com with SMTP id
 r5-20020a92d985000000b002246fb2807cso1839788iln.18
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 08:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8IpePUycnd9T2UnmC+qGDa3NT/TDw009Sb2Rd/G4H3o=;
 b=amgz+ziuop6PgrseV4PCh3n4zJ5i0hf8eUH4VCSdZH10CV0caX4zlWEuMVLACVkzET
 QUOBBHvG8VCh96zpg3+fgt7kMdc9sBJYc641cqjVBMh2TmiHBOUYYyJ64mQcYni7VPop
 ybcggRtwrfNHDHMpaRZAI14SxirtJcHakQ9aPi7zIcIZ+YUfCgIE11Bx4OusHv5kW8Sg
 NPftWuDj4rmj/nGmbzmd0xqwTB8njAjNYv3gmcN8WacbhVEqXu/WrlP7CSINy2MpWsxf
 wsLxqSC4L1s0TTu0Ws1kXWglJTZga5NhFWldwaG+aMLjq0J//G30AkxgbJqgno5/fVKn
 Kp0A==
X-Gm-Message-State: AOAM530wQQDJhBDct4r813ft8HHNLJcN06hggg5NxqqfMTXIhdGgqOBh
 G+icQ1I/BBVBA2LlQRQw3p3FUaLIhF1WmBZ2MeJI07nEkH5JDUL+gIFb2OcSdF8w0j/euq1urR/
 0UXaXPW8QT0GLnys=
X-Received: by 2002:a92:690d:: with SMTP id e13mr294522ilc.284.1631114350136; 
 Wed, 08 Sep 2021 08:19:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDwK+8XQKHdvCgyPHqfZwqLy11qknG6xsNz4k8+BnhcmTI9RY3N/aBIgHJM5n9gU9SQlXe8g==
X-Received: by 2002:a92:690d:: with SMTP id e13mr294508ilc.284.1631114349920; 
 Wed, 08 Sep 2021 08:19:09 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id e13sm1291951iod.36.2021.09.08.08.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 08:19:09 -0700 (PDT)
Date: Wed, 8 Sep 2021 11:19:07 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v1 3/3] migration: multifd: Enable zerocopy
Message-ID: <YTjUa5DuqE9RU0ZF@t490s>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com>
 <YS4rulGV9eueB04H@redhat.com>
 <CAJ6HWG5cH_33GDTo_v=8zZDZMJNf4k5+Y79Pt1A_7LmxXBx9bQ@mail.gmail.com>
 <YTewN8JZLbpL1Gcf@t490s>
 <CACGkMEuH+Ndh3cckaGfsit=uOLQ=gk39xptGm8bhPWWMzxEDJg@mail.gmail.com>
 <YThyDzq+fiBW75Q/@work-vm>
MIME-Version: 1.0
In-Reply-To: <YThyDzq+fiBW75Q/@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.393, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Leonardo Bras Soares Passos <leobras@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Jagannathan Raman <jag.raman@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 09:19:27AM +0100, Dr. David Alan Gilbert wrote:
> * Jason Wang (jasowang@redhat.com) wrote:
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
> When do they get uncounted?  i.e. is it just the data that's in flight
> that's marked as pinned?

I think so - there's __msg_zerocopy_callback() -> mm_unaccount_pinned_pages()
correspondingly.  Thanks,

-- 
Peter Xu


