Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE02402E6F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 20:34:50 +0200 (CEST)
Received: from localhost ([::1]:49354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNfvk-0000Sb-JW
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 14:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mNftX-0007LI-7r
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:32:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mNftU-0002Ck-FX
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:32:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631039547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v/Gy6GddH8/Ma2/9BwMbKuBkZfLmwSMKT4eEZVV/X7Q=;
 b=F05dsCloHTGkFbToD8SVXM5fejhi1mUQ9i4FiQDVkzm9wDWnWtlRkcCPCm5jyLfgi9avNC
 3HArNHx4tQ7H0xxprI0FsDa7tK0+8SdUHc59DBV6anUcgIZxqDVOFwd5PE+/7pcvZZ4Eyy
 R0SnvyPMG9jjY6hvJ9EP0L4zilEKQD4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-LH2cmUBbNAuzPPDwopmDnQ-1; Tue, 07 Sep 2021 14:32:26 -0400
X-MC-Unique: LH2cmUBbNAuzPPDwopmDnQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 13-20020ac8560d000000b0029f69548889so321500qtr.3
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 11:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v/Gy6GddH8/Ma2/9BwMbKuBkZfLmwSMKT4eEZVV/X7Q=;
 b=hPB9yyPVeXkUfd5kvDj29nq9m8wv4HUQeTJw8rFpdVzZQVHghlvDtP+IbwZXb+9Q7R
 BMiEYgxBJ3pr3925ex4X8+gjHeNIdydEawB46t+1Q3aNxhn2Sdlij5n+I98AFqg7PRNL
 SdbXgYmd1nFmFMV3Tx5MI2YyVmD4z+xtbLPXi57qmrpEA0PEjogf3+H7vswlPRy1R/Zv
 yYiH0NnFtXzxJp6N8utH16lg/S98ARHJIW2y7+GXQM7nZc26cePDMbFm79OZorodnb6N
 YlB7gaHK+cCAZheWtv9FZBptLxFVx4r9/wj1zf4Wfzt+2JTzB76I8oUX+uBuLuwIXKcP
 U6TA==
X-Gm-Message-State: AOAM533gb0+L3irOInISZwbPde4RjHihhGP7uvYLTDjG7L3Mr77MFE7n
 vEz1AOAsVf8NwfpQVK3dYXLswL1lGREJwHvIbRH++7dFZ+lP2vC+sZhBUcRXJCgXWPC6EHbOHmz
 OQbtqX4HAZAN58g0=
X-Received: by 2002:a37:d4c:: with SMTP id 73mr17448205qkn.188.1631039545922; 
 Tue, 07 Sep 2021 11:32:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJ7Ir1OL14DqXsab42Lj0VPOAQ7lDrYNPZphgDaRcSg7KLfx60A2HgMraJeK1jd+lUL6pnRA==
X-Received: by 2002:a37:d4c:: with SMTP id 73mr17448179qkn.188.1631039545671; 
 Tue, 07 Sep 2021 11:32:25 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id h4sm9258423qkp.86.2021.09.07.11.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 11:32:25 -0700 (PDT)
Date: Tue, 7 Sep 2021 14:32:23 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v1 3/3] migration: multifd: Enable zerocopy
Message-ID: <YTewN8JZLbpL1Gcf@t490s>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com>
 <YS4rulGV9eueB04H@redhat.com>
 <CAJ6HWG5cH_33GDTo_v=8zZDZMJNf4k5+Y79Pt1A_7LmxXBx9bQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG5cH_33GDTo_v=8zZDZMJNf4k5+Y79Pt1A_7LmxXBx9bQ@mail.gmail.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 04:22:55AM -0300, Leonardo Bras Soares Passos wrote:
> > I don't think it is valid to unconditionally enable this feature due to the
> > resource usage implications
> >
> > https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html
> >
> >   "A zerocopy failure will return -1 with errno ENOBUFS. This happens
> >    if the socket option was not set, the socket exceeds its optmem
> >    limit or the user exceeds its ulimit on locked pages."
> 
> You are correct, I unfortunately missed this part in the docs :(
> 
> > The limit on locked pages is something that looks very likely to be
> > exceeded unless you happen to be running a QEMU config that already
> > implies locked memory (eg PCI assignment)
> 
> Do you mean the limit an user has on locking memory?
> 
> If so, that makes sense. I remember I needed to set the upper limit of locked
> memory for the user before using it, or adding a capability to qemu before.

So I'm a bit confused on why MSG_ZEROCOPY requires checking RLIMIT_MEMLOCK.

The thing is IIUC that's accounting for pinned pages only with either mlock()
(FOLL_MLOCK) or vfio (FOLL_PIN).

I don't really think MSG_ZEROCOPY is doing that at all...  I'm looking at
__zerocopy_sg_from_iter() -> iov_iter_get_pages().

Say, I think there're plenty of iov_iter_get_pages() callers and normal GUPs, I
think most of them do no need such accountings.

-- 
Peter Xu


