Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D2A66C403
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 16:34:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHRUg-0007ye-3K; Mon, 16 Jan 2023 10:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pHRUc-0007kj-FA
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 10:33:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pHRUa-0000Sy-PO
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 10:33:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673883227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U1g1zCi+06h/BCDFKfYU8XUNQoM01xY7v+dJwQFuiQw=;
 b=W0UDwN/Roo5sFsjnUOIhWYW6zsT420eOynPbDewB2hlX5UWfOYVfYE5AgmNwAKFRPbARWU
 L5Ivayqas1fUKSAjlPR6fXXSvn+t8Y1UNvfZKoMqiQahk+0XzhRhQvQ/zudH5yYfyv9tPX
 7ItyPOulRP7DfOCpCAMoSolMlYUZ3+M=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-oZCH3jiTONyMLyELnzfUrw-1; Mon, 16 Jan 2023 10:33:46 -0500
X-MC-Unique: oZCH3jiTONyMLyELnzfUrw-1
Received: by mail-ed1-f72.google.com with SMTP id
 l17-20020a056402255100b00472d2ff0e59so19315866edb.19
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 07:33:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U1g1zCi+06h/BCDFKfYU8XUNQoM01xY7v+dJwQFuiQw=;
 b=7BLqVSpXNlRs7KIL8eNxUOpScT7ppS8ypky2tEoDTkB/0609UOEmlPl1aTLxSJVIsZ
 lDUvZVCDniRckGnbBa8tJBNIUqsTzS4wwztuMEcQrFYD9oQCJYz7hFxCIwt5RIukABlV
 kjrQ2Tm1IKneEWeFucY5G38Mx4EHmQWLr47hsziC/XVG5iDW/KMN9+ZC9RVEKah071gX
 6RBOGhlITlRGny2Hkjwlt9ViatL+S1nJ1i8G47gtZCX1SxhoQwkfxQSN6mujx81Q0gQ9
 k/jLIMknexfUiOBqSXqlM/Peii4rz3zjbDkD89aGOuAYKPu1af4qCsNf5wa2Nfxg4tex
 jWcg==
X-Gm-Message-State: AFqh2kplyT4oVZ/5jN9kzNlQOykmWd6IurU5zVEAD6OSHGcO0OKarGrz
 IZOrUF5NGHg71juOG8vxWhZFRtInvkgGCnKoyUOQ1UoHwfVapd4Z36a/oxpG98tqojOTcW3wG+G
 l7jR/CeVe6040ulA=
X-Received: by 2002:a17:907:a585:b0:871:3919:cbea with SMTP id
 vs5-20020a170907a58500b008713919cbeamr2708605ejc.54.1673883224352; 
 Mon, 16 Jan 2023 07:33:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsP1+tXYFUEmlpJRu6mf2xwlR+HRv7sYl+XDTQgxmYtii99ewpWT8Pm9lEk+AysfSPRbqKRIQ==
X-Received: by 2002:a17:907:a585:b0:871:3919:cbea with SMTP id
 vs5-20020a170907a58500b008713919cbeamr2708594ejc.54.1673883224151; 
 Mon, 16 Jan 2023 07:33:44 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 p14-20020a17090653ce00b0085ea718a81bsm6570877ejo.198.2023.01.16.07.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 07:33:43 -0800 (PST)
Date: Mon, 16 Jan 2023 16:33:42 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow
 <shentey@gmail.com>, qemu-devel@nongnu.org, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
 Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Message-ID: <20230116163342.467039a0@imammedo.users.ipa.redhat.com>
In-Reply-To: <88af50cb-4ebd-7995-70cf-f23ac33c5e45@aol.com>
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
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Fri, 13 Jan 2023 16:31:26 -0500
Chuck Zmudzinski <brchuckz@aol.com> wrote:

> On 1/13/23 4:33=E2=80=AFAM, Igor Mammedov wrote:
> > On Thu, 12 Jan 2023 23:14:26 -0500
> > Chuck Zmudzinski <brchuckz@aol.com> wrote:
> >  =20
> >> On 1/12/23 6:03=E2=80=AFPM, Michael S. Tsirkin wrote: =20
> >> > On Thu, Jan 12, 2023 at 10:55:25PM +0000, Bernhard Beschow wrote:   =
=20
> >> >> I think the change Michael suggests is very minimalistic: Move the =
if
> >> >> condition around xen_igd_reserve_slot() into the function itself and
> >> >> always call it there unconditionally -- basically turning three lin=
es
> >> >> into one. Since xen_igd_reserve_slot() seems very problem specific,
> >> >> Michael further suggests to rename it to something more general. All
> >> >> in all no big changes required.   =20
> >> >=20
> >> > yes, exactly.
> >> >    =20
> >>=20
> >> OK, got it. I can do that along with the other suggestions. =20
> >=20
> > have you considered instead of reservation, putting a slot check in dev=
ice model
> > and if it's intel igd being passed through, fail at realize time  if it=
 can't take
> > required slot (with a error directing user to fix command line)? =20
>=20
> Yes, but the core pci code currently already fails at realize time
> with a useful error message if the user tries to use slot 2 for the
> igd, because of the xen platform device which has slot 2. The user
> can fix this without patching qemu, but having the user fix it on
> the command line is not the best way to solve the problem, primarily
> because the user would need to hotplug the xen platform device via a
> command line option instead of having the xen platform device added by
> pc_xen_hvm_init functions almost immediately after creating the pci
> bus, and that delay in adding the xen platform device degrades
> startup performance of the guest.
>=20
> > That could be less complicated than dealing with slot reservations at t=
he cost of
> > being less convenient. =20
>=20
> And also a cost of reduced startup performance

Could you clarify how it affects performance (and how much).
(as I see, setup done at board_init time is roughly the same
as with '-device foo' CLI options, modulo time needed to parse
options which should be negligible. and both ways are done before
guest runs)

> However, the performance hit can be prevented by assigning slot
> 3 instead of slot 2 for the xen platform device if igd passthrough
> is configured on the command line instead of doing slot reservation,
> but there would still be less convenience and, for libxl users, an
> inability to easily configure the command line so that the igd can
> still have slot 2 without a hacky and error-prone patch to libxl to
> deal with this problem.
libvirt manages to get it right on management side without quirks on
QEMU side.

> I did post a patch on xen-devel to fix this using libxl, but so far
> it has not yet been reviewed and I mentioned in that patch that the
> approach of patching qemu so qemu reserves slot 2 for the igd is less
> prone to coding errors and is easier to maintain than the patch that
> would be required to implement the fix in libxl.

the patch is not trivial, and adds maintenance on QEMU.
Though I don't object to it as long as it's constrained to xen only
code and doesn't spill into generic PCI.
All I wanted is just point out there are other approach to problem
(i.e. do force user to user to provide correct configuration instead
of adding quirks whenever it's possible).


