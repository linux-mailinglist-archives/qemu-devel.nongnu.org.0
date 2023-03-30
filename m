Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2DB6CFE43
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 10:29:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phnee-0004U4-9t; Thu, 30 Mar 2023 04:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1phneW-0004Tq-79
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 04:29:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1phneS-0005Pz-N8
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 04:28:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680164934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cu7Vy50dQqqbSZQYMolb7lGxwwUuNdHc5TZU3PpfvIM=;
 b=LLD0DDku3ePlFD4R9cFGy5Qf/1NcpbpL2+K2S0WC9J4uF/MMBQqvJslN6GF8X6tDHvAIbP
 HRH+4NvqGQEeq5BQM3xeZIXgUQ4IeDPtdJilAxU6DSaSIfGmylcCJ8fiTclaHZa/P6IAdL
 sosr7yGGPtEqsOa44/rWM8ukI5ZEoTM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-UXy5siKNMGSC1rpRfViWEA-1; Thu, 30 Mar 2023 04:28:53 -0400
X-MC-Unique: UXy5siKNMGSC1rpRfViWEA-1
Received: by mail-ed1-f70.google.com with SMTP id
 a40-20020a509eab000000b005024c025bf4so13767765edf.14
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 01:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680164932;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cu7Vy50dQqqbSZQYMolb7lGxwwUuNdHc5TZU3PpfvIM=;
 b=Vb2kBoXPZxubluXRydFH1Cey7PaEzkYdU84NDTa8mbNStQJy1Z2A+Y+p73NVO4xi6K
 O6PPnRidJla7P+SSywM8TLZSg6zlTIIR1TWWzi3M12U0DXIn2eufqNSogmaQwumXqfh5
 +6qyjkMsgBvr41xN9YX8HgJtDXpfC/aNRVBium5xMBt6iexkh+VEi/DXLXUKiGSQU9FO
 PLVnZeaG78p/wKnQALIop0z/nbYLn7BVE0Jt3tCGU+ghS3dDApmbPS1zcDlwRy6iamr6
 JpTa16h+tUQLDep7M9YCzJii41Iq0TFTy3ljqWWSsp7hCumsCBk32SbiU1HCHze5qKc7
 stPA==
X-Gm-Message-State: AAQBX9cCMl7XufjWMWWltlFm3fL2ghhD64uHNG0OAGCpVpfQXDDzxHBL
 y/tyG++NIJRnkds21WJrWEQefGQRdGjiEIhi47toSg4IoOcjb+9SXm8VCkt3VFWUdMnAY5psMfW
 uXjS3nSG0bpMguoA=
X-Received: by 2002:a17:907:a808:b0:93f:fbe:c389 with SMTP id
 vo8-20020a170907a80800b0093f0fbec389mr19945303ejc.13.1680164932217; 
 Thu, 30 Mar 2023 01:28:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350aJWLUv04tRe5/o3C9Qa3d3YOM5EFVL0upOF7QfX1O1/2zAPADYKxHPO4W42w0Z/WZvXVSfyg==
X-Received: by 2002:a17:907:a808:b0:93f:fbe:c389 with SMTP id
 vo8-20020a170907a80800b0093f0fbec389mr19945284ejc.13.1680164931960; 
 Thu, 30 Mar 2023 01:28:51 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 rk28-20020a170907215c00b00933b38505f9sm14817164ejb.152.2023.03.30.01.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 01:28:51 -0700 (PDT)
Date: Thu, 30 Mar 2023 10:28:50 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Bui Quang Minh <minhquangbui99@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S . Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 2/5] apic: add support for x2APIC mode
Message-ID: <20230330102850.33882a75@imammedo.users.ipa.redhat.com>
In-Reply-To: <60228a86-633e-3cf6-b0d9-890b032d44f3@gmail.com>
References: <20230326052039.33717-1-minhquangbui99@gmail.com>
 <20230326052039.33717-3-minhquangbui99@gmail.com>
 <a8ea36d901a1b713ab8bc0f5bcd1b7d26ad6f9cb.camel@infradead.org>
 <05d55576-f703-18a1-7f9f-4c15b8c54490@gmail.com>
 <0944a6f4c7c1569c182a27d40bdeb0a164a41bbb.camel@infradead.org>
 <61446cfb-f937-3a0d-2a98-34febcc7e4f3@gmail.com>
 <3834475953c0f865e88251886f1e861d51c25a2b.camel@infradead.org>
 <445928d9-4cd3-978d-ce76-9cd01457b6f0@gmail.com>
 <e47b58ef574bcf61259d7d3f0707a1f5ca808ff6.camel@infradead.org>
 <49167ae7-4cb4-3863-64b1-1396e1911bbf@gmail.com>
 <37cbb3b9-8a9a-2b88-2e09-a81f46b8bf74@gmail.com>
 <60228a86-633e-3cf6-b0d9-890b032d44f3@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
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

