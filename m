Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296946652DE
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 05:36:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFSpL-0005Db-Q5; Tue, 10 Jan 2023 23:35:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pFSpI-0005D0-PI
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 23:35:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pFSpH-0000Ze-A0
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 23:35:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673411698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zgD4PXusvR/f8onznAaCZ7PK5c1IpTpp3SjUj44+/hM=;
 b=PqmACmlYf1o4jFyAarYlxOctyvWTBQegtSaV/id3lyK4DLoHA76M78dn7bpGpTC9p6+dov
 MnanTbfR0GLRkQxHLj1pA2t97jjhHmTqs9dPUJ30GQgx/Spyig9+iUmN8yU2zbhzKCHYOY
 H/S3L+NPB2WYGZ6kL/pRzAXNsm+W9fk=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-64-vWvESvaXNAyOSEOOc7xtfg-1; Tue, 10 Jan 2023 23:34:56 -0500
X-MC-Unique: vWvESvaXNAyOSEOOc7xtfg-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-150bde26feeso4467688fac.4
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 20:34:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zgD4PXusvR/f8onznAaCZ7PK5c1IpTpp3SjUj44+/hM=;
 b=rnciakVWxCZhSonnWN9wIOjeOb/NRUvrXZqYHo3L0sD99vs41273DSO4P50FwlW/Kc
 G+Wxbs4kPEuXwRFu/ro3dy8w34o6w3eM5GAwi5O1LqTuWrwAA6YrIN0gvP7fLM/Bds9b
 zW8kVklf78KNrvoWg35bRUKoE8U6GVJVgHKx9+bP0XNDPq0mLDhCcB/48pZPRVOtOBPh
 Ushszw4M7PtVI+zbjBuc0xfPvlaCnxTxmUqjEczrHHutOSNS/NLPlbKwbYhGm40IUr2h
 q1HCTshN80t5WdE8EWAg8tmGIyFCW4Zljd9agrbwJyzVXUoLg8nEm11v/rGWoDNCwV9Z
 NQ4g==
X-Gm-Message-State: AFqh2kp0B4GXdnsGRXOqLJXdD1c1qQBZrRXA2TwWR/fOgPdcOz5CE9o1
 88b961kreKDkOa4Hd0i43qDhXYmbCc0TrgnXpQ8GuEHvKc/3SzvwnsQeLIYM5V+CpQq4rgv3o54
 1talr7X+ftjfF51UpI0HBQOPRmVoE7SI=
X-Received: by 2002:a05:6870:4413:b0:144:a97b:1ae2 with SMTP id
 u19-20020a056870441300b00144a97b1ae2mr3875206oah.35.1673411696145; 
 Tue, 10 Jan 2023 20:34:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuyMqZcjHw/M06BFHqNcQ8h54g0nyWyx+EKsueHbx8EXtdJWkU/SxGfIzlt/iuEEhLTIKCkC9JEE/Ys2460VMs=
X-Received: by 2002:a05:6870:4413:b0:144:a97b:1ae2 with SMTP id
 u19-20020a056870441300b00144a97b1ae2mr3875192oah.35.1673411695937; Tue, 10
 Jan 2023 20:34:55 -0800 (PST)
MIME-Version: 1.0
References: <20221205170436.2977336-1-eperezma@redhat.com>
 <20221205170436.2977336-11-eperezma@redhat.com>
 <CACGkMEtcQztTdRbX3xyFvNYSRsu58tRppoyTUh94vXwSGLPH=A@mail.gmail.com>
 <PH0PR12MB5481EB05212DD70C97AC5729DCFF9@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481EB05212DD70C97AC5729DCFF9@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 11 Jan 2023 12:34:44 +0800
Message-ID: <CACGkMEthSYTw9JEHT_CM2FdV88eDqan+Ckj7McwTBRK92ziyUg@mail.gmail.com>
Subject: Re: [RFC PATCH for 8.0 10/13] virtio-net: Migrate vhost inflight
 descriptors
To: Parav Pandit <parav@nvidia.com>
Cc: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Liuxiangdong <liuxiangdong5@huawei.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Gautam Dawar <gdawar@xilinx.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Cindy Lu <lulu@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <elic@nvidia.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Tue, Jan 10, 2023 at 11:02 AM Parav Pandit <parav@nvidia.com> wrote:
>
> Hi Jason,
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Monday, December 5, 2022 10:25 PM
>
> >
> > A dumb question, any reason we need bother with virtio-net? It looks to=
 me it's
> > not a must and would complicate migration compatibility.
>
> Virtio net vdpa device is processing the descriptors out of order.
> This vdpa device doesn=E2=80=99t offer IN_ORDER flag.
>
> And when a VQ is suspended it cannot complete these descriptors as some d=
ummy zero length completions.
> The guest VM is flooded with [1].

Yes, but any reason for the device to do out-of-order for RX?

>
> So it is needed for the devices that doesn=E2=80=99t offer IN_ORDER featu=
re.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/net/virtio_net.c?h=3Dv6.2-rc3#n1252

It is only enabled in a debug kernel which should be harmless?

Thanks

>


