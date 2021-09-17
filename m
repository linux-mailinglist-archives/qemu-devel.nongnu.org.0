Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D5B40F8BF
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 15:03:25 +0200 (CEST)
Received: from localhost ([::1]:58570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRDWW-0006ks-Gr
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 09:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mRDSv-0005gh-0E
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 08:59:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mRDSs-00034o-8K
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 08:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631883576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Hfn9eqJFhdScfkb3J0zZKwlY3OjXfdSqSjJID7qYk0=;
 b=K6MJZFSRKLNpu6MjsJnP6iS2KCE7MXdUoq0VmY+fAU+wiX705UlTvVmj//kXvOYYWAQQDV
 6uqNnJvV9+TKS6Bj0GdKP76i6lp4hW97CFWOHJJNA3QqmtSFeORDDyIYLvaRwSqXkdcxN3
 aHM1IhKVi2mspR0Gr0LAhca8OduUcbo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-gRSKT2RnMuuAl-JtSbuyqA-1; Fri, 17 Sep 2021 08:59:35 -0400
X-MC-Unique: gRSKT2RnMuuAl-JtSbuyqA-1
Received: by mail-ed1-f71.google.com with SMTP id
 o23-20020a509b17000000b003d739e2931dso7279234edi.4
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 05:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v8KsL9Z/RAif6toP3K3NbzvIUlaIiOze5t5Lip9tbHo=;
 b=HcGiX6ryDxNcqJXhQF1rol+STG5NuahusiLxtUkFzLYgcfBch7znDoUkg+bLZEfmWO
 vNSUEhIJu0a/4ysEs/DuponPJ+V1KFL3N9RwPc5vjpUmRdMinvUDh/Luay6TSmyF20nE
 GD/XHBz+73+7QlH2Sc1KP4msN035ZaUVobnwrJT5Ce9jDCQJxsgkGEd6L+ypabJRt0js
 +WihPqYvBqINYCsV4I16CGvt6OVTUKj4qPvSVtys0SOlDEannk68Cyy2RuSbK7g/wLYS
 87fDBug/R164aveCcRB9gFAxkm2w+6A9dVCFFmXuI4fsQe47h4G/Xa8zpjEtchnJCvwJ
 BehQ==
X-Gm-Message-State: AOAM531vwIZ3M44HmKzy/TAf5A+ir2bzE9otByBju3KOvwACWfwO7BNn
 rQopPjViWfH8wrZnoPnN/HQydpzZ7E8TFn6osoi1uzUASZrZN3C2jm83Hn/pSwcyZ8EU+7yw4Me
 InLMVPze96CDc0+U=
X-Received: by 2002:a17:907:98a5:: with SMTP id
 ju5mr11421246ejc.378.1631883574726; 
 Fri, 17 Sep 2021 05:59:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7zS1QtposR0zmlnuy9ZyQZ35Ph9foeQZN/Ag3DJPh+0BjxL6A9PPhV92qJx8j2+ODjO584A==
X-Received: by 2002:a17:907:98a5:: with SMTP id
 ju5mr11421227ejc.378.1631883574527; 
 Fri, 17 Sep 2021 05:59:34 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id z3sm2192516eju.34.2021.09.17.05.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:59:34 -0700 (PDT)
Date: Fri, 17 Sep 2021 14:59:33 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>, "mst@redhat.com"
 <mst@redhat.com>
Subject: Re: [PATCH] nvdimm: release the correct device list
Message-ID: <20210917145933.460c7c82@redhat.com>
In-Reply-To: <e3257270-2ba3-e890-4506-7b1a14b5bc1a@fujitsu.com>
References: <20210624110415.187164-1-lizhijian@cn.fujitsu.com>
 <20210629160534.208b56ad@redhat.com>
 <224e4f45-14c7-4eec-f553-6fa25b4ffb6b@cn.fujitsu.com>
 <3ed73782-0ab2-d178-23e6-0ba19c70cb6f@fujitsu.com>
 <e3257270-2ba3-e890-4506-7b1a14b5bc1a@fujitsu.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Sep 2021 06:40:01 +0000
"lizhijian@fujitsu.com" <lizhijian@fujitsu.com> wrote:

> ping again

Michael,

can you include this in your next pull req, please?

>=20
>=20
>=20
> On 30/08/2021 09:04, Li Zhijian wrote:
> > ping
> >
> >
> > On 03/08/2021 12:00, Li, Zhijian wrote: =20
> >> ping
> >>
> >> Any body could help to review/queue this patch ?
> >>
> >>
> >>
> >> On 2021/6/29 22:05, Igor Mammedov wrote: =20
> >>> On Thu, 24 Jun 2021 19:04:15 +0800
> >>> Li Zhijian <lizhijian@cn.fujitsu.com> wrote:
> >>> =20
> >>>> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com> =20
> >>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> >>> =20
> >>>> ---
> >>>> =C2=A0 hw/acpi/nvdimm.c | 12 ++++++------
> >>>> =C2=A0 1 file changed, 6 insertions(+), 6 deletions(-)
> >>>>
> >>>> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> >>>> index e3d5fe19392..ff317263e85 100644
> >>>> --- a/hw/acpi/nvdimm.c
> >>>> +++ b/hw/acpi/nvdimm.c
> >>>> @@ -355,10 +355,10 @@ nvdimm_build_structure_caps(GArray *structures=
, uint32_t capabilities)
> >>>> =C2=A0 =C2=A0 static GArray *nvdimm_build_device_structure(NVDIMMSta=
te *state)
> >>>> =C2=A0 {
> >>>> -=C2=A0=C2=A0=C2=A0 GSList *device_list =3D nvdimm_get_device_list()=
;
> >>>> +=C2=A0=C2=A0=C2=A0 GSList *device_list, *list =3D nvdimm_get_device=
_list();
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GArray *structures =3D g_array_new(fa=
lse, true /* clear */, 1);
> >>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 for (; device_list; device_list =3D devic=
e_list->next) {
> >>>> +=C2=A0=C2=A0=C2=A0 for (device_list =3D list; device_list; device_l=
ist =3D device_list->next) {
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DeviceState *=
dev =3D device_list->data;
> >>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* bui=
ld System Physical Address Range Structure. */
> >>>> @@ -373,7 +373,7 @@ static GArray *nvdimm_build_device_structure(NVD=
IMMState *state)
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* build NVDI=
MM Control Region Structure. */
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvdimm_build_=
structure_dcr(structures, dev);
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>>> -=C2=A0=C2=A0=C2=A0 g_slist_free(device_list);
> >>>> +=C2=A0=C2=A0=C2=A0 g_slist_free(list);
> >>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (state->persistence) {
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvdimm_build_=
structure_caps(structures, state->persistence);
> >>>> @@ -1339,9 +1339,9 @@ static void nvdimm_build_ssdt(GArray *table_of=
fsets, GArray *table_data,
> >>>> =C2=A0 =C2=A0 void nvdimm_build_srat(GArray *table_data)
> >>>> =C2=A0 {
> >>>> -=C2=A0=C2=A0=C2=A0 GSList *device_list =3D nvdimm_get_device_list()=
;
> >>>> +=C2=A0=C2=A0=C2=A0 GSList *device_list, *list =3D nvdimm_get_device=
_list();
> >>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 for (; device_list; device_list =3D devic=
e_list->next) {
> >>>> +=C2=A0=C2=A0=C2=A0 for (device_list =3D list; device_list; device_l=
ist =3D device_list->next) {
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AcpiSratMemor=
yAffinity *numamem =3D NULL;
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DeviceState *=
dev =3D device_list->data;
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Object *obj =
=3D OBJECT(dev);
> >>>> @@ -1356,7 +1356,7 @@ void nvdimm_build_srat(GArray *table_data)
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build_srat_me=
mory(numamem, addr, size, node,
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 MEM_AFFINITY_ENABLED | MEM_AFFINITY_NON_VOLATILE);
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>>> -=C2=A0=C2=A0=C2=A0 g_slist_free(device_list);
> >>>> +=C2=A0=C2=A0=C2=A0 g_slist_free(list);
> >>>> =C2=A0 }
> >>>> =C2=A0 =C2=A0 void nvdimm_build_acpi(GArray *table_offsets, GArray *=
table_data, =20
> >>>
> >>> =20
> >>
> >>
> >> =20
> > =20


