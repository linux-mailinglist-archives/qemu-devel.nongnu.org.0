Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E1B698BF4
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:28:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSWoq-0004hE-Dg; Thu, 16 Feb 2023 00:28:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pSWop-0004h0-2f
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:28:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pSWon-0000xh-9X
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:28:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676525308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uYpyDvReWuaLNG1qDwhPhn59iKoV2Wdz1GRsYYyK9qs=;
 b=YP3volZlMokfR59JcHU4/7wPz48m5JWaDy3kDhLcQHRxv/WCK2VCksktz+ff9vaioL9bsA
 mEJadUfP1mjLslQ+S+0ifsPcy8Hx+Ov5q9QnElCD8LflnczFAVD8m9Y9V2CFE/XC4G/w8B
 9MUclFrxLNG80CE4KW0WMS9ooVtmEA8=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-540-yh75MWGzO0-dUoPD5fpZkQ-1; Thu, 16 Feb 2023 00:28:27 -0500
X-MC-Unique: yh75MWGzO0-dUoPD5fpZkQ-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-16e1da56174so634661fac.21
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:28:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uYpyDvReWuaLNG1qDwhPhn59iKoV2Wdz1GRsYYyK9qs=;
 b=G2kkL3DtEKi/Pe4UjuI6uPprBkgbP3IbgM+apgFUUShFe2irEW1w3NU80fzRsQU9dC
 +sUf8pRpbk6pvGUCqp55uKPVUG/FvPddt2e5F0sgurj4gV0SzEmMJzVkDnshwe4WdOln
 0rwZGzqAAIgnC9IHlU6Yvk20iSLDe3vplCdOneMigp+9zi7O49h48/Z/HqBVY31SXmRu
 Vm5SNF22zxq9sv3AHAnsIZ6YdZlqMAKwVGE7uugmTL1/+kleMuFcJqSC4DUaMcF6B4tP
 diqYkVdajqmM+gUQo4KKDo2Q2aWujU+fTnY4CrGO9Fau1rh9bydas7QIlVcznlHM86UE
 qT0w==
X-Gm-Message-State: AO0yUKVZTM6dEDoI8GKgw6/8ejnVhIH4NEPOXJRBckBpS/kwZ/gpLR6M
 J8qWakcNHOpt2fqSd/y9hfsKbTwOAHBwqHB9Bbv39JCICI2XzIUSY0Jcd555Cui7U9Q5Kb5Aulo
 ro7/U6VDYWPRHbzTVeknRzvoHL+U1/lY=
X-Received: by 2002:a05:6808:3186:b0:37d:5d77:e444 with SMTP id
 cd6-20020a056808318600b0037d5d77e444mr64135oib.35.1676525306503; 
 Wed, 15 Feb 2023 21:28:26 -0800 (PST)
X-Google-Smtp-Source: AK7set9nuchSKrjoq8pNtMEG0n24ef3mG7593oPuQeVLV8+zIrISw2G5FQIiKF0MiqDa+F+tI3neYy/UpTWjPH7QuBk=
X-Received: by 2002:a05:6808:3186:b0:37d:5d77:e444 with SMTP id
 cd6-20020a056808318600b0037d5d77e444mr64128oib.35.1676525306278; Wed, 15 Feb
 2023 21:28:26 -0800 (PST)
MIME-Version: 1.0
References: <20221218143927.597975-1-16567adigashreesh@gmail.com>
 <d7f05d4f-2a56-6663-4a66-e53c3f14a061@linaro.org>
 <Y6HjOqjECShxPfzU@arch.localdomain>
 <CABcq3pGii9c=f6LxNtNppoCky=jZbuqNFYcqKBuj1W2qgww84A@mail.gmail.com>
 <CABcq3pFaYy1EHb9KvC3KhJ7TAiAm1ii1VCLNK6u=YQvXz2MA+Q@mail.gmail.com>
In-Reply-To: <CABcq3pFaYy1EHb9KvC3KhJ7TAiAm1ii1VCLNK6u=YQvXz2MA+Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 16 Feb 2023 13:28:15 +0800
Message-ID: <CACGkMEvB1=U+mXc9kMQHLp3uhds12DU1n=YYd23AGdqyPeOpFw@mail.gmail.com>
Subject: Re: [PATCH] ebpf: fix compatibility with libbpf 1.0+
To: Andrew Melnichenko <andrew@daynix.com>
Cc: Shreesh Adiga <16567adigashreesh@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, yuri.benditovich@daynix.com, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Mauro Matteo Cascella <mcascell@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Wed, Feb 15, 2023 at 4:27 AM Andrew Melnichenko <andrew@daynix.com> wrot=
e:
>
> Hi, all.
> In the future, there would be eBPF RSS + the helper for Libvirt interacti=
on.
> And those patches are required for future work. Technically they are
> required for the current builds with linked libbpf 1.01.
> Can we apply this patch?
>

