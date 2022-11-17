Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797D962E3F8
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 19:20:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovjTL-0008GV-3l; Thu, 17 Nov 2022 13:18:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ovjTI-0008FO-2d
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 13:18:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ovjTA-000800-PJ
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 13:18:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668709115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CK9ZEL6gspyOFTlYS+fvuT9NHJXGygSGWOvlvqgzk98=;
 b=FMYbpjnFC3Shf1vc4iY7c532lsWdUWGfqBZrSYhgcfEz8xMrUOXcfxNHiwFwxp8kM9IsmR
 Dx0S5RyF2cz5x37roRv7ZE9wnX26RHJsu/LJZH5Zu1SukDUzIrBdZM64yf3RKqa+jYvkgh
 wN/K+AdBcV+bkuxHOD/BcXljLzKTMyM=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-352-edTcUtAuMkWwkbWOVByP6g-1; Thu, 17 Nov 2022 13:18:32 -0500
X-MC-Unique: edTcUtAuMkWwkbWOVByP6g-1
Received: by mail-il1-f198.google.com with SMTP id
 q10-20020a056e0220ea00b00300f474693aso1732027ilv.23
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 10:18:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CK9ZEL6gspyOFTlYS+fvuT9NHJXGygSGWOvlvqgzk98=;
 b=jEmtx9XKZwHbzsP1uOXf91GI4Ac5PskBuHLlU/zgwm+WJA9lk8y3dROUqgadjrKNeP
 Hmoi3xh2+Plv8Wr0phQSV2rzVq+b6vDaRZfgoi2ObT42ulwxP+qPr2HETMzHRKQLGcR7
 HYnZwzdgAI5gVnCnohQiUmCS+13nz3d6SiWZasaf6PlwCLmM7soKRJODT5hlTHoHGEGm
 Wi0VkSXv2WH5MmBlkyT9GqYgwO125SDcs8/7SEQtHiW0am/ssINkp+rK/IGFdPccmQ0R
 jLhQAdQH3q0HAycGS7kdDuWhgQRJAU7vF+UnCvSKs/9EK9+aGW1YvZwF2M/exMgc67zB
 YWeg==
X-Gm-Message-State: ANoB5pmBqihcb0ZA99pCbXAh24cYs8EEROOuzAsu3qYgPnVF+fEL3XEV
 3SUfTHPKJMT7y3VRWPqAhEkr0jX9tdMqaXfiYFihz/HS43NURucmySa+Jp6HMCufxepvbOtvrac
 RC+0yCO+jLYGK42M=
X-Received: by 2002:a5e:d70a:0:b0:6bf:e736:22a with SMTP id
 v10-20020a5ed70a000000b006bfe736022amr1851382iom.94.1668709111312; 
 Thu, 17 Nov 2022 10:18:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6TAXZYaKGbV1LiJQE1RlyM7JsHx0iU/s1G2sl+n6/1HQUN/mSW5kT0tMJU2PFrGs3yfH2o7Q==
X-Received: by 2002:a5e:d70a:0:b0:6bf:e736:22a with SMTP id
 v10-20020a5ed70a000000b006bfe736022amr1851342iom.94.1668709111076; 
 Thu, 17 Nov 2022 10:18:31 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 i9-20020a056e021d0900b002f9537986f3sm545327ila.24.2022.11.17.10.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 10:18:30 -0800 (PST)
Date: Thu, 17 Nov 2022 11:18:28 -0700
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
Subject: Re: [PATCH v3 14/17] vfio/migration: Reset device if setting
 recover state fails
Message-ID: <20221117111828.4b5641fc.alex.williamson@redhat.com>
In-Reply-To: <2904a876-72c2-45d2-16a4-5a9733b432a7@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-15-avihaih@nvidia.com>
 <20221116113651.0bdcfea1.alex.williamson@redhat.com>
 <2904a876-72c2-45d2-16a4-5a9733b432a7@nvidia.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
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

On Thu, 17 Nov 2022 19:11:47 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> On 16/11/2022 20:36, Alex Williamson wrote:
> > External email: Use caution opening links or attachments
> >
> >
> > On Thu, 3 Nov 2022 18:16:17 +0200
> > Avihai Horon <avihaih@nvidia.com> wrote:
> >  
> >> If vfio_migration_set_state() fails to set the device in the requested
> >> state it tries to put it in a recover state. If setting the device in
> >> the recover state fails as well, hw_error is triggered and the VM is
> >> aborted.
> >>
> >> To improve user experience and avoid VM data loss, reset the device with
> >> VFIO_RESET_DEVICE instead of aborting the VM.
> >>
> >> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> >> ---
> >>   hw/vfio/migration.c | 14 ++++++++++++--
> >>   1 file changed, 12 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> >> index f8c3228314..e8068b9147 100644
> >> --- a/hw/vfio/migration.c
> >> +++ b/hw/vfio/migration.c
> >> @@ -92,8 +92,18 @@ static int vfio_migration_set_state(VFIODevice *vbasedev,
> >>
> >>           mig_state->device_state = recover_state;
> >>           if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
> >> -            hw_error("%s: Failed setting device in recover state, err: %s",
> >> -                     vbasedev->name, strerror(errno));
> >> +            error_report(
> >> +                "%s: Failed setting device in recover state, err: %s. Resetting device",
> >> +                         vbasedev->name, strerror(errno));
> >> +
> >> +            if (ioctl(vbasedev->fd, VFIO_DEVICE_RESET)) {
> >> +                hw_error("%s: Failed resetting device, err: %s", vbasedev->name,
> >> +                         strerror(errno));
> >> +            }
> >> +
> >> +            migration->device_state = VFIO_DEVICE_STATE_RUNNING;
> >> +
> >> +            return -1;
> >>           }
> >>
> >>           migration->device_state = recover_state;  
> > This addresses one of my comments on 12/ and should probably be rolled
> > in there.  
> 
> Not sure to which comment you refer to. Could you elaborate?

Hmm, I guess I thought this was in the section immediately following
where I questioned going to recovery state.  I'm still not sure why
this is a separate patch from the initial implementation of the
function in 12/ though.  Thanks,
'
Alex


