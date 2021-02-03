Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2013C30DE9A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 16:49:07 +0100 (CET)
Received: from localhost ([::1]:46248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7KOw-0000kT-6T
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 10:49:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l7KNV-0007vP-9Y
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 10:47:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l7KNT-0005WT-5r
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 10:47:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612367254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Lui+YelUwjhy3X7IWp7Mo6UpkswFI+HVsHM4SaEFrg=;
 b=DgDtA5Gy+8Y5zDCJmghB7qmidfb6CGdl0yIUGejk5u1jMN/kGKIeL4a0eJ8GIO62L78bBj
 G/SvN91ED2hZ3kpcAPp9EuznFpjBaPNreXjFrW1Mxr1rNinC44WWjqDoq5ZokqarLEvS1i
 lEFMRJi+myJY00mWSRYiBzAFHCr3H6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-_EWBIO4KPmuJjixOecuxQw-1; Wed, 03 Feb 2021 10:47:32 -0500
X-MC-Unique: _EWBIO4KPmuJjixOecuxQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FA65800C78;
 Wed,  3 Feb 2021 15:47:31 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-32.ams2.redhat.com [10.36.115.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 617F85D6A8;
 Wed,  3 Feb 2021 15:47:10 +0000 (UTC)
Date: Wed, 3 Feb 2021 16:47:08 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 03/12] qga: Replace '--blacklist' command line option by
 '--denylist'
Message-ID: <20210203154708.GE5507@merkur.fritz.box>
References: <20210202205824.1085853-1-philmd@redhat.com>
 <20210202205824.1085853-4-philmd@redhat.com>
 <20210203100952.GD300990@redhat.com>
 <50e2133b-a6a2-a878-366f-eadcfd453aa@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <50e2133b-a6a2-a878-366f-eadcfd453aa@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 03.02.2021 um 13:45 hat BALATON Zoltan geschrieben:
> On Wed, 3 Feb 2021, Daniel P. Berrangé wrote:
> > On Tue, Feb 02, 2021 at 09:58:15PM +0100, Philippe Mathieu-Daudé wrote:
> > > Follow the inclusive terminology from the "Conscious Language in your
> > > Open Source Projects" guidelines [*] and replace the word "blacklist"
> > > appropriately.
> > > 
> > > Keep the --blacklist available for backward compatibility.
> > > 
> > > [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
> > > 
> > > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > > ---
> > >  docs/interop/qemu-ga.rst | 2 +-
> > >  qga/main.c               | 6 ++++--
> > >  2 files changed, 5 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/docs/interop/qemu-ga.rst b/docs/interop/qemu-ga.rst
> > > index 9a590bf95cb..89596e646de 100644
> > > --- a/docs/interop/qemu-ga.rst
> > > +++ b/docs/interop/qemu-ga.rst
> > > @@ -79,7 +79,7 @@ Options
> > > 
> > >    Daemonize after startup (detach from terminal).
> > > 
> > > -.. option:: -b, --blacklist=LIST
> > > +.. option:: -b, --denylist=LIST
> > > 
> > >    Comma-separated list of RPCs to disable (no spaces, ``?`` to list
> > >    available RPCs).
> > > diff --git a/qga/main.c b/qga/main.c
> > > index 249fe06e8e5..66177b9e93d 100644
> > > --- a/qga/main.c
> > > +++ b/qga/main.c
> > > @@ -257,7 +257,8 @@ QEMU_COPYRIGHT "\n"
> > >  #ifdef _WIN32
> > >  "  -s, --service     service commands: install, uninstall, vss-install, vss-uninstall\n"
> > >  #endif
> > > -"  -b, --blacklist   comma-separated list of RPCs to disable (no spaces, \"?\"\n"
> > > +"  --blacklist       backward compatible alias for --denylist (deprecated)\n"
> > > +"  -b, --denylist    comma-separated list of RPCs to disable (no spaces, \"?\"\n"
> > 
> > 
> > "-b" is a bit odd as a short name now, but i guess that's not the end
> > of the world.
> 
> Maybe -b, --block  or --block-rpc? Not the best but at least preserves
> consistency with the short option.

I was thinking about something like --blocked-rpcs, too, so +1 from me
for your latter option.

If we're touching these names, let's try to actually make them good, not
just different. Neither --blacklist nor --denylist actually describe
well what the option does.

Kevin


