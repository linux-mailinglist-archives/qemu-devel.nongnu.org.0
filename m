Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2AF366859
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 11:49:57 +0200 (CEST)
Received: from localhost ([::1]:35782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ9Ua-0006fA-Fh
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 05:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lZ9TW-0006Ce-MZ
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 05:48:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lZ9TT-0006Wk-JX
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 05:48:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618998526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QD19puLjkoCCvkxK1G/EmbvZdItS5MULv7zCGgJyfDE=;
 b=Jb4G/ZU+Arqzu4CFgqTwzDI3cu9h3Jw+EA7XmRInOoo1d9aSa54fIfWkVdvowrRh6kl5R8
 E+SNQXwUE88Fdquao3HvW5D+feKofeaUy4+tqmmOdnyHnNWmLXX+44k3igVWwVypimeRV2
 XoidedYplZqyyIwNMBO2dt1in6AzhN8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-qXE-mq9lMWCCCn6zh8wMxw-1; Wed, 21 Apr 2021 05:48:44 -0400
X-MC-Unique: qXE-mq9lMWCCCn6zh8wMxw-1
Received: by mail-wm1-f72.google.com with SMTP id
 g199-20020a1c9dd00000b02901355dd71edaso193237wme.7
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 02:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=lz88bUqN7jGpG/6E9kFSXV5HpsTedhkwJFs5t235oFI=;
 b=efXequRoorWMmQYzexXxwx41OyAJbgNq3vfUFkAkBMZn5DtyqbViCswk18MvXea8jg
 EHickDzfd7dRMdPnt0W8yVou2lzrnNSPgl9W8hyal2VXykx9/Fo91eUvHO5cptg4VK56
 8wqRKSnhzm7RXmUot1sqOu07GR9NTTUjsem6FL8wafv9jvVAv3Qn2KGhyC0EfePYWcEk
 XFrua3UT76sNgQt+3bD9i/E6DGHa6Fk22/Ct9XwYXKunpsqfcjjb1GJNkCyVFd/cFCQA
 aRJj/GdHGH7rrGsoeVsvFwRIKsLgISFt3J/1HHm0NE2YPvOSMZo81M5aO78HH0BSoA3E
 OVAQ==
X-Gm-Message-State: AOAM531JRxKWcwu4xZKLi6RUUt8budAjNYo4aQ91JBzV31IshoZTF1DI
 VJjwtE18P4BYxtuNWp6ldo/rcQiE3f2P7vKXK4KcXzB6IgrWnO1m/qkWWxlCruh/ayFSSAmg2oz
 rOSPX4aF9+OIyQWM=
X-Received: by 2002:adf:e8cf:: with SMTP id k15mr26004504wrn.112.1618998522999; 
 Wed, 21 Apr 2021 02:48:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMvv/kgH7gU4OUBQxeoIfv3DkOE9J5HBEgXs2mOvXUv7z3j+QJTf4KG9ml7yY4rT+rFvdgDQ==
X-Received: by 2002:adf:e8cf:: with SMTP id k15mr26004486wrn.112.1618998522790; 
 Wed, 21 Apr 2021 02:48:42 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id f8sm1768537wmc.8.2021.04.21.02.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 02:48:42 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 0/2] i386: Fix interrupt based Async PF enablement
In-Reply-To: <YH/yW+mVgvGHXXmW@redhat.com>
References: <20210401151957.408028-1-vkuznets@redhat.com>
 <ea3fc380-332f-b9e5-aa31-3540916cfc33@redhat.com>
 <87sg43d4gk.fsf@vitty.brq.redhat.com>
 <091dec53-cc0c-04ca-154a-3cfab6475705@redhat.com>
 <YHiQlkIOHDClFfXS@work-vm> <20210420173541.24kxarhw75h2rqxa@habkost.net>
 <8735vkhw29.fsf@vitty.brq.redhat.com> <YH/nZNk49bPdSyF/@redhat.com>
 <87zgxsgf3q.fsf@vitty.brq.redhat.com> <YH/yW+mVgvGHXXmW@redhat.com>
