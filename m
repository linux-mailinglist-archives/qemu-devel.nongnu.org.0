Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D83F4403C71
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:25:24 +0200 (CEST)
Received: from localhost ([::1]:58770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzRz-0006pS-Vm
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mNzQr-00069J-6I
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:24:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mNzQp-0002gx-Ik
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:24:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631114650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GRIlG81pEb5Fc4MYCQN17EDkjqcizs1vN8BroMqa1vk=;
 b=SoJ/KPffinuKmPbBUQUm4AB4r9N9apimIAM/OF9mfA55ffbRYApL8S1S2k2opekZB9O7ZL
 mcS3JG9i97P2uyLyKkwQT8F3tVGTs5D6I4Fvmanh815Xq12F90sjAEJrDWhxozG2KVvl4u
 D/nD8kypZ5fZ5N/O4SMRNRG5ydKWe/k=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-DZ4HUqkhN4SSwR_mqK7bxg-1; Wed, 08 Sep 2021 11:24:09 -0400
X-MC-Unique: DZ4HUqkhN4SSwR_mqK7bxg-1
Received: by mail-io1-f70.google.com with SMTP id
 k6-20020a6b3c060000b0290568c2302268so1954621iob.16
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 08:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GRIlG81pEb5Fc4MYCQN17EDkjqcizs1vN8BroMqa1vk=;
 b=7fBQYhtTUS4Thnk2SgbIXb/sFkKCCkfWrjnAiDV4MVjYhTYDJ3RXDHPpC5idDupQw0
 8P8rA7FF60A2W+0DExYyAYUACmP6DYFC5FmSUz1AJlCRk9py6vIvdWILfuQCPDHLfCx3
 5zotA8YZ0WICwRGjU3jZp2nQFaa7T3yCL6MmiTG/mC+PDZTf7tZ0DihVXjix/ZsIvbOO
 D60lhLUTayxRvPvTIqnq05wNRkmY9Abktg4YkVGGbhHgioNlj/qBrXXPz3LNV80eMOSi
 /FBcpwA698xyOLvU0AkzQfxNLQTK/MvpbPJiJW0AbMY9Acn+lG6A1i0uNR6vLRrUx105
 xQXQ==
X-Gm-Message-State: AOAM531vFzaRa03nRwMXzbhZQw1RDmqgPG4TJe6zgXkOt5CEvs28+cpO
 YXbg2p/ypwiUfUDRHwd6t1/QznizDzZAsy7GMDGANAC1EH+BazjwqDP6jHNef0j1tuIwcpwxh5z
 YcJPWAO7cA5A54kc=
X-Received: by 2002:a02:ac11:: with SMTP id a17mr4237825jao.100.1631114649159; 
 Wed, 08 Sep 2021 08:24:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgDk6FtwwiFAwjpntFsfA5QzXrpKOW7Q6YnmWX3RNi8mvZ3o6D+LFVFEOE52hclaBwSTXF6w==
X-Received: by 2002:a02:ac11:: with SMTP id a17mr4237726jao.100.1631114647670; 
 Wed, 08 Sep 2021 08:24:07 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id p15sm1318950iop.15.2021.09.08.08.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 08:24:07 -0700 (PDT)
Date: Wed, 8 Sep 2021 11:24:05 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
Message-ID: <YTjVlaufrGLdgcpL@t490s>
References: <YS4nPfEBCy9IC3rd@redhat.com>
 <CAJ6HWG75NDzaRAoHvM6FkFoB+sQvTpmdR8+AdMkoY6TsP06ZhA@mail.gmail.com>
 <YTCPngNB+l70sl06@redhat.com>
 <CAJ6HWG6dd+timQM27-NTumvwDM2bFawRsnmrZumdzGZ8hCR3dQ@mail.gmail.com>
 <YTCeNCEmr3NsQEPR@redhat.com>
 <CAJ6HWG6D61K49gyvfLo2c5=cZpkYh96ciZjO5V=wiPdG+wB5zQ@mail.gmail.com>
 <YTCnP9J/JINhg4h8@redhat.com> <YTdHpx263WNe7nuZ@work-vm>
 <YTeq1jttqpuVC3ZD@t490s> <YTh0wn1IoaJpVwQ9@work-vm>
MIME-Version: 1.0
In-Reply-To: <YTh0wn1IoaJpVwQ9@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
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
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Leonardo Bras Soares Passos <leobras@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Jagannathan Raman <jag.raman@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 09:30:58AM +0100, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > On Tue, Sep 07, 2021 at 12:06:15PM +0100, Dr. David Alan Gilbert wrote:
> > > > > What if we do the 'flush()' before we start post-copy, instead of after each
> > > > > iteration? would that be enough?
> > > > 
> > > > Possibly, yes. This really need David G's input since he understands
> > > > the code in way more detail than me.
> > > 
> > > Hmm I'm not entirely sure why we have the sync after each iteration;
> > 
> > We don't have that yet, do we?
> 
> I think multifd does; I think it calls multifd_send_sync_main sometimes,
> which I *think* corresponds to iterations.

Oh.. Then we may need to:

  (1) Make that sync work for zero-copy too; say, semaphores may not be enough
      with it - we need to make sure all async buffers are consumed by checking
      the error queue of the sockets,

  (2) When we make zero-copy work without multi-fd, we may want some similar
      sync on the main stream too

Thanks,

> 
> Dave
> 
> > > the case I can think of is if we're doing async sending, we could have
> > > two versions of the same page in flight (one from each iteration) -
> > > you'd want those to get there in the right order.
> > 
> > From MSG_ZEROCOPY document:
> > 
> >         For protocols that acknowledge data in-order, like TCP, each
> >         notification can be squashed into the previous one, so that no more
> >         than one notification is outstanding at any one point.
> > 
> >         Ordered delivery is the common case, but not guaranteed. Notifications
> >         may arrive out of order on retransmission and socket teardown.
> > 
> > So no matter whether we have a flush() per iteration before, it seems we may
> > want one when zero copy enabled?
> > 
> > Thanks,
> > 
> > -- 
> > Peter Xu
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 

-- 
Peter Xu


