Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018156AD013
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 22:20:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZIEr-0000RJ-HN; Mon, 06 Mar 2023 16:19:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZIEp-0000Qw-6O
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 16:19:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZIEm-0006Re-PX
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 16:19:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678137554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tYGA8u6FFZ9qbPNa59d0CijpTYUzBuj5C7MlWir/UBc=;
 b=fOeh+a3CG+f7CSOdclofBZuRH/9/vCOlUCmk1QUtJSaC9tgq8Nfbd4yA4moa5orhMuRYSA
 /ON7Ox2h/ZPfXZbStNcXXcnwgBivX+EFvrMPRlAa3RoHuYIQUp/T6WUqaKO9qE6rE35kjW
 EAeMTw+D/q72eYZ6c00UhNOGiMNZ6kU=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-oQ-DV6iEMuqeFgoQHT3Z_Q-1; Mon, 06 Mar 2023 16:19:13 -0500
X-MC-Unique: oQ-DV6iEMuqeFgoQHT3Z_Q-1
Received: by mail-il1-f200.google.com with SMTP id
 y2-20020a929502000000b0031707c6b348so5969793ilh.8
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 13:19:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678137552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tYGA8u6FFZ9qbPNa59d0CijpTYUzBuj5C7MlWir/UBc=;
 b=MBTwyjEpqIv9gKWUkE9KCVAYlwUC3vVeiw3i4tnixmO02QjV+o4yYlnWUNtkk+jQAh
 l1UFz0qBKlORpP4j8Y8/b2Z0NDHEiBH11AQcIT0OCqLN9rrOlmyAzKGdVCskZfDc/fcn
 vCj4H4AGxMhU0cLdKvlqp6GXSe7jdmjNtTNz2BcpdvhoSnILNBL+SdOMFfxwjYX8N7cU
 nPKFHrpUpgMPu+m2wL0w8PgkRFTN8JFYLU9efZCIHb+5EwXrell5Hz4dYIbOMFrDPa0F
 pZXx85EfCzfQ1Rk8Und/ALWJU1tyYEkrtZrly1RQPfEFZ4iFPnZUgAKK1cJrvQpZDvpC
 5AnA==
X-Gm-Message-State: AO0yUKW9MsYEAdnSxjr1f+l+co1OH61D2PQbd4m+8Cri6QGbL7/x0YMi
 n29IB+R48DzZHnWeLv+WenKeeZddeGETYFnVb3qeOXLLHrcQcP0A5+nT2r8qVtUNq7He29Jg+6/
 JusPFOFEg7M7IPSI=
X-Received: by 2002:a05:6e02:1e04:b0:317:93dc:1122 with SMTP id
 g4-20020a056e021e0400b0031793dc1122mr10757534ila.14.1678137552605; 
 Mon, 06 Mar 2023 13:19:12 -0800 (PST)
X-Google-Smtp-Source: AK7set/WnO9pPkhXxZt2uAsp1FNvYYXqMSdiUCPmlvfG1nG+rPM7Vw8EjlQ6Q06UJiPGFdn1KO3Kcw==
X-Received: by 2002:a05:6e02:1e04:b0:317:93dc:1122 with SMTP id
 g4-20020a056e021e0400b0031793dc1122mr10757521ila.14.1678137552334; 
 Mon, 06 Mar 2023 13:19:12 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 r16-20020a92d450000000b00316e39f1285sm3068617ilm.82.2023.03.06.13.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 13:19:11 -0800 (PST)
Date: Mon, 6 Mar 2023 14:19:09 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>,
 qemu-devel@nongnu.org, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH v3 00/13] vfio/migration: Device dirty page tracking
Message-ID: <20230306141909.20c17a7e.alex.williamson@redhat.com>
In-Reply-To: <f04bc012-96ad-fb6c-6edf-9afefc8607e7@redhat.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230305135734.71d54dd1.alex.williamson@redhat.com>
 <d8c298a7-41a3-49bf-6c5c-b071b1398160@oracle.com>
 <20230305191913.562b7a85.alex.williamson@redhat.com>
 <73116eef-872b-5845-4a95-01d6155f288e@oracle.com>
 <f04bc012-96ad-fb6c-6edf-9afefc8607e7@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

On Mon, 6 Mar 2023 12:05:06 +0100
C=C3=A9dric Le Goater <clg@redhat.com> wrote:

