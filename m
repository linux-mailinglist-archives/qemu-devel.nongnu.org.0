Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AD230D80A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 12:01:48 +0100 (CET)
Received: from localhost ([::1]:42450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Fut-0007rd-JN
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 06:01:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7Fsv-0007Gp-UP
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:59:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7Fss-00060m-Nl
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:59:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612349980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cberw22i4OyXhCOwhlnp5X3G0td/WRmeYu0FOAInees=;
 b=jBgE+C4q7IZo5qqfVXP+8z5oJOLFcoIJV3YVHtZyK0EO9G33FPFW5dU67MUeD+Sirtuc2p
 zuL9XSlkWmgxJCJvRKR00a91bdCTMPs7nV8Eu98BVohVD7j+DhCvlVClF9i6IBjVd1z22s
 53ueRAqFIJKk8Ag41tCnTdwPDnbDbw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-94kmtrLMNSiqgub7m-jv_A-1; Wed, 03 Feb 2021 05:59:39 -0500
X-MC-Unique: 94kmtrLMNSiqgub7m-jv_A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25374C7402;
 Wed,  3 Feb 2021 10:59:38 +0000 (UTC)
Received: from work-vm (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 724DE4D;
 Wed,  3 Feb 2021 10:59:36 +0000 (UTC)
Date: Wed, 3 Feb 2021 10:59:33 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: ARM Snapshots Not Backwards-Compatible
Message-ID: <20210203105933.GF2950@work-vm>
References: <YBogDGJRU5pcDKmi@strawberry.localdomain>
 <153e5c54-f8bf-d088-502d-502309f5d2a6@redhat.com>
 <20210203102758.GC2950@work-vm>
 <CAFEAcA9_mcXHd5m+Z2M1jvk58kGVEcYKF+0kVsLJTjwB9MZcfw@mail.gmail.com>
 <20210203104920.GE2950@work-vm>
 <CAFEAcA9DdiBA+-5cQ87NR6fHFFFJAtDVbAEc+AJQNMNo4bVB+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9DdiBA+-5cQ87NR6fHFFFJAtDVbAEc+AJQNMNo4bVB+A@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-arm <qemu-arm@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Wed, 3 Feb 2021 at 10:49, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> >
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > On Wed, 3 Feb 2021 at 10:28, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> > > >
> > > > * Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> > > > > Cc'ing migration team and qemu-arm@ list.
> > > >
> > > > I'll have to leave the detail of that to the ARM peole; but from a
> > > > migration point of view I think we do want the 64 bit ARM migrations to
> > > > be stable now.  Please tie incompatible changes to machine types.
> > >
> > > That is the intention, but because there's no upstream testing
> > > of migration compat, we never notice if we get it wrong.
> > > What is x86 doing to keep cross-version migration working ?
> >
> > I know there used to be some of our team running Avocado tests for
> > compatibility regularly, I'm not sure of the current status.
> > It's something we also do regularly around when we do downstream
> > releases, so we tend to catch them then, although even on x86 that
> > often turns out to be a bit late.
> 
> So downstream testing only?

I thought there used to be some regular avocado testing of upstream but
I'm not sure if it's all architectures and I'm not sure if it's still
happening; I haven't seen any migration issues from it for a while,
which makes me think it isn't.

> I think that unless we either (a) start
> doing migration-compat testing consistently upstream or (b) RedHat or
> some other downstream start testing and reporting compat issues
> to us for aarch64 as they do for x86-64, in practice we're just
> not going to have working migration compat despite our best
> intentions. (None of the issues Aaron raises were deliberate
> compat breaks -- they're all "we made a change we didn't think
> affected migration but it turns out that it does".)

I'd agree; we still hit this too often on x86 as well.

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


