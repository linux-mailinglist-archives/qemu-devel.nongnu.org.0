Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FC35BEEF1
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:05:01 +0200 (CEST)
Received: from localhost ([::1]:40204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakQO-0004wf-Ax
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oafXp-0008VC-3N
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:52:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oafXk-0003pt-RP
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663689132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TIavYQaP1xU/zSQbIfjiROODqnpFWcS38ZFYtE/pL5M=;
 b=PlrQngoybr6mUU2Z5ezvjulNN8zvJINMeygRJZUSdOLnVHF6YRMHJ02QMvgcCie/nEC1db
 ZxxTltxpYBMN2YUMymyX6dxHTwFEE+HB7I5Db7j6MA+bSuciRUEZG5P8E/KX9kRUra+AgS
 K8zwql025gx7H6DU1qviKmjOMNgjBGg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-321-cSNm7sLwMUaWXVfD8OrlPA-1; Tue, 20 Sep 2022 11:52:11 -0400
X-MC-Unique: cSNm7sLwMUaWXVfD8OrlPA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v190-20020a1cacc7000000b003b4ab30188fso6507727wme.2
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 08:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TIavYQaP1xU/zSQbIfjiROODqnpFWcS38ZFYtE/pL5M=;
 b=X+CF9Ne3Yhcu3ST1sd2JaZHT67hBnQlev/rdCG2w9Cv1fAWowEZXgFN3ZQUVURbJgM
 3SrCG+Js6P51pgdiXRWyjySnp9Ye7opYdmvnFVAoJrq0UqMxx+egjPCxxPii9FRVMCH8
 uPMsJkbB0r2nfuarzIgbTPAK0w/xDKLg6QFRozJC6Ec18+iSrKwTuCHGovLQLUtWXFkY
 HQs7zg01eGvIuyPmWLLWGvFuHC2i2O/WLbBdNSGTuFh75va8/x9Tt3Jk6JTwKIvH02ge
 h1S0ws3tSOE2PJ2ua37fpoPB7ZKa90BI8cLdIXCpqMixUNXZe/KcFxDZBjQpG8OLZz5d
 7m0g==
X-Gm-Message-State: ACrzQf1FM7LpfZCgae9kqt0gyFrX94vxrE9T3lkSDSoHEhX+67qMml+M
 cqUr2YBmc+d6IjUToIGClpaKjDtzH4HVLJyyArrOSkPcHx7VgPvpYBv2p9vyiwgld75nFcI6pXn
 XS5Jfy+zLBBV4AYA=
X-Received: by 2002:a5d:4a48:0:b0:22a:e55d:535d with SMTP id
 v8-20020a5d4a48000000b0022ae55d535dmr11734375wrs.308.1663689129779; 
 Tue, 20 Sep 2022 08:52:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6UavUlRBHu+0W8G1sidcjCqYTiTVw3kxIdln4cZRF96wqL/9sqqJHcwPgMHhCJFb1WEqNs4g==
X-Received: by 2002:a5d:4a48:0:b0:22a:e55d:535d with SMTP id
 v8-20020a5d4a48000000b0022ae55d535dmr11734358wrs.308.1663689129587; 
 Tue, 20 Sep 2022 08:52:09 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm126340wmb.28.2022.09.20.08.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 08:52:08 -0700 (PDT)
Date: Tue, 20 Sep 2022 16:52:07 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: Maximum QMP reply size
Message-ID: <Yynhp6fhD37wqb8o@work-vm>
References: <CAFn=p-ZkKLQtYAwzkQb7srFf_fF8ij+g5wkZiRofx4U+kSZ7Rw@mail.gmail.com>
 <CAFEAcA8Zy3RpTZM-gJk6ZZaUEf6huTuuK3C4-uSo6pYz8KCrMQ@mail.gmail.com>
 <YyNDCDH71oytYujr@work-vm>
 <CAFEAcA9=hY57=7mXrcs3MHZuGR0HdXwQh-thW8zW=hMmxck2Ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9=hY57=7mXrcs3MHZuGR0HdXwQh-thW8zW=hMmxck2Ng@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Thu, 15 Sept 2022 at 16:21, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > On Tue, 6 Sept 2022 at 20:41, John Snow <jsnow@redhat.com> wrote:
> > > > Hi, I suspect I have asked this before, but I didn't write it down in
> > > > a comment, so I forget my justification...
> > > >
> > > > In the QMP lib, we need to set a buffering limit for how big a QMP
> > > > message can be -- In practice, I found that the largest possible
> > > > response was the QAPI schema reply, and I set the code to this:
> > > >
> > > >     # Maximum allowable size of read buffer
> > > >     _limit = (64 * 1024)
> > > >
> > > > However, I didn't document if this was a reasonable limit or just a
> > > > "worksforme" one. I assume that there's no hard limit for the protocol
> > > > or the implementation thereof in QEMU. Is there any kind of value here
> > > > that would be more sensible than another?
> > > >
> > > > I'm worried that if replies get bigger in the future (possibly in some
> > > > degenerate case I am presently unaware of) that the library default
> > > > will become nonsensical.
> > >
> > > There are some QMP commands which return lists of things
> > > where we put no inherent limit on how many things there
> > > are in the list, like qom-list-types. We'd have to be getting
> > > a bit enthusiastic about defining types for that to get
> > > up towards 64K's worth of response, but it's not inherently
> > > impossible. I think using human-monitor-command to send
> > > an 'xp' HMP command is also a way to get back an arbitrarily
> > > large string (just ask for a lot of memory to be dumped).
> >
> > We could put size limits on xp; most Humans will only dump a few kB
> > maximum like that, any larger and you can dump to file.
> 
> Sure, we could, but why? It's not clear to me why a consumer
> of QMP needs to impose a maximum message size limit on it:

That was just a suggestion if someone did want to limit it; if 'xp'
sizing is the only thing holding us back.

> I thought it was just JSON. Fixed buffer sizes are very 1980s :-)

But generic JSON is awful for this, given there are no constraints on
field ordering, a parser has to read the whole JSON message before
being able to determine if anything in it makes sense.  You can't
generally 'stream' parse it, so do end up reading into buffers.

> If this is a common requirement then should we define something
> in the protocol where the client says "I can support messages
> up to this big" and then the server has to split things up?

I fear you'll have to do that for every command type that outputs
a lot of data; doing it generally could be tricky.

Dave

> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


