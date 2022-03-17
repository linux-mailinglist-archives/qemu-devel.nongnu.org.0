Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8569A4DCDDC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 19:47:24 +0100 (CET)
Received: from localhost ([::1]:58194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUv9f-0002LR-JG
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 14:47:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nUuzu-00021I-An
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:37:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nUuzs-000805-AW
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:37:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647542233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CBi2zMfylXGvT60ID2rs5hD7B7Q79V6gJMhxILntOPI=;
 b=UzsqxOoLzHH8fnQa06bLRxjIlujUYjWujHAdFHyHz3o8ayqNmTRh0drR4LKNaxu5KJOwib
 oPdrOwnpgp0QtgX66r0xelV11NVczaZdMBf/EjxaEPNZiqJ2AfS+T4DBF5+h3EQwVlGltY
 XijfGkR34xhCpNn+Yy7+ctlTsetjqcA=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-huzJ4OliMneBFZKvfN6N0Q-1; Thu, 17 Mar 2022 14:37:11 -0400
X-MC-Unique: huzJ4OliMneBFZKvfN6N0Q-1
Received: by mail-io1-f70.google.com with SMTP id
 y3-20020a056602178300b00645d25c30c1so3750242iox.6
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 11:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=hpTxDem4HDaiFkiA3QjwyXYSkTP/ptI/oelJ/v0BTXw=;
 b=acv+plAPGpYBk6/5CLgCab/bIrBRM8sliPHfA7UCpLpG71X6r8Rl2aZYlYiMFol6Tb
 TlGAr1EUICF4k/XzzbmKkXtM/LehwYdSdj44OWQ1mHhlaGsiYsZwBft2P7bcoaMoX3mc
 6WOPuf/3nRwToFxq9K1yCQr1Ned0cXx9JdgEcNN4yOaHuVE9AWk4Ci/ZShkPlA4iamHh
 iJFeOYT48E7+aPY5fKjflTEB6q6NhhfWyGz+Lzycsubo8jjnhSExpLFChk3zfust5GOa
 Ycb07OB/7A7mK9l4lyjD2YsErl00pztVYnfTeo03CUAZFXO1vJkqna5XyO0QZ2pvqTUc
 +jFA==
X-Gm-Message-State: AOAM531JcvAoieF6HwsGt73LiC65YfXWk3wg45DFsyhlhOZMTRa1t0Ke
 FLFz1pQTmp8xnVB4HEs/AggMBZ+tppeJ7I7IhyQgo3vxbhe+emIGP+d2rkoT2FW0OQRRZ8UFeH1
 F2IfWytolK61rF4g=
X-Received: by 2002:a05:6638:2589:b0:31a:4a70:b070 with SMTP id
 s9-20020a056638258900b0031a4a70b070mr2766978jat.208.1647542230954; 
 Thu, 17 Mar 2022 11:37:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIgUUMvLZTs5Qfc8su+/7rLyzm/OcfpahNFFJQ9zBENto3Y0OBzcDFdvYCWu66neCE9k87Ew==
X-Received: by 2002:a05:6638:2589:b0:31a:4a70:b070 with SMTP id
 s9-20020a056638258900b0031a4a70b070mr2766968jat.208.1647542230716; 
 Thu, 17 Mar 2022 11:37:10 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 x14-20020a927c0e000000b002c244d8dcc8sm3432319ilc.42.2022.03.17.11.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 11:37:10 -0700 (PDT)
Date: Thu, 17 Mar 2022 12:37:09 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-7.1] vfio/common: remove spurious tpm-crb-cmd
 misalignment warning
Message-ID: <20220317123709.6992ca07.alex.williamson@redhat.com>
In-Reply-To: <0ea966f3-d53f-3a43-9d02-36f4907eb000@redhat.com>
References: <20220316202951.294860-1-eric.auger@redhat.com>
 <20220316170818.5b4f0032.alex.williamson@redhat.com>
 <826be3d2-8403-5d8f-9eee-f58b15bc1c32@redhat.com>
 <20220317082315.0a293120.alex.williamson@redhat.com>
 <0ea966f3-d53f-3a43-9d02-36f4907eb000@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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
