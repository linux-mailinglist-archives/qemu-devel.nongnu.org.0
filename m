Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4502D40E057
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 18:20:55 +0200 (CEST)
Received: from localhost ([::1]:38996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQu86-0007Hg-8t
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 12:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mQtxk-00027a-EH
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 12:10:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mQtxe-0001LR-B1
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 12:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631808604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X/75nplITC1BbmVrqUgdxpjRfsz7ttQKw73sr6291Kg=;
 b=XkIxOiM0kSGt1la3HtYeU0AXf8Rv/EQhU9zHJgyXrYx2M5G/REjtS2KHd/8vzixm5BoJQA
 2bZPdN58NFsoX+wgJGDzQyM13OLtQEZQ1GXynhOPE678G4/cyKj1yR7j+lIp2SB86Dv1Ba
 Gl/flnEJy5MsmElB6oAP3JkgZ8LpyEY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-BPs3-MdqMJi448LGpCqfZQ-1; Thu, 16 Sep 2021 12:10:01 -0400
X-MC-Unique: BPs3-MdqMJi448LGpCqfZQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 g1-20020a5d64e1000000b0015e0b21ef04so2644369wri.17
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 09:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=X/75nplITC1BbmVrqUgdxpjRfsz7ttQKw73sr6291Kg=;
 b=IFx1/XJBpp/B+LfJasX9JDDIbR4AdgvcTWimtIcBcFLhNTlEZOkLEWmKY9AZRLY9+p
 aJjetDk8m/d+80o+k2dgyvi//fkzrPhgwPB2GRELfQ+HWseIKWnqz6wPfUIxIpHJd7Op
 5KMmXuvIFJCIqowz9vA2LPRiht3sD9Ze9x81hsLbrRO9ylmG8/DXP5EF4SuC3r5nyR8U
 vYiErUcPWPLrCkBQ5nsYvEyxo+D79CQOmh+ZSKsrTunXhpxndd0V0j9/xkB1p+5Oc1oj
 QjG1z275+ZN6YHLHJvUSh5TaZeQ5nottVg/fDJGNKnWpXGUZTZhzasGV3nyPLDR6qoZs
 VMWQ==
X-Gm-Message-State: AOAM5303CL3qWyuvTRCl9ucnEmvdDbo7xKlaPnLz3UHN2/2Yggsp1B4H
 75Xkh8EV9Wtbp+iPvYzQEwFonfLORUS2UFm/PTVDOw1JNTw1O6EmXjSjni2AIW6wJ15LKCKTUD6
 eVGHD6KYvRyunzPk=
X-Received: by 2002:a7b:cb97:: with SMTP id m23mr4814154wmi.70.1631808600742; 
 Thu, 16 Sep 2021 09:10:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/Jz2/anI2Hj2wAiTO2qvJ+QsWW5epaWUU1N7zejpYLljEbBPoY/OyYekRtgWi3rRqZW4YMw==
X-Received: by 2002:a7b:cb97:: with SMTP id m23mr4814129wmi.70.1631808600503; 
 Thu, 16 Sep 2021 09:10:00 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id j27sm3320192wms.6.2021.09.16.09.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 09:09:59 -0700 (PDT)
Date: Thu, 16 Sep 2021 17:09:57 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/2] virtiofs queue
Message-ID: <YUNsVVctMVjSHOQ6@work-vm>
References: <20210916135241.150566-1-dgilbert@redhat.com>
 <CAFEAcA-k=jKqBcEzxd+ALPYz_UVT1_AG3PnsuX2N77_UTSE=nA@mail.gmail.com>
 <YUNj1DQT9VyU54DV@work-vm>
 <CAFEAcA_DDQFkF-n3_mr9RyRBUnUN00kZNKoiP_e5koY3F1zxHg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_DDQFkF-n3_mr9RyRBUnUN00kZNKoiP_e5koY3F1zxHg@mail.gmail.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Sergio Lopez <slp@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Thu, 16 Sept 2021 at 16:33, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > On Thu, 16 Sept 2021 at 14:58, Dr. David Alan Gilbert (git)
> > > <dgilbert@redhat.com> wrote:
> > > >
> > > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > > >
> > > > The following changes since commit 57b6f58c1d0df757c9311496c32d502925056894:
> > > >
> > > >   Merge remote-tracking branch 'remotes/hreitz/tags/pull-block-2021-09-15' into staging (2021-09-15 18:55:59 +0100)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >   https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20210916
> > > >
> > > > for you to fetch changes up to 046d91c83caac29e2ba26c63fd7d685a57463f6d:
> > > >
> > > >   virtiofsd: Reverse req_list before processing it (2021-09-16 14:50:48 +0100)
> > > >
> > >
> > > gpg says your key has expired; what keyserver can I download an
> > > updated key from?
> >
> > I pushed an updated one to pgp.mit.edu just before I sent the pull;
> > I can see it there (although it's a bit slow to respond).
> 
> It doesn't seem to respond for me; a recv-keys just hangs.
> I recommend keys.openpgp.org or keyserver.ubuntu.com.

I've just pushed them to both of those.

Dave

> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


