Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA526A440E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:16:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeEF-0008Ah-9G; Mon, 27 Feb 2023 09:11:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pWeCw-0007Dj-AB
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pWeCt-0000ty-SQ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677507023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qwTMfj+GtDdsguLxKYz8N71JPcDeHj4m7VXwVE1veBQ=;
 b=XUAvFWUheQqPGc5JjF/fHTMgTmT330wNJ5yF9DkJ3XVzFidFEEP1wFSTFIZqdAWlDHOrEf
 FiMAm+e7brypEo08upR1gvaMnY6Vp30729Ipayj2fEPGOLkHISEHdpT150rljapLI1FMb6
 1urzqkC0RbLW/vw7RVHFoJ4zOcOfaFU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-361-LUmVhQcuMay6Y3iwcHecJA-1; Mon, 27 Feb 2023 09:10:21 -0500
X-MC-Unique: LUmVhQcuMay6Y3iwcHecJA-1
Received: by mail-qv1-f71.google.com with SMTP id
 jh21-20020a0562141fd500b0053c23b938a0so3393086qvb.17
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:10:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qwTMfj+GtDdsguLxKYz8N71JPcDeHj4m7VXwVE1veBQ=;
 b=yBsg/qXsyWEdxo2nSOxTnktD0PdwG1SAkgnqbqMpCZeJjAqpY7KLsWdeUMVCC+wQMZ
 gtI0iHGrIBGrEPlV9bkR6S/d+nJheZcUNTz8TafwxuDMjs2+FPRj/6pfIuDuaCyfuddI
 N0eAu+ywGAoh4d6OiFQP1AuFGWb2TAAskILQhFKu0V08yx7H64OFfMTAGeYf067vzyrl
 CP4aXcFr6T2/O0d7lOek+JebU5wLEKVjBiHZbvYbvYbnlKkphB8x0NRDkzh2NCnMvnPG
 kfiJ3Z54MSphYgGt7Z9xDw0ik6wnnbOE3olRxkWx/1eQ+MadvNJ+J/ACQepBeolhxInQ
 Wfxg==
X-Gm-Message-State: AO0yUKWQW2rw9t8pXibOWYretbj2BSvaKiXVA58cHk4iwmbcG60Ouzor
 8z3wBAP73yXDfQaH2tm3nxOyU5yrFk8mQ5MnLDni99BZLs5pAPHlyLlGZ8qjmYqN3hKZdgSQsj9
 JCntKu03gVO4waRE=
X-Received: by 2002:a05:6214:1c4c:b0:56e:a2cb:574e with SMTP id
 if12-20020a0562141c4c00b0056ea2cb574emr50185550qvb.5.1677507021026; 
 Mon, 27 Feb 2023 06:10:21 -0800 (PST)
X-Google-Smtp-Source: AK7set91IEKAQ7JPchfCduPdevNOrxp59alcRI4ffA7Kb6JEWThcN1awuC0iuE17QOSIpKLG5ZHrsw==
X-Received: by 2002:a05:6214:1c4c:b0:56e:a2cb:574e with SMTP id
 if12-20020a0562141c4c00b0056ea2cb574emr50185502qvb.5.1677507020771; 
 Mon, 27 Feb 2023 06:10:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 i62-20020a37b841000000b0073b79edf46csm4956862qkf.83.2023.02.27.06.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 06:10:20 -0800 (PST)
Message-ID: <2a8dad3e-3dba-0fc5-8bde-b36c20e85138@redhat.com>
Date: Mon, 27 Feb 2023 15:10:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 02/20] vfio/migration: Refactor vfio_save_block() to
 return saved data size
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-3-avihaih@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230222174915.5647-3-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/22/23 18:48, Avihai Horon wrote:
> Refactor vfio_save_block() to return the size of saved data on success
> and -errno on error.
> 
> This will be used in next patch to implement VFIO migration pre-copy
> support.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>

LGTM

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.

> ---
>   hw/vfio/migration.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 4fb7d01532..94a4df73d0 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -240,8 +240,8 @@ static int vfio_query_stop_copy_size(VFIODevice *vbasedev,
>       return 0;
>   }
>   
> -/* Returns 1 if end-of-stream is reached, 0 if more data and -errno if error */
> -static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
> +/* Returns the size of saved data on success and -errno on error */
> +static ssize_t vfio_save_block(QEMUFile *f, VFIOMigration *migration)
>   {
>       ssize_t data_size;
>   
> @@ -251,7 +251,7 @@ static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
>           return -errno;
>       }
>       if (data_size == 0) {
> -        return 1;
> +        return 0;
>       }
>   
>       qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
> @@ -261,7 +261,7 @@ static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
>   
>       trace_vfio_save_block(migration->vbasedev->name, data_size);
>   
> -    return qemu_file_get_error(f);
> +    return qemu_file_get_error(f) ?: data_size;
>   }
>   
>   /* ---------------------------------------------------------------------- */
> @@ -335,6 +335,7 @@ static void vfio_state_pending_exact(void *opaque, uint64_t threshold_size,
>   static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>   {
>       VFIODevice *vbasedev = opaque;
> +    ssize_t data_size;
>       int ret;
>   
>       /* We reach here with device state STOP only */
> @@ -345,11 +346,11 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>       }
>   
>       do {
> -        ret = vfio_save_block(f, vbasedev->migration);
> -        if (ret < 0) {
> -            return ret;
> +        data_size = vfio_save_block(f, vbasedev->migration);
> +        if (data_size < 0) {
> +            return data_size;
>           }
> -    } while (!ret);
> +    } while (data_size);
>   
>       qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>       ret = qemu_file_get_error(f);