Cc: peter.maydell@linaro.org, stefanb@linux.vnet.ibm.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Mar 2022 15:34:53 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> Hi Alex,
>=20
> On 3/17/22 3:23 PM, Alex Williamson wrote:
> > On Thu, 17 Mar 2022 14:57:30 +0100
> > Eric Auger <eric.auger@redhat.com> wrote:
> > =20
> >> Hi Alex,
> >>
> >> On 3/17/22 12:08 AM, Alex Williamson wrote: =20
> >>> On Wed, 16 Mar 2022 21:29:51 +0100
> >>> Eric Auger <eric.auger@redhat.com> wrote:
> >>>   =20
> >>>> The CRB command buffer currently is a RAM MemoryRegion and given
> >>>> its base address alignment, it causes an error report on
> >>>> vfio_listener_region_add(). This region could have been a RAM device
> >>>> region, easing the detection of such safe situation but this option
> >>>> was not well received. So let's add a helper function that uses the
> >>>> memory region name to recognize the region and detect the situation
> >>>> is safe wrt assignment. Other regions can be listed here if such kin=
d
> >>>> of problem occurs again.
> >>>>
> >>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>>> ---
> >>>>  hw/vfio/common.c     | 26 +++++++++++++++++++++++++-
> >>>>  hw/vfio/trace-events |  1 +
> >>>>  2 files changed, 26 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> >>>> index 080046e3f51..b58a38f5c57 100644
> >>>> --- a/hw/vfio/common.c
> >>>> +++ b/hw/vfio/common.c
> >>>> @@ -861,6 +861,22 @@ static void vfio_unregister_ram_discard_listene=
r(VFIOContainer *container,
> >>>>      g_free(vrdl);
> >>>>  }
> >>>> =20
> >>>> +static bool vfio_known_safe_misalignment(MemoryRegionSection *secti=
on)
> >>>> +{
> >>>> +    MemoryRegion *mr =3D section->mr;
> >>>> +
> >>>> +    if (strcmp(memory_region_name(mr), "tpm-crb-cmd") !=3D 0) {
> >>>> +        return false;
> >>>> +    }   =20
> >>> Hi Eric,
> >>>
> >>> I was thinking more along the lines that we could use
> >>> memory_region_owner() to get the owning Object, then on
> >>> that we could maybe use INTERFACE_CHECK to look for TYPE_MEMORY_DEVIC=
E,
> >>> then consider anything else optional.  (a) could something like that
> >>> work and (b) do all required mappings currently expose that interface=
?
> >>> Thanks,   =20
> >> If I understand correctly you just want to error_report() misalignemen=
t
> >> of MR sections belonging to
> >>
> >> TYPE_MEMORY_DEVICE devices and silence the rest? Is that a correct
> >> understanding? I thought you wanted to be much more protective and
> >> ignore misalignments on a case by case basis hence the white listing
> >> of this single tpm-crb-cmd region. =20
> > Ah right, so I'm just slipping back into what we currently do, fail for
> > memory and warn on devices, which would be a generally reasonable long
> > term plan except people file bugs about those warnings.  Crud.
> >
> > I guess I don't have a better idea than creating essentially an
> > exception list like this.  Do you think it's better to do the strcmp
> > for the specific memory region or would it maybe be sufficient to test
> > the owner object is TYPE_TPM_CRB?  Thanks, =20
> I asked myself the question and eventually chose to be more conservative
> with the granularity of the MR. Sometimes objects own several MRs and I
> wondered if some misalignments could be considered as safe while others
> unsafe, within the same object.=C2=A0 Nevertheless I don't have a strong
> opinion and will respin according to your preferencee.

Hi Eric,

As we discussed offline, I think the benefits of being able to test the
type, ie. TYPE_TPM_CRB, might outweigh the flexibility of having per mr
granularity.  The strcmp seems like a maintenance red flag since that's
subject to change, though maybe migration support forces it to be more
static than it would otherwise appear.  In any case, it's probably not
worth warning about any DMA mapping failures for mr's backed by a tpm
device.  Thanks,

Alex

> >>>> +
> >>>> +    /* this is a known safe misaligned region, just trace for
> >>>> debug purpose */
> >>>> +    trace_vfio_known_safe_misalignment(memory_region_name(mr),
> >>>> +
> >>>> section->offset_within_address_space,
> >>>> +
> >>>> section->offset_within_region,
> >>>> +                                       qemu_real_host_page_size);
> >>>> +    return true;
> >>>> +}
> >>>> +
> >>>>  static void vfio_listener_region_add(MemoryListener *listener,
> >>>>                                       MemoryRegionSection *section)
> >>>>  {
> >>>> @@ -884,7 +900,15 @@ static void
> >>>> vfio_listener_region_add(MemoryListener *listener, if
> >>>> (unlikely((section->offset_within_address_space &
> >>>> ~qemu_real_host_page_mask) !=3D (section->offset_within_region &
> >>>> ~qemu_real_host_page_mask))) {
> >>>> -        error_report("%s received unaligned region", __func__);
> >>>> +        if (!vfio_known_safe_misalignment(section)) {
> >>>> +            error_report("%s received unaligned region %s
> >>>> iova=3D0x%"PRIx64
> >>>> +                         " offset_within_region=3D0x%"PRIx64
> >>>> +                         " qemu_real_host_page_mask=3D0x%"PRIxPTR,
> >>>> +                         __func__,
> >>>> memory_region_name(section->mr),
> >>>> +                         section->offset_within_address_space,
> >>>> +                         section->offset_within_region,
> >>>> +                         qemu_real_host_page_mask);
> >>>> +        }
> >>>>          return;
> >>>>      }
> >>>> =20
> >>>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> >>>> index 0ef1b5f4a65..6f38a2e6991 100644
> >>>> --- a/hw/vfio/trace-events
> >>>> +++ b/hw/vfio/trace-events
> >>>> @@ -100,6 +100,7 @@ vfio_listener_region_add_skip(uint64_t start,
> >>>> uint64_t end) "SKIPPING region_add vfio_spapr_group_attach(int
> >>>> groupfd, int tablefd) "Attached groupfd %d to liobn fd %d"
> >>>> vfio_listener_region_add_iommu(uint64_t start, uint64_t end)
> >>>> "region_add [iommu] 0x%"PRIx64" - 0x%"PRIx64
> >>>> vfio_listener_region_add_ram(uint64_t iova_start, uint64_t
> >>>> iova_end, void *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64"
> >>>> [%p]" +vfio_known_safe_misalignment(const char *name, uint64_t
> >>>> iova, uint64_t offset_within_region, uint64_t page_size) "Region
> >>>> \"%s\" iova=3D0x%"PRIx64" offset_within_region=3D0x%"PRIx64"
> >>>> qemu_real_host_page_mask=3D0x%"PRIxPTR ": cannot be mapped for DMA"
> >>>> vfio_listener_region_add_no_dma_map(const char *name, uint64_t
> >>>> iova, uint64_t size, uint64_t page_size) "Region \"%s\"
> >>>> 0x%"PRIx64" size=3D0x%"PRIx64" is not aligned to 0x%"PRIx64" and
> >>>> cannot be mapped for DMA" vfio_listener_region_del_skip(uint64_t
> >>>> start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
> >>>> vfio_listener_region_del(uint64_t start, uint64_t end) "region_del
> >>>> 0x%"PRIx64" - 0x%"PRIx64   =20
>=20


