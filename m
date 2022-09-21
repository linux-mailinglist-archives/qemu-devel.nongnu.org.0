Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 482E55BF7AC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 09:27:28 +0200 (CEST)
Received: from localhost ([::1]:37506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oau8k-0007pq-7Z
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 03:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oatvV-0002XW-5B
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 03:13:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oatvQ-0002LX-Sg
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 03:13:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663744419;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4w0hWuJ9Lhks5VRap9NVM/0T3P0dHI/Ey0Fh1B3HIfA=;
 b=a1pqzNwXpIT5DvujcE+BU5xFs5RdZzDRAYOG5muMZjjmVr50sXIhii655wrVMLNeXMlHMb
 9oI191kCH93G6zfyrVFwoPtxebPwBMqnnwB6bwyoFYcPRY5b2zKk1Co5qNEAqabsWiy8pG
 RilTUT1TVVBUYc+JPnDDQ6C1bs9Gl8E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361--8htkoqHOjygCRKSRciwxA-1; Wed, 21 Sep 2022 03:13:38 -0400
X-MC-Unique: -8htkoqHOjygCRKSRciwxA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D41C101E14E;
 Wed, 21 Sep 2022 07:13:37 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A4CB40C6EC5;
 Wed, 21 Sep 2022 07:13:36 +0000 (UTC)
Date: Wed, 21 Sep 2022 08:13:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Warner Losh <imp@bsdimp.com>
Cc: Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Brad Smith <brad@comstyle.com>, John Snow <jsnow@redhat.com>
Subject: Re: QEMU's FreeBSD 13 CI job is failing
Message-ID: <Yyq5mhBi10bEw+g+@redhat.com>
References: <b403c8e4-3788-7ba1-a038-3a71fa0bc7c6@redhat.com>
 <Yyl4EO0L5h02HOLN@redhat.com>
 <ed402176-df96-dff2-869b-a3326e6314ea@redhat.com>
 <Yyl5yRMxGAEA7K05@redhat.com>
 <CANCZdfr6HWx8M8YzWDv2sqi96z+HyLMSGtzTUnTF_XbfNzcs4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANCZdfr6HWx8M8YzWDv2sqi96z+HyLMSGtzTUnTF_XbfNzcs4g@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 20, 2022 at 02:21:46PM -0600, Warner Losh wrote:
> On Tue, Sep 20, 2022 at 2:57 AM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Tue, Sep 20, 2022 at 10:23:56AM +0200, Thomas Huth wrote:
> > > On 20/09/2022 10.21, Daniel P. Berrangé wrote:
> > > > On Tue, Sep 20, 2022 at 08:44:27AM +0200, Thomas Huth wrote:
> > > > >
> > > > > Seen here for example:
> > > > >
> > > > > https://gitlab.com/qemu-project/qemu/-/jobs/3050165356#L2543
> > > > >
> > > > > ld-elf.so.1: /lib/libc.so.7: version FBSD_1.7 required by
> > > > > /usr/local/lib/libpython3.9.so.1.0 not found
> > > > > ERROR: Cannot use '/usr/local/bin/python3', Python >= 3.6 is
> > required.
> > > > >
> > > > > ... looks like the Python binary is not working anymore? Does
> > anybody know
> > > > > what happened here?
> > > >
> > > > FreeBSD ports is only guaranteed to work with latest minor release
> > > > base image. The python binary recently started relying on symbols
> > > > in the 13.1 base image, and we're using 13.0.
> > > >
> > > > I updated lcitool last week to pick 13.1, so we just need a refresh
> > > > on the QEMU side to pick this up.
> > >
> > > OK ... Alex, IIRC you have a patch queued to update the files that are
> > > refreshed by lcitool ... does that already contain the update for
> > FreeBSD,
> > > too?
> >
> > Oh actually, I'm forgetting that QEMU doesn't use the 'lcitool manifest'
> > command for auto-generating the gitlab-ci.yml file. In QEMU's case just
> > manually edit .gitlab-ci.d/cirrus.yml to change
> >
> >     CIRRUS_VM_IMAGE_NAME: freebsd-13-0
> >
> 
> FreeBSD's support policy is that we EOL minor dot releases a few months
> after
> the next minor release is final. Part of that process involves moving the
> build
> of packages to that new minor version (which is what's not guaranteed to
> work
> on older versions... only old binaries on new versions is guaranteed)...
> And that's
> the problem that was hit here.

It would be nice if something in the ports tool / packages was
able to report the incompatibility at time of install, rather
than leaving a later runtime failed.

> I'll try to submit changes after the next minor release in that 'few month'
> window
> to update this in the future. In general, doing so would be the best fit
> with FreeBSD's
> support model...  It's one of those things I didn't think of at the time,
> but is obvious in
> hindsight.

Note, we're reliant on Cirrus CI actually publishing the new images
for use. I've not previously checked before how quickly they publish
them after FreeBSD does the upstream release, but anyway I go by what
they list here:

  https://cirrus-ci.org/guide/FreeBSD/

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


