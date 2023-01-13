Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D7C66930D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 10:34:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGGRS-0003Sh-Bo; Fri, 13 Jan 2023 04:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pGGR9-0003Of-90
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 04:33:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pGGR4-0005oa-GB
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 04:33:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673602395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EGmXSGcryLyMwWBJBAGRPqNc83FeWcTOUw9/1eaT3RA=;
 b=GxCaFd8o0EducUeBe+0lcfw//GAEWLAVrOlcK2GWguTMQQV6zFD8Ntf+IxmoBfOaBOICwC
 3xVcrsOTtvIuG8oeIPvqu7DFKZ+9xOWbfoFATdPAe7ziUpoxS/UzWqIRaQIJTKcflKymxN
 kOw90a5myK537U5x9yP/D7VVE7MePNI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-507-9EWjcOLXMnyLY02oePMcSA-1; Fri, 13 Jan 2023 04:33:13 -0500
X-MC-Unique: 9EWjcOLXMnyLY02oePMcSA-1
Received: by mail-ed1-f71.google.com with SMTP id
 w3-20020a056402268300b00487e0d9b53fso14236634edd.10
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 01:33:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EGmXSGcryLyMwWBJBAGRPqNc83FeWcTOUw9/1eaT3RA=;
 b=XyJ/RrIYYPX/7qaDzhc+SaQ8bxUKbFM9tZi77+lcA3I6lyJq0enrztIdyjWCMz/13Q
 zu3BDrNqrdbmA7qhUm2YLYYEmsi6yrtbACPV3MoX398HuE16Wq1NYDjIH7Rgq+E15ZAs
 /hnWo1AJne+NQ+ioKQDMaeHNm26OFvQNJmWugFqTdYVwYiCZETaxFPyT5lV9rgcQL+TF
 bGQR5+deBh7iFgSFHwKAEvn3KT/x82EKxyWfzphsu0kGDlfly+z6Y69crZls/EbcEdmj
 6a31Ea7Vqh52zSC+nRG1si/ZuwU0K9GymqafOkyx04IXhcB3R8uFVMUcPPlc5eFc/THf
 aqKg==
X-Gm-Message-State: AFqh2kr0yJvFlxpBOOhYi3E+P2vhBj3Eacil+8duBpgbpBNO+3SQP9Rq
 ucxzaH2/MPhUJXcLaZr8NfoGMkr4PhRjBWEeACQaeXwIt15cCMAZTRiSKmW+AtWPvM6PPClvDcF
 L9pFXgiAAUCp2Yxg=
X-Received: by 2002:a17:906:6d14:b0:7c1:765:9cfc with SMTP id
 m20-20020a1709066d1400b007c107659cfcmr2434457ejr.34.1673602392343; 
 Fri, 13 Jan 2023 01:33:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvMyiZunNV7hT53Eb0xO5saoqrfpCr+V6WcY8sAbjY0cHEl4y6/dAWivhbcVBq6Aq75LiToFA==
X-Received: by 2002:a17:906:6d14:b0:7c1:765:9cfc with SMTP id
 m20-20020a1709066d1400b007c107659cfcmr2434437ejr.34.1673602392137; 
 Fri, 13 Jan 2023 01:33:12 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 a17-20020a170906369100b007c0f2c4cdffsm8257387ejc.44.2023.01.13.01.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 01:33:11 -0800 (PST)
Date: Fri, 13 Jan 2023 10:33:10 +0100
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
Message-ID: <20230113103310.3da703ab@imammedo.users.ipa.redhat.com>
In-Reply-To: <128d8ee2-8ee9-0a76-10de-af4c1b364179@aol.com>
References: <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz.ref@aol.com>
 <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz@aol.com>
 <20230110030331-mutt-send-email-mst@kernel.org>
 <a6994521-68d5-a05b-7be2-a8c605733467@aol.com>
 <D785501E-F95D-4A22-AFD0-85133F8CE56D@gmail.com>
 <9f63e7a6-e434-64b4-f082-7f5a0ab8d5bf@aol.com>
 <7208A064-2A25-4DBB-BF19-6797E96AB00C@gmail.com>
 <20230112180314-mutt-send-email-mst@kernel.org>
 <128d8ee2-8ee9-0a76-10de-af4c1b364179@aol.com>
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

On Thu, 12 Jan 2023 23:14:26 -0500
Chuck Zmudzinski <brchuckz@aol.com> wrote:

> On 1/12/23 6:03=E2=80=AFPM, Michael S. Tsirkin wrote:
> > On Thu, Jan 12, 2023 at 10:55:25PM +0000, Bernhard Beschow wrote: =20
> >> I think the change Michael suggests is very minimalistic: Move the if
> >> condition around xen_igd_reserve_slot() into the function itself and
> >> always call it there unconditionally -- basically turning three lines
> >> into one. Since xen_igd_reserve_slot() seems very problem specific,
> >> Michael further suggests to rename it to something more general. All
> >> in all no big changes required. =20
> >=20
> > yes, exactly.
> >  =20
>=20
> OK, got it. I can do that along with the other suggestions.

have you considered instead of reservation, putting a slot check in device =
model
and if it's intel igd being passed through, fail at realize time  if it can=
't take
required slot (with a error directing user to fix command line)?
That could be less complicated than dealing with slot reservations at the c=
ost of
being less convenient.

>=20
> Thanks.
>=20


