Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 863074ADB17
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:24:57 +0100 (CET)
Received: from localhost ([::1]:51026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHRQN-0006HL-IB
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:24:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nHP3N-00037r-VJ
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:53:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nHP3L-0004CB-64
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:53:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644321177;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p+qZyeGrms3II6ovS4Yu1VIXUlVDkdTDCQTauRh7YmY=;
 b=EKaWFwDyU6pTkZNVz4S1pcrXudHIQ6ce86pIaPEpkfM9C7c+0Ce01Xavoe9z4Y3U4eoK1O
 pRGZlkLSEBEj1TJjpJ7I2QTfpv/k7x71UBXZQKcy5KUxud7Ek9QG7Ax4ERHObk5/mgLysU
 lsTFrzQCx3X8nOMBAcfyo0mvWPr1voM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-NJxgtrs7PwuiwCMdWLFXvA-1; Tue, 08 Feb 2022 06:52:54 -0500
X-MC-Unique: NJxgtrs7PwuiwCMdWLFXvA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A631783DEA6;
 Tue,  8 Feb 2022 11:52:53 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 099662B3A7;
 Tue,  8 Feb 2022 11:52:33 +0000 (UTC)
Date: Tue, 8 Feb 2022 11:52:31 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 08/11] mos6522: add "info via" HMP command for debugging
Message-ID: <YgJZfwfpX5/R9HfR@redhat.com>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-9-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA8ZiLTgeG_2aUHBoV0io52623VRybG0NL0uY8=9Fg59Kg@mail.gmail.com>
 <71542eb1-fc8f-8f30-81e0-35c9df764825@amsat.org>
 <877da5wzgp.fsf@pond.sub.org> <YgJF9SDwb93k5/fg@work-vm>
MIME-Version: 1.0
In-Reply-To: <YgJF9SDwb93k5/fg@work-vm>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 08, 2022 at 10:29:09AM +0000, Dr. David Alan Gilbert wrote:
> * Markus Armbruster (armbru@redhat.com) wrote:
> > Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> > 
> > > On 7/2/22 20:34, Peter Maydell wrote:
> > >> On Thu, 27 Jan 2022 at 21:03, Mark Cave-Ayland
> > >> <mark.cave-ayland@ilande.co.uk> wrote:
> > >>>
> > >>> This displays detailed information about the device registers and timers to aid
> > >>> debugging problems with timers and interrupts.
> > >>>
> > >>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > >>> ---
> > >>>   hmp-commands-info.hx | 12 ++++++
> > >>>   hw/misc/mos6522.c    | 92 ++++++++++++++++++++++++++++++++++++++++++++
> > >>>   2 files changed, 104 insertions(+)
> > >> 
> > >> I'm not sure how keen we are on adding new device-specific
> > >> HMP info commands, but it's not my area of expertise. Markus ?
> > >
> > > HMP is David :)
> > 
> > Yes.
> 
> So let me start with an:
> 
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> (If it's useful info for the author of the device, then I'm happy for
> HMP to have that), but then - (moving the reply around a bit):
> 
> 
> > Should this be conditional on the targets where we actually link the
> > device, like info skeys?
> > 
> 
> Yes, I think so; it's a reasonably old/obscure device, there's no reason
> everyone having it built in.
> 
> > >                 IIRC it is OK as long as HMP is a QMP wrapper.
> > 
> > That's "how to do it", and I'll get back to it in a jiffie, but Peter
> > was wondering about the "whether to do it".
> > 
> > Most HMP commands are always there.
> > 
> > We have a few specific to compile-time configurable features: TCG, VNC,
> > Spice, Slirp, Linux.  Does not apply here.
> > 
> > We have a few specific to targets, such as dump-skeys and info skeys for
> > s390.  Target-specific is not quite the same as device-specific.
> > 
> > We have no device-specific commands so far.  However, dump-skeys and
> > info skeys appear to be about the skeys *device*, not the s390 target.
> > Perhaps any s390 target has such a device?  I don't know.  My point is
> > we already have device-specific commands, they're just masquerading as
> > target-specific commands.
> 
> Yeh we've got info lapic/ioapic as well.
> 
> > The proposed device-specific command uses a mechanism originally made
> > for modules instead (more on that below).
> > 
> > I think we should make up our minds which way we want device-specific
> > commands done, then do *all* of them that way.
> 
> I think device specific commands make sense, but I think it would
> probably be better if we had an 'info dev $name' and that a method on
> the device rather than registering each one separately.
> I'd assume that this would be a QMP level thing that got unwrapped at
> HMP.
> 
> But that's not a problem for this contribution; someone else can figure
> that out later.

Actually I think this would solve a problem with this contribution.
This patch implements a QMP command but never registers it, so it
isn't actually accessible via QMP. It only registers the HMP wrapper
which rather defeats the point of doing it via the QMP HumanReadableText
approach.

I'm guessing this was done because we don't have ability to dynamically
register QMP commands at runtime.  I don't know how hard/easy it is
to address this, and perhaps we don't even want to.  It was a problem
for me when previously converting HMP info commands to QMP and I
didn't get a solution, so didn't convert anything where the command
impl was dynamically registered at runtime. This basically excluded
converting devices that have been split into loadable modules.

If we had a general  'info dev-debug' (HMP) and  'x-query-dev-debug'
commands, then we could side-step the QMP limitation, as both thue
HMP and QMP comamnds could be statically registered. The devices
then only need to register  a callback at runtime which should be
easier to deal with.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


