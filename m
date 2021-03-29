Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E783B34CD95
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 12:04:52 +0200 (CEST)
Received: from localhost ([::1]:57198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQolQ-00050y-1h
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 06:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lQojE-0004YQ-Et
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 06:02:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lQoj8-0002Yc-3x
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 06:02:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617012147;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c9xa0auiIOon5K5mN1jZAquo57OeiHm23mYu4G0v9Hg=;
 b=PUPhEWB2+zrKyrPH3J9nOLPsodNMYS49lO6+jbcyl4CI6HAhBAsvdQHQJYZSuht8Qv+CYt
 VF37zGd66x88eTM+jGyOi4XePFO7LttV70p/XOe+oMFVTH5KKva0wYi9AXvmxSV89uRDWD
 sEWcdhGbyWq01wJ1wFJUwm5AeoRQRmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-PwCRuNxEP4O8jwnXdWUF-w-1; Mon, 29 Mar 2021 06:02:22 -0400
X-MC-Unique: PwCRuNxEP4O8jwnXdWUF-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 007F5107ACCA
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 10:02:22 +0000 (UTC)
Received: from redhat.com (ovpn-114-228.ams2.redhat.com [10.36.114.228])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F3A660D79;
 Mon, 29 Mar 2021 10:02:13 +0000 (UTC)
Date: Mon, 29 Mar 2021 11:02:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 0/8] [RfC] fix tracing for modules
Message-ID: <YGGlo0C/JqlyQLMV@redhat.com>
References: <20210121125028.3247190-1-kraxel@redhat.com>
 <20210203163202.GF241524@stefanha-x1.localdomain>
 <20210222151332.vea6cszd4pwtkeno@sirius.home.kraxel.org>
 <YFiHnr/uguP8/Vtz@redhat.com>
 <20210326124700.taujcpo2xqbn2pzj@sirius.home.kraxel.org>
 <YGGcnmLvFHEkX4ot@redhat.com>
 <20210329094818.q4xtejd6labmb5gr@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210329094818.q4xtejd6labmb5gr@sirius.home.kraxel.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 29, 2021 at 11:48:18AM +0200, Gerd Hoffmann wrote:
> On Mon, Mar 29, 2021 at 10:23:42AM +0100, Daniel P. Berrangé wrote:
> > On Fri, Mar 26, 2021 at 01:47:00PM +0100, Gerd Hoffmann wrote:
> > >   Hi,
> > > 
> > > > eg a trace point "dma_map_wait" gets mapped to probes in many
> > > > .stp files, once per target, because we need to match based on
> > > > the executable path:
> > > > 
> > > >   probe qemu.system.x86_64.dma_map_wait = process("/usr/libexec/qemu-system-x86_64").mark("dma_map_wait")
> > > >   probe qemu.system.x86_64.dma_map_wait = process("/usr/libexec/qemu-system-ppc64").mark("dma_map_wait")
> > > 
> > > Probe qemu.system.ppc64.dma_map_wait = ...
> > > 
> > > Can I trace qemu started from build directory?
> > > Seems scripts/qemu-trace-stap doesn't support that.
> > 
> > We should really generate extra equiv .stp files just for running from
> > the build.
> 
> Well, "make install" with --prefix=$HOME/qemu-install fixed that for the time
> being.
> 
> Now I have this:
> 
> kraxel@sirius ~/qemu-install/bin# sudo ./qemu-trace-stap -v run ./qemu-system-x86_64 "qxl_soft_reset"
> Using tapset dir '/home/kraxel/qemu-install/share/systemtap/tapset' for binary './qemu-system-x86_64'
> Compiling script 'probe qemu.system.x86_64.log.qxl_soft_reset {}'
> semantic error: unresolved function pid: identifier 'pid' at /home/kraxel/qemu-install/share/systemtap/tapset/qemu-system-x86_64-log.stp:5451:41
>         source:     printf("%d@%d qxl_soft_reset %d\n", pid(), gettimeofday_ns(), qid)
>                                                         ^
> 
> Pass 2: analysis failed.  [man error::pass2]
> 
> Any clue why pid() isn't known?

Hmm, strange, makes me think we have a bug causing it to not pull in
global functions.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