I've queued this.

Thanks

>
> On Wed, Dec 28, 2022 at 6:19 PM Andrew Melnichenko <andrew@daynix.com> wr=
ote:
> >
> > Hi, it's a good idea to update the skeleton generation. Technically
> > skeleton generation is not a part of Qemu building. The skeleton is
> > already presented in the Qemu tree, so we skip dependencies from
> > clang/bpftool.
> > It's a good idea to have an updated bpf program and simplified
> > Makefile with Qemu sources. And the skeleton in the Qemu tree should
> > be identical to what the Makefile.ebpf would generate.
> > I think having one patch with all changes to eBPF RSS is acceptable.
> >
> > On Tue, Dec 20, 2022 at 6:30 PM Shreesh Adiga
> > <16567adigashreesh@gmail.com> wrote:
> > >
> > > On Sun, Dec 18, 2022 at 05:15:04PM +0100, Philippe Mathieu-Daud=C3=A9=
 wrote:
> > > > Hi,
> > > >
> > > > On 18/12/22 15:39, Shreesh Adiga wrote:
> > > > > The current implementation fails to load on a system with
> > > > > libbpf 1.0 and reports that legacy map definitions in 'maps'
> > > > > section are not supported by libbpf v1.0+. This commit updates
> > > > > the Makefile to add BTF (-g flag) and appropriately updates
> > > > > the maps in rss.bpf.c and update the skeleton file in repo.
> > > > >
> > > > > Signed-off-by: Shreesh Adiga <16567adigashreesh@gmail.com>
> > > > > ---
> > > > >   ebpf/rss.bpf.skeleton.h  | 1171 ++++++++++++++++++++++++++++---=
-------
> > > > >   tools/ebpf/Makefile.ebpf |    8 +-
> > > > >   tools/ebpf/rss.bpf.c     |   43 +-
> > > > >   3 files changed, 891 insertions(+), 331 deletions(-)
> > > >
> > > >
> > > > > +static inline const void *rss_bpf__elf_bytes(size_t *sz)
> > > > > +{
> > > > > +   *sz =3D 20440;
> > > > > +   return (const void *)"\
> > > > >   \x7f\x45\x4c\x46\x02\x01\x01\0\0\0\0\0\0\0\0\0\x01\0\xf7\0\x01\=
0\0\0\0\0\0\0\0\
> > > > > -\0\0\0\0\0\0\0\0\0\0\0\x18\x1d\0\0\0\0\0\0\0\0\0\0\x40\0\0\0\0\0=
\x40\0\x0a\0\
> > > > > -\x01\0\xbf\x18\0\0\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\x4c\xff\0=
\0\0\0\xbf\xa7\
> > > > > -\0\0\0\0\0\0\x07\x07\0\0\x4c\xff\xff\xff\x18\x01\0\0\0\0\0\0\0\0=
\0\0\0\0\0\0\
> > > > > +\0\0\0\0\0\0\0\0\0\0\0\x98\x4c\0\0\0\0\0\0\0\0\0\0\x40\0\0\0\0\0=
\x40\0\x0d\0\
> > > > > +\x01\0\xbf\x19\0\0\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\x54\xff\0=
\0\0\0\xbf\xa7\
> > > > > +\0\0\0\0\0\0\x07\x07\0\0\x54\xff\xff\xff\x18\x01\0\0\0\0\0\0\0\0=
\0\0\0\0\0\0\
> > > > >   \xbf\x72\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\xbf\x06\0\0\0\0\0\0\x1=
8\x01\0\0\0\0\0\
> > > > > -\0\0\0\0\0\0\0\0\0\xbf\x72\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\xbf\x=
07\0\0\0\0\0\0\
> > > > > -\x18\0\0\0\xff\xff\xff\xff\0\0\0\0\0\0\0\0\x15\x06\x66\x02\0\0\0=
\0\xbf\x79\0\0\
> > > > > -\0\0\0\0\x15\x09\x64\x02\0\0\0\0\x71\x61\0\0\0\0\0\0\x55\x01\x01=
\0\0\0\0\0\x05\
> > > > > -\0\x5d\x02\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\xc0\xff\0\0\0\0\x=
7b\x1a\xb8\xff\
> > > > > -\0\0\0\0\x7b\x1a\xb0\xff\0\0\0\0\x7b\x1a\xa8\xff\0\0\0\0\x7b\x1a=
\xa0\xff\0\0\0\
> > > > > -\0\x63\x1a\x98\xff\0\0\0\0\x7b\x1a\x90\xff\0\0\0\0\x7b\x1a\x88\x=
ff\0\0\0\0\x7b\
> > > > > -\x1a\x80\xff\0\0\0\0\x7b\x1a\x78\xff\0\0\0\0\x7b\x1a\x70\xff\0\0=
\0\0\x7b\x1a\
> > > > > -\x68\xff\0\0\0\0\x7b\x1a\x60\xff\0\0\0\0\x7b\x1a\x58\xff\0\0\0\0=
\x7b\x1a\x50\
> > > > > -\xff\0\0\0\0\x15\x08\x4c\x02\0\0\0\0\x6b\x1a\xd0\xff\0\0\0\0\xbf=
\xa3\0\0\0\0\0\
> > > > > -\0\x07\x03\0\0\xd0\xff\xff\xff\xbf\x81\0\0\0\0\0\0\xb7\x02\0\0\x=
0c\0\0\0\xb7\
> > > > > +\0\0\0\0\0\0\0\0\0\xbf\x72\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\xbf\x=
08\0\0\0\0\0\0\
> > > > > +\x18\0\0\0\xff\xff\xff\xff\0\0\0\0\0\0\0\0\x15\x06\x67\x02\0\0\0=
\0\xbf\x87\0\0\
> > > > > +\0\0\0\0\x15\x07\x65\x02\0\0\0\0\x71\x61\0\0\0\0\0\0\x55\x01\x01=
\0\0\0\0\0\x05\
> > > > > +\0\x5e\x02\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\xc8\xff\0\0\0\0\x=
7b\x1a\xc0\xff\
> > > > > +\0\0\0\0\x7b\x1a\xb8\xff\0\0\0\0\x7b\x1a\xb0\xff\0\0\0\0\x7b\x1a=
\xa8\xff\0\0\0\
> > > > > +\0\x63\x1a\xa0\xff\0\0\0\0\x7b\x1a\x98\xff\0\0\0\0\x7b\x1a\x90\x=
ff\0\0\0\0\x7b\
> > > > > +\x1a\x88\xff\0\0\0\0\x7b\x1a\x80\xff\0\0\0\0\x7b\x1a\x78\xff\0\0=
\0\0\x7b\x1a\
> > > > > +\x70\xff\0\0\0\0\x7b\x1a\x68\xff\0\0\0\0\x7b\x1a\x60\xff\0\0\0\0=
\x7b\x1a\x58\
> > > > > +\xff\0\0\0\0\x15\x09\x4d\x02\0\0\0\0\x6b\x1a\xd0\xff\0\0\0\0\xbf=
\xa3\0\0\0\0\0\
> > > > [...]
> > > >
> > > > Can we have a build system step which generates this file and compa=
re
> > > > with what is committed in the repository that we can run in our CI?
> > > >
> > > > That would avoid the need of human review of this blob.
> > > >
> > > Here are the steps to verify:
> > > Pull latest archlinux/archlinux docker image and get a bash shell ins=
ide
> > > the container. Install the required toolchain packages.
> > > pacman -Syu --noconfirm
> > > pacman -S --noconfirm  bpf libbpf llvm clang make
> > >
> > > Confirm the versions:
> > > clang 14.0.6
> > > bpftool 7.0.0
> > > libbpf 1.0.1
> > >
> > > After this, ensure that the files Makefile.ebpf and rss.bpf.c from th=
is
> > > patch exist at /home/shreesh/c/qemu/tools/ebpf/ inside the docker.
> > > This path seems to be important since BTF info seems to contain the a=
bsolute
> > > path of rss.bpf.c which was compiled by clang and is embedded inside
> > > the generated ELF object.
> > >
> > > Run `make -C /home/shreesh/c/qemu/tools/ebpf -f Makefile.ebpf` and
> > > verify that `sha256sum /home/shreesh/c/qemu/tools/ebpf/rss.bpf.skelet=
on.h` is
> > > a54af3d1fb401ddd56c151f00ae20d6557e965c0a1a4d8ed5f8d925457158a0e whic=
h
> > > should be the same as the one submitted as part of this patch.
> > >
> > > I'm not familiar with QEMU's CI and am not sure if the above steps ca=
n
> > > be converted into build system steps. However it should be doable by =
a
> > > human and verify that the generated skeleton file is correct and not
> > > tampered with.
> > >
> > > Regards,
> > > Shreesh
>


