Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3236259F261
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 06:11:09 +0200 (CEST)
Received: from localhost ([::1]:43814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQhjQ-0000a5-Be
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 00:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQhfF-0001uF-B4
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 00:06:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQhfD-0000l9-Pc
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 00:06:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661314004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rFmsDe2U7XagVx/ugrXmi2O/XFlTLHTq/+B+Slwo50A=;
 b=ezPxp7gm26J0DamNq/ApaJjvNkvstP0It8ZhZUFs/31RR/vCI/blMByp5LXhGl3hqqsXie
 hnxdbRUneZx8zYeoMfHJBgsQ+LArmql3LRE3ZV489Rle6wIoFchzC0y2lDOVzg4GABlQDn
 GaWxf4rx4MulubleHQZJwhl+OSpEIW8=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-575-nNXHi3iKPJyXYqoQ3SQVsw-1; Wed, 24 Aug 2022 00:06:42 -0400
X-MC-Unique: nNXHi3iKPJyXYqoQ3SQVsw-1
Received: by mail-pl1-f197.google.com with SMTP id
 h12-20020a170902f54c00b0016f8858ce9bso10177223plf.9
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 21:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=rFmsDe2U7XagVx/ugrXmi2O/XFlTLHTq/+B+Slwo50A=;
 b=HpZlb3ei/slIeYTks9vdhrsOIKQvac+xkc8YP1g4h2XuZ92J5FFkPKGost6gp6TI5U
 XOUrmOkRRw+v63IkavFzEFedp9oqaZ/Ir4eIS3zaioWqXP4d1LhPQ6cqTlaoEQQj4N+5
 wOhpdboPiMF5yuJjr2NeoNAAnwOsR7Uw8dJOTNQ2h4S6I4TYv/wDkg+RGPzqUjBqOA+l
 ZyAyZIKXClytGVORPrjERv5sr35r/69bXpKV9n2//MzQqfz/t8Te16/AIgHmphw1Psws
 b6J5bctOiqTaM3h9X0jeotabjOVt5FGFEg1wZRXzlpRCrc5LIMc5T6xwr384XIsMotA/
 y4hQ==
X-Gm-Message-State: ACgBeo39PqPNUDDdTlmwusKktJRy3Vrhg8MToZIuVOT4fdErrD+n/3zZ
 SZpA3IJVXHLwvNAYClV+ABIGFkftJotxrrUt/5ipFYf/40t+NaYfDJpNCWo77MtdP/FRcVA42vm
 7wtpfXp+f7bnE7bk=
X-Received: by 2002:a63:210f:0:b0:41c:650c:aea4 with SMTP id
 h15-20020a63210f000000b0041c650caea4mr22368690pgh.267.1661314001350; 
 Tue, 23 Aug 2022 21:06:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6TZxj/AgKJevsYEuiaCj8W1G8xGmMT7xrEh3CkxR0w0erYalyNuDdYG+BqdoiD5gcACmgJ9A==
X-Received: by 2002:a63:210f:0:b0:41c:650c:aea4 with SMTP id
 h15-20020a63210f000000b0041c650caea4mr22368674pgh.267.1661314001117; 
 Tue, 23 Aug 2022 21:06:41 -0700 (PDT)
Received: from [10.72.13.242] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 q101-20020a17090a17ee00b001fab67cce42sm176313pja.53.2022.08.23.21.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 21:06:40 -0700 (PDT)
Message-ID: <20f2490e-2bf8-1660-59ce-129648e0c78a@redhat.com>
Date: Wed, 24 Aug 2022 12:06:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 19/24] vhost-net: vhost-user: update
 vhost_net_virtqueue_restart()
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <73f25e2ffde00e25535902ba4bf7b92097f51d4a.1660611460.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <73f25e2ffde00e25535902ba4bf7b92097f51d4a.1660611460.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/8/16 09:06, Kangjie Xu 写道:
> Update vhost_net_virtqueue_restart() for vhost-user scenario.


Similar to previous patch, let's explain why it it needed.

Thanks


>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   hw/net/vhost_net.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index c0d408f3b4..778081e54a 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -556,6 +556,10 @@ int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
>   
>       idx =  vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
>   
> +    if (net->nc->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
> +        idx = idx - net->dev.vq_index;
> +    }
> +
>       r = vhost_dev_virtqueue_restart(&net->dev, vdev, idx);
>       if (r < 0) {
>           goto err_start;


