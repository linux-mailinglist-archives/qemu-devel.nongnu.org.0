Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA50F520E55
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 09:27:11 +0200 (CEST)
Received: from localhost ([::1]:38366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noKH0-00027A-JH
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 03:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noKEj-0000c7-1y
 for qemu-devel@nongnu.org; Tue, 10 May 2022 03:24:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noKEe-0006LR-Hf
 for qemu-devel@nongnu.org; Tue, 10 May 2022 03:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652167482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZvDcaDrsCqAM8j/JaQhsLdvY1pWgYZSeUp7Qa2sPEag=;
 b=HXynTSVM7YXyBeDH7xNF9LiefVILS4ULBJv6VCPqd+2nuzdDlIZh7NoWCmlAiwN1u29/NR
 zZ1+B26zqFa75U0qwct1UVvEdx+AAj3EBl/OLXAyyJNjgJ4G2cJWErPsxhRKZ1JGj6CTIx
 TSOdpYP/bcemn5FACLrgeci21TLtu6s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-z-nQK3ywPjWTyPUGGhcolA-1; Tue, 10 May 2022 03:24:41 -0400
X-MC-Unique: z-nQK3ywPjWTyPUGGhcolA-1
Received: by mail-wm1-f71.google.com with SMTP id
 r186-20020a1c44c3000000b00393f52ed5ceso854222wma.7
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 00:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZvDcaDrsCqAM8j/JaQhsLdvY1pWgYZSeUp7Qa2sPEag=;
 b=5rTv6z7D7r9vJUySC69fwMqSflwD9vTuxfsXwg1MfajXYDrePvdJ3dnsfjK+psMMGW
 nno/9hVAD0+Qmj19sDJxb23KSgSUf0tjz3yO45VlxQjnPJ8ZeC+G9EskL4R0RJOGT1uZ
 uHPs1N1c11us9ZYTQeXF035f4pvY8HF4iUSyuBNNgH2FAJm1P+DFXqKZXeWZbHvbapS+
 5nAv1LQf2/dcuk3AOdQ5auiES5gpYnrEgx1YZzQENle8UgCIkgJIhzebmJtBQDtfF+Ms
 jiV7w6Gtdw41Ek9TcfAzPQtbxjxGir4aTstYSrMmZhUaR7LBt+VwyxmyJ2mVcPjxJMlF
 qQ2g==
X-Gm-Message-State: AOAM531zr57sw2zpWL0wbMhmRrN1RufRmFN4LOu1IpEmPGUD1XBoshEj
 fHpS+8jMsiltiswAABDGdni5cClW1Y/1UbT9Y6TrjoTSKoEW531iP8KMR0I4NIO24fQKkap6nOa
 zLZuyp4XrjXKcA4s=
X-Received: by 2002:a5d:4348:0:b0:206:1c79:fd57 with SMTP id
 u8-20020a5d4348000000b002061c79fd57mr17657780wrr.344.1652167480140; 
 Tue, 10 May 2022 00:24:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBhzXp2K9PK37aTAiGO7Q2emURTWCkQq3sHZwSV+xU0n9uh2r01413rp/69og6pY2x9mEKiQ==
X-Received: by 2002:a5d:4348:0:b0:206:1c79:fd57 with SMTP id
 u8-20020a5d4348000000b002061c79fd57mr17657757wrr.344.1652167479927; 
 Tue, 10 May 2022 00:24:39 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 s6-20020adfea86000000b0020c5253d907sm13273625wrm.83.2022.05.10.00.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 00:24:39 -0700 (PDT)
Message-ID: <358f4e05-a29f-6e2f-5fc3-1df6c2b8315c@redhat.com>
Date: Tue, 10 May 2022 09:24:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] mos6522: fix linking error when CONFIG_MOS6522 is not
 set
Content-Language: en-US
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-ppc@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, mopsfelder@gmail.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>
References: <20220506011632.183257-1-muriloo@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220506011632.183257-1-muriloo@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On 06/05/2022 03.16, Murilo Opsfelder Araujo wrote:
> When CONFIG_MOS6522 is not set, building ppc64-softmmu target fails:
> 
>      /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/monitor_misc.c.o:(.data+0x1158): undefined reference to `hmp_info_via'
> 
> Make devices configuration available in hmp-commands*.hx and check for
> CONFIG_MOS6522.
> 
> Fixes: 409e9f7131e5 (mos6522: add "info via" HMP command for debugging)
> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Fabiano Rosas <farosas@linux.ibm.com>
> ---
> v2:
> - Included devices configuration in monitor/misc.c
> 
> v1:
> - https://lore.kernel.org/qemu-devel/20220429233146.29662-1-muriloo@linux.ibm.com/
> 
>   hmp-commands-info.hx | 2 ++
>   monitor/misc.c       | 3 +++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index adfa085a9b..9ad784dd9f 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -881,6 +881,7 @@ SRST
>   ERST
>   
>   #if defined(TARGET_M68K) || defined(TARGET_PPC)
> +#if defined(CONFIG_MOS6522)

I think you could even get rid of the TARGET_ stuff now that the CONFIG line 
works!

>       {
>           .name         = "via",
>           .args_type    = "",
> @@ -889,6 +890,7 @@ ERST
>           .cmd          = hmp_info_via,
>       },
>   #endif
> +#endif
>   
>   SRST
>     ``info via``
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 6c5bb82d3b..3d2312ba8d 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -84,6 +84,9 @@
>   #include "hw/s390x/storage-attributes.h"
>   #endif
>   
> +/* Make devices configuration available for use in hmp-commands*.hx templates */
> +#include CONFIG_DEVICES

Looks reasonable to me.

So with the "#if defined(TARGET_M68K) || defined(TARGET_PPC)" removed:

Reviewed-by: Thomas Huth <thuth@redhat.com>