On Wed, 29 Mar 2023 22:30:44 +0700
Bui Quang Minh <minhquangbui99@gmail.com> wrote:

> On 3/29/23 21:53, Bui Quang Minh wrote:
> > On 3/28/23 22:58, Bui Quang Minh wrote: =20
> >> On 3/27/23 23:49, David Woodhouse wrote: =20
> >>> On Mon, 2023-03-27 at 23:35 +0700, Bui Quang Minh wrote: =20
> >>>> On 3/27/23 23:22, David Woodhouse wrote: =20
> >>>>> On Mon, 2023-03-27 at 22:45 +0700, Bui Quang Minh wrote: =20
> >>>>>> =20
> >>>>>>> Maybe I'm misreading the patch, but to me it looks that
> >>>>>>> if (dest =3D=3D 0xff) apic_get_broadcast_bitmask() bit applies ev=
en in
> >>>>>>> x2apic mode? So delivering to the APIC with physical ID 255 will =
be
> >>>>>>> misinterpreted as a broadcast? =20
> >>>>>>
> >>>>>> In case dest =3D=3D 0xff the second argument to=20
> >>>>>> apic_get_broadcast_bitmask
> >>>>>> is set to false which means this is xAPIC broadcast =20
> >>>>>
> >>>>> Yeah, but it *isn't* xAPIC broadcast. It's X2APIC unicast to APIC#2=
55.
> >>>>>
> >>>>> I think you want (although you don't have 'dev') something like thi=
s:
> >>>>>
> >>>>>
> >>>>> static void apic_get_delivery_bitmask(uint32_t *deliver_bitmask,
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 uint32_t dest, uint8_t=20
> >>>>> dest_mode)
> >>>>> {
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 APICCommonState *apic_iter;
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int i;
> >>>>>
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memset(deliver_bitmask, 0x00, max_ap=
ic_words *=20
> >>>>> sizeof(uint32_t));
> >>>>>
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* x2APIC broadcast id for both phys=
ical and logical=20
> >>>>> (cluster) mode */
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dest =3D=3D 0xffffffff) {
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 apic_get_bro=
adcast_bitmask(deliver_bitmask, true);
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>>>>
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dest_mode =3D=3D 0) {
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 apic_find_de=
st(deliver_bitmask, dest);
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Broadcast=
 to xAPIC mode apics */
> >>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dest =3D=3D 0xff) {
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dest =3D=3D 0xff &&=
 is_x2apic_mode(dev)) {
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 apic_get_broadcast_bitmask(deliver_bitmask, false);
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> >>>>> =20
> >>>>
> >>>> Hmm, the unicast case is handled in apic_find_dest function, the log=
ic
> >>>> inside the if (dest =3D=3D 0xff) is for handling the broadcast case =
only.
> >>>> This is because when dest =3D=3D 0xff, it can be both a x2APIC unica=
st and
> >>>> xAPIC broadcast in case we have some CPUs that are in xAPIC and othe=
rs
> >>>> are in x2APIC. =20
> >>>
> >>> Ah! Yes, I see it now.
> >>>
> >>> Shouldn't apic_get_broadcast_bitmask(=E2=80=A6 true) add *all* APICs =
to the
> >>> mask, regardless of their mode? An APIC which is still in xAPIC mode
> >>> will only look at the low 8 bits and see 0xFF which it also interprets
> >>> as broadcast? Or is that not how real hardware behaves? =20
> >>
> >> This is interesting. Your point looks reasonable to me but I don't=20
> >> know how to verify it, I'm trying to write kernel module to test it=20
> >> but there are just too many things running on Linux that uses=20
> >> interrupt so the system hangs.
> >>
> >> This raises another question: when dest =3D=3D 0x102 in IPI, does the=
=20
> >> xAPIC mode CPU with APIC ID 0x2 accept the IPI? I can't see this=20
> >> stated clearly in the Intel SDM. =20
> >=20
> > I do some more testing on my hardware, your point is correct when dest=
=20
> > =3D=3D 0xffffffff, the interrupt is delivered to all APICs regardless o=
f=20
> > their mode. =20
>=20
> To be precisely, it only broadcasts to CPUs in xAPIC mode if the IPI=20
> destination mode is physical. In case the destination mode is logical,=20
> flat model/cluster model rule applies to determine if the xAPIC CPUs=20
> accept the IPI. Wow, this is so complicated :)

It would be nice if you could update apic kvm unit test with your
findings if it doesn't test those variants yet.

>=20
>=20
> > And when dest =3D=3D 0x102 in IPI, xAPIC mode CPU with APIC ID=20
> > 0x2 also accepts that IPI. =20
>=20


