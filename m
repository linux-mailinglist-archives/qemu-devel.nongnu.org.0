Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A2B66788C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:05:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFynV-000168-1e; Thu, 12 Jan 2023 09:43:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pFynQ-0000ym-Gs
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:43:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pFynO-00042t-Th
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:43:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673534589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1oHPXrp9c6YPmRaS00yN4Po5ucj/zL+yew3yTwJicJU=;
 b=EtfTbl7ZlPitRbBufo5LQUV1vXus1L22IUdlm7hehSmUMKrGbf3ISZ+o6CEKIpKrid+GXn
 RLkZpYzTA8dF+yF2pzuwVoDESh7npISU1eVV/xWbgSDDc9HkK4yo/0+JTN35fW3C2WUsMh
 otgonle4u0ZtnDNaXgnqkyR7QyxjlH8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-GDUtW2T9OU6yQpFfHXY9Qw-1; Thu, 12 Jan 2023 09:43:08 -0500
X-MC-Unique: GDUtW2T9OU6yQpFfHXY9Qw-1
Received: by mail-wr1-f72.google.com with SMTP id
 o5-20020adfba05000000b0029064ccbe46so3505931wrg.9
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 06:43:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1oHPXrp9c6YPmRaS00yN4Po5ucj/zL+yew3yTwJicJU=;
 b=zdssQd4m0TooXtPo668BJuDqPc1W2FxGhaeYBTE2/H96bd+A8A48U6Sj9NR24rk/RZ
 otbvrZ1cKLIOH5dohqE3nVquXniQtgJlkbIsgJZafhGifbxdi643SIJaJFfv0eNMY2r5
 nnYNI7lKtk+HCgQkMu1LgykmTgf1WuVvO6odgZ/TdXKoSvTlT+4nWqLZtPYzMhNyLbKU
 AiEqcSU+O0GZknSNNSUOeIi28OJDtZKOzd3SpXChJ6yMJC5WK3MJ58N4Q4A196czTON5
 4MofzECmmSq9Hacjtc/S7U2VB8yvdn2ZwMvWha/L4G+hgYBdYlo/qWzxCWFvIg5qxtBg
 jiEg==
X-Gm-Message-State: AFqh2kowXJUgClghDtVOfGtmkPr1pCpWSznoYVvKhqyysABC2cXCZHI6
 ZLc1yYIFVZPpWUwQcObxmxGtV2lrj5+AGWEFxFHT25sA2hXanL3Af36RIengc6O5Jot3ayLGYtY
 obG1XsL+SyPM6QR8=
X-Received: by 2002:a05:600c:4e04:b0:3d2:381f:2db5 with SMTP id
 b4-20020a05600c4e0400b003d2381f2db5mr54226206wmq.22.1673534587050; 
 Thu, 12 Jan 2023 06:43:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuSg1A5u0YUKu2NSCePe13MXzw5YOCb7Zva9p34Ik7+qE7ZkwrwIZ9+vEiv2VR4jfQ2e8E6Pw==
X-Received: by 2002:a05:600c:4e04:b0:3d2:381f:2db5 with SMTP id
 b4-20020a05600c4e0400b003d2381f2db5mr54226172wmq.22.1673534586768; 
 Thu, 12 Jan 2023 06:43:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c310e00b003cf5ec79bf9sm24244372wmo.40.2023.01.12.06.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 06:43:06 -0800 (PST)
Message-ID: <1e99a430-c81c-6955-0385-3eddeebd9460@redhat.com>
Date: Thu, 12 Jan 2023 15:43:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 05/13] migration/qemu-file: Add qemu_file_get_to_fd()
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230112085020.15866-1-avihaih@nvidia.com>
 <20230112085020.15866-6-avihaih@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230112085020.15866-6-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 1/12/23 09:50, Avihai Horon wrote:
> Add new function qemu_file_get_to_fd() that allows reading data from
> QEMUFile and writing it straight into a given fd.
> 
> This will be used later in VFIO migration code.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   migration/qemu-file.h |  1 +
>   migration/qemu-file.c | 34 ++++++++++++++++++++++++++++++++++
>   2 files changed, 35 insertions(+)
> 
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index fa13d04d78..9d0155a2a1 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -148,6 +148,7 @@ int qemu_file_shutdown(QEMUFile *f);
>   QEMUFile *qemu_file_get_return_path(QEMUFile *f);
>   void qemu_fflush(QEMUFile *f);
>   void qemu_file_set_blocking(QEMUFile *f, bool block);
> +int qemu_file_get_to_fd(QEMUFile *f, int fd, size_t size);
>   
>   void ram_control_before_iterate(QEMUFile *f, uint64_t flags);
>   void ram_control_after_iterate(QEMUFile *f, uint64_t flags);
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 2d5f74ffc2..102ab3b439 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -940,3 +940,37 @@ QIOChannel *qemu_file_get_ioc(QEMUFile *file)
>   {
>       return file->ioc;
>   }
> +
> +/*
> + * Read size bytes from QEMUFile f and write them to fd.
> + */
> +int qemu_file_get_to_fd(QEMUFile *f, int fd, size_t size)
> +{
> +    while (size) {
> +        size_t pending = f->buf_size - f->buf_index;
> +        ssize_t rc;
> +
> +        if (!pending) {
> +            rc = qemu_fill_buffer(f);
> +            if (rc < 0) {
> +                return rc;
> +            }
> +            if (rc == 0) {
> +                return -EIO;
> +            }
> +            continue;
> +        }
> +
> +        rc = write(fd, f->buf + f->buf_index, MIN(pending, size));
> +        if (rc < 0) {
> +            return -errno;
> +        }
> +        if (rc == 0) {
> +            return -EIO;
> +        }
> +        f->buf_index += rc;
> +        size -= rc;
> +    }
> +
> +    return 0;
> +}


