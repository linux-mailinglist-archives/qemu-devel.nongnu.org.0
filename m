Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B0742D0EF
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 05:26:16 +0200 (CEST)
Received: from localhost ([::1]:43264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1marNn-0003K6-6d
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 23:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1marM7-0001HT-KZ
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 23:24:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1marM5-0002SR-4G
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 23:24:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634181867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XvQgsJ6H4oCsRhFkBGQaqTVbcjKATspmfdD79gs17FI=;
 b=TeQ0+le9z9KuqaWvsbS7SPdqD8R6X38Z5t1TmCYl+eSIryLDobZq4ClXXBbAr4VDUdxL86
 ZZMUo72DClJacLF/XBaijf3su/dRSaTbagLA7yZwawlhcQWtWI8tj9gJKT1EiGlg5/3NOJ
 MMkzacD9tLFSWnhTr/UjsJkqlBBgsZM=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-aDNPzpWRMTC2u9PwM2iL_Q-1; Wed, 13 Oct 2021 23:24:20 -0400
X-MC-Unique: aDNPzpWRMTC2u9PwM2iL_Q-1
Received: by mail-pf1-f198.google.com with SMTP id
 d10-20020a621d0a000000b0044ca56b97f5so2770157pfd.2
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 20:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XvQgsJ6H4oCsRhFkBGQaqTVbcjKATspmfdD79gs17FI=;
 b=eGywJn7evq2C4udRe9xoijHtJ5RlMyEaUu1C+oHXWe5fXfDk1FLY61PwsW/bWBI0Kz
 CHaWF2LN8uBdW7jLQ2hPzs5fkbF2R6DMPyCy3M/kyMkTiwpP4F0us35QjpijXuXqa3x7
 L4GmfSlruZ1Z0eUojsUNuAWm0eLepnJMNYGmpJ2MQo36km0Tekb0gDj2Ru/2VNNbehOg
 WGwqE++SsG2wf7Z4xZ8SvDmYwBmAWzJXjvWt6NSll8Kz8BbRnods2u5wbSRwXFou8RNR
 kMkujmFrbYg8LUtHH4Z0AbasN40WA8LMv7sui/64bEL7JSxqLH10X2aXTYrSPyqhrne9
 4O8g==
X-Gm-Message-State: AOAM533c/HAZFzT5dBm6c7PxUDfPiuuCYgiUHn0sRorNd3jYFIVorX1k
 rCNiKJhQvOPV1EabQtrggv6VP548Bc1m4YqS78YSP4ZditqfpC0YsqBrz5pnWH6y/U1Z6HyAbYv
 QSZXCjz5foOU3qRw=
X-Received: by 2002:a63:561a:: with SMTP id k26mr2514814pgb.144.1634181859693; 
 Wed, 13 Oct 2021 20:24:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhO1ZOwdrDcOd1FrC1uQ45bScnRf0mHlWV0Dl4iv8U3RY/P0q4PEIV2Y4kQBwTbbb3qu7jhA==
X-Received: by 2002:a63:561a:: with SMTP id k26mr2514788pgb.144.1634181859412; 
 Wed, 13 Oct 2021 20:24:19 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id f15sm799430pfq.193.2021.10.13.20.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 20:24:18 -0700 (PDT)
Subject: Re: [PATCH v2 03/15] net/vhost-vdpa: Fix device compatibility check
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20211008133442.141332-1-kwolf@redhat.com>
 <20211008133442.141332-4-kwolf@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <64419691-23ef-4eed-738c-0c762651c893@redhat.com>
Date: Thu, 14 Oct 2021 11:24:08 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211008133442.141332-4-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: damien.hedde@greensocs.com, lvivier@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, libvir-list@redhat.com, quintela@redhat.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, its@irrelevant.dk, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/10/8 ÏÂÎç9:34, Kevin Wolf Ð´µÀ:
> vhost-vdpa works only with specific devices. At startup, it second
> guesses what the command line option handling will do and error out if
> it thinks a non-virtio device will attach to them.
>
> This second guessing is not only ugly, it can lead to wrong error
> messages ('-device floppy,netdev=foo' should complain about an unknown
> property, not about the wrong kind of network device being attached) and
> completely ignores hotplugging.
>
> Drop the old checks and implement .check_peer_type() instead to fix
> this. As a nice side effect, it also removes one more dependency on the
> legacy QemuOpts infrastructure and even reduces the code size.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   net/vhost-vdpa.c | 37 ++++++++++++++-----------------------
>   1 file changed, 14 insertions(+), 23 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 912686457c..6dc68d8677 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -147,12 +147,26 @@ static bool vhost_vdpa_has_ufo(NetClientState *nc)
>   
>   }
>   
> +static bool vhost_vdpa_check_peer_type(NetClientState *nc, ObjectClass *oc,
> +                                       Error **errp)
> +{
> +    const char *driver = object_class_get_name(oc);
> +
> +    if (!g_str_has_prefix(driver, "virtio-net-")) {
> +        error_setg(errp, "vhost-vdpa requires frontend driver virtio-net-*");
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
>   static NetClientInfo net_vhost_vdpa_info = {
>           .type = NET_CLIENT_DRIVER_VHOST_VDPA,
>           .size = sizeof(VhostVDPAState),
>           .cleanup = vhost_vdpa_cleanup,
>           .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
>           .has_ufo = vhost_vdpa_has_ufo,
> +        .check_peer_type = vhost_vdpa_check_peer_type,
>   };
>   
>   static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
> @@ -179,24 +193,6 @@ static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
>       return ret;
>   }
>   
> -static int net_vhost_check_net(void *opaque, QemuOpts *opts, Error **errp)
> -{
> -    const char *name = opaque;
> -    const char *driver, *netdev;
> -
> -    driver = qemu_opt_get(opts, "driver");
> -    netdev = qemu_opt_get(opts, "netdev");
> -    if (!driver || !netdev) {
> -        return 0;
> -    }
> -    if (strcmp(netdev, name) == 0 &&
> -        !g_str_has_prefix(driver, "virtio-net-")) {
> -        error_setg(errp, "vhost-vdpa requires frontend driver virtio-net-*");
> -        return -1;
> -    }
> -    return 0;
> -}
> -
>   int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>                           NetClientState *peer, Error **errp)
>   {
> @@ -204,10 +200,5 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>   
>       assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>       opts = &netdev->u.vhost_vdpa;
> -    /* verify net frontend */
> -    if (qemu_opts_foreach(qemu_find_opts("device"), net_vhost_check_net,
> -                          (char *)name, errp)) {
> -        return -1;
> -    }
>       return net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, opts->vhostdev);
>   }


