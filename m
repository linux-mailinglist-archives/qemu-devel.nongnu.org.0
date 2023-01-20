Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F3267613E
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 00:08:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJ0T1-0000M9-PA; Fri, 20 Jan 2023 18:06:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pJ0Sz-0000Kv-P3
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 18:06:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pJ0Sx-0006zW-5V
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 18:06:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674255994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nmrvtv3XHQfVNaEYhvgzsGO16+TgmKtQQ/6wJkcGaDg=;
 b=Ekfu3USGoOrAYACftNABQA2wD0Y4VD7FsR+Rt+YrbZO/Uh7AGUUO6oECd050QB7seuwvK7
 SOHAgNzNOxFyfmtKYZ+Ced/NZy0JkIbnfD1tWY2IUabo+23uGwFnABL0XaeiU0+aeeicOB
 sRUuBwxQYo3I2kEEGT7iBQ5aybTe6K8=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-444--axc_a6ePxO5CVO15d6Sng-1; Fri, 20 Jan 2023 18:06:33 -0500
X-MC-Unique: -axc_a6ePxO5CVO15d6Sng-1
Received: by mail-io1-f70.google.com with SMTP id
 4-20020a6b1404000000b00704700d919cso3723108iou.11
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 15:06:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nmrvtv3XHQfVNaEYhvgzsGO16+TgmKtQQ/6wJkcGaDg=;
 b=t8iIcs9bcQ535NhXo1neEbCi0qm1QZgwzUMH2Ybw9Yi3nS0shv89wdr7iVEMrwT8A4
 RKhOVqeJHhPhHmTNS9x89aD1HKekogmQB956xcikC8yUhR4PBm+42QyGNMw3tw5rbxGs
 NAzerWT35qhZwK0kcJlQ0eFRS7ZWTGcErF2M2geEbTY7EQniJb+WBpC44rVYlLCgcv2y
 43uk9d2PVMDhyo0spSKOsdyBjzoOoFmnx2RAsoD9YIkuR97ZgfMvM+yhWP7p2pvuqFA8
 krmgukXJInSrEAoX59CMDxmRav77CbxFYiCDPFP1Y6s4xNaN3GNu742znbSKRqe+mEwo
 55+w==
X-Gm-Message-State: AFqh2kqaqf39BDVVg//Ee8ZCDmhTr3Dn6tLl6fZX8dtCbN80etveivLt
 4fakywPwFXu9GEkaZWMymhRfd6V6o96zXp1gX6V3irWrBfmoECBgNcYwteVIy+5CE2mbKAD172J
 BS7CDczzpBig1Qps=
X-Received: by 2002:a92:c261:0:b0:30f:641b:d12c with SMTP id
 h1-20020a92c261000000b0030f641bd12cmr1552407ild.9.1674255992422; 
 Fri, 20 Jan 2023 15:06:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu9AjfY1bM8V0xSZuKVtxTtzPgiXPHHkKnOKEAtrkbA7k2qw2ypAIrDOYnkwmu7uA0u6hX/8g==
X-Received: by 2002:a92:c261:0:b0:30f:641b:d12c with SMTP id
 h1-20020a92c261000000b0030f641bd12cmr1552392ild.9.1674255992209; 
 Fri, 20 Jan 2023 15:06:32 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 p16-20020a92d290000000b00302632f0d20sm731447ilp.67.2023.01.20.15.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 15:06:31 -0800 (PST)
Date: Fri, 20 Jan 2023 16:06:30 -0700
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
Subject: Re: [PATCH v8 05/13] migration/qemu-file: Add qemu_file_get_to_fd()
Message-ID: <20230120160630.21e08d05.alex.williamson@redhat.com>
In-Reply-To: <20230116141135.12021-6-avihaih@nvidia.com>
References: <20230116141135.12021-1-avihaih@nvidia.com>
 <20230116141135.12021-6-avihaih@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
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

On Mon, 16 Jan 2023 16:11:27 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> Add new function qemu_file_get_to_fd() that allows reading data from
> QEMUFile and writing it straight into a given fd.
>=20
> This will be used later in VFIO migration code.
>=20
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>
> ---
>  migration/qemu-file.h |  1 +
>  migration/qemu-file.c | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)

quintela, dgilbert, Ping for ack.  Thanks,

Alex

=20
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index fa13d04d78..9d0155a2a1 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -148,6 +148,7 @@ int qemu_file_shutdown(QEMUFile *f);
>  QEMUFile *qemu_file_get_return_path(QEMUFile *f);
>  void qemu_fflush(QEMUFile *f);
>  void qemu_file_set_blocking(QEMUFile *f, bool block);
> +int qemu_file_get_to_fd(QEMUFile *f, int fd, size_t size);
> =20
>  void ram_control_before_iterate(QEMUFile *f, uint64_t flags);
>  void ram_control_after_iterate(QEMUFile *f, uint64_t flags);
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 2d5f74ffc2..102ab3b439 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -940,3 +940,37 @@ QIOChannel *qemu_file_get_ioc(QEMUFile *file)
>  {
>      return file->ioc;
>  }
> +
> +/*
> + * Read size bytes from QEMUFile f and write them to fd.
> + */
> +int qemu_file_get_to_fd(QEMUFile *f, int fd, size_t size)
> +{
> +    while (size) {
> +        size_t pending =3D f->buf_size - f->buf_index;
> +        ssize_t rc;
> +
> +        if (!pending) {
> +            rc =3D qemu_fill_buffer(f);
> +            if (rc < 0) {
> +                return rc;
> +            }
> +            if (rc =3D=3D 0) {
> +                return -EIO;
> +            }
> +            continue;
> +        }
> +
> +        rc =3D write(fd, f->buf + f->buf_index, MIN(pending, size));
> +        if (rc < 0) {
> +            return -errno;
> +        }
> +        if (rc =3D=3D 0) {
> +            return -EIO;
> +        }
> +        f->buf_index +=3D rc;
> +        size -=3D rc;
> +    }
> +
> +    return 0;
> +}


