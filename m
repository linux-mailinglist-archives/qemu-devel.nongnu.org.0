Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB5765BEBB
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 12:13:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCfEi-000318-CC; Tue, 03 Jan 2023 06:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pCfEZ-0002yR-0i
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 06:13:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pCfEW-000692-Bb
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 06:13:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672744407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LB5MGPj/ZzrHLDBpuLrY5hWFasNDrZI0lD++RSdRWj8=;
 b=itaqZ/1qsMjetH7QaWLs2xFd0ArZ1Swb3aZNQNOjgAsGGS4mk0qIElLqHEQ+GZ5f9BuwdY
 QuVdtlA1/M/9q/iKL18iXIUB9+qFo0l0Dlx6C9bJMWacZQFrdV63ygzpS9/89AXuHrv3N7
 J0u7WEfqikKi0cqMujHgB1sTER6yEik=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-319-WLarY411MKmtuIhjkhuW8Q-1; Tue, 03 Jan 2023 06:13:25 -0500
X-MC-Unique: WLarY411MKmtuIhjkhuW8Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 m8-20020a05600c3b0800b003d96bdce12fso14624504wms.9
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 03:13:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LB5MGPj/ZzrHLDBpuLrY5hWFasNDrZI0lD++RSdRWj8=;
 b=dU3rkNVdOqHHnGhJCiv5BAIr2NXgRKU8z2SmwPaxxXTzVimjNE+R9Ra42Ba62jswHJ
 UJToA2LlmGFYvat8SxqAEf/245taRUWbAXuQobYmR+t0WQV0GtL+oF4M33juC+udG2Cy
 hNUEhuDk+oRr8RjqquwrMYIAjfbVOi0NS90QUnWrjZaB2gPKGTBgQYfKZBq+hzNRdb48
 Rlg1VlADN4qye8imUL7ccpYJ96lO5/lV0waWqdwhLUvm8W/mXigrWtVuCO2c3Jpt4c6Y
 +rQOrkvWY4lx25s+XPROXiUUw5AIwIwesOfNdENJ4OwhmeoD84g0xA6wcUA0RxgbNFko
 qoWQ==
X-Gm-Message-State: AFqh2krz+9r54wKV22Uj2uMMFq+0BTL4ZBvZGV8qQzt/TGjJ3nv548Jk
 tLGW9/eD0aPTW8yf+h0uoEdc6xJK1ZcX8FBSyZNcdmgGC/goIE5PY6ncl2Hx1GnNUc13xvjDRFS
 UDMQnVh9SQNMOjX4=
X-Received: by 2002:a1c:3887:0:b0:3d2:26cd:3b1e with SMTP id
 f129-20020a1c3887000000b003d226cd3b1emr30366099wma.28.1672744404862; 
 Tue, 03 Jan 2023 03:13:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuDDnyPzD4yaRUj9O8vAt/GD7PZWUdjFC++JEObAZ3hrns2Toce+8xow+mUj1cJf4yT5KjJ+w==
X-Received: by 2002:a1c:3887:0:b0:3d2:26cd:3b1e with SMTP id
 f129-20020a1c3887000000b003d226cd3b1emr30366058wma.28.1672744404535; 
 Tue, 03 Jan 2023 03:13:24 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 19-20020a05600c021300b003c5571c27a1sm47968738wmi.32.2023.01.03.03.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 03:13:24 -0800 (PST)
Date: Tue, 3 Jan 2023 11:13:21 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org,
 qemu-block@nongnu.org, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v5 04/14] vfio/migration: Fix NULL pointer dereference bug
Message-ID: <Y7QN0fT6vI9AMU+3@work-vm>
References: <20221229110345.12480-1-avihaih@nvidia.com>
 <20221229110345.12480-5-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221229110345.12480-5-avihaih@nvidia.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Avihai Horon (avihaih@nvidia.com) wrote:
> As part of its error flow, vfio_vmstate_change() accesses
> MigrationState->to_dst_file without any checks. This can cause a NULL
> pointer dereference if the error flow is taken and
> MigrationState->to_dst_file is not set.
> 
> For example, this can happen if VM is started or stopped not during
> migration and vfio_vmstate_change() error flow is taken, as
> MigrationState->to_dst_file is not set at that time.
> 
> Fix it by checking that MigrationState->to_dst_file is set before using
> it.
> 
> Fixes: 02a7e71b1e5b ("vfio: Add VM state change handler to know state of VM")
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

It might be worth posting this patch separately since it's a simple fix
and should go in sooner.

Dave

> ---
>  hw/vfio/migration.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index e1413ac90c..09fe7c1de2 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -743,7 +743,9 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
>           */
>          error_report("%s: Failed to set device state 0x%x", vbasedev->name,
>                       (migration->device_state & mask) | value);
> -        qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
> +        if (migrate_get_current()->to_dst_file) {
> +            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
> +        }
>      }
>      vbasedev->migration->vm_running = running;
>      trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
> -- 
> 2.26.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


