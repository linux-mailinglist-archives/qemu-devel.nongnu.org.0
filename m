Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481204DDB92
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 15:23:01 +0100 (CET)
Received: from localhost ([::1]:50282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVDVM-0003io-DJ
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 10:23:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nVDQV-00072K-8W
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 10:17:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nVDQR-0002qw-0J
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 10:17:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647613071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=flWMx0E3NKZD7JB6JGpqVv9oT8t1jAZX04XEbwr599w=;
 b=NkodRD+fhW9zlN8/vziUpew6rxw1QEYMujDArhvNYxg0S/MArIx7A4pMe14aQ+0ADdaT16
 GHsrz1QgCQ1dIM4PscgAvPR0XisnYtGjI0iRG60kZIFFqjL70G335hnWM8IYbW41pLWMxN
 YMyNFiMPLbwCNROh+ZS53r4AKcKUvWw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-fj3AO0awMBOhct8TyGB-aw-1; Fri, 18 Mar 2022 10:17:46 -0400
X-MC-Unique: fj3AO0awMBOhct8TyGB-aw-1
Received: by mail-ed1-f72.google.com with SMTP id
 b10-20020a50e38a000000b00418cd24fd27so4996954edm.8
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 07:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=34a2izy+Md/H3J6ntBVzk4NIh156pl6jSuOFoCNNS/A=;
 b=zJGcLv/3FApaGsxmdpeIn8CVhauN8a4P62AeDWB8zAV+y20pD7ZB5bGDXl9wvO801f
 w0vh77uyKhwiz7y3sX8gne1NxsVpbjajjlTvfNumvC8JviRKvonhDaDi2hv2y+q7NkK4
 TemqhpmNS5UIAW4y7TpaKZnAF+NtEv14Tv2qXzjNkptFvuqh2s9EqymCPHoWRP+UBusC
 aO5cOipyqmUOxJdlaC5UMlHM2mxo6fy8SqTBS9C1VR9EJmmn3Cqv2dVHQL/4FHzXCDOa
 b/zMIm025cNpolNYtuJUiW8m2PuOjh9SMtbHxIiMxyCiQ0vM7HMhZkBV2xM2aF2xj3jr
 hyOA==
X-Gm-Message-State: AOAM531U7krRMkqewCm+CLX4rNbVL2yDArdF2n+dJT5MjhLZqjCA/lXv
 HQelocEqE8Rvszuyng53AzsA6rlDjPT8veoEyuKW1zfBm6cBJ4VruVLrwaeV7VebkVG/c/pHEix
 cWyxjwU1/P2ukpzo=
X-Received: by 2002:a17:906:3fd4:b0:6da:8ab0:a882 with SMTP id
 k20-20020a1709063fd400b006da8ab0a882mr8832520ejj.572.1647613064981; 
 Fri, 18 Mar 2022 07:17:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8R0ZR1dAMXTAv7hzseHyeFjUMPARrEk9U6m19eXLmT1evzkwQu/HBJYnizfHEDX0fFRWnSw==
X-Received: by 2002:a17:906:3fd4:b0:6da:8ab0:a882 with SMTP id
 k20-20020a1709063fd400b006da8ab0a882mr8832496ejj.572.1647613064691; 
 Fri, 18 Mar 2022 07:17:44 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a170906530100b006df78d85eabsm3812958ejo.111.2022.03.18.07.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 07:17:44 -0700 (PDT)
Date: Fri, 18 Mar 2022 15:17:42 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/4] target/i386: Fix sanity check on max APIC ID /
 X2APIC enablement
Message-ID: <20220318151742.6653ad7d@redhat.com>
In-Reply-To: <1c7ae19b8ca87b1fcf0b70f4057e24c7e21720f4.camel@infradead.org>
References: <20220314142544.150555-1-dwmw2@infradead.org>
 <20220316100425.2758afc3@redhat.com>
 <d374107ebd48432b6c2b13c13c407a48fdb2d755.camel@infradead.org>
 <20220316055333-mutt-send-email-mst@kernel.org>
 <c359ac8572d0193dd65bb384f68873d24d0c72d3.camel@infradead.org>
 <20220316064631-mutt-send-email-mst@kernel.org>
 <20220316122842.0bc78825@redhat.com>
 <2d2eb49f7a59918521c1614debe5b87017f5789b.camel@infradead.org>
 <20220317094209.2888b431@redhat.com>
 <20220317100536.6ccabfe0@redhat.com>
 <1c7ae19b8ca87b1fcf0b70f4057e24c7e21720f4.camel@infradead.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: berrange@redhat.com, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, vkuznets@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Mar 2022 11:13:44 +0000
David Woodhouse <dwmw2@infradead.org> wrote:

