Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904E5623A2A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 04:05:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osxr6-0006r1-Fd; Wed, 09 Nov 2022 22:03:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1osxr3-0006qW-7w
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 22:03:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1osxr0-0001FR-T3
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 22:03:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668049425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eKioFEkp8BJEFmkFz42t805E4P5A9hO3Wyi4CHX5wGw=;
 b=HJ7UMG74YDWAmEB/ptuv4pWVFjosDxqlRXvARJYSMFjW/2vrSuzpLQEPm8CjCtmhi20ICv
 DdSjFSk1DmU327FfB+l9OVDWlv8bT/PEnhGc9PBgIHVBg7E1PPNyQUzY9CyM7D/rDKpRtp
 00MvS79Ztu6EpL1jCg9pzESraojQoMU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-37-hg9gxj27NtSFjIWzm5zDzw-1; Wed, 09 Nov 2022 22:03:43 -0500
X-MC-Unique: hg9gxj27NtSFjIWzm5zDzw-1
Received: by mail-ej1-f72.google.com with SMTP id
 nc4-20020a1709071c0400b0078a5ceb571bso378226ejc.4
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 19:03:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eKioFEkp8BJEFmkFz42t805E4P5A9hO3Wyi4CHX5wGw=;
 b=oRDM9JtwMDVERVnhpDbBlPkoZtizXryrwzHLFpmAfOJWZDbH90WAZ+mkNJevUqRnpF
 Z0pa8KzC2Xds6tq3WZ46C/ItMO+MNKjAwN3413JTAhisVq8U2ENh7m50zD/1X8ja6ZwH
 1FMu/009j3LDktTzLGKopD3UR33aQnCjTSuDL6BJyfCWaBGK8okil9sQyPoMBVOggDF0
 Um3Zo84LM3dN2VKZP9n6URJ3gQtFsp+/rDshh5rWLzo69ouxhku3QyZeTcrL+wCZYfsN
 fm7adwmQ6hSpRBMvElwJGBU5gxli9Xd5V/fg80+gM2YwPMn9N2rXgh5VwAB6OW+IBp2G
 9/Lg==
X-Gm-Message-State: ACrzQf2X8FO7mp5aY9xci9HC0rkr8ikzChy8gm2V/EOQ/qNeN+EbIR/q
 SI85teJb8Gjmk9c1q1I3NmsB0tNGhYVxyPWParwvIp5Ej4Hg+ivjCVlSS3mLmo5b2bJ5PrwgbYw
 uLlaUFhnDA7TmOUcQoUGNSdNzln+ox/k=
X-Received: by 2002:a05:6402:544:b0:463:beae:427f with SMTP id
 i4-20020a056402054400b00463beae427fmr45416431edx.29.1668049422512; 
 Wed, 09 Nov 2022 19:03:42 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6g9n63sNSfyf6vx0pcHxRDc+N9QWJ3eKhcLzD/Ipcsl6XceKshXO/A19fPKOOrZ4E5KFOdxxSH+Hypn83yPjI=
X-Received: by 2002:a05:6402:544:b0:463:beae:427f with SMTP id
 i4-20020a056402054400b00463beae427fmr45416421edx.29.1668049422313; Wed, 09
 Nov 2022 19:03:42 -0800 (PST)
MIME-Version: 1.0
References: <20221104103017.181600-1-zhenyzha@redhat.com>
 <87o7tgpi9s.fsf@pond.sub.org>
In-Reply-To: <87o7tgpi9s.fsf@pond.sub.org>
From: Zhenyu Zhang <zhenyzha@redhat.com>
Date: Thu, 10 Nov 2022 11:03:06 +0800
Message-ID: <CAJFLiBJNZPWDU6SDf3xUMORRywYouu74h7sRcFvtytDQrFo+3A@mail.gmail.com>
Subject: Re: [PATCH v2] qom.json: default the prealloc-threads to smp-cpus
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, shan.gavin@gmail.com, 
 liuyd.fnst@fujitsu.com, eric.auger@redhat.com, imammedo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=zhenyzha@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Many thanks for your patient review, I learned a lot.
I will send v3 to correct it.

On Wed, Nov 9, 2022 at 5:52 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> The subject is misleading, I'm afraid.  It suggests you're changing the
> default.  You don't, you just fix its documentation.
>
> Zhenyu Zhang <zhenyzha@redhat.com> writes:
>
> > Since the amount of prealloc-threads to smp-cpus is
> > defaulted in hostmem, so sync this information.
>
> Covering history could be helpful.
>
> Here's my try
>
>     qapi/qom: Memory backend property prealloc-threads doc fix
>
>     Commit ffac16fab3 "hostmem: introduce "prealloc-threads" property"
>     (v5.0.0) changed the default number of threads from number of CPUs
>     to 1.  This was deemed a regression, and fixed in commit f8d426a685
>     "hostmem: default the amount of prealloc-threads to smp-cpus".
>     Except the documentation remained unchanged.  Update it now.
>
> >
> > Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>
>
> The following part ...
>
> > v1: https://www.mail-archive.com/qemu-devel@nongnu.org/msg919682.html
> >
> > Changelog
> > =========
> > v2:
> >   * This property is available since 5.0.                     (Philippe)
> > ---
>
> ... needs to go below the --- line, so it doesn't go into git.
>
> >  qapi/qom.json | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/qapi/qom.json b/qapi/qom.json
> > index 87fcad2423..b2f6bceec7 100644
> > --- a/qapi/qom.json
> > +++ b/qapi/qom.json
> > @@ -576,7 +576,7 @@
> >  #
> >  # @prealloc: if true, preallocate memory (default: false)
> >  #
> > -# @prealloc-threads: number of CPU threads to use for prealloc (default: 1)
> > +# @prealloc-threads: number of CPU threads to use for prealloc (default: smp-cpus) (since 5.0)
>
> Long line.
>
> "smp-cpus" is not defined.  It's QOM property /machine/smp member @cpus,
> commonly set with -M smp.cpus=N (or its sugared form -smp cpus=N).
>
> Suggest
>
>    # @prealloc-threads: number of CPU threads to use for prealloc
>    # (default: number of CPUs) (since 5.0)
>
> >  #
> >  # @prealloc-context: thread context to use for creation of preallocation threads
> >  #                    (default: none) (since 7.2)
>


