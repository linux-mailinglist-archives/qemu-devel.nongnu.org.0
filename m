Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B936ADD89
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:35:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVag-00071u-30; Tue, 07 Mar 2023 06:34:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pZVac-00071f-E0
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:34:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pZVaa-0006eA-T2
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:34:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678188880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3m88D14NzxA1mBnq68ziktzDuYb0rPg5lBn0bgWPdSQ=;
 b=bZZYHXjKtiDiZK/DWQ6IkpLV5TBAXnpIETWPGYuMavJsKiXwhs3eblY87awGuxnDp7unCl
 uNYr+KpqO9679abCgJhb+IXZiaIZfXMOqUSzlb1RikUWSodp6x1CHEIwD3N20satf08Pql
 2MCB1fswKPVEIR9MlvbPBq4ZYtT+X88=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-2aqTuTQ2NyWKeqCYNCV8pA-1; Tue, 07 Mar 2023 06:34:39 -0500
X-MC-Unique: 2aqTuTQ2NyWKeqCYNCV8pA-1
Received: by mail-ed1-f71.google.com with SMTP id
 z14-20020a05640235ce00b004e07ddbc2f8so9807206edc.7
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:34:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678188878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3m88D14NzxA1mBnq68ziktzDuYb0rPg5lBn0bgWPdSQ=;
 b=j7BwhvteAnEEHR8cQuuQbPCNUwxVo4G89EKtvISBE6XYc9w7FZSqvYOr7vx07J2Hwg
 aKe5OjodFi7NtdIHzuqjgi6/l32i2RtO9ZjnV8LmdbT5HRfQzFbqYt6/UDhVGXPqVMbB
 ooq9jGL28D3hGcf2QJZPZ7eeFHffObyqXOxHR/KmnekaGEwOYURM+YewLqPdUUJFYkD8
 4SliILN+Q8GEKQ1qq8T+d9ethlhyTZdZNrDpAj73l3zDE+XfpFJfYNGeRAqdAgredS0Z
 pujIH7EXllDAQhX/2asgSrMbdILbcA19OUwICyuKugKZa0EOQMcWfNxoHzGgMK3zwtEx
 t3Cw==
X-Gm-Message-State: AO0yUKWPgY3i/qPJk8ohXuAsCky/EmuLf89426xbQbUdW4Eerp2HuupJ
 qWen7JbnhIabJY9Mwbf9lpxr/0bG5EE1ZOkDZucqDDPF4/pIOS1651PQZRa6Ste7WGRr6VymDnN
 MrbZE3RGcg0dOszU=
X-Received: by 2002:a17:907:787:b0:8dd:76d5:a82 with SMTP id
 xd7-20020a170907078700b008dd76d50a82mr19274904ejb.47.1678188877887; 
 Tue, 07 Mar 2023 03:34:37 -0800 (PST)
X-Google-Smtp-Source: AK7set8MHEcTSpShPv5PKodYmQ8ckP2O6cFDeJeound+8jbgcjVk2AAmIkvODTiZmt7FQ6ZSIZoSTQ==
X-Received: by 2002:a17:907:787:b0:8dd:76d5:a82 with SMTP id
 xd7-20020a170907078700b008dd76d50a82mr19274883ejb.47.1678188877630; 
 Tue, 07 Mar 2023 03:34:37 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 d6-20020a1709064c4600b008eb5b085075sm5880160ejw.122.2023.03.07.03.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 03:34:37 -0800 (PST)
Date: Tue, 7 Mar 2023 12:34:36 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Bui Quang Minh <minhquangbui99@gmail.com>, qemu-devel@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S . Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/4] apic: add support for x2APIC mode
Message-ID: <20230307123436.75034f80@imammedo.users.ipa.redhat.com>
In-Reply-To: <9da78e3b051ce3d9c857b793fe879f917cb518cb.camel@infradead.org>
References: <20230221160500.30336-1-minhquangbui99@gmail.com>
 <20230221160500.30336-2-minhquangbui99@gmail.com>
 <20230224152932.1de436cb@imammedo.users.ipa.redhat.com>
 <ee3d42c1-9e52-57f9-eba8-a5dc3a45d14f@gmail.com>
 <20230227170759.12297901@imammedo.users.ipa.redhat.com>
 <f24683be-f3a7-34fe-279a-11d01e696bbc@gmail.com>
 <20230228173954.6a7b6c4f@imammedo.users.ipa.redhat.com>
 <71d9e801-80b2-d5ed-4c02-b328f0b175d4@gmail.com>
 <20230306114331.531c9cd2@imammedo.users.ipa.redhat.com>
 <96f1f670d576dbb1969055353b9e7b5a8632a4c8.camel@infradead.org>
 <f348f44d-1f27-58df-22e6-dfd015588a1a@gmail.com>
 <9da78e3b051ce3d9c857b793fe879f917cb518cb.camel@infradead.org>
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