> On Thu, 2022-03-17 at 10:05 +0100, Igor Mammedov wrote:
> > re-sending reply as something went wrong with headers (I suspect Daniel=
's name formatting)
> > and email got bounced back.
> >=20
> > On Wed, 16 Mar 2022 14:31:33 +0000
> > David Woodhouse <dwmw2@infradead.org> wrote:
> >  =20
> > > On Wed, 2022-03-16 at 12:28 +0100, Igor Mammedov wrote:   =20
> > > > Generally Daniel is right, as long as it's something that what real=
 hardware
> > > > supports. (usually it's job if upper layers which know what guest O=
S is used,
> > > > and can tweak config based on that knowledge).
> > > >=20
> > > > But it's virt only extension and none (tested with
> > > >  Windows (hangs on boot),
> > > >  Linux (brings up only first 255 cpus)
> > > > ) of mainline OSes ended up up working as expected (i.e. user asked=
 for this
> > > > many CPUs but can't really use them as expected).     =20
> > >=20
> > > As I said, that kind of failure mode will happen even with the split
> > > irq chip and EXT_DEST_ID, with Windows and older (pre-5.10) Linux
> > > kernels.
> > >=20
> > > For older guests it would also happen on real hardware, and in VMs
> > > where you expose an IOMMU with interrupt remapping. Some guests don't
> > > support interrupt remapping, or don't support X2APIC at all.
> > >    =20
> > > > Which would just lead to users reporting (obscure) bugs.     =20
> > >=20
> > > It's not virt only. This could happen with real hardware.   =20
> >=20
> > I was talking about EXT_DEST_ID kvm extension. =20
>=20
> Then I'm confused, because that isn't the conversation we were having
> before. And in that case what you say above about Linux only bringing
> up the first 255 CPUs directly contradicts what you say below, my own
> experience, and the whole *point* of the EXT_DEST_ID extension :)

Now I'm lost in translation too :)

> Let's start again. You observed that Linux guests fail to bring up >254
> vcPUs if qemu doesn't enable the EXT_DEST_ID support, and your fix was
> to require EXT_DEST_ID (as a side-effect of requiring split irqchip).
>=20
> This reminded me of the fixes I'd been posting since 2020 which still
> haven't been merged, so I dusted those off and resent them.
>=20
> I didn't incorporate your change, and objected to your patch because I
> think it's pointless babysitting.

1)

> Yes, in the general case if you want
> your guest to use more than 254 vCPUs you need to take a moment to
> think about precisely what your guest operating system requires in
> order to support that.
>=20
> At the very least it needs X2APIC support, and then you need *one* of:
>=20
>  =E2=80=A2 EXT_DEST_ID,
>  =E2=80=A2 Interrupt remapping, or
>  =E2=80=A2 just using those vCPUs without external interrupts.
>=20
> Both of the first two require the split irqchip, so your patch just
> doesn't let users rely on that last option. I conceded (cited below)
> because I don't know of any existing guest OS which does use that last
> option. I'd attempted to make Linux do so, but eventually abandoned it:
> https://git.infradead.org/users/dwmw2/linux.git/shortlog/refs/heads/irqaf=
finity

Given that is was abandoned, it's unlikely that the last option was ever
used (and before EXT_DEST_ID, qemu was requiring irq remapping to start
guest with so many vcpus). If there will be a user for it in the future
we can relax restriction given that it will be properly documented/
user gets sane error/warning messages, so they could figure out what to do.

> But now you seem to be making a different argument?
>=20
> > > Anyway, as far as I'm concerned it doesn't matter very much whether w=
e
> > > insist on the split irq chip or not. Feel free to repost your patch
> > > rebased on top of my fixes, which are also in my tree at
> > > https://git.infradead.org/users/dwmw2/qemu.git
> > >=20
> > >=20
> > > The check you're modifying has moved to x86_cpus_init().   =20
> >=20
> > if we are to keep iommu dependency then moving to x86_cpus_init()
> > isn't an option, it should be done at pc_machine_done() time. =20
>=20
> Thus far, I didn't think anyone had been talking about a dependency on
> IOMMU. That doesn't make any sense at all. EXT_DEST_ID is perfectly
> sufficient for Linux kernels from 5.10 onwards and they don't need the
> IOMMU.

IOMMU was required before EXT_DEST_ID due to irq-remapping dependency,
and that conservative config worked fine for both Linux and Windows
guests. That's why I've raised question if we should revert restriction
to the way it was back then.

With Linux pre-5.10 guests, dmesg output at least complains about
IRQ remapping, so user has a small chance to be able to figure out
that IOMMU should be configured to get all CPUs working.
For post-5.10, all one gets is "bad cpu" without any clue as to why,
if EXT_DEST_ID is not advertised by hypervisor.
It would be better if guest kernel printed some error/warning in that case.

If we start with IOMMU, (Win/Linux) guests boot fine (modulo ancient ones)
(irq-remapping is 'on' by default since qemu-4.0).

> So no. Post your patch to s/kvm_irqchip_in_kernel/kvm_irqchip_is_split/
> in x86_cpus_init() by all means; I don't care much about that and I've
> even incorporated that change into my tree at
> https://git.infradead.org/users/dwmw2/qemu.git so that if I do have to
> repost these fixes yet again, it'll be included.

Looks fine to me, thanks.

> But let's not re-add the IOMMU dependency. That would be wrong.

We should document possible options, somewhere in QEMU.
So not only few would know about what options to use and when.
Something along lines above [1].


