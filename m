Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584F4344029
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:50:05 +0100 (CET)
Received: from localhost ([::1]:54918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJ4O-0007cT-Bq
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOJ1g-0005lx-5U
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:47:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOJ1a-0000u5-Bt
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616413629;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=FD1CUVQ7756riLkYPw3KQqaONS4BT7DvPfbwRqSk2o4=;
 b=ICjXsaD6ou2SNVWH8xg8Z/Niz1rqIx1xTtMpHyvaaaAvyvpkMUz3o9UAETyvUOjDHS2k/p
 uo5haCwdYeOWqz+KqRDhjwFb4uPU1aMNs6BUyRatlQWYZRhwfsA96vMSSaKV/2nOtzTVz3
 H9FJsrsKjl7XHW3PPE3f7pzGH2zNuyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-mzFlJcFMOKq-3lU5fvdL6Q-1; Mon, 22 Mar 2021 07:47:07 -0400
X-MC-Unique: mzFlJcFMOKq-3lU5fvdL6Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3B89593A2
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 11:47:06 +0000 (UTC)
Received: from redhat.com (ovpn-112-245.ams2.redhat.com [10.36.112.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E3AC60C5F;
 Mon, 22 Mar 2021 11:46:58 +0000 (UTC)
Date: Mon, 22 Mar 2021 11:46:55 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 0/8] [RfC] fix tracing for modules
Message-ID: <YFiDr7XEPyRudWEb@redhat.com>
References: <20210121125028.3247190-1-kraxel@redhat.com>
 <20210203163202.GF241524@stefanha-x1.localdomain>
 <20210222151332.vea6cszd4pwtkeno@sirius.home.kraxel.org>
 <YFiBRyV3DCMTWC+4@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YFiBRyV3DCMTWC+4@stefanha-x1.localdomain>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 11:36:39AM +0000, Stefan Hajnoczi wrote:
> On Mon, Feb 22, 2021 at 04:13:32PM +0100, Gerd Hoffmann wrote:
> >   Hi,
> > 
> > > > TODO:
> > > > Enabling modular tracepoints via -trace cmd line doesn't work yet.
> > > > Guess we need to store the list somewhere for later re-processing.
> > > > Error handling is tricky, specifically the "tracepoint doesn't exist"
> > > > error.  Suggestions / ideas are welcome.
> > > 
> > > Two ideas:
> > > 
> > > Global trace event name list
> > > ----------------------------
> > > Build *some* global information about all trace events, including
> > > modules, into the main QEMU binary. For example, generate an array of
> > > all trace event names so QEMU can always print an error if a
> > > non-existent trace event name is used. (This is similar to the
> > > trace-events-all file, which is a global list of all trace events.)
> > > 
> > > Module name prefixes
> > > --------------------
> > > Allow an optional module/group prefix like qxl:my_trace_event. When the
> > > user says:
> > > 
> > >   --trace qxl:my_trace_event
> > > 
> > > QEMU knows that this trace event belongs to the "qxl" module/group. It
> > > will not attempt to load it until the qxl module registers itself.
> > > 
> > > If "my_trace_event" doesn't exist in the qxl module:
> > > 1. If the qxl module is not loaded we don't hit an error. Nevermind.
> > > 2. When the qxl module is loaded pending events are resolved and an
> > >    error is printed.
> > 
> > Finally found the time to look at this again... 
> > 
> > So, we already have a "group".  Which is basically the sub-directory of
> > the trace-events file right now, and it seems to be mostly a build system
> > thing.  We get many small lists instead of one huge, but there seems to
> > be no other effect.  We could change that though, by giving each group
> > an (optional?) prefix.
> 
> Yes. This reminds me of an idea that was mentioned at the beginning of
> this effort: maybe QEMU modules should always have their own directory
> in the source tree instead of being alongside other source files that
> are built into the main binary.

This implies that each time we modularize something, we have to move
its source code. It is possible,  but it wouldn't be by preferred
choice.

> > There also is a probe prefix, apparently used by dtrace only.  Not sure
> > how to deal with that.  It prefix is qemu-<target-type>-<target-name>.
> > Giving qemu modules its own dtrace prefix looks sensible to me.  That
> > would probably something like "qemu-module-<name>".
> 
> I think the DTrace prefix needs to be the same as the executable name,
> but I'm not sure. I also don't know how that extends to shared libraries
> like QEMU modules. I'm afraid you would need to investigate the DTrace
> prefix.

I'm not aware of any requirement for dtrace prefix to match the
executable name. We don't even have an executable called "qemu"
so we're not matching even today.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


