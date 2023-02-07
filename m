Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC7868E487
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 00:43:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPXbW-0005RR-4W; Tue, 07 Feb 2023 18:42:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pPXbO-0005Qg-1M
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:42:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pPXbM-0003bJ-AP
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675813335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/bkxUxGpxgscbhyOS2T8R7zLM9Gf1gKsP20B/e/gmI=;
 b=B9A97qQb+pREeorTLdJc+98BmYgoKhdQRVO6H+ly9R2bmF63/C9FOWgXTJBS1os3+auGt1
 loZYRvmsVypy7oZe8qUOB9bxgPjxa2RJAcjXYcarKdjXFskJDxCGO0g8i0A5K0IKdbFs8g
 GC/5mbS4JMQAp/6u2X4wG9yHyCo2WfI=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-364-CAPRygfLPGqcFTGUFh-y2w-1; Tue, 07 Feb 2023 18:42:13 -0500
X-MC-Unique: CAPRygfLPGqcFTGUFh-y2w-1
Received: by mail-io1-f71.google.com with SMTP id
 k26-20020a5d8b1a000000b0073020447349so4681166ion.8
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 15:42:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M/bkxUxGpxgscbhyOS2T8R7zLM9Gf1gKsP20B/e/gmI=;
 b=APSnVhy2rtpsBiP4zFByIq6o933lFB1Yz073K7M6X/t9cbr8MO3fPMamPg82OCmzBI
 1LPld8odAjYYWLu2IrTsBDr+mPHB/HOD2Gy7o+E3Ozb2h6WhhZ6OmM2cstPaLhVzibw1
 skrVl2hZHvT2zZKna7ihr2PE+V2gIyb0pkF6GEMuqYkySuurik2HT+k+WcmthtYbrwJr
 ixvAt7MGHRG6k1GN8nuolat5LP60zKGCz7nA9+Lhg6tsZqqE9D1Yn/X/3lnP/vGXCLpr
 7MRALQx7zms8rGW5U7HiuNY667RJ/gad1GuqYntNDwmpoK4Lq3cmRAScNUGEt1VZTFUY
 ah3A==
X-Gm-Message-State: AO0yUKV5hr8Ui6lqYmeetAoeze+5UQqHXz0MGuVPgfuyoD9WdX3Nxilr
 RFAwMFbamT7u4VqluXqWh068OY1q8tO/L2c4reeZjnOyLZdRpQtB6yKEVlEyOzNrVArOcvjElqP
 uz9iNzuzAWLTQsnU=
X-Received: by 2002:a5d:9d10:0:b0:734:6b18:40b2 with SMTP id
 j16-20020a5d9d10000000b007346b1840b2mr3083266ioj.17.1675813332966; 
 Tue, 07 Feb 2023 15:42:12 -0800 (PST)
X-Google-Smtp-Source: AK7set9qnsVke9MrmUh/lYdmNm+Suv6wvQcrX6Kn3FG4i5zuVfVZEco0CCa+MGvZLuVnpeDxU5+nTA==
X-Received: by 2002:a5d:9d10:0:b0:734:6b18:40b2 with SMTP id
 j16-20020a5d9d10000000b007346b1840b2mr3083233ioj.17.1675813332709; 
 Tue, 07 Feb 2023 15:42:12 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 g16-20020a056602151000b0071cbf191687sm4207246iow.55.2023.02.07.15.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 15:42:12 -0800 (PST)
Date: Tue, 7 Feb 2023 16:42:09 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, "Ilya Leoshkevich"
 <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, "Juan Quintela"
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, John Snow
 <jsnow@redhat.com>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v9 10/14] vfio/migration: Implement VFIO migration
 protocol v2
Message-ID: <20230207164209.03951381.alex.williamson@redhat.com>
In-Reply-To: <20230206123137.31149-11-avihaih@nvidia.com>
References: <20230206123137.31149-1-avihaih@nvidia.com>
 <20230206123137.31149-11-avihaih@nvidia.com>
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

On Mon, 6 Feb 2023 14:31:33 +0200
Avihai Horon <avihaih@nvidia.com> wrote:
> @@ -523,6 +745,41 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
>      return 0;
>  }
>  
> +static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    enum vfio_device_mig_state recover_state;
> +    int ret;
> +
> +    /* We reach here with device state STOP only */
> +    recover_state = VFIO_DEVICE_STATE_STOP;

Why do we need to put this in a local variable?

> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP_COPY,
> +                                   recover_state);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    do {
> +        ret = vfio_save_block(f, vbasedev->migration);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +    } while (!ret);
> +
> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> +    ret = qemu_file_get_error(f);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    recover_state = VFIO_DEVICE_STATE_ERROR;

IIRC, the ERROR state is not reachable as a user directed state.  I
suppose passing it as the recovery state guarantees a device reset when
it fails, but if that's the intention it should be documented with a
comment to explain so (and vfio_migration_set_state() should not bother
trying to use it as a recovery state).

> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP,
> +                                   recover_state);
> +    trace_vfio_save_complete_precopy(vbasedev->name, ret);
> +
> +    return ret;
> +}
> +
>  static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
>  {
>      VFIODevice *vbasedev = opaque;
...
> @@ -769,12 +1087,17 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>      case MIGRATION_STATUS_CANCELLED:
>      case MIGRATION_STATUS_FAILED:
>          bytes_transferred = 0;
> -        ret = vfio_migration_v1_set_state(vbasedev,
> -                                          ~(VFIO_DEVICE_STATE_V1_SAVING |
> -                                            VFIO_DEVICE_STATE_V1_RESUMING),
> -                                          VFIO_DEVICE_STATE_V1_RUNNING);
> -        if (ret) {
> -            error_report("%s: Failed to set state RUNNING", vbasedev->name);
> +        if (migration->v2) {
> +            vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
> +                                     VFIO_DEVICE_STATE_ERROR);

Same here.  Thanks,

Alex

> +        } else {
> +            ret = vfio_migration_v1_set_state(vbasedev,
> +                                              ~(VFIO_DEVICE_STATE_V1_SAVING |
> +                                                VFIO_DEVICE_STATE_V1_RESUMING),
> +                                              VFIO_DEVICE_STATE_V1_RUNNING);
> +            if (ret) {
> +                error_report("%s: Failed to set state RUNNING", vbasedev->name);
> +            }
>          }
>      }
>  }


