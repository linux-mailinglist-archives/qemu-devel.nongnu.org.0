Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD1069801B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:01:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKCb-0008Fi-JA; Wed, 15 Feb 2023 11:00:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSKCN-0008Bt-V4
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:00:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSKCK-00077o-UP
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:59:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676476796;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MjyrLeRznNocaVSMMUggkDPDQcEYTGVABAvcRE7MFy4=;
 b=fugIDt1ZMo+lNM7JqvLuczkznEEk6+zDSsOGQJ2UjTtuXnsFEB+xfyzerRttcCFdgAiQ2P
 V6Vnc6SSUdNpHY5k9mAmL9qEhxKSuxlTB/d6alKu5ZUt0lwJbF7D+Tu4+c3mqNaKNO1TT3
 +i3hbJo185bE4uQIiO5rPpPferAqpWY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-kWg4lkzQMOi6fQI741SYiw-1; Wed, 15 Feb 2023 10:59:52 -0500
X-MC-Unique: kWg4lkzQMOi6fQI741SYiw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 417EB2804842;
 Wed, 15 Feb 2023 15:59:52 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.254])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B16FE18EC1;
 Wed, 15 Feb 2023 15:59:49 +0000 (UTC)
Date: Wed, 15 Feb 2023 15:59:47 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: Dorinda Bassey <dbassey@redhat.com>, qemu-devel@nongnu.org,
 kraxel@redhat.com, armbru@redhat.com, qemu_oss@crudebyte.com,
 pbonzini@redhat.com, wtaymans@redhat.com
Subject: Re: [PATCH] audio/pwaudio.c: Add Pipewire audio backend for QEMU
Message-ID: <Y+0BcwxQ2INww8dN@redhat.com>
References: <20230215085102.415053-1-dbassey@redhat.com>
 <CAJ+F1CL0_OAj5-jsyCVY5aF=qoSoPx2Mu=q8Z7mpp3mesRi6=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CL0_OAj5-jsyCVY5aF=qoSoPx2Mu=q8Z7mpp3mesRi6=Q@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

On Wed, Feb 15, 2023 at 05:18:50PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Feb 15, 2023 at 12:51 PM Dorinda Bassey <dbassey@redhat.com> wrote:
> >
> > This commit adds a new audiodev backend to allow QEMU to use Pipewire as both an audio sink and source. This backend is available on most systems.
> >
> 
> Hmm, I would rather have less audio (and ui) backends in QEMU. (for
> audio, if I could introduce and keep only one, that would be
> GStreamer: to remove the others..)

Even if we take this patch, and don't have a gstreamer impl,
it feels like we've scope for cutting down the backends.

The 'oss' driver for example ?  On Linux that's long obsolete,
with alsa or one of the higher level APIs available.  OSS was
also use on freebsd, but IIUC,  sndio is better choice there
now too ?  Deprecate (and later remove) 'oss' now ?

The 'sdl' driver is setup in meson.build as our lowest priority
impl, we'll pick any other driver ahead of sdl. Is there any
compelling reason why we must give users the option of 'sdl'
for audio when we have soo many other choices available ?
Even if using SDL for graphics, it seems like we can use any
other backend for audio. Deprecate (and later remove) 'sdl'
for audio ?

IIUC, pipewire is positioned to replace pulseaudio. So if we
take a pipewire backend, once pipewire is available in enough
distros we could deprecate the pulseaudio backend and eventually
remove it. Maybe the same applies for 'jack' ?

IOW, could we get to

 - Windows: dsound
 - MacOS: coreaudio
 - (Open|Net|Free)BSD: sndio
 - Linux: alsa/pipewire

?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


