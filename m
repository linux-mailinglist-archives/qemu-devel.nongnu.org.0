Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC84640475D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 10:51:23 +0200 (CEST)
Received: from localhost ([::1]:56232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOFmE-0003Mc-Sk
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 04:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mOFki-0002TF-Fu
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 04:49:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mOFkg-0005wu-Ue
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 04:49:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631177385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NhbByGCNvRZ0OorOBmTJuLXHa0paZLfAhCLdYPZCq/g=;
 b=gLcLQOwNcH1ve2zSiv/iqLF5zpWz+4cmETkYB4xqfw87ySaAV3zkgXMN1unlWOdLT6hRqK
 ft2RkH4lI2SyRjZBNbPKdqWHof/dEAoEfniCoojuGAOCPxYGy5Ai6i1cDSTPaCRNMUHXaJ
 s9yhTZaW05v5Cj5uTvR6Cvmb60bXtoc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-FvNBnDOEMFCn-TDk15Uqvg-1; Thu, 09 Sep 2021 04:49:44 -0400
X-MC-Unique: FvNBnDOEMFCn-TDk15Uqvg-1
Received: by mail-wm1-f71.google.com with SMTP id
 x10-20020a7bc76a000000b002f8cba3fd65so577450wmk.2
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 01:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NhbByGCNvRZ0OorOBmTJuLXHa0paZLfAhCLdYPZCq/g=;
 b=aaRX8vd3nJiL9KRGSV0LNz/q+oLBk2du6Sz8hCPIPskjg/04DDvpvx16FBeB0uYBWC
 DMsMwcXtdSG+7KOeTPpu+JUwyS6Vq1alCAeLRFTMvDrdzydhvAPs0eHPpwNf6Tsb59dv
 C9crW0S6ZhFu7SOYqeclPtytAWkDFiXjjTurBcc9zmHXZZQ0x9bcPyUywSzcVhBuF9XO
 EonLoADtaUtjIl2odLMCsyaKNt2kqakKMR0qk/rBs1logsh+4oI76NTdnQWwMyQM3CcF
 8ADqoCsJuZpMRj89ojiSPD9j9IBPfV8GrvWWP342StLWWVMGoYPh2ao65xO/o7gDH1NC
 WhtQ==
X-Gm-Message-State: AOAM533bLsrZ3lmdle4P54DqgV/HArRvwUk3Z6xHPkRZbQ3c7NArPHi3
 YCMZYcuZYfcdwpvKv0nlnBPuo7st92lv5MbowYsgP3+XJVPFzvQn9p1gj/Dn+sVcev0tgRor3TR
 PgAttLxxMmi7xULI=
X-Received: by 2002:a1c:1cc:: with SMTP id 195mr1789632wmb.188.1631177382828; 
 Thu, 09 Sep 2021 01:49:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgGX+LWH/mVJENgcy5qH6Kvvjrcs1lXBXkd/6XvDW03A3Pa7qYXjFv/yFbOHck7mxb0H2URQ==
X-Received: by 2002:a1c:1cc:: with SMTP id 195mr1789612wmb.188.1631177382665; 
 Thu, 09 Sep 2021 01:49:42 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id t17sm1087248wra.95.2021.09.09.01.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 01:49:41 -0700 (PDT)
Date: Thu, 9 Sep 2021 09:49:39 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
Message-ID: <YTnKo8XL0BcZYWaH@work-vm>
References: <CAJ6HWG75NDzaRAoHvM6FkFoB+sQvTpmdR8+AdMkoY6TsP06ZhA@mail.gmail.com>
 <YTCPngNB+l70sl06@redhat.com>
 <CAJ6HWG6dd+timQM27-NTumvwDM2bFawRsnmrZumdzGZ8hCR3dQ@mail.gmail.com>
 <YTCeNCEmr3NsQEPR@redhat.com>
 <CAJ6HWG6D61K49gyvfLo2c5=cZpkYh96ciZjO5V=wiPdG+wB5zQ@mail.gmail.com>
 <YTCnP9J/JINhg4h8@redhat.com> <YTdHpx263WNe7nuZ@work-vm>
 <YTeq1jttqpuVC3ZD@t490s> <YTh0wn1IoaJpVwQ9@work-vm>
 <YTjVlaufrGLdgcpL@t490s>
MIME-Version: 1.0
In-Reply-To: <YTjVlaufrGLdgcpL@t490s>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
 qemu-devel <qemu-devel@nongnu.org>,
 Leonardo Bras Soares Passos <leobras@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Jagannathan Raman <jag.raman@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Wed, Sep 08, 2021 at 09:30:58AM +0100, Dr. David Alan Gilbert wrote:
> > * Peter Xu (peterx@redhat.com) wrote:
> > > On Tue, Sep 07, 2021 at 12:06:15PM +0100, Dr. David Alan Gilbert wrote:
> > > > > > What if we do the 'flush()' before we start post-copy, instead of after each
> > > > > > iteration? would that be enough?
> > > > > 
> > > > > Possibly, yes. This really need David G's input since he understands
> > > > > the code in way more detail than me.
> > > > 
> > > > Hmm I'm not entirely sure why we have the sync after each iteration;
> > > 
> > > We don't have that yet, do we?
> > 
> > I think multifd does; I think it calls multifd_send_sync_main sometimes,
> > which I *think* corresponds to iterations.
> 
> Oh.. Then we may need to:
> 
>   (1) Make that sync work for zero-copy too; say, semaphores may not be enough
>       with it - we need to make sure all async buffers are consumed by checking
>       the error queue of the sockets,
> 
>   (2) When we make zero-copy work without multi-fd, we may want some similar
>       sync on the main stream too

It might not be worth bothering with (2) - zerocopy fits a lot better
with multifd's data organisation.

Dave

> Thanks,
> 
> > 
> > Dave
> > 
> > > > the case I can think of is if we're doing async sending, we could have
> > > > two versions of the same page in flight (one from each iteration) -
> > > > you'd want those to get there in the right order.
> > > 
> > > From MSG_ZEROCOPY document:
> > > 
> > >         For protocols that acknowledge data in-order, like TCP, each
> > >         notification can be squashed into the previous one, so that no more
> > >         than one notification is outstanding at any one point.
> > > 
> > >         Ordered delivery is the common case, but not guaranteed. Notifications
> > >         may arrive out of order on retransmission and socket teardown.
> > > 
> > > So no matter whether we have a flush() per iteration before, it seems we may
> > > want one when zero copy enabled?
> > > 
> > > Thanks,
> > > 
> > > -- 
> > > Peter Xu
> > > 
> > -- 
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > 
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


