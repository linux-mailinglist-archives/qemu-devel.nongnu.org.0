Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352893EA523
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 15:08:33 +0200 (CEST)
Received: from localhost ([::1]:45392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEARj-0008Lj-Pm
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 09:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mEAPB-0007Hu-OZ
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 09:05:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mEAP6-0006ad-Mc
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 09:05:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628773544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HKKwam5heFvSym+YEXaYI79fglgmH6SVwpMrHXTamxM=;
 b=A2jRE05sKeApIsypN6U+Em8IVXRuxAyj7rCXrr3Bv3UL6wePOGR/+6bu6aqBKNdFK/3on/
 vki6uxh48nXJeAeSHBoY2QP4L613hqnydTlK6SGVgi33431KcxFKJ9sGAcXtSTLTCZMl07
 cYxBag7EwBBPyy4ylSvitRMDI3O8I0w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-Z9-KausnMA29VUTm8OKNKQ-1; Thu, 12 Aug 2021 09:05:41 -0400
X-MC-Unique: Z9-KausnMA29VUTm8OKNKQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 z186-20020a1c7ec30000b02902e6a27a9962so3100375wmc.3
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 06:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HKKwam5heFvSym+YEXaYI79fglgmH6SVwpMrHXTamxM=;
 b=pEjfousKTTLhCeIurD/llRR9zcRPiN/ZDB0EkBBHl8bC4yI2qxEPxLy7MmbgQZGSl1
 hf1E1fbejZugEnABMz1WfsyJUbM1ZZMwm5MND/Tx3Uh7DhpvG7MqxabIhV542GYFXrWA
 ZvelqaKFunueTouaW4AgR6dbQrGMBex6IiZPbt0FCXJLivGB2NLquWjY9hJBYcEQ92Xz
 k+GQlhFpChTCgmg7Qzu5s5QLcERh9i3lpQXwzNoXnH33L+v86efvXWidzF0KzV3xHIpc
 zh2aJLwXZSLKLwI138E2V1fHAShMxI8H6/t8uByaIeElUHNs+vnCOGborlB/pL09JMsF
 xg2g==
X-Gm-Message-State: AOAM531l3BOpsEErllotGJ4cDS6HwsNJ142/T0i2tyvtrQbQ2QfMbf30
 4pV+OhYajxmn1VRhuDTKtuTYFI3cIVRGsk8wrG8H675REi13EMDjuftrppE+z9UPZ1IavE7pwAT
 V+ulcFrJt8ZLxjZc=
X-Received: by 2002:a5d:610d:: with SMTP id v13mr1962341wrt.199.1628773539747; 
 Thu, 12 Aug 2021 06:05:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDVh3vuaduyNVhk72QuzXJuwf6eGyEdBrQsxT21j5TnyJryScWzE3pst7/fKakiw0vXmTVIQ==
X-Received: by 2002:a5d:610d:: with SMTP id v13mr1962314wrt.199.1628773539499; 
 Thu, 12 Aug 2021 06:05:39 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id k17sm2969155wrw.53.2021.08.12.06.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 06:05:38 -0700 (PDT)
Date: Thu, 12 Aug 2021 14:05:36 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] configure: Remove spurious [] from tr
Message-ID: <YRUcoAiKWtxfPVqB@work-vm>
References: <20210812110942.19065-1-dgilbert@redhat.com>
 <CAFEAcA9dp-kM_cB9g=7kpeCbFVxiwoQ14L+mymc_pHwZ_1UDnA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9dp-kM_cB9g=7kpeCbFVxiwoQ14L+mymc_pHwZ_1UDnA@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Thu, 12 Aug 2021 at 12:11, Dr. David Alan Gilbert (git)
> <dgilbert@redhat.com> wrote:
> >
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >
> > ShellCheck points out that tr '[a-z]' actually replaces the []'s
> > and only the a-z is needed.
> >
> > Remove the spurious [] - although in this use it will make no
> > difference.
> >
> > Fixes: bb55b712e8dc4d4eb515144d5c26798fea178cba
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >  configure | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/configure b/configure
> > index 9a79a004d7..5bb8c2a59d 100755
> > --- a/configure
> > +++ b/configure
> > @@ -4549,7 +4549,7 @@ if test "$gprof" = "yes" ; then
> >  fi
> >  echo "CONFIG_AUDIO_DRIVERS=$audio_drv_list" >> $config_host_mak
> >  for drv in $audio_drv_list; do
> > -    def=CONFIG_AUDIO_$(echo $drv | LC_ALL=C tr '[a-z]' '[A-Z]')
> > +    def=CONFIG_AUDIO_$(echo $drv | LC_ALL=C tr 'a-z' 'A-Z')
> >      echo "$def=y" >> $config_host_mak
> >  done
> >  if test "$alsa" = "yes" ; then
> > -
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks.

> (Is this the only thing shellcheck complains about in configure?
> I'm guessing not...)

Indeed it's not; there's LOTS of warnings; although most of them are
probably irrelevant; there are also two others at the error level:

In configure line 4406:
        if "$ld" -verbose 2>&1 | grep -q "^[[:space:]]*$emu[[:space:]]*$"; then
                                                       ^-- SC1087: Use braces when expanding arrays, e.g. ${array[idx]} (or ${var}[.. to quiet).

which is probably just needing the ${emu} to shut it up.

In configure line 4464:
if !(GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action" "$git_submodules"); then
    ^-- SC1035: You are missing a required space after the !.

which hmm I've not quite got my head around yet; but maybe that one is
real.


  https://www.shellcheck.net/wiki/SC1035 -- You are missing a required space ...
  https://www.shellcheck.net/wiki/SC1087 -- Use braces when expanding arrays,...

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


