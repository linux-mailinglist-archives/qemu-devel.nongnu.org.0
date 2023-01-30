Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C7068098C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 10:31:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQVZ-0005ck-62; Mon, 30 Jan 2023 04:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pMQVP-0005cR-4p
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:31:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pMQVN-0006r0-HX
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:31:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675071072;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=1LO14ojnfNxvo7aIbu1nDIDpv7RBUa2fqioHDl5Xwsg=;
 b=hDteKb1F0/eNlH3XUsYAzt7v3kdK3yOYDtTtxqzoInyWrxUNM2VL0owQtYGvkaCeDhM2Ip
 86VWfRciKIZTGx1vOjPWCURauJTHet7bYVPSYnCFdByjaWCnBLAqJnuoGDgtZcXKd5m64Y
 VaHlLUCE3f0xzoYBEmgMGF00w+qaG7M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-94-DYBNvyDeP9qRAsNjTHK6Uw-1; Mon, 30 Jan 2023 04:31:06 -0500
X-MC-Unique: DYBNvyDeP9qRAsNjTHK6Uw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FF53382C967;
 Mon, 30 Jan 2023 09:31:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B625400EAD6;
 Mon, 30 Jan 2023 09:31:03 +0000 (UTC)
Date: Mon, 30 Jan 2023 09:31:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Eric Biggers <ebiggers@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 pbonzini@redhat.com, Mathias Krause <minipli@grsecurity.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH qemu v3] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <Y9eOVaeOJ6T4/Eq3@redhat.com>
References: <Y69fUstLKNv/RLd7@zx2c4.com>
 <20221230220725.618763-1-Jason@zx2c4.com>
 <Y72FmQlNwBsp8Ntc@zx2c4.com>
 <20230110125005-mutt-send-email-mst@kernel.org>
 <Y84LSgtrq1Rq3ItD@sol.localdomain>
 <20230123071128-mutt-send-email-mst@kernel.org>
 <CAHmME9qXnA=0tBwXe=S=X_LzdBa0irDbWNSNnTdUHSQYJkfPpQ@mail.gmail.com>
 <20230128061015-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230128061015-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
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

On Sat, Jan 28, 2023 at 06:15:03AM -0500, Michael S. Tsirkin wrote:
> On Mon, Jan 23, 2023 at 06:37:21AM -0600, Jason A. Donenfeld wrote:
> > On Mon, Jan 23, 2023 at 6:12 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Sun, Jan 22, 2023 at 08:21:30PM -0800, Eric Biggers wrote:
> > > > Hi Michael,
> > > >
> > > > On Tue, Jan 10, 2023 at 12:50:42PM -0500, Michael S. Tsirkin wrote:
> > > > > On Tue, Jan 10, 2023 at 04:34:49PM +0100, Jason A. Donenfeld wrote:
> > > > > > Hi Michael,
> > > > > >
> > > > > > Could you queue up this patch and mark it as a fix for 7.2.1? It is a
> > > > > > straight-up bug fix for a 7.2 regression that's now affected several
> > > > > > users.
> > > > >
> > > > > OK. In the future pls cc me if you want me to merge a patch. Thanks!
> > > > >
> > > > > > - It has two Tested-by tags on the thread.
> > > > > > - hpa, the maintainer of the kernel side of this, confirmed on one of
> > > > > >   the various tributary threads that this approach is a correct one.
> > > > > > - It doesn't introduce any new functionality.
> > > > > >
> > > > > > For your convenience, you can grab this out of lore here:
> > > > > >
> > > > > >   https://lore.kernel.org/lkml/20221230220725.618763-1-Jason@zx2c4.com/
> > > > > >
> > > > > > Or if you want to yolo it:
> > > > > >
> > > > > >   curl https://lore.kernel.org/lkml/20221230220725.618763-1-Jason@zx2c4.com/raw | git am -s
> > > > > >
> > > > > > It's now sat silent on the mailing list for a while. So let's please get
> > > > > > this committed and backported so that the bug reports stop coming in.
> > > > > >
> > > >
> > > > This patch still isn't on QEMU's master branch.  What happened to it?
> > > >
> > > > - Eric
> > >
> > > Indeed though I remember picking it up. Tagged again now. Thanks!
> > 
> > Thanks. What branch is this in? I didn't see it on:
> > https://gitlab.com/mstredhat/qemu/-/branches/active
> > https://github.com/mstsirkin/qemu/branches
> 
> I don't use github really. And it was not pushed to gitlab as I was
> figuring out issues with other patches before starting CI as CI minutes
> are limited.

QEMU CI config as of a few months ago, pushing to gitlab will *not* start
CI pipelines. You need to explicitly use opt-in to it when pushing by
using 'git push -o ci.variable=QEMU_CI=1' to create a pipeline with all
jobs manual or QEMU_CI=2 to create a pipeline and immediately run all jobs.
Alternatively use the web UI to start the pipeline, again setting QEMU_CI=1|2
So don't let CI minutes concerns dissuade from pushing to gitlab merely to
publish the code.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


