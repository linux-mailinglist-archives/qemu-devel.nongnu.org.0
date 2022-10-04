Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508715F3D82
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 09:55:06 +0200 (CEST)
Received: from localhost ([::1]:34560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofcld-0007q5-1J
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 03:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ofcI4-0001GF-4t
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 03:24:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ofcI0-0003GR-Oc
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 03:24:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664868268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UWVs1cTuwscJkSS42I84gijtmuoLGEo4ErFizwjdrec=;
 b=IOljlf03lggNFDrFdilCMEfQzuYBJsbsufkMihevpulYopEZ3YbRr2no8Zkg7pdfxnxDtZ
 KIDx/GNl68GJinko9cYtPyKZWkD5sMFN5lhhF83kKS586HKlJtdEO0XLAlWY2HWSHpdbBP
 gqNH32RGjgPc4AWCmNesgN7vhmCZmXE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-9-L6HXSv-fP4CBqUzIbnFmLQ-1; Tue, 04 Oct 2022 03:23:46 -0400
X-MC-Unique: L6HXSv-fP4CBqUzIbnFmLQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 y15-20020a1c4b0f000000b003b47578405aso3327984wma.5
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 00:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=UWVs1cTuwscJkSS42I84gijtmuoLGEo4ErFizwjdrec=;
 b=tZ517hVSZvehRpTdripRink9c+Kv1AmPTKObG3G5FR9CvR3ilsBORN1JNm6jm0Bub4
 X+o5IVJPjuwICix1aN69zzjPgPBUwAqGcpPNqBIdsJNCv/HlykEjFIpJ6JgmcqFVSx5K
 0O/HZegxiH7TAWGrocXfvjA/4EIx+Wb/zapwckPUX1N94Ct8ywuckJ6fAsietFX/JgGb
 hxyX4gTuVt7S5tRt/XdiIz9gumv8GL1exFLSXOjEhBy/ixqx0czpCdHaa12+gqlJPBaP
 aHYUTQGSRn2O62tPwIja1+5fwdmFuR7818shTErsu0d0tN1VFtOmoTULXl8wIkHR3poq
 m0Sg==
X-Gm-Message-State: ACrzQf32BWqSfW5HCFymiBktLcwThhmcGMCBMATrTYrDTxS7nYn8Wzrw
 XAn+zOA9zYkY8LDSSm+NFGjt2jyU+aPBczS5gJjPC/4LreL3Ytr/h2XEhNHMePP9etlFrzTLp8a
 rFEqjUCGMzHMtblM=
X-Received: by 2002:a5d:4b8b:0:b0:22e:4185:bcc7 with SMTP id
 b11-20020a5d4b8b000000b0022e4185bcc7mr4248174wrt.174.1664868225776; 
 Tue, 04 Oct 2022 00:23:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5uYqM6iYVkvlJbJ8tnOGWXgtn9QXWKGJXejI9Ijd+uUBx1A2pLnVX/iXZhoBEBi5E732dmCQ==
X-Received: by 2002:a5d:4b8b:0:b0:22e:4185:bcc7 with SMTP id
 b11-20020a5d4b8b000000b0022e4185bcc7mr4248153wrt.174.1664868225507; 
 Tue, 04 Oct 2022 00:23:45 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-246.web.vodafone.de.
 [109.43.178.246]) by smtp.gmail.com with ESMTPSA id
 fc10-20020a05600c524a00b003b435c41103sm27284158wmb.0.2022.10.04.00.23.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 00:23:44 -0700 (PDT)
Message-ID: <14d32128-7855-2109-6a1a-1d8eabbab54e@redhat.com>
Date: Tue, 4 Oct 2022 09:23:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] net: improve error message for missing netdev backend
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Jason Wang <jasowang@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20221003100612.596845-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221003100612.596845-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.467, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 03/10/2022 12.06, Daniel P. Berrangé wrote:
> The current message when using '-net user...' with SLIRP disabled at
> compile time is:
> 
>    qemu-system-x86_64: -net user: Parameter 'type' expects a net backend type (maybe it is not compiled into this binary)
> 
> An observation is that we're using the 'netdev->type' field here which
> is an enum value, produced after QAPI has converted from its string
> form.
> 
> IOW, at this point in the code, we know that the user's specified
> type name was a valid network backend. The only possible scenario that
> can make the backend init function be NULL, is if support for that
> backend was disabled at build time. Given this, we don't need to caveat
> our error message with a 'maybe' hint, we can be totally explicit.
> 
> The use of QERR_INVALID_PARAMETER_VALUE doesn't really lend itself to
> user friendly error message text. Since this is not used to set a
> specific QAPI error class, we can simply stop using this pre-formatted
> error text and provide something better.
> 
> Thus the new message is:
> 
>    qemu-system-x86_64: -net user: network backend 'user' is not compiled into this binary
> 
> The case of passing 'hubport' for -net is also given a message reminding
> people they should have used -netdev/-nic instead, as this backend type
> is only valid for the modern syntax.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
> 
> NB, this does not make any difference to people who were relying on the
> QEMU built-in default hub that was created if you don't list any -net /
> -netdev / -nic argument, only those using explicit args.
> 
>   net/net.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/net/net.c b/net/net.c
> index 2db160e063..8ddafacf13 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1036,19 +1036,23 @@ static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
>       if (is_netdev) {
>           if (netdev->type == NET_CLIENT_DRIVER_NIC ||
>               !net_client_init_fun[netdev->type]) {
> -            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "type",
> -                       "a netdev backend type");
> +            error_setg(errp, "network backend '%s' is not compiled into this binary",
> +                       NetClientDriver_str(netdev->type));
>               return -1;
>           }
>       } else {
>           if (netdev->type == NET_CLIENT_DRIVER_NONE) {
>               return 0; /* nothing to do */
>           }
> -        if (netdev->type == NET_CLIENT_DRIVER_HUBPORT ||
> -            !net_client_init_fun[netdev->type]) {
> -            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "type",
> -                       "a net backend type (maybe it is not compiled "
> -                       "into this binary)");
> +        if (netdev->type == NET_CLIENT_DRIVER_HUBPORT) {
> +            error_setg(errp, "network backend '%s' is only supported with -netdev/-nic",
> +                       NetClientDriver_str(netdev->type));
> +            return -1;
> +        }
> +
> +        if (!net_client_init_fun[netdev->type]) {
> +            error_setg(errp, "network backend '%s' is not compiled into this binary",
> +                       NetClientDriver_str(netdev->type));
>               return -1;
>           }
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


