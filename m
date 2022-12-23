Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A6E654D2A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 09:04:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8d12-00007z-Rq; Fri, 23 Dec 2022 03:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p8d0u-00007L-VO
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 03:02:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p8d0t-0000Be-EU
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 03:02:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671782562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iCwNH9wz+QgJwA1f47/U6brYkFw0TCbCxysEMWPdan8=;
 b=aoQ8VFTc+O7dVy9OKBnB1r5ESqQN1piKpxXtiNW+RA2EljE1KLTMjtjjVy3Cs7K67QNNNW
 jrSHAXuP58wCnXQ3cNb3hWnhYnQODBUOIT9gyYfFZH0qPzuAjD5nJAvESA04rnPaS52jfY
 /NSWqQH7XOYa4006J0piOc2myQkItsw=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-307-iFKnT14dM9yWhO-n-YwZpg-1; Fri, 23 Dec 2022 03:02:41 -0500
X-MC-Unique: iFKnT14dM9yWhO-n-YwZpg-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-144ea535efbso2133543fac.16
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 00:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iCwNH9wz+QgJwA1f47/U6brYkFw0TCbCxysEMWPdan8=;
 b=U+6Ns6ms1a9Pd9DckNL0PeL3oIC3RclA8lzdgIOt/t7G0+ZDAG6BqXgWKzXHpJGlJP
 XlizeJBQZQatCu7TeIdVztQcs5EAPUYPP1z1g0j6G+sseJLj9MeNCY3TtPl+G6PfrVoz
 Px1x2AVBgqUDhhwkK5Ouxv1E7QcwqEHvKHWcWXRjN/WEZXm7UPWyRAdkJoDHBUdoXcpu
 OMP2KBoyoRaApHSBOkEZRAuDTD9qFFoPwDfq9bbPoSmPZyp97sn1Q/ImaqOwmVH1XBP3
 7g02bY8GO768AzXNVCbQ2HSFCLvH92rSvXOHcdqLvei2+wUi7GQp6b0KSe6DUp90edW0
 2X5Q==
X-Gm-Message-State: AFqh2kpnpYiQG1CJhMMTbZAZgjJhYgf7/OtDm+1yLvXpE4VgS3zz7PmO
 VWs65lfRLQg0tmk89VsxIh1bgpxClLpUortlxlmnzWimafZSl3j5841q9ZHgYTNptwJWAnmjboS
 nNQvrkUj8qmBI/cWtaqVjqJ2h605kGXM=
X-Received: by 2002:aca:1111:0:b0:35e:7a42:7ab5 with SMTP id
 17-20020aca1111000000b0035e7a427ab5mr441794oir.280.1671782560278; 
 Fri, 23 Dec 2022 00:02:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtUow04nylGyRR0wstyRzCD3x28h9vN02/3r9xRKc4iQVINnh1U15vv1g3VV3XYnPoX7Ngklv0XmLMf1PCosjk=
X-Received: by 2002:aca:1111:0:b0:35e:7a42:7ab5 with SMTP id
 17-20020aca1111000000b0035e7a427ab5mr441789oir.280.1671782560098; Fri, 23 Dec
 2022 00:02:40 -0800 (PST)
MIME-Version: 1.0
References: <20221129081037.12099-1-jasowang@redhat.com>
 <20221129081037.12099-4-jasowang@redhat.com> <Y4Yr5WvfioOJWOEX@x1n>
 <CACGkMEuC41jFin3XAVSs3ra0tmxZD7L5NeDLn5OD6ziq7z1huA@mail.gmail.com>
 <Y4d0HokcV/tg0wlk@x1n>
 <CACGkMEu-t7J=GP2ZJ3cw6X427SzzPk=XFV9tSCfffK4RKuFnAQ@mail.gmail.com>
 <Y4jBMkNEFqUA7edN@x1n>
 <CACGkMEszjH02RPRy5ps7JBqkELCqLSdcCCLyPLoxY155zh8BgQ@mail.gmail.com>
 <Y458YMavxao9XSwL@x1n>
 <CACGkMEut82E-c_w_0MUPOwYDLkcM+mt127dbs3bkhATDSr6JQg@mail.gmail.com>
 <Y49Kcr4ivGGZ2hhF@x1n>
In-Reply-To: <Y49Kcr4ivGGZ2hhF@x1n>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 23 Dec 2022 16:02:29 +0800
Message-ID: <CACGkMEtgZY_2CHQwivuyMp+C=uJ7+Vom3WrDYqZesMonWKtd4A@mail.gmail.com>
Subject: Re: [PATCH 3/3] intel-iommu: build iova tree during IOMMU translation
To: Peter Xu <peterx@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 viktor@daynix.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Tue, Dec 6, 2022 at 9:58 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Dec 06, 2022 at 11:18:03AM +0800, Jason Wang wrote:
> > On Tue, Dec 6, 2022 at 7:19 AM Peter Xu <peterx@redhat.com> wrote:
> > >
> > > Jason,
> > >
> > > On Mon, Dec 05, 2022 at 12:12:04PM +0800, Jason Wang wrote:
> > > > I'm fine to go without iova-tree. Would you mind to post patches for
> > > > fix? I can test and include it in this series then.
> > >
> > > One sample patch attached, only compile tested.
> >
> > I don't see any direct connection between the attached patch and the
> > intel-iommu?
>
> Sorry!  Wrong tree dumped...  Trying again.

The HWADDR breaks memory_region_notify_iommu_one():

qemu-system-x86_64: ../softmmu/memory.c:1991:
memory_region_notify_iommu_one: Assertion `entry->iova >=
notifier->start && entry_end <= notifier->end' failed.

I wonder if we need either:

1) remove the assert

or

2) introduce a new memory_region_notify_unmap_all() to unmap from
notifier->start to notifier->end.

Thanks

>
> >
> > >
> > > I can also work on this but I'll be slow in making progress, so I'll add it
> > > into my todo.  If you can help to fix this issue it'll be more than great.
> >
> > Ok, let me try but it might take some time :)
>
> Sure. :)
>
> I'll also add it into my todo (and I think the other similar one has been
> there for a while.. :( ).
>
> --
> Peter Xu


