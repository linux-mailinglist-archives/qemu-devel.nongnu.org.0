Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C52863B1A3
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 19:51:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozjDC-0002aO-Ma; Mon, 28 Nov 2022 13:50:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ozjCs-0002TK-V7
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 13:50:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ozjCq-0002p9-G0
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 13:50:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669661415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZR5vaf2xAtOCmJ3AuLSYHZFrCaOIi9NWaQE2bwz9OUM=;
 b=FtHbXIPmgXdEGMeu16FzDE6XGbB94LxkBQXHiidhFSLq/X+giZoBTJLD3KmipBtODwi/Vo
 uXaiXZjp4zkNG7KX1b/OsA5DOGPTeAdWj22cNNkoJeyjpwoVU3o6b9RgUlcBHv8vdGM2+W
 2CKn2n59L/n5DkPg4KIOBuWczqv51tw=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-494-oEBBq-TtMAmcyW2NGXpQaw-1; Mon, 28 Nov 2022 13:50:08 -0500
X-MC-Unique: oEBBq-TtMAmcyW2NGXpQaw-1
Received: by mail-io1-f70.google.com with SMTP id
 y5-20020a056602120500b006cf628c14ddso6553196iot.15
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 10:50:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZR5vaf2xAtOCmJ3AuLSYHZFrCaOIi9NWaQE2bwz9OUM=;
 b=feZPFYW9u6B54nuNMasniO/OIZ3hp2X8wdc0xznBC8TAFFYSxMUNqrDpgDfZJlhtRD
 LxswFkQvJqkbxzqkqhOsvOP91360DO1RDIJ6/gWNON7iShnKZmXHc8uAA7gPd4++6FVb
 v8++jrncfSvFvk+hMCiQb4ptoCRpMYFhvZvyhvaPEPWFVje4YxkeV8i0aFh8mRbOpxaj
 YbMB2/F25zxLn687zUY6+M3vt/HY8S78mxVya6s5vBUyFajPHCeS3sNeG8yjfatEdqq/
 D766Q/nwQ+R+Jlhg10/55OH9q6zLiJDPx3UeqO6MSELTIEwfw6d99BAXUYCIEw+jvLXS
 sv7g==
X-Gm-Message-State: ANoB5pmkhLUFlxCIPCS3G9X1eJ1EKHZdVJ80H0he+Z/489BhP7MyQfe4
 Lhc7DT8R3j+1onx5slTy6M3pp35MWntVye/XUOhGkJWfUflq3hO8KTyTg8MJOoqkHGsWYrX/qJG
 0PI55VsdkDXyJLt8=
X-Received: by 2002:a02:9f8a:0:b0:363:db63:a796 with SMTP id
 a10-20020a029f8a000000b00363db63a796mr25391152jam.250.1669661407279; 
 Mon, 28 Nov 2022 10:50:07 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7vLdtR/4A4M4xRzXRYy7Ar0pMqsbnPA8czjE6vmjVcZKSFu/JIoXADkRx5J+4PHNQ8lABRtQ==
X-Received: by 2002:a02:9f8a:0:b0:363:db63:a796 with SMTP id
 a10-20020a029f8a000000b00363db63a796mr25391136jam.250.1669661406991; 
 Mon, 28 Nov 2022 10:50:06 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 p3-20020a92c603000000b002e85e8b8d1dsm4010739ilm.5.2022.11.28.10.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 10:50:06 -0800 (PST)
Date: Mon, 28 Nov 2022 11:50:03 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng
 <fam@euphon.net>, Eric Blake <eblake@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, John Snow
 <jsnow@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org, Kunkun
 Jiang <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor
 Gottlieb <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: Re: [PATCH v3 12/17] vfio/migration: Implement VFIO migration
 protocol v2
Message-ID: <20221128115003.602d4ef7.alex.williamson@redhat.com>
In-Reply-To: <a867c866-c297-960c-6fe3-51f292f4c6d3@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-13-avihaih@nvidia.com>
 <20221116112935.23118a30.alex.williamson@redhat.com>
 <099b99c2-8949-c101-45eb-9a8aaed2adb7@nvidia.com>
 <20221117103829.18feab7a.alex.williamson@redhat.com>
 <feaa77ec-c574-6267-0872-d8769037e4c7@nvidia.com>
 <a867c866-c297-960c-6fe3-51f292f4c6d3@nvidia.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 24 Nov 2022 14:41:00 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> On 20/11/2022 11:34, Avihai Horon wrote:
