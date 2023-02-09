Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0C06914ED
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 00:51:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQGgt-0000Bm-DI; Thu, 09 Feb 2023 18:50:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pQGgm-00007m-2A
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 18:50:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pQGgj-00023x-Bs
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 18:50:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675986648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2VZQAueKlU0uXZUou5sGelGvxOO0p1Tqu8N8i6ud6ig=;
 b=I8m3ed395M8+fT07L+l1smE893USrfT+ZUHS4Hrw0VTxpzyq/BodRkw4vyshZtHdxgTwAc
 oE0qECbrCyVKzO91SPd9olMKG6PpwOlhm4v6JbW+10+ckkG1MKXzX1IJbh1uZzu+XJFI/h
 9i0WjQLbTydXKqEyvJLHh3sv1WO0mVk=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-232-5efR9C7PNIquZTwavmoS-g-1; Thu, 09 Feb 2023 18:50:47 -0500
X-MC-Unique: 5efR9C7PNIquZTwavmoS-g-1
Received: by mail-il1-f200.google.com with SMTP id
 g1-20020a92cda1000000b0030c45d93884so2814912ild.16
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 15:50:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2VZQAueKlU0uXZUou5sGelGvxOO0p1Tqu8N8i6ud6ig=;
 b=xtHakhNLr/QnyaioGnogxegwMZiGirYTwRR9T2lzqabBQkXz9qGk0ba1Iuww+C4jxH
 Tgr7ni4QRHVsmunPkOM0emydvQXzXsnkwJhvOkQW0Qf2Vokxh3Hn8DGtSxh8rqdQGADF
 oQZdc2l3HZSK5qo0ahE6AFYUIMQ3AGgJ4+91gQNFN3UbDFGMLRW3xF5LK6ZahdIstI0W
 VTCDTidwdjzjI9KwAOSKLcUTTEXiYmqC2SCcrYNFVKvxETtAaJMApG2cnjlNt8m9I9oi
 dXfG2Pm4IqgXU+r+/gb0CZle8H4IHVpLTYz6x7NT1c+abNyFMxvvvHS+HDu4PHZ04N1H
 vpHA==
X-Gm-Message-State: AO0yUKXnDJmTxVXbPwxhlSPPlB6oMBb78KSL/2afjWdtG6iqlvejb9D0
 4xSdZTF1FUAxuWORDkP52NMFTth1Bl5Ae+Wljt1YW3Wj/nxolItWfoILnh00YAzguEZClwYHl6E
 gF2lVH9416sF6J7s=
X-Received: by 2002:a05:6e02:1cac:b0:313:d385:3e98 with SMTP id
 x12-20020a056e021cac00b00313d3853e98mr14680312ill.18.1675986646277; 
 Thu, 09 Feb 2023 15:50:46 -0800 (PST)
X-Google-Smtp-Source: AK7set/kzJ8pRre9r12fTfeoEIA/ftzgK6zqRSy09e3p/7XZfFRaCEz9uo3ja6D6NbJ2ed1ypAtL4w==
X-Received: by 2002:a05:6e02:1cac:b0:313:d385:3e98 with SMTP id
 x12-20020a056e021cac00b00313d3853e98mr14680298ill.18.1675986646050; 
 Thu, 09 Feb 2023 15:50:46 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 z10-20020a92d18a000000b0030c0217dde6sm886816ilz.0.2023.02.09.15.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 15:50:45 -0800 (PST)
Date: Thu, 9 Feb 2023 16:50:44 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>, Juan Quintela <quintela@redhat.com>
Cc: <qemu-devel@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: Re: [PATCH v10 04/12] migration/qemu-file: Add qemu_file_get_to_fd()
Message-ID: <20230209165044.1015f029.alex.williamson@redhat.com>
In-Reply-To: <20230209192043.14885-5-avihaih@nvidia.com>
References: <20230209192043.14885-1-avihaih@nvidia.com>
 <20230209192043.14885-5-avihaih@nvidia.com>
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


Hey Juan,

I think we're close, please ack this if it looks ok.  Thanks,

Alex

On Thu, 9 Feb 2023 21:20:35 +0200
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
>=20
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


