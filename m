Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273C52DD291
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 15:02:30 +0100 (CET)
Received: from localhost ([::1]:51430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kptrR-0001Ze-16
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 09:02:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kptpk-0000k9-53
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:00:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kptpe-0004H5-HW
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:00:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608213637;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=2+16//hvUAw3zrcbJ9jokGLknjlIEA5pfZMurEUGmqc=;
 b=Vak7jPIibwslwJveoQIKmCWbWvPzxQIVZ29DYRSnDBJN999kW1KCdBWm6JCDh6Ht2Xfysk
 Rz/VUPSslkVrOTqiZ8DPcxaJAZUHL8Nxm6W/AjxnxuN5HQk/lKvxkwx1doceD5Thy+YWf6
 +l4419n6g2QfPIn+Z0+ka15TQjZNuaI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-nFV8zwMpOrahHdmGKuEnbA-1; Thu, 17 Dec 2020 09:00:20 -0500
X-MC-Unique: nFV8zwMpOrahHdmGKuEnbA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14638107ACE8;
 Thu, 17 Dec 2020 14:00:19 +0000 (UTC)
Received: from redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13FCB1A353;
 Thu, 17 Dec 2020 14:00:15 +0000 (UTC)
Date: Thu, 17 Dec 2020 14:00:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Status/future of QEMU bsd-user impl ? (Wea Re: [PULL 00/12] Compile
 QEMU with -Wimplicit-fallthrough)
Message-ID: <20201217140012.GF247354@redhat.com>
References: <20201216172949.57380-1-thuth@redhat.com>
 <CAFEAcA97zNc3yEfSeBTOuQLFghcJHbh_toJ368HMZzHke+y0SQ@mail.gmail.com>
 <a6271697-c645-968a-7e0f-e1993140633b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a6271697-c645-968a-7e0f-e1993140633b@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Ed Maste <emaste@freebsd.org>,
 Sean Bruno <sbruno@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Chen Qun <kuhn.chenqun@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 17, 2020 at 02:03:47PM +0100, Thomas Huth wrote:
> On 17/12/2020 13.51, Peter Maydell wrote:
> > On Wed, 16 Dec 2020 at 17:29, Thomas Huth <thuth@redhat.com> wrote:
> >>
> >>  Hi!
> >>
> >> The following changes since commit af3f37319cb1e1ca0c42842ecdbd1bcfc64a4b6f:
> >>
> >>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2020-12-15 21:24:31 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://gitlab.com/huth/qemu.git tags/pull-request-2020-12-16
> >>
> >> for you to fetch changes up to cbbedfeeb77e25b065f8a2b0c33e81403edaf728:
> >>
> >>   configure: Compile with -Wimplicit-fallthrough=2 (2020-12-16 12:52:20 +0100)
> >>
> >> ----------------------------------------------------------------
> >> * Compile QEMU with -Wimplicit-fallthrough=2 to avoid bugs in
> >>   switch-case statements
> >> ----------------------------------------------------------------
> > 
> > Hi; this generates a new warning on the NetBSD build:
> > 
> > ../src/bsd-user/main.c: In function 'cpu_loop':
> > ../src/bsd-user/main.c:513:16: warning: this statement may fall
> > through [-Wimplicit-fallthrough=]
> >              if (bsd_type != target_freebsd)
> >                 ^
> > ../src/bsd-user/main.c:515:9: note: here
> >          case 0x100:
> >          ^~~~
> 
> Oh man, can't we just ditch the bsd-user folder now? It's known to be broken
> since many releases, so it's currently only causing additional effort to
> keep this code compilable (also with regards to the automatic code scan tool
> reports that we've seen during the past months), without real benefit. Even
> if the BSD folks finally upstream their fixed version again, it's more
> likely that they will start from scratch again instead of fixing the old
> folder, I guess?

Yeah, it has been a while since we last discussed this:

  https://lists.gnu.org/archive/html/qemu-devel/2017-01/msg00171.html

Meanwhile their out of free bsd-user impl continues to be developed
until Dec 2019 at least:

  https://github.com/seanbruno/qemu-bsd-user/commits/bsd-user

I don't recall what happened after that initial discussion about
merging the new impl. Did Sean simply not have the time to invest
in the merge ? I'll CC him here to see what opinion he has on the
future of bsd-user in QEMU.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