Date: Wed, 21 Apr 2021 11:48:41 +0200
Message-ID: <87tuo0ge86.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Apr 21, 2021 at 11:29:45AM +0200, Vitaly Kuznetsov wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > On Wed, Apr 21, 2021 at 10:38:06AM +0200, Vitaly Kuznetsov wrote:
>> >> Eduardo Habkost <ehabkost@redhat.com> writes:
>> >>=20
>> >> > On Thu, Apr 15, 2021 at 08:14:30PM +0100, Dr. David Alan Gilbert wr=
ote:
>> >> >> * Paolo Bonzini (pbonzini@redhat.com) wrote:
>> >> >> > On 06/04/21 13:42, Vitaly Kuznetsov wrote:
>> >> >> > > older machine types are still available (I disable it for <=3D=
 5.1 but we
>> >> >> > > can consider disabling it for 5.2 too). The feature is upstrea=
m since
>> >> >> > > Linux 5.8, I know that QEMU supports much older kernels but th=
is doesn't
>> >> >> > > probably mean that we can't enable new KVM PV features unless =
all
>> >> >> > > supported kernels have it, we'd have to wait many years otherw=
ise.
>> >> >> >=20
>> >> >> > Yes, this is a known problem in fact. :(  In 6.0 we even support=
 RHEL 7,
>> >> >> > though that will go away in 6.1.
>> >> >> >=20
>> >> >> > We should take the occasion of dropping RHEL7 to be clearer abou=
t which
>> >> >> > kernels are supported.
>> >> >>=20
>> >> >> It would be nice to be able to define sets of KVM functonality tha=
t we
>> >> >> can either start given machine types with, or provide a separate s=
witch
>> >> >> to limit kvm functionality back to some defined point.  We do trip=
 over
>> >> >> the same things pretty regularly when accidentally turning on new
>> >> >> features.
>> >> >
>> >> > The same idea can apply to the hyperv=3Don stuff Vitaly is working
>> >> > on.  Maybe we should consider making a generic version of the
>> >> > s390x FeatGroup code, use it to define convenient sets of KVM and
>> >> > hyperv features.
>> >>=20
>> >> True, the more I look at PV features enablement, the more I think tha=
t
>> >> we're missing something important in the logic. All machine types we
>> >> have are generally suposed to work with the oldest supported kernel s=
o
>> >> we should wait many years before enabling some of the new PV features
>> >> (KVM or Hyper-V) by default.
>> >>=20
>> >> This also links to our parallel discussion regarding migration
>> >> policies. Currently, we can't enable PV features by default based on
>> >> their availability on the host because of migration, the set may diff=
er
>> >> on the destination host. What if we introduce (and maybe even switch =
to
>> >> it by default) something like
>> >>=20
>> >>  -migratable opportunistic (stupid name, I know)
>> >>=20
>> >> which would allow to enable all features supported by the source host
>> >> and then somehow checking that the destination host has them all. Thi=
s
>> >> would effectively mean that it is possible to migrate a VM to a
>> >> same-or-newer software (both kernel an QEMU) but not the other way
>> >> around. This may be a reasonable choice.
>> >
>> > I don't think this is usable in pratice. Any large cloud or data cente=
r
>> > mgmt app using QEMU relies on migration, so can't opportunistically
>> > use arbitrary new features. They can only use features in the oldest
>> > kernel their deployment cares about. This can be newer than the oldest
>> > that QEMU supports, but still older than the newest that exists.
>> >
>> > ie we have situation where:
>> >
>> >  - QEMU upstream minimum host is version 7
>> >  - Latest possible host is version 45
>> >  - A particular deployment has a mixture of hosts at version 24 and 37
>> >
>> > "-migratable opportunistic"  would let QEMU use features from version =
37
>> > despite the deployment needing compatibility with host version 24 stil=
l.
>> >
>>=20
>> True; I was not really thinking about 'big' clouds/data centers, these
>> should have enough resources to carefully set all the required features
>> and not rely on the 'default'. My thoughts were around using migration
>> for host upgrade on smaller (several hosts) deployments and in this case
>> it's probably fairly reasonable to require to start with the oldest host
>> and upgrade them all if getting new features is one of the upgrade goals=
.
>
>
>> > It is almost as if we need to have a way to explicitly express a minim=
um
>> > required host version that VM requires compatibility with, so deployme=
nts
>> > can set their own baseline that is newer than QEMU minimum.
>>=20
>> Yes, maybe, but setting the baseline is also a non-trivial task:
>> e.g. how would users know which PV features they can enable without
>> going through Linux kernel logs or just trying them on the oldest kernel
>> they need? This should probably be solved by some upper layer management
>> app which would collect feature sets from all hosts and come up with a
>> common subset. I'm not sure if this is done by some tools already.
>
> I specifically didn't talk in terms of features, because the problem you
> describe is unreasonable to push onto applications.
>
> Rather QEMU could express host baseline
>
>    - "host-v1"  - features A and B
>    - "host-v2"  - features A, B and C
>    - "host-v3"  - features A, B, C, D, E and f
>
> The mgmt app / admin only has to know which QEMU host baselines their
> hosts support.
>
> Essentially this could be viewed as separating the host kernel dependant
> bits out of the machine type, into a separate configuration axis.

In case we only think about upstream kernels and assuming PV features
never go away that coud work. Distro kernels, however, exist too and
feature backports are common, so which version should I declare when my
kernel has e.g. features A, B and E ? (There used to be
KVM_GET_API_VERSION ioctl but then we switched to CAPs and this happened
for a reason.)

Personaly, I'd vote for having individual PV features in the config if
it ever gets introduced.

--=20
Vitaly


