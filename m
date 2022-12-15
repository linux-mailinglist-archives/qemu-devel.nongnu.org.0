Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FED64DCB7
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 15:07:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5osa-0004Bl-N4; Thu, 15 Dec 2022 09:06:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p5osX-00048p-El
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 09:06:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p5osV-00031j-Ln
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 09:06:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671113186;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=EAwB7+BZAoQhmF/UVOCsecDY9IentN0mH+/f3wfA5go=;
 b=ICZld6STqQURhHs1m2gqimpI0/6NwMBLzrm/j/uHsuR8ePAB2EyGNZXRmfza0lZm+OVYrE
 dPONzZez3xAHqRb4psglIxuTCexEER8f7uxOHct+fBOHLTuCZc2azMJ3b9aOKvHuvbpsB0
 DY8jDmikcWxvZJZgPk/6gVtQtLMd8lc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-Fkm05qVRMd-hWG3qrJ3Gxw-1; Thu, 15 Dec 2022 09:06:22 -0500
X-MC-Unique: Fkm05qVRMd-hWG3qrJ3Gxw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22D0B2805D03;
 Thu, 15 Dec 2022 14:06:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B5244085721;
 Thu, 15 Dec 2022 14:06:20 +0000 (UTC)
Date: Thu, 15 Dec 2022 14:06:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ralf-Philipp Weinmann <ralf@comsecuris.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: QEMU PPC VLE support
Message-ID: <Y5sp11VXr/nY84ib@redhat.com>
References: <CAJSP0QVVQLueQDzOb-GAhORetK38EzgBhem=UjChJ3oaxRaFmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJSP0QVVQLueQDzOb-GAhORetK38EzgBhem=UjChJ3oaxRaFmg@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Dec 15, 2022 at 08:37:54AM -0500, Stefan Hajnoczi wrote:
> Hi,
> I came across this post where Ralf-Philipp is looking for a freelancer
> to implement PPC VLE support in QEMU:
> https://chaos.social/@rpw/109516326028642262
> 
> It mentions upstreaming the code and I've included QEMU PPC
> maintainers in this email so they can discuss the project with
> Ralf-Philipp. That way the chances of a mergable result will be
> maximized.
> 
> The Rust aspect is interesting, but QEMU does not have any existing
> targets implemented in Rust. It might be a major effort to create the
> necessary C<->Rust interfacing, so I'm not sure whether that's
> realistic given the timeframe for the project.

I'd very much like to see QEMU open up to use of Rust, but I don't
think we should be doing it in a piecemeal way where we special case
just one part.

If we're going to accept use of Rust, then its important that we
(the QEMU community) come to some general agreement for what our
intention is for the use fo Rust in QEMU

Running a paid-for development effort that intends to upstream
to QEMU feels like a pretty risky venture if it intends to use
Rust, prior to the QEMU community making a clear plan about our
wishes for use of Rust.

On the other hand, perhaps such an effort could force us to
actually make a decision. We've talked about Rust quite a few
times, but until someone has a concrete proposal for use of
Rust in QEMU context, we're likely to keep punting the decision
to a later date.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


