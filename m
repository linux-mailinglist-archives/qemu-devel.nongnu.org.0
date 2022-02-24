Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A39A4C2BC8
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 13:33:14 +0100 (CET)
Received: from localhost ([::1]:33184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNDJ3-0004l1-6h
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 07:33:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNDFo-0003fm-HD
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:29:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNDFj-0005hQ-Rf
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645705787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FW+JYYyRK2rpa7HF9BLZpHNLQGQgyJJ6Q0BOpZTLxBg=;
 b=M+C/n48jsGZEpsC6SMTJfOt0+KLaaj7eFxQDJWgSpQuo188RQhoacskyTBaBe3yQjznK5w
 XKVg1CgpCWbrUoSQARDGHNhEgSHe4jxmqPmjw+moLPqIDV/kCPeyUi1QnBSJGBYBJlrc3a
 K4xBswbBhmU8pRT1dNHwf3e3nSWtZiQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-2jKp2VDsOYGoL73NV0TE2g-1; Thu, 24 Feb 2022 07:29:46 -0500
X-MC-Unique: 2jKp2VDsOYGoL73NV0TE2g-1
Received: by mail-ed1-f69.google.com with SMTP id
 l24-20020a056402231800b00410f19a3103so677239eda.5
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 04:29:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FW+JYYyRK2rpa7HF9BLZpHNLQGQgyJJ6Q0BOpZTLxBg=;
 b=XLXHJoRD/nwHHFjpLGXQMtNo5TV/9izYU/YZJhcVHDSwy9rgUwqWpeAPk0Z08fKhod
 syocBspXIyLwDNzA9FePAE+Imol4v1HuLa5LIeZlozTIzUe7fSxRG9GpeLw02dwXE1mI
 U9roH6vaO8A4U+GDGDcehgzl0NhBJu5nHT3e59394qyscJG2JuMrgNBMeWpTGI1dxEtK
 X5xPWDTKmVSrXgm5wSEqyyZzpHTRh/p4JBcridNX6blI70xeIt9nENYfMKC9wHpkTSph
 WQd45SGwaYgW7EOqvDgRuYKS2EnNL++5a+jlDov39FcPnOz7Tzimx3EMFI9+axwh5GDk
 gP1A==
X-Gm-Message-State: AOAM531jDQJgHcZ7Q/wHISdB95aj4YJ7nBZ/oE0Nc6TsZjEPZbyKbeLA
 kmF6myVebdZUaX++T8ZnFlIKek09VAVdt3mafSVlPmrz0mlkUG9bCzM4osBujz+ZEUfoS0FE40R
 jYKVUa2U67JHjibY=
X-Received: by 2002:a05:6402:375:b0:404:c2be:3b8c with SMTP id
 s21-20020a056402037500b00404c2be3b8cmr2037581edw.247.1645705785022; 
 Thu, 24 Feb 2022 04:29:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUskChmJ6P5oNC44PnmxZ0ZxUhfRU/ewT+qiHO0PlNWf46F2kFFcZO+d27ZK0U5KPtR16mfA==
X-Received: by 2002:a05:6402:375:b0:404:c2be:3b8c with SMTP id
 s21-20020a056402037500b00404c2be3b8cmr2037550edw.247.1645705784736; 
 Thu, 24 Feb 2022 04:29:44 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id y21sm1331652eda.38.2022.02.24.04.29.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 04:29:44 -0800 (PST)
Message-ID: <c95ea305-683d-42d5-13ba-ba239db5d7c6@redhat.com>
Date: Thu, 24 Feb 2022 13:29:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 11/18] block: introduce snapshot-access filter
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
 <20220216194617.126484-12-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220216194617.126484-12-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, nikita.lapshin@virtuozzo.com, stefanha@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.02.22 20:46, Vladimir Sementsov-Ogievskiy wrote:
> The filter simply utilizes snapshot-access API of underlying block

Nit picking: Well, it isn’t really a filter.  I understand where you’re 
coming from, but by definition it isn’t a filter driver.

> node.
>
> In further patches we want to use it like this:
>
> [guest]                   [NBD export]
>     |                            |
>     | root                       | root
>     v                 file       v
> [copy-before-write]<------[snapshot-access]
>     |           |
>     | file      | target
>     v           v
> [active-disk] [temp.img]
>
> This way, NBD client will be able to read snapshotted state of active
> disk, when active disk is continued to be written by guest. This is
> known as "fleecing", and currently uses another scheme based on qcow2
> temporary image which backing file is active-disk. New scheme comes
> with benefits - see next commit.
>
> The other possible application is exporting internal snapshots of
> qcow2, like this:
>
> [guest]          [NBD export]
>     |                  |
>     | root             | root
>     v       file       v
> [qcow2]<---------[snapshot-access]
>
> For this, we'll need to implement snapshot-access API handlers in
> qcow2 driver, and improve snapshot-access filter (and API) to make it
> possibele to select snapshot by name.

s/possibele/possible/

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   qapi/block-core.json    |   4 +-
>   block/snapshot-access.c | 132 ++++++++++++++++++++++++++++++++++++++++
>   MAINTAINERS             |   1 +
>   block/meson.build       |   1 +
>   4 files changed, 137 insertions(+), 1 deletion(-)
>   create mode 100644 block/snapshot-access.c

Again, I like this very much, not least because it provides a clean way 
to solve the long-standing question of how to nicely export qcow2 snapshots.

[...]

> diff --git a/block/snapshot-access.c b/block/snapshot-access.c
> new file mode 100644
> index 0000000000..77b87c1946
> --- /dev/null
> +++ b/block/snapshot-access.c

[...]

> +static int snapshot_access_open(BlockDriverState *bs, QDict *options, int flags,
> +                                Error **errp)
> +{
> +    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
> +                               BDRV_CHILD_DATA | BDRV_CHILD_PRIMARY,
> +                               false, errp);
> +    if (!bs->file) {
> +        return -EINVAL;
> +    }
> +
> +    bs->total_sectors = bs->file->bs->total_sectors;

(qcow2) snapshots can have a size that differs from the image’s current 
(active layer) size.  We should accommodate for that here (I guess I’d 
be fine with a FIXME, too, but introducing FIXMEs is always not exactly 
great), I think.

> +
> +    return 0;
> +}
> +


