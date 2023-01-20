Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65C0675928
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 16:54:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIti2-0003j0-WA; Fri, 20 Jan 2023 10:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pIti0-0003fG-FB
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 10:53:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pIthy-0005zr-E4
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 10:53:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674230016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zo/bgcYV0ObHws9R5dA7ORalLRR/q2ZzXR/KXsJkowY=;
 b=M6fhe6qV0LsQUYOb6nM9Sd0aWbO74lXILr8QZor0Kj72BqqJo8MjbcTXZ/6YzNPbAIbc2C
 CpDkyQQFzOM1G3g7TiFMUr2IhBHsxvUm+l+9Yw1djqYCSZjktiLtS0ZfSoHvhlifJy0G2l
 DNsfmucZzLJwoK2DaIJrQee3vJRYkjY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-Rb7D_6UBOv2c0vtt8-6mEA-1; Fri, 20 Jan 2023 10:53:34 -0500
X-MC-Unique: Rb7D_6UBOv2c0vtt8-6mEA-1
Received: by mail-ej1-f72.google.com with SMTP id
 hr22-20020a1709073f9600b0086ffb73ac1cso4074392ejc.23
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 07:53:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zo/bgcYV0ObHws9R5dA7ORalLRR/q2ZzXR/KXsJkowY=;
 b=KBXdJv3lIUKgSzNecNbUn68CUNDnj4TKQ4muTwR3AmNYpOOT+qv5tSM3zMJPnAsHyp
 o6Z3zS6PmoKfwSgSKr9OT6kpNP8O0patcs0V32EOTC2gbCstVpzX9jGrcVqT5aPYGrsR
 bEieD0J9NKk886MeZVcby71JhWv6xQ8J0+LlaZvoECBM//l8WYeKJ9Z4bUTWy+Yz2c5Q
 kCcZuaR0+uKTUGC3A9TIG7p24MUx+s+PgXCRjqIG9HDzG78f3Zx/42MByvpl9dGGQPNn
 OMMyASX1NidvM04voYXVr954NXhFWhmVwYuGXZFCWRlPsyw1gW61BbhQubSlmGMak/li
 /s5g==
X-Gm-Message-State: AFqh2krts6YhOB73Rr33k4bvB983kxTJ+X6DiYyuzw1GHZY/iTo3ypJw
 SM6Ozi8V3PoMp3Vd3w/DLdmv5OznVlgdXV9fdV0r9HY6z4MeZ9WBQkb8QPA3aJ3xQjCNybdNcE8
 bAU7HLHMJ9FmKkqY=
X-Received: by 2002:a17:907:76ac:b0:857:1e36:3b7b with SMTP id
 jw12-20020a17090776ac00b008571e363b7bmr14276215ejc.11.1674230013194; 
 Fri, 20 Jan 2023 07:53:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuHMc4vUSPXnME9pCV0Z0nM0gPPUOC5/S8JlZvWNonafqUeLDk0VipB57PMHiWEE3LnYak7Yg==
X-Received: by 2002:a17:907:76ac:b0:857:1e36:3b7b with SMTP id
 jw12-20020a17090776ac00b008571e363b7bmr14276194ejc.11.1674230012972; 
 Fri, 20 Jan 2023 07:53:32 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 q24-20020a056402249800b0046ac460da13sm17585986eda.53.2023.01.20.07.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:53:31 -0800 (PST)
Date: Fri, 20 Jan 2023 16:53:29 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: Chuck Zmudzinski <brchuckz@netscape.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paul
 Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Message-ID: <20230120165329.46f254b4@imammedo.users.ipa.redhat.com>
In-Reply-To: <a3aed167-74f7-aa4c-1bc6-84f116feb702@aol.com>
References: <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz.ref@aol.com>
 <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz@aol.com>
 <20230110030331-mutt-send-email-mst@kernel.org>
 <a6994521-68d5-a05b-7be2-a8c605733467@aol.com>
 <D785501E-F95D-4A22-AFD0-85133F8CE56D@gmail.com>
 <9f63e7a6-e434-64b4-f082-7f5a0ab8d5bf@aol.com>
 <7208A064-2A25-4DBB-BF19-6797E96AB00C@gmail.com>
 <20230112180314-mutt-send-email-mst@kernel.org>
 <128d8ee2-8ee9-0a76-10de-af4c1b364179@aol.com>
 <20230113103310.3da703ab@imammedo.users.ipa.redhat.com>
 <88af50cb-4ebd-7995-70cf-f23ac33c5e45@aol.com>
 <20230116163342.467039a0@imammedo.users.ipa.redhat.com>
 <fce262ea-e0d5-d670-787c-62d91b040739@netscape.net>
 <20230117113513.4e692539@imammedo.users.ipa.redhat.com>
 <a3aed167-74f7-aa4c-1bc6-84f116feb702@aol.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Tue, 17 Jan 2023 09:43:52 -0500