On Mon, 06 Mar 2023 16:50:29 +0000
David Woodhouse <dwmw2@infradead.org> wrote:

> On Mon, 2023-03-06 at 23:39 +0700, Bui Quang Minh wrote:
> > On 3/6/23 22:51, David Woodhouse wrote: =20
> > > On Mon, 2023-03-06 at 11:43 +0100, Igor Mammedov wrote: =20
> > > > > However, there are still problems while trying to extending suppo=
rt to
> > > > > APIC ID larger than 255 because there are many places assume APIC=
 ID is
> > > > > 8-bit long. =20
> > > >=20
> > > > that's what I was concerned about (i.e. just enabling x2apic withou=
t fixing
> > > > with all code that just assumes 8bit apicid). =20
> > >=20
> > > Even before you extend the physical APIC IDs past 254 or 255, there's
> > > still the issue that 255 isn't a broadcast in X2APIC mode. And that
> > > *logical* addressing will use more than 8 bits even when the physical
> > > IDs are lower.
> > >  =20
> > > > > One of that is interrupt remapping which returns 32-bit
> > > > > destination ID but uses MSI (which has 8-bit destination) to send=
 to
> > > > > APIC. I will look more into this. =20
> > >=20
> > > The translated 'output' from the interrupt remapping doesn't "use MSI=
",
> > > in the sense of a write transaction which happens to go to addresses =
in
> > > the 0x00000000FEExxxxx range. The *input* to interrupt remapping comes
> > > from that intercept.
> > >=20
> > > The output is already "known" to be an MSI message, with a full 64-bit
> > > address and 32-bit data, and the KVM API puts the high 24 bits of the
> > > target APIC ID into the high word of the address.
> > >=20
> > > If you look at the "generic" x86_iommu_irq_to_msi_message() in
> > > hw/intc/x86-iommu.c you'll see it's also using the same trick:
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0 msg.__addr_hi =3D irq->dest & 0xffffff00; =20
> >=20
> > Yeah, I see that trick too, with this hunk and temporarily disable=20
> > broadcast destination id 0xff in physical mode, I am able to boot Linux=
=20
> > with 255 CPUs (I can't see how to use few CPUs but configure with high=
=20
> > APIC ID) =20
>=20
> I never worked out how to explicitly assign high APIC IDs but you can
> at least spread them out by explicitly setting the topology to
> something weird like sockets=3D17,cores=3D3,threads=3D3 so that some APIC=
 IDs
> get skipped.
>=20
> Of course, that doesn't let you exercise the interesting corner case of
> physical APIC ID 0xff though. I wonder if there's a way of doing it
> such that only CPU#0 and CPU#255 are *online* at boot, even if the rest
> theoretically exist?=20

you can have arbitrary (withing -smp limits) vcpu at startup time by
using -device foo-cpu-type,topo-ids-here (modulo auto-created ones on
behalf -smp X value)

Possible vcpus for given -M/-smp/-cpu combination one can get using
hotpluggable-cpus HMP command or its QMP counterpart.
=20
> > @@ -814,7 +816,12 @@ static void apic_send_msi(MSIMessage *msi)
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t addr =3D msi->address;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t data =3D msi->data;
> > -=C2=A0=C2=A0=C2=A0 uint8_t dest =3D (addr & MSI_ADDR_DEST_ID_MASK) >> =
MSI_ADDR_DEST_ID_SHIFT;
> > +=C2=A0=C2=A0=C2=A0 uint32_t dest =3D (addr & MSI_ADDR_DEST_ID_MASK) >>=
 MSI_ADDR_DEST_ID_SHIFT;
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * The higher 3 bytes of destination id is sto=
red in higher word of
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * msi address. See x86_iommu_irq_to_msi_messa=
ge()
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 dest =3D dest | (addr >> 32);
> >=20
> > I am reading the manual now, looks like broadcast destination id in=20
> > x2APIC is 0xffff_ffff in both physical and logic mode. =20
>=20
> Yep, that looks about right.


