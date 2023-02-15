Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA85E69855A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:15:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOB9-0005tL-DD; Wed, 15 Feb 2023 15:14:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pSOAu-0005rx-UN
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:14:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pSOAq-0004Ew-V8
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:14:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676492080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U1wrWGEpVsra8u10jrpz5eOYi1xilGx5PYsbD5L5RB8=;
 b=acOUa9jd617dqklGhakO3LYDRbQO2DcB9P2JHjOo8EhgwPQAG0rTlXcaiWDifOF3ed+pLw
 widyhfkSmhzw1kH3i+4kRbdoME5c8TDB3zOBIwQxbNr6KdyxaU4xN09NgA5FeqwzxXeuIj
 96Z4ARpBPByXaxR4YuHdmk2JjFK6KoE=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-439-ORhyhheyMuK7mgo9LomwPg-1; Wed, 15 Feb 2023 15:14:38 -0500
X-MC-Unique: ORhyhheyMuK7mgo9LomwPg-1
Received: by mail-il1-f200.google.com with SMTP id
 i17-20020a056e020ed100b003157534461aso32449ilk.11
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 12:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U1wrWGEpVsra8u10jrpz5eOYi1xilGx5PYsbD5L5RB8=;
 b=eKfmtcV++nWZ2YlMCkUT28rPvgtE9YOo0PHcJjyxJvlttwMQ8vXikna+ZuBlJNH8ZH
 aVzInu3sjwXbSBfv11D9QPNMvWq6Jdd1YDJc+oKB/qVNZ+5yYPE+T1UuBbBrVPrp/0UJ
 OIFLROYDBuGYuyrbMUc8sDsTvi43XemGw3NBjpeFdFpgtiZMB0qd+hJPX5pulOlRM+Bg
 6hqMVdOQVp2pAnk/81UWjFlo3Upa3P+QMkGumfGlfDn5EjWpnIXtD+gvQx9DatU+YoF4
 14R/Try4/EUnbhGCe8Br+rguNImMs+StGoMTuqldzkvHqsALVcSLRVSNl6fspulRYSQZ
 Y4eQ==
X-Gm-Message-State: AO0yUKXZ/yWoQhl1ttfyOhyaq47/2PzZeoiNpi1Y1WEAs2ZsYF0ZiMJg
 zYrrB3aMyhaNcq0HCJ/WeOi7v8npLXiwK83fA1itIizYs4wC3QKAPC4/onLcVVb0sQyxq+DWyME
 tX2Es4PDFn6wv2dg=
X-Received: by 2002:a6b:e303:0:b0:72a:efc0:3cf1 with SMTP id
 u3-20020a6be303000000b0072aefc03cf1mr2522595ioc.21.1676492077660; 
 Wed, 15 Feb 2023 12:14:37 -0800 (PST)
X-Google-Smtp-Source: AK7set/8F2iyimfXgkGlg23TMjnnEr9+1KaqQuisld0f+rjHSoRblNZgk0pfMJZDMiLLO2UvOTJOyQ==
X-Received: by 2002:a6b:e303:0:b0:72a:efc0:3cf1 with SMTP id
 u3-20020a6be303000000b0072aefc03cf1mr2522583ioc.21.1676492077396; 
 Wed, 15 Feb 2023 12:14:37 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 g16-20020a056602151000b0073dec58143asm3894679iow.41.2023.02.15.12.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 12:14:36 -0800 (PST)
Date: Wed, 15 Feb 2023 13:14:35 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, =?UTF-8?B?Q8Op?=
 =?UTF-8?B?ZHJpYw==?= Le Goater <clg@redhat.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v10 03/12] vfio/migration: Allow migration without VFIO
 IOMMU dirty tracking support
Message-ID: <20230215131435.3e14aa55.alex.williamson@redhat.com>
In-Reply-To: <87sff6ztxq.fsf@secure.mitica>
References: <20230209192043.14885-1-avihaih@nvidia.com>
 <20230209192043.14885-4-avihaih@nvidia.com>
 <8735773xr7.fsf@secure.mitica>
 <2efede77-0b06-0efa-1ea2-86300307c86f@nvidia.com>
 <87sff6ztxq.fsf@secure.mitica>
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

On Wed, 15 Feb 2023 19:04:33 +0100
Juan Quintela <quintela@redhat.com> wrote:

> Avihai Horon <avihaih@nvidia.com> wrote:
> > On 15/02/2023 14:43, Juan Quintela wrote: =20
> >> External email: Use caution opening links or attachments
> >>
> >>
> >> Avihai Horon <avihaih@nvidia.com> wrote: =20
> >>> Currently, if IOMMU of a VFIO container doesn't support dirty page
> >>> tracking, migration is blocked. This is because a DMA-able VFIO device
> >>> can dirty RAM pages without updating QEMU about it, thus breaking the
> >>> migration.
> >>>
> >>> However, this doesn't mean that migration can't be done at all.
> >>> In such case, allow migration and let QEMU VFIO code mark all pages
> >>> dirty.
> >>>
> >>> This guarantees that all pages that might have gotten dirty are repor=
ted
> >>> back, and thus guarantees a valid migration even without VFIO IOMMU
> >>> dirty tracking support.
> >>>
> >>> The motivation for this patch is the introduction of iommufd [1].
> >>> iommufd can directly implement the /dev/vfio/vfio container IOCTLs by
> >>> mapping them into its internal ops, allowing the usage of these IOCTLs
> >>> over iommufd. However, VFIO IOMMU dirty tracking is not supported by
> >>> this VFIO compatibility API.
> >>>
> >>> This patch will allow migration by hosts that use the VFIO compatibil=
ity
> >>> API and prevent migration regressions caused by the lack of VFIO IOMMU
> >>> dirty tracking support.
> >>>
> >>> [1]
> >>> https://lore.kernel.org/kvm/0-v6-a196d26f289e+11787-iommufd_jgg@nvidi=
a.com/
> >>>
> >>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> >>> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com> =20
> >> Reviewed-by: Juan Quintela <quintela@redhat.com>
> >>
> >> I know why you are doing this.
> >>
> >> But I think this should print a warning, error, somewhere. =20
> >
> > IMHO, I'm not sure it's really necessary.
> >
> > To enable VFIO migration the user must explicitly set x-enable-migratio=
n=3Don.
> > I guess in this case the user is well aware of the dirty tracking
> > capabilities the VFIO device has or doesn't have.
> > So I don't think adding this error/warning will help much. =20
>=20
> Oops.  I missed that bit.
> I retire my objection.

Keep it in mind though as hopefully we'll be making vfio migration
non-experimental soon and enabled by default where devices support it.
We'll need to consider whether we want to keep "dumb" dirty tracking,
or even any form of dirty tracking in the type1 uAPI, under an
experimental opt-in.  Thanks,

Alex


