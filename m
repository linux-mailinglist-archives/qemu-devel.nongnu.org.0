Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445C65614EB
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 10:25:14 +0200 (CEST)
Received: from localhost ([::1]:48686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6pU8-0003yp-T4
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 04:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6pSm-0003Hg-PZ
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 04:23:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6pSi-0003OP-QE
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 04:23:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656577423;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWDTeS5beVpYjI3v/BnDFa9p42LIwDsZ6nM6z8SI2Ds=;
 b=WMjLaUCM/2nS8w4mWYCxJHgPrsJj/td9MYrTKyO8HsLHavSRaGBqLQSmTtVY1oHa5qVbMX
 Mq6nVkOjlXOr30RdrD2mUrjlE54nAe7tJ6hG6F3tZeP6izKJU17FvqhTt88rQLQ4iuxCi7
 ijPumqogLCaPAp/uXVnGaRoB3jE5xao=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-bNmkrXLSOZ2CO8UCvB2PVA-1; Thu, 30 Jun 2022 04:23:40 -0400
X-MC-Unique: bNmkrXLSOZ2CO8UCvB2PVA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2B62811E87;
 Thu, 30 Jun 2022 08:23:39 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D408318EAB;
 Thu, 30 Jun 2022 08:23:38 +0000 (UTC)
Date: Thu, 30 Jun 2022 09:23:36 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 2/2] python/qemu/machine: accept QMP connection
 asynchronously
Message-ID: <Yr1diN83gU2dx27u@redhat.com>
References: <20220628134939.680174-1-marcandre.lureau@redhat.com>
 <20220628134939.680174-3-marcandre.lureau@redhat.com>
 <YrsNZAznZrxUr/zr@redhat.com>
 <CAFn=p-YCAf7VvCvwjh++KZ3GguG8MKo=ukGR3EqxRYprXgZWDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFn=p-YCAf7VvCvwjh++KZ3GguG8MKo=ukGR3EqxRYprXgZWDg@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 29, 2022 at 07:54:08PM -0400, John Snow wrote:
> On Tue, Jun 28, 2022 at 10:17 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Tue, Jun 28, 2022 at 05:49:39PM +0400, marcandre.lureau@redhat.com wrote:
> > > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > >
> > > QMP accept is currently synchronous. If qemu dies before the connection
> > > is established, it will wait there. Instead turn the code to do
> > > concurrently accept() and wait(). Returns when the first task is
> > > completed to determine whether a connection was established.
> >
> > If the spawned QEMU process was given -daemonize, won't this code
> > mistakenly think the subprocess has quit ?
> 
> Do we use daemonize with this code anywhere? Is it important that we
> are able to?

Well what's the intended breadth of use cases this code wants to
target ?

If you don't daemonize QEMU, then QEMU will (likely) get killed off
when the parent python process terminates. That can be ok for adhoc
testing scenarios where the QEMU process is transient and throwaway,
or for using QEMU as an embedded technology (think libguestfs). If
you want your QEMU to run full OS workloads, then generally you won't
want it to die when the mgmt app is restarted (eg for software upgrade),
whereupon you want to daemonize.

> Many of the shutdown routines I wrote expect to work directly with a
> launched process ... at least, that expectation exists in my head. I
> suppose a lot of this code may actually just coincidentally work with
> -daemonize and I wouldn't have noticed. I certainly haven't been
> testing it explicitly. I definitely make no accommodations for it, so
> I would expect some stale processes in various cases at a minimum.

Looking at the code it probably works by accident - the shutdown()
methods kinda assumes we're talking to a direct child, but it'll
happen to work right now as it'll simply cleanup the defunct
intermediate child, while QEMU stays running.

> If we want to expand to accommodate this feature, can we do that
> later? Machine needs a bit of a remodel anyway. (I want to write an
> 'idiomatic' asyncio version to match the QMP lib. I have some
> questions to work out WRT which portions of this appliance can be
> upstreamed and which need to remain only in our testing tree. We can
> talk about those pieces later, just throwing it out there that it's on
> my list.)

The machine class is probably the part that looks least ready to be
published as an API on pypi. Its code really shows its origins as an
adhoc testing framework, rather than a general purpose API for running
and managing QEMU from python.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


