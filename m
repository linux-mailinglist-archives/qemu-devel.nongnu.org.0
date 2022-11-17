Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8937A62E34E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 18:40:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oviqV-0001yg-Ny; Thu, 17 Nov 2022 12:38:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oviqT-0001yE-GY
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:38:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oviqR-0008P8-MC
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:38:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668706714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vc6t4s5bYtkVfxeQcEnvPzxcYv/bPjboCLqPsAwhIl4=;
 b=dYcht2aC7SSEflT+zgOTJY2ryQQx+qbHeTzT9VXLFnCL1GYwX/z8nmVwcbN7dV19qY7Llt
 543XP9So1lAdaHPX0YINVZNXJiZnFFL/0S7bBntp+fk1P1Do1lQ7MCsHuEvOWESJnZk7b+
 qU1vtgADRM0k2m3pFHvp4hY9iZRa5J0=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-183-RJKLqJTEOkOYRP4Fhmgygw-1; Thu, 17 Nov 2022 12:38:33 -0500
X-MC-Unique: RJKLqJTEOkOYRP4Fhmgygw-1
Received: by mail-il1-f198.google.com with SMTP id
 c4-20020a056e020bc400b0030098df879dso1648430ilu.6
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 09:38:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vc6t4s5bYtkVfxeQcEnvPzxcYv/bPjboCLqPsAwhIl4=;
 b=VmtHtXggVvc37pDKuKSYqs+wkRJB7gJcn4PuHmAusG+QzemGkedfUik2rwfp0ubgq8
 cTXpJp0MsPDoqlFA6T/CGpnk5YV7BwNOwvZP22tRRIIPIQHjhQElWbhNVhm57P7Q3Khd
 loZNbU6iPbTb7yyEtQYrUeqbrBgWrPWelkhxxhARSEPzXOdcEc6AmsFeDm4EGGk8y0B8
 I6yOVL+vDuYrr030a2W5AcHbBQYU7gB+xnZqsmGaS40TsjxlKjg+qwrSMZ+lEJck/D5k
 7k0igZ3oHz6poo9fwN6/F33CeslzIk3Hxhgx4AYJrnKCp5L8YddyRMU9Q60ezKByPTj/
 EZRQ==
X-Gm-Message-State: ANoB5plmOxZ8huDo1HgEKB+B+yKIxK9fEmh0kxp4x0iwqrTg9sv442Ih
 O7HajNlh209VKc7zl3T1LbPOJ2GP159TwvdKXX5qrbRD+D42xM1FchVGM1QAm2WoQmKXepJaX+K
 Llb4tqPIHvoDPrf8=
X-Received: by 2002:a05:6638:3e13:b0:374:32e6:4b3c with SMTP id
 co19-20020a0566383e1300b0037432e64b3cmr1519695jab.197.1668706712467; 
 Thu, 17 Nov 2022 09:38:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7rgnLSoXbLZSqzvd9mV+u3lDQDDM/BtCjAtBjF+kiIYa3NP7M/uPY2CTruytcAaV9jwCwDCA==
X-Received: by 2002:a05:6638:3e13:b0:374:32e6:4b3c with SMTP id
 co19-20020a0566383e1300b0037432e64b3cmr1519675jab.197.1668706712132; 
 Thu, 17 Nov 2022 09:38:32 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 o137-20020a02228f000000b003748d3552e1sm419651jao.154.2022.11.17.09.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 09:38:31 -0800 (PST)
Date: Thu, 17 Nov 2022 10:38:29 -0700
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
Message-ID: <20221117103829.18feab7a.alex.williamson@redhat.com>
In-Reply-To: <099b99c2-8949-c101-45eb-9a8aaed2adb7@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-13-avihaih@nvidia.com>
 <20221116112935.23118a30.alex.williamson@redhat.com>
 <099b99c2-8949-c101-45eb-9a8aaed2adb7@nvidia.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 17 Nov 2022 19:07:10 +0200
Avihai Horon <avihaih@nvidia.com> wrote:
> On 16/11/2022 20:29, Alex Williamson wrote:
> > On Thu, 3 Nov 2022 18:16:15 +0200
> > Avihai Horon <avihaih@nvidia.com> wrote:
> >> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> >> index e784374453..62afc23a8c 100644
> >> --- a/hw/vfio/migration.c
> >> +++ b/hw/vfio/migration.c
> >> @@ -44,8 +44,84 @@
> >>   #define VFIO_MIG_FLAG_DEV_SETUP_STATE   (0xffffffffef100003ULL)
> >>   #define VFIO_MIG_FLAG_DEV_DATA_STATE    (0xffffffffef100004ULL)
> >>
> >> +#define VFIO_MIG_DATA_BUFFER_SIZE (1024 * 1024)  
> > Add comment explaining heuristic of this size.  
> 
> This is an arbitrary size we picked with mlx5 state size in mind.
> Increasing this size to higher values (128M, 1G) didn't improve 
> performance in our testing.
> 
> How about this comment:
> This is an initial value that doesn't consume much memory and provides 
> good performance.
> 
> Do you have other suggestion?

I'd lean more towards your description above, ex:

/*
 * This is an arbitrary size based on migration of mlx5 devices, where
 * the worst case total device migration size is on the order of 100s
 * of MB.  Testing with larger values, ex. 128MB and 1GB, did not show
 * a performance improvement.
 */

I think that provides sufficient information for someone who might come
later to have an understanding of the basis if they want to try to
optimize further.

> >> @@ -804,34 +1090,51 @@ static int vfio_migration_init(VFIODevice *vbasedev)
> >>           return -EINVAL;
> >>       }
> >>
> >> -    ret = vfio_get_dev_region_info(vbasedev,
> >> -                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
> >> -                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
> >> -                                   &info);
> >> -    if (ret) {
> >> -        return ret;
> >> -    }
> >> +    ret = vfio_migration_query_flags(vbasedev, &mig_flags);
> >> +    if (!ret) {
> >> +        /* Migration v2 */
> >> +        /* Basic migration functionality must be supported */
> >> +        if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
> >> +            return -EOPNOTSUPP;
> >> +        }
> >> +        vbasedev->migration = g_new0(VFIOMigration, 1);
> >> +        vbasedev->migration->device_state = VFIO_DEVICE_STATE_RUNNING;
> >> +        vbasedev->migration->data_buffer_size = VFIO_MIG_DATA_BUFFER_SIZE;
> >> +        vbasedev->migration->data_buffer =
> >> +            g_malloc0(vbasedev->migration->data_buffer_size);  
> > So VFIO_MIG_DATA_BUFFER_SIZE is our chunk size, but why doesn't the
> > later addition of estimated device data size make any changes here?
> > I'd think we'd want to scale the buffer to the minimum of the reported
> > data size and some well documented heuristic for an upper bound.  
> 
> As I wrote above, increasing this size to higher values (128M, 1G) 
> didn't improve performance in our testing.
> We can always change it later on if some other heuristics are proven to 
> improve performance.

Note that I'm asking about a minimum buffer size, for example if
hisi_acc reports only 10s of KB for an estimated device size, why would
we still allocate VFIO_MIG_DATA_BUFFER_SIZE here?  Thanks,

Alex


