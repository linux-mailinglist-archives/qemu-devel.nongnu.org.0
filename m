Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208EF43F546
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 05:13:25 +0200 (CEST)
Received: from localhost ([::1]:45894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgIKZ-0000Wm-P5
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 23:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mgIIr-0008Gu-HP
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 23:11:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mgIIn-0008Qh-GC
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 23:11:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635477091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Az0i/SgEZIeg2AYiA0nZUSUHPDIpR4ZMZRDGBoYE6E=;
 b=grk9aBxZcqpCScz8FuhZKZoaQXxhh0v9dlkHhojCpvuB2K6nlsI2c5C7/+H7+GFvAND7d9
 HzCY+iiAG9JW2lZB1W/fEg8KJ2h6BY3mfFvCbhw1LGJqVGJAd+p568PZ39GLGGrWEp3Boo
 8umO+Jqoq6ee/qcDfHHT8RMKJF80WhI=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-Z3ex18msM7OX1yT1FVldHQ-1; Thu, 28 Oct 2021 23:11:30 -0400
X-MC-Unique: Z3ex18msM7OX1yT1FVldHQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 d6-20020a63d646000000b00268d368ead8so4371962pgj.6
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 20:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=8Az0i/SgEZIeg2AYiA0nZUSUHPDIpR4ZMZRDGBoYE6E=;
 b=rvoKPWWCk0Lp2dCfqOi2BuEblhgi1FXzVGpKVsQdBJL48SBBuNCO/mkPduIhghdro9
 E+z+p/mWlwpholMi4P634nemd3VDNd+nOyOCyCkTlc0v1ct6Bvs8bsdZOTo0bukw23pK
 YfoJCb4PIlDB7QwqJzZbdjWjk+TW26Au8lm6g40uogwB06tIzIX+jxNtPYSfqDDUNbUO
 sqE218YHXfUHbGp9JG0a5XdQF2ulKIFvgHtQlICkjfraFCa+SFKQ1hL2bjDzeD4OYFwr
 mESriAiY8WmpYv7dDrSgz+tKO+B7jdP7nkkBUOCaacy9sTr2mjnYpbWt2fFAyaXH/8dh
 FOyg==
X-Gm-Message-State: AOAM531pHrF/WJM5XqaMWQcesHAF6U1lXqKOSRNCVSqkLLwcz2rS6hgH
 GHWlsqJLR7UNTbzHtzBNQROd3r43XHgbqMF5X3ox15YvFcEfB/bPOwPViTAGqd5RFLmbbolgq7A
 nBygZaBYKIbgBMWM=
X-Received: by 2002:a17:90b:3504:: with SMTP id
 ls4mr8660774pjb.111.1635477089081; 
 Thu, 28 Oct 2021 20:11:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqzwR42NXij6hfUMWlllbINUadaDADlV32fjGWPOb/nZWR+8icjWLTU6FMeeKOMK8n21A2rw==
X-Received: by 2002:a17:90b:3504:: with SMTP id
 ls4mr8660733pjb.111.1635477088588; 
 Thu, 28 Oct 2021 20:11:28 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id b10sm5079527pfl.200.2021.10.28.20.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 20:11:28 -0700 (PDT)
Subject: Re: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
To: Zhang Chen <chen.zhang@intel.com>
References: <20211028090556.3168043-1-chen.zhang@intel.com>
 <20211028090556.3168043-2-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c603b048-1cee-1396-811d-8be857aa932b@redhat.com>
Date: Fri, 29 Oct 2021 11:11:23 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211028090556.3168043-2-chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7,
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


ÔÚ 2021/10/28 ÏÂÎç5:05, Zhang Chen Ð´µÀ:
> Make the vnet header a necessary part of filter transfer protocol.
> It make other modules(like another filter-redirector,colo-compare...)
> know how to parse net packet correctly. If local device is not the
> virtio-net-pci, vnet_hdr_len will be 0.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>   net/filter-mirror.c | 34 ++++++++++++++++------------------
>   1 file changed, 16 insertions(+), 18 deletions(-)
>
> diff --git a/net/filter-mirror.c b/net/filter-mirror.c
> index f20240cc9f..24d3e498e9 100644
> --- a/net/filter-mirror.c
> +++ b/net/filter-mirror.c
> @@ -39,6 +39,7 @@ struct MirrorState {
>       CharBackend chr_in;
>       CharBackend chr_out;
>       SocketReadState rs;
> +    /* Keep compatibility for the management layer */
>       bool vnet_hdr;
>   };
>   
> @@ -48,7 +49,7 @@ static int filter_send(MirrorState *s,
>   {
>       NetFilterState *nf = NETFILTER(s);
>       int ret = 0;
> -    ssize_t size = 0;
> +    ssize_t size = 0, vnet_hdr_len = 0;
>       uint32_t len = 0;
>       char *buf;
>   
> @@ -63,21 +64,18 @@ static int filter_send(MirrorState *s,
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


I wonder if we need to introduce new parameter, e.g force_vnet_hdr here, 
then we can always send vnet_hdr when it is enabled.

Otherwise the "vnet_hdr_support" seems meaningless.

Thanks


> +    if (ret != sizeof(len)) {
> +        goto err;
>       }
>   
>       buf = g_malloc(size);
> @@ -252,7 +250,7 @@ static void filter_redirector_setup(NetFilterState *nf, Error **errp)
>           }
>       }
>   
> -    net_socket_rs_init(&s->rs, redirector_rs_finalize, s->vnet_hdr);
> +    net_socket_rs_init(&s->rs, redirector_rs_finalize, true);
>   
>       if (s->indev) {
>           chr = qemu_chr_find(s->indev);
> @@ -406,14 +404,14 @@ static void filter_mirror_init(Object *obj)
>   {
>       MirrorState *s = FILTER_MIRROR(obj);
>   
> -    s->vnet_hdr = false;
> +    s->vnet_hdr = true;
>   }
>   
>   static void filter_redirector_init(Object *obj)
>   {
>       MirrorState *s = FILTER_REDIRECTOR(obj);
>   
> -    s->vnet_hdr = false;
> +    s->vnet_hdr = true;
>   }
>   
>   static void filter_mirror_fini(Object *obj)


