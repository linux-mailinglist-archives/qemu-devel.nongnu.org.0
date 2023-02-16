Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F1269992B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 16:44:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgQ3-0005Po-EF; Thu, 16 Feb 2023 10:43:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSgQ1-0005Nk-7Y
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 10:43:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSgPz-0004bF-Cs
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 10:43:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676562210;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=DncfW+zuQVJ8AYhj+x1CkqzF9Ms9doV67NrvfgSQSPM=;
 b=WjEUkQkj1l9WwvzUp7jdVu1RFrCvTwhsLttD5XLcgkEp7MEDR+opV1hijbjqToZhnv3YYI
 mrbgSQjQsyQkmLP4hiE0PI+S6JMgM/KoALudjI51qboXncDK64ZM4b5TKtErQ4a9+qQiL6
 w6hLYGxwBcCdmUCxqTGVAmCsiS9GUT0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-299-8H4zuzRDMEyXa284qy2M9Q-1; Thu, 16 Feb 2023 10:43:29 -0500
X-MC-Unique: 8H4zuzRDMEyXa284qy2M9Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 bd21-20020a05600c1f1500b003dc5cb10dcfso973490wmb.9
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 07:43:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DncfW+zuQVJ8AYhj+x1CkqzF9Ms9doV67NrvfgSQSPM=;
 b=cyS70tprbhWwVD0S9CX/4DAqxvfcyy8GUjZT7aGLgXOyLy3BnlHSeWEC6JsDkUsPiS
 hk6+6nXnqscq/+vg6keJhe9HOPdFYQffVNCBy76GthN872LBt5SMqrmq1ohr2NlO1oNn
 /QZOI69AbaJnSs9iRnX3U830NnDDMuHvfIT4BPS6f8bEQIsx0f7w5ASvmMZv5HugbVPy
 CE4/3w/qF6AUp+2YAC+FeWgGw3NXbz4RsgGvOjisn/DtJEjpkmODMCKz/foETjW1Izym
 dJ6ZFpX68Gi2fZYo1KBjCDSJg5Rl9O/XahMWpOuVgJdy0/AcsmxB4tcAuSr+f6PxAOrx
 m8IQ==
X-Gm-Message-State: AO0yUKXjIRyL4cncUuykHhyGhM2wMGOOFQnxkrfd9Xpwax2EaT+NbpBl
 msMbNAT3mbx7KlBjctM/KYD/gp292q1G+HUXrzwsgsQom2rfMuGxdf6biAzPJf1G47HNZASH9H4
 q7cf6uSk1PvD+Pmc=
X-Received: by 2002:a5d:4a8e:0:b0:2c5:8d4a:3695 with SMTP id
 o14-20020a5d4a8e000000b002c58d4a3695mr1688355wrq.59.1676562207944; 
 Thu, 16 Feb 2023 07:43:27 -0800 (PST)
X-Google-Smtp-Source: AK7set+XvS8NjoYW60z1cJbpayFKA8w0TMUw+stJGqqHXkx00RElZPAbFji+ibJZghbpa8DRSXcQhw==
X-Received: by 2002:a5d:4a8e:0:b0:2c5:8d4a:3695 with SMTP id
 o14-20020a5d4a8e000000b002c58d4a3695mr1688330wrq.59.1676562207615; 
 Thu, 16 Feb 2023 07:43:27 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 h9-20020adfe989000000b002c5501a5803sm1748470wrm.65.2023.02.16.07.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 07:43:26 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>,  Alex Williamson <alex.williamson@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Cornelia Huck <cohuck@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>,  Yishai
 Hadas <yishaih@nvidia.com>,  Jason Gunthorpe <jgg@nvidia.com>,  Maor
 Gottlieb <maorg@nvidia.com>,  Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>,  Joao Martins
 <joao.m.martins@oracle.com>
Subject: Re: [PATCH v11 08/11] vfio/migration: Implement VFIO migration
 protocol v2
In-Reply-To: <20230216143630.25610-9-avihaih@nvidia.com> (Avihai Horon's
 message of "Thu, 16 Feb 2023 16:36:27 +0200")
References: <20230216143630.25610-1-avihaih@nvidia.com>
 <20230216143630.25610-9-avihaih@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Feb 2023 16:43:25 +0100
Message-ID: <87pma9hazm.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Avihai Horon <avihaih@nvidia.com> wrote:

Reviewed-by: Juan Quintela <quintela@redhat.com>.


1st comment is a bug, but as you just remove it.


Not that it matters a lot in the end (you are removing v1 on the
following patch).

> @@ -438,7 +445,13 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
>                  return false;
>              }
>  
> -            if (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
> +            if (!migration->v2 &&
> +                migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
> +                continue;
> +            }

Are you missing here:


               } else {
                   return false;
               }

Or I am missunderstanding the code.


> +            if (migration->v2 &&
> +                migration->device_state == VFIO_DEVICE_STATE_RUNNING) {
>                  continue;
>              } else {
>                  return false;


[...]



> +/*
> + * This is an arbitrary size based on migration of mlx5 devices, where typically
> + * total device migration size is on the order of 100s of MB. Testing with
> + * larger values, e.g. 128MB and 1GB, did not show a performance improvement.
> + */
> +#define VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE (1 * MiB)

Just in case that it makes a difference.  You are using here a 1MB
buffer.
But qemu_file_get_to_fd() uses a 32KB buffer.



>      }
>  }
>  
> +static int vfio_query_stop_copy_size(VFIODevice *vbasedev,
> +                                     uint64_t *stop_copy_size)
> +{
> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
> +                              sizeof(struct vfio_device_feature_mig_data_size),
> +                              sizeof(uint64_t))] = {};
> +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;

suggestion:

       size_t size = DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
                                 sizeof(struct vfio_device_feature_mig_data_size),
                                 sizeof(uint64_t));
       g_autofree struct vfio_device_feature *feature = g_malloc0(size * sizeof(uint64_t));

I have to reread several times to see what was going on there.


And call it a day?



Later, Juan.


