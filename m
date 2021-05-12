Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB35537B457
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 04:59:27 +0200 (CEST)
Received: from localhost ([::1]:53466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgf5q-0006gQ-Tm
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 22:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lgf3r-00040X-2U
 for qemu-devel@nongnu.org; Tue, 11 May 2021 22:57:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lgf3o-0005u2-Pj
 for qemu-devel@nongnu.org; Tue, 11 May 2021 22:57:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620788240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=znSd28ZNJvaIgAyhqizi2Y0bkszVkdPi1gjXzRcoXyA=;
 b=N1hKLNV/SIbKIDr/gJ8jUY5jmokvBYbz0V3wZrCXi1orRYeWv8QEByj9Z9Zjir2ewmBNq1
 lIL4xdHL67+QScFYoSE6P1CITGefImm69QZYkgPgRlXyjvCwdcmR+tNaFkJLG24zaC5V6y
 Evn9l3U2/S0eDJvQMoGj8ff4Wqm5tjI=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-3sF_PibqOZeucC8dsHHGug-1; Tue, 11 May 2021 22:57:14 -0400
X-MC-Unique: 3sF_PibqOZeucC8dsHHGug-1
Received: by mail-pg1-f197.google.com with SMTP id
 l25-20020a6357190000b02901f6df0d646eso13439574pgb.23
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 19:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=znSd28ZNJvaIgAyhqizi2Y0bkszVkdPi1gjXzRcoXyA=;
 b=M1VOeUqMEo6TuHEWYNIBpQxtwlm7kT6175Mq3kePqEiUsnA9wAVpiJ1hwTfXIGEz+y
 YVOaVLR96DBcvBojyKj1viqFqWHfs0YmMmNa97i1Y7UYv5sdjj9AYTF5wzEgNMApmFgL
 pF5Ea99ApN+VxD3jhhZU8X6cTV5GP2ZLE/wDt+DB5UIlvYkSOgu+RQyRiHpjqBvEp6E8
 ePkt4Y6ZUdmUz3lJdJvgegu8CqNG3pzE+CJTZ9Es14Ti09pGvsvKzYaGVTGy9A4500+t
 1+6qmMaWXzsGSw8npWLsMkcBXodf7APEhqQVUYW56KKj//94p3MGCEbUa2RAO0Pjerjm
 045Q==
X-Gm-Message-State: AOAM531xQVriZligD/V7PGeFYD/sWplOKa3E5vcNGON9Pr1bFpBrnvYV
 aMpF526jZU6A0eThLIZ0HeBe3nfR4ij9xu6QFqjEa+7ZsaVL2nkIyqu8Tz1nf0ssA8chg/MUOpV
 IAp0nDA6J3OTQGGo=
X-Received: by 2002:a63:5049:: with SMTP id q9mr9751972pgl.123.1620788233058; 
 Tue, 11 May 2021 19:57:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw73S8v94F64l2KzqcBwbrYFLIXWEnce9fRy+O18rplAUpyEbmVrYovKkCOg7j4WyppKK4izQ==
X-Received: by 2002:a63:5049:: with SMTP id q9mr9751953pgl.123.1620788232804; 
 Tue, 11 May 2021 19:57:12 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id mg1sm3129286pjb.14.2021.05.11.19.57.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 19:57:08 -0700 (PDT)
Subject: Re: [PATCH 3/3] virtio-net: Constify VirtIOFeature feature_sizes[]
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511104157.2880306-1-philmd@redhat.com>
 <20210511104157.2880306-4-philmd@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <774a603f-f511-903a-2383-8d191ac27c7d@redhat.com>
Date: Wed, 12 May 2021 10:57:03 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210511104157.2880306-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/5/11 下午6:41, Philippe Mathieu-Daudé 写道:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/net/virtio-net.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 66b9ff45118..6b7e8dd04ef 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -89,7 +89,7 @@
>                                            VIRTIO_NET_RSS_HASH_TYPE_TCP_EX | \
>                                            VIRTIO_NET_RSS_HASH_TYPE_UDP_EX)
>   
> -static VirtIOFeature feature_sizes[] = {
> +static const VirtIOFeature feature_sizes[] = {
>       {.flags = 1ULL << VIRTIO_NET_F_MAC,
>        .end = endof(struct virtio_net_config, mac)},
>       {.flags = 1ULL << VIRTIO_NET_F_STATUS,


Acked-by: Jason Wang <jasowang@redhat.com>



