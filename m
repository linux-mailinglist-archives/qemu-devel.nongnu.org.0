Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4A9699D31
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 20:54:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSkJu-0001Rf-QV; Thu, 16 Feb 2023 14:53:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pSkJs-0001RQ-FJ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 14:53:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pSkJq-0005X1-KD
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 14:53:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676577205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FP8mWWIFgjrATyMsoaHXwB+Ls9oWxm72dh55Wk+BK9s=;
 b=KGjDJi/PU7V73+1zFdO+8YvVOa4Ze7tgeDdPQdnjNUf6UY/v3sCT9POCaSh6iZUjQRK53L
 wFafDSdoz05nUQpMrD6RUK9DLJTkWs3ODuy14oOp4020OXrOkhk+vWP/FUYMcrpi+xMfac
 sgHO1018uy1/a2+Ht4PoCpjJqZQOwUc=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-650-IIEfJYhqNlCHO1KAb4Uwbg-1; Thu, 16 Feb 2023 14:53:24 -0500
X-MC-Unique: IIEfJYhqNlCHO1KAb4Uwbg-1
Received: by mail-il1-f199.google.com with SMTP id
 j12-20020a056e02220c00b003159820c0b9so384992ilf.6
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 11:53:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FP8mWWIFgjrATyMsoaHXwB+Ls9oWxm72dh55Wk+BK9s=;
 b=FhYYZFjhStSevGlgi6fnWngu1RjHZ55qYPFLHVMRph+itOVjie0T31eI8wQptoKV3X
 nB7IxCilUgYBZG5Xbk17EK+AmOOrvqwM0U7NCA42+f5DSi6dOTqRJRxSUehAskI3kPhQ
 VmhVABcg7hsco5kHjc2xpjZePkI8KjMd2HUWq9pA8dcd0ESMSdMKPKtvlBBUscTQFyB7
 RSRmTIOt79tJNO7V/UeUzFIIDbM7dSPRa5LXlmSG8lKWMkCXVaVt23nOyOZ3qAF0zq9n
 sFl0/s/k7JUF2aS0o5T+Tq7Dx4V0MOklIgu7Bt4DVCjQjoRB1gdT4CcLVoySoxrpLjJB
 Ua1A==
X-Gm-Message-State: AO0yUKW46XpVPGnvJTWaLBqSxf1kwjLPNnq75hNKPR2KuT0/bamjmjbh
 r+V/w4LgcGIbIgbSNdwEMgmRuz9TPGv3lEhOCEPVXSGtUIYnVBEFS4EusDLR/ZWvm9bUG6H6fOB
 1b5ytLSOgtlO6ymQ=
X-Received: by 2002:a05:6e02:1645:b0:315:7004:3e43 with SMTP id
 v5-20020a056e02164500b0031570043e43mr6403944ilu.28.1676577202944; 
 Thu, 16 Feb 2023 11:53:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+mvzMJACbb+TvG81MW+XlKo2k+Od9kzMxbJCoIeN0qMPVJtfQY5UgNZP5E6YRhPL6zc0NJCg==
X-Received: by 2002:a05:6e02:1645:b0:315:7004:3e43 with SMTP id
 v5-20020a056e02164500b0031570043e43mr6403922ilu.28.1676577202699; 
 Thu, 16 Feb 2023 11:53:22 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 b17-20020a029a11000000b0039ea34dffcdsm820841jal.129.2023.02.16.11.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 11:53:21 -0800 (PST)
Date: Thu, 16 Feb 2023 12:53:20 -0700
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
Subject: Re: [PATCH v11 08/11] vfio/migration: Implement VFIO migration
 protocol v2
Message-ID: <20230216125320.0afe5a98.alex.williamson@redhat.com>
In-Reply-To: <87edqpft7y.fsf@secure.mitica>
References: <20230216143630.25610-1-avihaih@nvidia.com>
 <20230216143630.25610-9-avihaih@nvidia.com>
 <87pma9hazm.fsf@secure.mitica>
 <93eb428e-543c-8af1-44a7-2b1124a080c0@nvidia.com>
 <87edqpft7y.fsf@secure.mitica>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
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

On Thu, 16 Feb 2023 17:52:33 +0100
Juan Quintela <quintela@redhat.com> wrote:

> Avihai Horon <avihaih@nvidia.com> wrote:
> > On 16/02/2023 17:43, Juan Quintela wrote:  
> >> External email: Use caution opening links or attachments
> >>
> >>
> >> Avihai Horon <avihaih@nvidia.com> wrote:
> >>
> >> Reviewed-by: Juan Quintela <quintela@redhat.com>.
> >>
> >>
> >> 1st comment is a bug, but as you just remove it.
> >>
> >>
> >> Not that it matters a lot in the end (you are removing v1 on the
> >> following patch).
> >>  
> >>> @@ -438,7 +445,13 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
> >>>                   return false;
> >>>               }
> >>>
> >>> -            if (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
> >>> +            if (!migration->v2 &&
> >>> +                migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
> >>> +                continue;
> >>> +            }  
> >> Are you missing here:
> >>
> >>
> >>                 } else {
> >>                     return false;
> >>                 }
> >>
> >> Or I am missunderstanding the code.  
> >
> > I think the code is OK:
> >
> > If the device uses v1 migration and is running, the first if is true
> > and we continue.
> > If the device uses v1 migration and is not running, the first if is
> > false and the second if is false (since the device doesn't use v2
> > migration) and we return false.
> >
> > If the device uses v2 migration and is running, the first if is false
> > and the second if is true, so we continue.
> > If the device uses v2 migration and is not running, first if is false
> > and the second if is false, so we return false.  
> 
> You win O:-)
> 
> I was looking at C level, not at the "semantic" level.
> 
> >>
> >>         size_t size = DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
> >>                                   sizeof(struct vfio_device_feature_mig_data_size),
> >>                                   sizeof(uint64_t));
> >>         g_autofree struct vfio_device_feature *feature = g_malloc0(size * sizeof(uint64_t));
> >>
> >> I have to reread several times to see what was going on there.
> >>
> >>
> >> And call it a day?  
> >
> > I don't have a strong opinion here.
> > We can do whatever you/Alex like more.  
> 
> I think it is more readable, and we don't put (normally) big chunks in
> the stack, but once told that, who wrotes the code has more to say O:-)

This is not a huge amount of data on the stack, so I'm fine with it as
is.  Thanks,

Alex


