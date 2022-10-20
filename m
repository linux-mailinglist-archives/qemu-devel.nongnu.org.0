Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353E4606154
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:18:15 +0200 (CEST)
Received: from localhost ([::1]:35012 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVR5-0004Yz-WD
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:18:12 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olV0K-0003A4-4K
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olTLh-0001F4-GI
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:04:33 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olTLf-0002aI-Lp
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:04:29 -0400
Received: by mail-wr1-x430.google.com with SMTP id b4so33740195wrs.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JKgokySAbSDocqAoeooaDVOHdyffvNbsXeaqlsl0F6Q=;
 b=YuyG979IjH/omPZt2SGnYnru0cV909zoMvrCX3HL8PlAQdcIyioHPGUmIe8W7VRBSv
 d2WnsvRMEK9yG7HTRtQWCf9RmSq9IbNSIhnsLVc2PCjx2Gm680bspMWPyW1lTeBwXRuv
 xuMNES+nRwqUtt4PO6rfyf/9Fw2sP1qA7syP1NgiwDQTJlpmK2BMtT2+57Gcbs7vYsJn
 yYio/2h/fsm9Fc9mw9t+Z4mkyDsXkIDwdnDXlUWjvpl7NtagwnivDivGU9ObtDvXMLYa
 ZprzBgE8PHy04ffFEu2X2AHiYCKwPWAQQq8rs5rQHIAb2gFw+Pg6UZ6B9tqRap+rMoGj
 pGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JKgokySAbSDocqAoeooaDVOHdyffvNbsXeaqlsl0F6Q=;
 b=a9tUAdtFia6WyKHEaCR+GM73n5+Z3ipJxhr+R+iVa8Vq3NVRmF68l+WcnXYLLVTd1v
 gOuvKaoewqSHPdLnSNcn+oH7VI9MB4fajHVXDNF6bbTUMWma3B4quEClCatwDmdnnynR
 D3oX2T40n0vVK+zPKft7fUP7Ss+utOf/xPnF7MHc01/ga4/DhtpD48n8crshhEXBhZGc
 EflQ+N39eGQzhHTD5N7N2ssu9j3Ch7SpHW4C6pnY4hzaMWLYmIBje88cheEvCr9W0v2B
 N7cZRIMUz74GIaNr9Rh58B8Nh4qfI+8xFTppnWlCKlgKQ4yLHyURMykVy2EfPdB0C8KA
 1l8Q==
X-Gm-Message-State: ACrzQf2d4uRlfev+AVUIwaPM3Ih4wnOk8kgPYonxnoN7Vm1FTnuNpBc/
 Gi9nP2+36rFZ/NTmbGrCBX89PQ==
X-Google-Smtp-Source: AMsMyM6fAcbMc6B7n6thzH2AP9CJAGCgb2F1dro5nYnmNF/EItcvTfq7llVzApvdJ80okI4kHx48fQ==
X-Received: by 2002:a5d:6d0d:0:b0:230:1b65:a378 with SMTP id
 e13-20020a5d6d0d000000b002301b65a378mr8393523wrq.406.1666263865964; 
 Thu, 20 Oct 2022 04:04:25 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 b27-20020a05600c4a9b00b003c6b874a0dfsm2878294wmp.14.2022.10.20.04.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 04:04:25 -0700 (PDT)
Message-ID: <644e55ec-1040-09ad-0d1b-1ac80b70b58c@linaro.org>
Date: Thu, 20 Oct 2022 13:04:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v12 12/17] net: dgram: add unix socket
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Anthony Perard
 <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
 <20221020091624.48368-13-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020091624.48368-13-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/22 11:16, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> QAPI schema
> Acked-by: Markus Armbruster <armbru@redhat.com>

Eventually:

   Acked-by: Markus Armbruster <armbru@redhat.com> (QAPI schema)

> ---
>   net/dgram.c     | 54 ++++++++++++++++++++++++++++++++++++++++++++++++-
>   qapi/net.json   |  2 +-
>   qemu-options.hx |  1 +
>   3 files changed, 55 insertions(+), 2 deletions(-)
> 
> diff --git a/net/dgram.c b/net/dgram.c
> index e581cc62f39f..02a189e36358 100644
> --- a/net/dgram.c
> +++ b/net/dgram.c
> @@ -426,6 +426,7 @@ int net_init_dgram(const Netdev *netdev, const char *name,
>       SocketAddress *remote, *local;
>       struct sockaddr *dest_addr;
>       struct sockaddr_in laddr_in, raddr_in;
> +    struct sockaddr_un laddr_un, raddr_un;
>       socklen_t dest_len;
>   
>       assert(netdev->type == NET_CLIENT_DRIVER_DGRAM);
> @@ -465,7 +466,7 @@ int net_init_dgram(const Netdev *netdev, const char *name,
>           }
>       } else {
>           if (local->type != SOCKET_ADDRESS_TYPE_FD) {
> -            error_setg(errp, "type=inet requires remote parameter");
> +            error_setg(errp, "type=inet or unix require remote parameter");

Maybe clearer reworded as:

   "type=inet or type=unix requires remote parameter"

>               return -1;
>           }
>       }