> On 3/6/23 10:45, Joao Martins wrote:
> > On 06/03/2023 02:19, Alex Williamson wrote: =20
> >> On Sun, 5 Mar 2023 23:33:35 +0000
> >> Joao Martins <joao.m.martins@oracle.com> wrote:
> >> =20
> >>> On 05/03/2023 20:57, Alex Williamson wrote: =20
> >>>> On Sat,  4 Mar 2023 01:43:30 +0000
> >>>> Joao Martins <joao.m.martins@oracle.com> wrote:
> >>>>     =20
> >>>>> Hey,
> >>>>>
> >>>>> Presented herewith a series based on the basic VFIO migration proto=
col v2
> >>>>> implementation [1].
> >>>>>
> >>>>> It is split from its parent series[5] to solely focus on device dir=
ty
> >>>>> page tracking. Device dirty page tracking allows the VFIO device to
> >>>>> record its DMAs and report them back when needed. This is part of V=
FIO
> >>>>> migration and is used during pre-copy phase of migration to track t=
he
> >>>>> RAM pages that the device has written to and mark those pages dirty=
, so
> >>>>> they can later be re-sent to target.
> >>>>>
> >>>>> Device dirty page tracking uses the DMA logging uAPI to discover de=
vice
> >>>>> capabilities, to start and stop tracking, and to get dirty page bit=
map
> >>>>> report. Extra details and uAPI definition can be found here [3].
> >>>>>
> >>>>> Device dirty page tracking operates in VFIOContainer scope. I.e., W=
hen
> >>>>> dirty tracking is started, stopped or dirty page report is queried,=
 all
> >>>>> devices within a VFIOContainer are iterated and for each of them de=
vice
> >>>>> dirty page tracking is started, stopped or dirty page report is que=
ried,
> >>>>> respectively.
> >>>>>
> >>>>> Device dirty page tracking is used only if all devices within a
> >>>>> VFIOContainer support it. Otherwise, VFIO IOMMU dirty page tracking=
 is
> >>>>> used, and if that is not supported as well, memory is perpetually m=
arked
> >>>>> dirty by QEMU. Note that since VFIO IOMMU dirty page tracking has n=
o HW
> >>>>> support, the last two usually have the same effect of perpetually
> >>>>> marking all pages dirty.
> >>>>>
> >>>>> Normally, when asked to start dirty tracking, all the currently DMA
> >>>>> mapped ranges are tracked by device dirty page tracking. If using a
> >>>>> vIOMMU we block live migration. It's temporary and a separate serie=
s is
> >>>>> going to add support for it. Thus this series focus on getting the
> >>>>> ground work first.
> >>>>>
> >>>>> The series is organized as follows:
> >>>>>
> >>>>> - Patches 1-7: Fix bugs and do some preparatory work required prior=
 to
> >>>>>    adding device dirty page tracking.
> >>>>> - Patches 8-10: Implement device dirty page tracking.
> >>>>> - Patch 11: Blocks live migration with vIOMMU.
> >>>>> - Patches 12-13 enable device dirty page tracking and document it.
> >>>>>
> >>>>> Comments, improvements as usual appreciated. =20
> >>>>
> >>>> Still some CI failures:
> >>>>
> >>>> https://gitlab.com/alex.williamson/qemu/-/pipelines/796657474
> >>>>
> >>>> The docker failures are normal, afaict the rest are not.  Thanks,
> >>>>     =20
> >>>
> >>> Ugh, sorry
> >>>
> >>> The patch below scissors mark (and also attached as a file) fixes tho=
se build
> >>> issues. I managed to reproduce on i386 target builds, and these chang=
es fix my
> >>> 32-bit build.
> >>>
> >>> I don't have a working Gitlab setup[*] though to trigger the CI to en=
able to
> >>> wealth of targets it build-tests. If you could kindly test the patch =
attached in
> >>> a new pipeline (applied on top of the branch you just build) below to=
 understand
> >>> if the CI gets happy. I will include these changes in the right patch=
es (patch 8
> >>> and 10) for the v4 spin. =20
> >>
> >> Looks like this passes:
> >>
> >> https://gitlab.com/alex.williamson/qemu/-/pipelines/796750136
> >> =20
> > Great, I've staged this fixes in patches 8&10!
> >=20
> > I have a sliver of hope that we might still make it by soft freeze (tom=
orrow?).
> > If you think it can still make it, should the rest of the series is goo=
d, then I
> > can follow up v4 today/tomorrow. Thoughts? =20
>=20
> I would say, wait and see if a v4 is needed first. These changes are
> relatively easy to fold in.

I think we have enough changes and fixes to post a v4 once you're happy
with it.  We should have tomorrow, the 7th to get final reviews and
post a pull request.  Thanks,

Alex