Chuck Zmudzinski <brchuckz@aol.com> wrote:

> On 1/17/2023 5:35 AM, Igor Mammedov wrote:
> > On Mon, 16 Jan 2023 13:00:53 -0500
> > Chuck Zmudzinski <brchuckz@netscape.net> wrote:
> > =20
> > > On 1/16/23 10:33, Igor Mammedov wrote: =20
> > > > On Fri, 13 Jan 2023 16:31:26 -0500
> > > > Chuck Zmudzinski <brchuckz@aol.com> wrote:
> > > >    =20
> > > >> On 1/13/23 4:33=E2=80=AFAM, Igor Mammedov wrote:   =20
> > > >> > On Thu, 12 Jan 2023 23:14:26 -0500
> > > >> > Chuck Zmudzinski <brchuckz@aol.com> wrote:
> > > >> >      =20
> > > >> >> On 1/12/23 6:03=E2=80=AFPM, Michael S. Tsirkin wrote:     =20
> > > >> >> > On Thu, Jan 12, 2023 at 10:55:25PM +0000, Bernhard Beschow wr=
ote:       =20
> > > >> >> >> I think the change Michael suggests is very minimalistic: Mo=
ve the if
> > > >> >> >> condition around xen_igd_reserve_slot() into the function it=
self and
> > > >> >> >> always call it there unconditionally -- basically turning th=
ree lines
> > > >> >> >> into one. Since xen_igd_reserve_slot() seems very problem sp=
ecific,
> > > >> >> >> Michael further suggests to rename it to something more gene=
ral. All
> > > >> >> >> in all no big changes required.       =20
> > > >> >> >=20
> > > >> >> > yes, exactly.
> > > >> >> >        =20
> > > >> >>=20
> > > >> >> OK, got it. I can do that along with the other suggestions.    =
 =20
> > > >> >=20
> > > >> > have you considered instead of reservation, putting a slot check=
 in device model
> > > >> > and if it's intel igd being passed through, fail at realize time=
  if it can't take
> > > >> > required slot (with a error directing user to fix command line)?=
     =20
> > > >>=20
> > > >> Yes, but the core pci code currently already fails at realize time
> > > >> with a useful error message if the user tries to use slot 2 for the
> > > >> igd, because of the xen platform device which has slot 2. The user
> > > >> can fix this without patching qemu, but having the user fix it on
> > > >> the command line is not the best way to solve the problem, primari=
ly
> > > >> because the user would need to hotplug the xen platform device via=
 a
> > > >> command line option instead of having the xen platform device adde=
d by
> > > >> pc_xen_hvm_init functions almost immediately after creating the pci
> > > >> bus, and that delay in adding the xen platform device degrades
> > > >> startup performance of the guest.
> > > >>    =20
> > > >> > That could be less complicated than dealing with slot reservatio=
ns at the cost of
> > > >> > being less convenient.     =20
> > > >>=20
> > > >> And also a cost of reduced startup performance   =20
> > > >=20
> > > > Could you clarify how it affects performance (and how much).
> > > > (as I see, setup done at board_init time is roughly the same
> > > > as with '-device foo' CLI options, modulo time needed to parse
> > > > options which should be negligible. and both ways are done before
> > > > guest runs)   =20
> > >=20
> > > I preface my answer by saying there is a v9, but you don't
> > > need to look at that. I will answer all your questions here.
> > >=20
> > > I am going by what I observe on the main HDMI display with the
> > > different approaches. With the approach of not patching Qemu
> > > to fix this, which requires adding the Xen platform device a
> > > little later, the length of time it takes to fully load the
> > > guest is increased. I also noticed with Linux guests that use
> > > the grub bootoader, the grub vga driver cannot display the
> > > grub boot menu at the native resolution of the display, which
> > > in the tested case is 1920x1080, when the Xen platform device
> > > is added via a command line option instead of by the
> > > pc_xen_hvm_init_pci fucntion in pc_piix.c, but with this patch
> > > to Qemu, the grub menu is displayed at the full, 1920x1080
> > > native resolution of the display. Once the guest fully loads,
> > > there is no noticeable difference in performance. It is mainly
> > > a degradation in startup performance, not performance once
> > > the guest OS is fully loaded. =20
> > above hints on presence of bug[s] in igd-passthru implementation,
> > and this patch effectively hides problem instead of trying to figure
> > out what's wrong and fixing it.
> > =20
>=20
> Why did you delete the rest of my answers to your other observations and
> not respond to them?

they are preserved on mail-list in you previous email.
It's usually fine to trim non relevant parts and keep only part/context
that is being replied to.

I didn't want to argue point that it's usually job of management
arrange correct IGD passthrough for QEMU like Alex pointed out.
Hence those part got trimmed.


>=20


