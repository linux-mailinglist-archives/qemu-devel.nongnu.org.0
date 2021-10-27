Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5240E43C1D5
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 06:47:22 +0200 (CEST)
Received: from localhost ([::1]:35882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfaqP-0000iQ-Eq
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 00:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mfaoq-0008MX-81
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 00:45:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mfaoo-0002kb-2x
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 00:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635309941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pddojIoarX3jMBf11miT9PVDmIUij2hAFqR4UZWFON4=;
 b=QYIwZM8GMSsglPyGB+803RGMm/mqXFVV52YpRlxbOpCiBhMISbPOFW45A1rEqN8bUhPk0I
 K2GBbPIGMccqu+N13mUlBkblF4DYOWLKDC1Oj8BDKBtQ7Pn3BQvqExbeaEWQqqj6AJrpEu
 VoVtdUtSD2R8kAjHnGiV2hpfo0XkxDQ=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-5OI3bZsePSmwBKhh-VatAw-1; Wed, 27 Oct 2021 00:45:40 -0400
X-MC-Unique: 5OI3bZsePSmwBKhh-VatAw-1
Received: by mail-pl1-f198.google.com with SMTP id
 u1-20020a170903124100b0013fd0e97269so702109plh.10
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 21:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pddojIoarX3jMBf11miT9PVDmIUij2hAFqR4UZWFON4=;
 b=G5HWHYxFUm1ePXwbVChL6LoDbDG6nPNCygIzD9oaP4wEo4s7Qep/cYS+Zo16zj/E0A
 9LGV3quYSPhMxu3D/8qGA2QuOI6Sn4YA6JqoIu9YnMpSxyPvr+sL1d5x6l4cG2DtR1/e
 izVErGYuN/AHKt4Mb4ykQjE4nRNJQbP9nZ6ahx7PO9cX4sUjzxVe9xH9PLuGWwEJUKva
 +aPuL2MNSQaJI/YSGbhbLLfmLTS30DFR2zHXIsUYcS6esB+Hkx3hb2wcUs998JFJlElq
 p1oFHhucAa+NQX6dnwTKSkts+U1xU/prELuVYbFh3erdKCICbAIIKK0c9POBn3IsMS39
 XLPA==
X-Gm-Message-State: AOAM530euG5hn1erpphS2S3gJheWXKZcfc1qJQcop8kU3VpQTdHmunR8
 7dXS4uZ+HZwgimUbj8rRtKxQwMAgi61hwtEYldNwQo3q+on9lFW40jKuWcguDZAypdV8TLbQCRh
 8CWYR286/5b1Yy/Q=
X-Received: by 2002:a63:6c41:: with SMTP id h62mr22402185pgc.206.1635309938787; 
 Tue, 26 Oct 2021 21:45:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqfxA7bGdEyuJZuY6XSGuq/fu/oma5Ss5/Mf+4YhiHvdrm6zYVLwWUbpuewPRRSOuCJ29LyA==
X-Received: by 2002:a63:6c41:: with SMTP id h62mr22402168pgc.206.1635309938366; 
 Tue, 26 Oct 2021 21:45:38 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id u10sm9946404pfk.211.2021.10.26.21.45.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 21:45:37 -0700 (PDT)
Subject: Re: [PATCH V4 1/3] net/filter: Remove vnet_hdr from filter-mirror and
 filter-redirector
To: Zhang Chen <chen.zhang@intel.com>
References: <20211026181730.3102184-1-chen.zhang@intel.com>
 <20211026181730.3102184-2-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8948cdd0-7f4c-9b77-a02f-582b4fe96adf@redhat.com>
Date: Wed, 27 Oct 2021 12:45:34 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211026181730.3102184-2-chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/10/27 ÉÏÎç2:17, Zhang Chen Ð´µÀ:
> Make the vnet header a necessary part of filter transfer protocol.
> So remove the module's vnet_hdr_support switch here.
> It make other modules(like another filter-redirector,colo-compare...)
> know how to parse net packet correctly. If local device is not the
> virtio-net-pci, vnet_hdr_len will be 0.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>   net/filter-mirror.c | 88 ++++++++++-----------------------------------
>   qemu-options.hx     | 14 ++++----
>   2 files changed, 25 insertions(+), 77 deletions(-)
>
> diff --git a/net/filter-mirror.c b/net/filter-mirror.c
> index f20240cc9f..4f0e26cc92 100644
> --- a/net/filter-mirror.c
> +++ b/net/filter-mirror.c
> @@ -39,7 +39,6 @@ struct MirrorState {
>       CharBackend chr_in;
>       CharBackend chr_out;
>       SocketReadState rs;
> -    bool vnet_hdr;
>   };
>   
>   static int filter_send(MirrorState *s,
> @@ -48,7 +47,7 @@ static int filter_send(MirrorState *s,
>   {
>       NetFilterState *nf = NETFILTER(s);
>       int ret = 0;
> -    ssize_t size = 0;
> +    ssize_t size = 0, vnet_hdr_len = 0;
>       uint32_t len = 0;
>       char *buf;
>   
> @@ -63,21 +62,18 @@ static int filter_send(MirrorState *s,
>           goto err;
>       }
>   
> -    if (s->vnet_hdr) {
> -        /*
> -         * If vnet_hdr = on, we send vnet header len to make other
> -         * module(like colo-compare) know how to parse net
> -         * packet correctly.
> -         */
> -        ssize_t vnet_hdr_len;
> -
> -        vnet_hdr_len = nf->netdev->vnet_hdr_len;
> +    /*
> +     * The vnet header is the necessary part of filter transfer protocol.
> +     * It make other module(like colo-compare) know how to parse net
> +     * packet correctly. If device is not the virtio-net-pci,
> +     * vnet_hdr_len will be 0.
> +     */
> +    vnet_hdr_len = nf->netdev->vnet_hdr_len;
>   
> -        len = htonl(vnet_hdr_len);
> -        ret = qemu_chr_fe_write_all(&s->chr_out, (uint8_t *)&len, sizeof(len));
> -        if (ret != sizeof(len)) {
> -            goto err;
> -        }
> +    len = htonl(vnet_hdr_len);
> +    ret = qemu_chr_fe_write_all(&s->chr_out, (uint8_t *)&len, sizeof(len));
> +    if (ret != sizeof(len)) {
> +        goto err;
>       }
>   
>       buf = g_malloc(size);
> @@ -232,6 +228,12 @@ static void redirector_rs_finalize(SocketReadState *rs)
>       MirrorState *s = container_of(rs, MirrorState, rs);
>       NetFilterState *nf = NETFILTER(s);
>   
> +    /* Check remote vnet_hdr */
> +    if (rs->vnet_hdr_len != nf->netdev->vnet_hdr_len) {
> +        error_report("filter redirector got a different packet vnet_hdr"
> +        " from local, please check the -device configuration");
> +    }
> +
>       redirector_to_filter(nf, rs->buf, rs->packet_len);
>   }
>   
> @@ -252,7 +254,7 @@ static void filter_redirector_setup(NetFilterState *nf, Error **errp)
>           }
>       }
>   
> -    net_socket_rs_init(&s->rs, redirector_rs_finalize, s->vnet_hdr);
> +    net_socket_rs_init(&s->rs, redirector_rs_finalize, true);
>   
>       if (s->indev) {
>           chr = qemu_chr_find(s->indev);
> @@ -323,20 +325,6 @@ static void filter_mirror_set_outdev(Object *obj,
>       }
>   }
>   
> -static bool filter_mirror_get_vnet_hdr(Object *obj, Error **errp)
> -{
> -    MirrorState *s = FILTER_MIRROR(obj);
> -
> -    return s->vnet_hdr;
> -}
> -
> -static void filter_mirror_set_vnet_hdr(Object *obj, bool value, Error **errp)
> -{
> -    MirrorState *s = FILTER_MIRROR(obj);
> -
> -    s->vnet_hdr = value;
> -}
> -
>   static char *filter_redirector_get_outdev(Object *obj, Error **errp)
>   {
>       MirrorState *s = FILTER_REDIRECTOR(obj);
> @@ -354,31 +342,12 @@ static void filter_redirector_set_outdev(Object *obj,
>       s->outdev = g_strdup(value);
>   }
>   
> -static bool filter_redirector_get_vnet_hdr(Object *obj, Error **errp)
> -{
> -    MirrorState *s = FILTER_REDIRECTOR(obj);
> -
> -    return s->vnet_hdr;
> -}
> -
> -static void filter_redirector_set_vnet_hdr(Object *obj,
> -                                           bool value,
> -                                           Error **errp)
> -{
> -    MirrorState *s = FILTER_REDIRECTOR(obj);
> -
> -    s->vnet_hdr = value;
> -}
> -
>   static void filter_mirror_class_init(ObjectClass *oc, void *data)
>   {
>       NetFilterClass *nfc = NETFILTER_CLASS(oc);
>   
>       object_class_property_add_str(oc, "outdev", filter_mirror_get_outdev,
>                                     filter_mirror_set_outdev);
> -    object_class_property_add_bool(oc, "vnet_hdr_support",
> -                                   filter_mirror_get_vnet_hdr,
> -                                   filter_mirror_set_vnet_hdr);
>   
>       nfc->setup = filter_mirror_setup;
>       nfc->cleanup = filter_mirror_cleanup;
> @@ -393,29 +362,12 @@ static void filter_redirector_class_init(ObjectClass *oc, void *data)
>                                     filter_redirector_set_indev);
>       object_class_property_add_str(oc, "outdev", filter_redirector_get_outdev,
>                                     filter_redirector_set_outdev);
> -    object_class_property_add_bool(oc, "vnet_hdr_support",
> -                                   filter_redirector_get_vnet_hdr,
> -                                   filter_redirector_set_vnet_hdr);
>   
>       nfc->setup = filter_redirector_setup;
>       nfc->cleanup = filter_redirector_cleanup;
>       nfc->receive_iov = filter_redirector_receive_iov;
>   }
>   
> -static void filter_mirror_init(Object *obj)
> -{
> -    MirrorState *s = FILTER_MIRROR(obj);
> -
> -    s->vnet_hdr = false;
> -}
> -
> -static void filter_redirector_init(Object *obj)
> -{
> -    MirrorState *s = FILTER_REDIRECTOR(obj);
> -
> -    s->vnet_hdr = false;
> -}
> -
>   static void filter_mirror_fini(Object *obj)
>   {
>       MirrorState *s = FILTER_MIRROR(obj);
> @@ -435,7 +387,6 @@ static const TypeInfo filter_redirector_info = {
>       .name = TYPE_FILTER_REDIRECTOR,
>       .parent = TYPE_NETFILTER,
>       .class_init = filter_redirector_class_init,
> -    .instance_init = filter_redirector_init,
>       .instance_finalize = filter_redirector_fini,
>       .instance_size = sizeof(MirrorState),
>   };
> @@ -444,7 +395,6 @@ static const TypeInfo filter_mirror_info = {
>       .name = TYPE_FILTER_MIRROR,
>       .parent = TYPE_NETFILTER,
>       .class_init = filter_mirror_class_init,
> -    .instance_init = filter_mirror_init,
>       .instance_finalize = filter_mirror_fini,
>       .instance_size = sizeof(MirrorState),
>   };
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 5f375bbfa6..38c03812a7 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4946,18 +4946,16 @@ SRST
>   
>           ``behind``: insert behind the specified filter (default).
>   
> -    ``-object filter-mirror,id=id,netdev=netdevid,outdev=chardevid,queue=all|rx|tx[,vnet_hdr_support][,position=head|tail|id=<id>][,insert=behind|before]``
> +    ``-object filter-mirror,id=id,netdev=netdevid,outdev=chardevid,queue=all|rx|tx[,position=head|tail|id=<id>][,insert=behind|before]``


I wonder if we break management layer. If yes, maybe it's better to keep 
the vnet_hdr_support here.

Thanks


>           filter-mirror on netdev netdevid,mirror net packet to
> -        chardevchardevid, if it has the vnet\_hdr\_support flag,
> -        filter-mirror will mirror packet with vnet\_hdr\_len.
> +        chardev chardevid, filter-mirror will mirror packet with vnet\_hdr\_len.
>   
> -    ``-object filter-redirector,id=id,netdev=netdevid,indev=chardevid,outdev=chardevid,queue=all|rx|tx[,vnet_hdr_support][,position=head|tail|id=<id>][,insert=behind|before]``
> +    ``-object filter-redirector,id=id,netdev=netdevid,indev=chardevid,outdev=chardevid,queue=all|rx|tx[,position=head|tail|id=<id>][,insert=behind|before]``
>           filter-redirector on netdev netdevid,redirect filter's net
>           packet to chardev chardevid,and redirect indev's packet to
> -        filter.if it has the vnet\_hdr\_support flag, filter-redirector
> -        will redirect packet with vnet\_hdr\_len. Create a
> -        filter-redirector we need to differ outdev id from indev id, id
> -        can not be the same. we can just use indev or outdev, but at
> +        filter. filter-redirector will redirect packet with vnet\_hdr\_len.
> +        Create a filter-redirector we need to differ outdev id from indev id,
> +        id can not be the same. we can just use indev or outdev, but at
>           least one of indev or outdev need to be specified.
>   
>       ``-object filter-rewriter,id=id,netdev=netdevid,queue=all|rx|tx,[vnet_hdr_support][,position=head|tail|id=<id>][,insert=behind|before]``


