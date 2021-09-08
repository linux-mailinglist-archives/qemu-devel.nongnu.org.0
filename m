Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82316403630
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 10:36:22 +0200 (CEST)
Received: from localhost ([::1]:47594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNt49-0004Up-H5
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 04:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mNszD-0006Pf-Lz
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:31:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mNsz2-00008z-BH
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:31:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631089863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f0P9p3RsW0VITxSk590m+1Nwa19DQsErthy0RAKccHw=;
 b=PVywQda6d8aBJnFQXsLfN7/PidenwnJ/3A/d43P//9UJS1SJBysH7rGhlOoKMy1d3DS5ek
 dvlWneVOCqtaH1VYxP7kIS0urdFpDScR28TTJnnsn2svBv98pE6YcWwmo/hzdOS5SgMz+x
 z1I1FdVS244+gWnGwWj04Yuqt1utEto=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-wpyGgjRrMvS0LWd6Lozdtg-1; Wed, 08 Sep 2021 04:31:01 -0400
X-MC-Unique: wpyGgjRrMvS0LWd6Lozdtg-1
Received: by mail-wm1-f69.google.com with SMTP id
 s197-20020a1ca9ce000000b002e72ba822dcso729304wme.6
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 01:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=f0P9p3RsW0VITxSk590m+1Nwa19DQsErthy0RAKccHw=;
 b=CCOh3vL9xbBflAP/2i4P1vdY07rU8l73v7ceIYL9N96wvUtV+GxZU+T0EePM1M0fMe
 nlBreFMFldvIYVZQCmE3oS4iZB/rT9CyqxELvlMNKbyX1RgODj+H48KNSoNOylQJebo4
 m/xx3kbfsC5CVMMRSdRDyTvPjsRI+pcAT5ODZ3d1ZwcwdPEjgI/c5D49flmIzUc7/nLj
 LmI4cXy8f9sFNeVogtFLfAMxyMFPHwzvvYqgAgqgolOgUKGmAHEWtNfEwVO+LKj9q/nf
 cqklEHTC8sPz4CPNUi04q68dLPWup0w6o1aWf9qYdygZM1G87EDjhrlykF/RxChz9Xnf
 Hpkg==
X-Gm-Message-State: AOAM533GYfXaQHQd5f2RphMyeAr65at0lw7K851CPtlCqWCaySSgt1kg
 A6CtTzqJ13K8NQHybuH+5ZZcWjPA486eKnb/xILHUiMACQ9VLi09IlNJiXNCrvr/4kSVOrtlF77
 8rY5jFxFOtfI5xd4=
X-Received: by 2002:a1c:7f86:: with SMTP id a128mr2285425wmd.31.1631089860753; 
 Wed, 08 Sep 2021 01:31:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGXgYN7SN0q4KGJlx0TwAEZoxX60QMxiJxb3zs/tZq9YXo9pKtDhxKWcsyB8T8GQha/7JAkw==
X-Received: by 2002:a1c:7f86:: with SMTP id a128mr2285394wmd.31.1631089860519; 
 Wed, 08 Sep 2021 01:31:00 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id k1sm1432190wrz.61.2021.09.08.01.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 01:31:00 -0700 (PDT)
Date: Wed, 8 Sep 2021 09:30:58 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
Message-ID: <YTh0wn1IoaJpVwQ9@work-vm>
References: <20210831110238.299458-3-leobras@redhat.com>
 <YS4nPfEBCy9IC3rd@redhat.com>
 <CAJ6HWG75NDzaRAoHvM6FkFoB+sQvTpmdR8+AdMkoY6TsP06ZhA@mail.gmail.com>
 <YTCPngNB+l70sl06@redhat.com>
 <CAJ6HWG6dd+timQM27-NTumvwDM2bFawRsnmrZumdzGZ8hCR3dQ@mail.gmail.com>
 <YTCeNCEmr3NsQEPR@redhat.com>
 <CAJ6HWG6D61K49gyvfLo2c5=cZpkYh96ciZjO5V=wiPdG+wB5zQ@mail.gmail.com>
 <YTCnP9J/JINhg4h8@redhat.com> <YTdHpx263WNe7nuZ@work-vm>
 <YTeq1jttqpuVC3ZD@t490s>
MIME-Version: 1.0
In-Reply-To: <YTeq1jttqpuVC3ZD@t490s>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
> On Tue, Sep 07, 2021 at 12:06:15PM +0100, Dr. David Alan Gilbert wrote:
> > > > What if we do the 'flush()' before we start post-copy, instead of after each
> > > > iteration? would that be enough?
> > > 
> > > Possibly, yes. This really need David G's input since he understands
> > > the code in way more detail than me.
> > 
> > Hmm I'm not entirely sure why we have the sync after each iteration;
> 
> We don't have that yet, do we?

I think multifd does; I think it calls multifd_send_sync_main sometimes,
which I *think* corresponds to iterations.

Dave

> > the case I can think of is if we're doing async sending, we could have
> > two versions of the same page in flight (one from each iteration) -
> > you'd want those to get there in the right order.
> 
> From MSG_ZEROCOPY document:
> 
>         For protocols that acknowledge data in-order, like TCP, each
>         notification can be squashed into the previous one, so that no more
>         than one notification is outstanding at any one point.
> 
>         Ordered delivery is the common case, but not guaranteed. Notifications
>         may arrive out of order on retransmission and socket teardown.
> 
> So no matter whether we have a flush() per iteration before, it seems we may
> want one when zero copy enabled?
> 
> Thanks,
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


