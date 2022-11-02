Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F48615CCC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 08:14:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq7wc-0005nE-H0; Wed, 02 Nov 2022 03:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oq7wZ-0005kt-UT
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 03:13:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oq7wQ-0003X7-3R
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 03:13:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667373216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELUfLydvYO9se0GiL37I6PjpArpkbMLeV7IcCofkkZ8=;
 b=HL34Q1/xUVdVLfmkJBwJI5wCgXQVWl+0sCOvngmcFpUO7gbn4CPt19dWbZ3AbunSvlfnFS
 IjPOwnxTGDVx1oNygMPUw249I1PpOvSmBd4vvDGkmlNYlS0hOlVKBNT8cwF680XjOAYTHa
 FO2o2PDXN3SPs8oQ79eyAdmZVB+Yqn8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-227-7yXspNs-NHmSQjgnCeyRQg-1; Wed, 02 Nov 2022 03:13:35 -0400
X-MC-Unique: 7yXspNs-NHmSQjgnCeyRQg-1
Received: by mail-qt1-f198.google.com with SMTP id
 ay12-20020a05622a228c00b003a52bd33749so4697246qtb.8
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 00:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ELUfLydvYO9se0GiL37I6PjpArpkbMLeV7IcCofkkZ8=;
 b=ih92Nk24izgQjCkIAuh4xzlluIQMNSi+IpfxbJtcrsPuHRRjeh9+jCIiJ9QXEPjxwk
 NtHHHNQsga4xMq72CMsq+z7zJSluVwoZTKpVRwSlR7J4I71XPBufrmomcrbXDJoL9bzS
 EPzVujHtLAYJPv2+pyYOC2Vt5J7qJnbOd0EgyUM0cHyuvH+WxpmNvydQ5dJbjoWNMaVc
 czsjewDbXxhz5X3Yg4eOOxcV5XatELH0MTK/Ww7ItjlGP1acm4Ihi7IlMKgwQ6CkH0C6
 gwPZfBMw+sQIWA6jQJLIipU8EFOtvkxTqcNRT4hbtiWYsauVjE4ZrAHe7RZMfZC3z9M9
 eLrA==
X-Gm-Message-State: ACrzQf1QO+JwtZrIb8cbZQJvV6unb8QrdxcRuoyJCLAevTgLnOkbH2T8
 f/i/ljPVM43l84GZR2M6lw2caDg1PA4Kxu4cNAMEjwYSxQhgscEVSpgZzNfn36xXQxDIlHq/AMg
 iBq0aws2YPjyBueU=
X-Received: by 2002:a05:622a:394:b0:39c:dcd7:ae69 with SMTP id
 j20-20020a05622a039400b0039cdcd7ae69mr18486267qtx.546.1667373214664; 
 Wed, 02 Nov 2022 00:13:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7wF+WL76biLLBYrqAW/uFkP0sqpHa6aN4kEOn0Dye13vR+TNExtVhn4nM6BCM0QfIjbHPzLA==
X-Received: by 2002:a05:622a:394:b0:39c:dcd7:ae69 with SMTP id
 j20-20020a05622a039400b0039cdcd7ae69mr18486252qtx.546.1667373214455; 
 Wed, 02 Nov 2022 00:13:34 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-201.web.vodafone.de.
 [109.43.177.201]) by smtp.gmail.com with ESMTPSA id
 o6-20020a05620a2a0600b006ce3f1af120sm18732qkp.44.2022.11.02.00.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 00:13:33 -0700 (PDT)
Message-ID: <da79f2db-c430-bf6a-79a4-c005935d4a5f@redhat.com>
Date: Wed, 2 Nov 2022 08:13:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RFC 2/4] hmp: Add "info netdev" cmd
Content-Language: en-US
To: huangy81@chinatelecom.cn, qemu-devel <qemu-devel@nongnu.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
References: <cover.1667232396.git.huangy81@chinatelecom.cn>
 <4e96b2beac69aa865777eb95330b9852a36353c7.1667232396.git.huangy81@chinatelecom.cn>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <4e96b2beac69aa865777eb95330b9852a36353c7.1667232396.git.huangy81@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 31/10/2022 17.19, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Introduce "info netdev" command so developers can play with
> it easier.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>   hmp-commands-info.hx  | 14 ++++++++++++++
>   include/monitor/hmp.h |  1 +
>   net/net.c             | 31 +++++++++++++++++++++++++++++++
>   3 files changed, 46 insertions(+)
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 754b1e8..217843c 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -880,6 +880,20 @@ SRST
>       Display the vcpu dirty page limit information.
>   ERST
>   
> +    {
> +        .name       = "netdev",
> +        .args_type  = "",
> +        .params     = "",
> +        .help       = "show information about netdev, guest acked features are "
> +                      "also printed if supporting virtio-net dataplane offloading",
> +        .cmd        = hmp_info_netdev,
> +    },
> +
> +SRST
> +  ``info netdev``
> +    Display information about netdev.
> +ERST

Hmm, so according to the information, this shows information about the 
virtio *frontend*, but netdev is about *backends* (like TAP, slirp, VDE, 
...) ... so this is definitely also the wrong naming here. Maybe rather 
"info virtio-net" or "info vhost-net" or something like that?

  Thomas