> >
> > On 17/11/2022 19:38, Alex Williamson wrote: =20
> >> External email: Use caution opening links or attachments
> >>
> >>
> >> On Thu, 17 Nov 2022 19:07:10 +0200
> >> Avihai Horon <avihaih@nvidia.com> wrote: =20
> >>> On 16/11/2022 20:29, Alex Williamson wrote: =20
> >>>> On Thu, 3 Nov 2022 18:16:15 +0200
> >>>> Avihai Horon <avihaih@nvidia.com> wrote: =20
> >>>>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> >>>>> index e784374453..62afc23a8c 100644
> >>>>> --- a/hw/vfio/migration.c
> >>>>> +++ b/hw/vfio/migration.c
> >>>>> @@ -44,8 +44,84 @@
> >>>>> =C2=A0=C2=A0 #define VFIO_MIG_FLAG_DEV_SETUP_STATE (0xffffffffef100=
003ULL)
> >>>>> =C2=A0=C2=A0 #define VFIO_MIG_FLAG_DEV_DATA_STATE (0xffffffffef1000=
04ULL)
> >>>>>
> >>>>> +#define VFIO_MIG_DATA_BUFFER_SIZE (1024 * 1024) =20
> >>>> Add comment explaining heuristic of this size. =20
> >>> This is an arbitrary size we picked with mlx5 state size in mind.
> >>> Increasing this size to higher values (128M, 1G) didn't improve
> >>> performance in our testing.
> >>>
> >>> How about this comment:
> >>> This is an initial value that doesn't consume much memory and provides
> >>> good performance.
> >>>
> >>> Do you have other suggestion? =20
> >> I'd lean more towards your description above, ex:
> >>
> >> /*
> >> =C2=A0 * This is an arbitrary size based on migration of mlx5 devices,=
 where
> >> =C2=A0 * the worst case total device migration size is on the order of=
 100s
> >> =C2=A0 * of MB.=C2=A0 Testing with larger values, ex. 128MB and 1GB, d=
id not show
> >> =C2=A0 * a performance improvement.
> >> =C2=A0 */
> >>
> >> I think that provides sufficient information for someone who might come
> >> later to have an understanding of the basis if they want to try to
> >> optimize further. =20
> >
> > OK, sounds good, I will add a comment like this.
> > =20
> >>>>> @@ -804,34 +1090,51 @@ static int vfio_migration_init(VFIODevice=20
> >>>>> *vbasedev)
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return=
 -EINVAL;
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>>>>
> >>>>> -=C2=A0=C2=A0=C2=A0 ret =3D vfio_get_dev_region_info(vbasedev,
> >>>>> - VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
> >>>>> - VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
> >>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &info);
> >>>>> -=C2=A0=C2=A0=C2=A0 if (ret) {
> >>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> >>>>> -=C2=A0=C2=A0=C2=A0 }
> >>>>> +=C2=A0=C2=A0=C2=A0 ret =3D vfio_migration_query_flags(vbasedev, &m=
ig_flags);
> >>>>> +=C2=A0=C2=A0=C2=A0 if (!ret) {
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Migration v2 */
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Basic migration func=
tionality must be supported */
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!(mig_flags & VFIO_=
MIGRATION_STOP_COPY)) {
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return -EOPNOTSUPP;
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vbasedev->migration =3D=
 g_new0(VFIOMigration, 1);
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vbasedev->migration->de=
vice_state =3D=20
> >>>>> VFIO_DEVICE_STATE_RUNNING;
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vbasedev->migration->da=
ta_buffer_size =3D=20
> >>>>> VFIO_MIG_DATA_BUFFER_SIZE;
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vbasedev->migration->da=
ta_buffer =3D
> >>>>> + g_malloc0(vbasedev->migration->data_buffer_size); =20
> >>>> So VFIO_MIG_DATA_BUFFER_SIZE is our chunk size, but why doesn't the
> >>>> later addition of estimated device data size make any changes here?
> >>>> I'd think we'd want to scale the buffer to the minimum of the report=
ed
> >>>> data size and some well documented heuristic for an upper bound. =20
> >>> As I wrote above, increasing this size to higher values (128M, 1G)
> >>> didn't improve performance in our testing.
> >>> We can always change it later on if some other heuristics are proven =
to
> >>> improve performance. =20
> >> Note that I'm asking about a minimum buffer size, for example if
> >> hisi_acc reports only 10s of KB for an estimated device size, why would
> >> we still allocate VFIO_MIG_DATA_BUFFER_SIZE here?=C2=A0 Thanks, =20
> >
> > This buffer is rather small and has little memory footprint.
> > Do you think it is worth the extra complexity of resizing the buffer?
> > =20
> Alex, WDYT?
> Note that the reported estimated size is dynamic and might change from=20
> query to the other, potentially leaving us with smaller buffer size.
>=20
> Also, as part of v4 I moved this allocation to vfio_save_setup(), so it=20
> will be allocated only during migration (when it's actually used) and=20
> only by src side.

There's a claim here about added complexity that I'm not really seeing.
It looks like we simply make an ioctl call here and scale our buffer
based on the minimum of the returned device estimate or our upper
bound.

The previous comments that exceptionally large buffers don't
significantly affect migration performance seems like that also suggests
that even if the device estimate later changes, we'll likely be ok with
the initial device estimate anyway.  Periodically re-checking the
device estimate and re-allocating up to a high water mark could
potentially be future work.  Thanks,

Alex


