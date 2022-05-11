Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FB4522C4B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 08:29:26 +0200 (CEST)
Received: from localhost ([::1]:48752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nofqe-00017H-Fp
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 02:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nofhF-0006fA-Eq
 for qemu-devel@nongnu.org; Wed, 11 May 2022 02:19:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nofhD-0002Q0-GQ
 for qemu-devel@nongnu.org; Wed, 11 May 2022 02:19:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652249978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F6sSmVNkapUZjNAtd4UG8ruaejF2qFRWGG16s7L0kmU=;
 b=GyH5UIV9//He7AGvlEVbq1S9Vm9v8+AsulmF36vn5AFmzj3x7DUq8xug9UT7S8TNux0l8J
 FzepgnmWQLlHjvbMn5sR3uCthPTkvFtp7OAIncpxuc0YmZuHZVcb6JwG8m7s03KDT5wOx2
 v/wW9SXbSMFDUAmPX8xLbPnove9lun4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-IEyxCzdnOK6taLl1d9ptDg-1; Wed, 11 May 2022 02:19:37 -0400
X-MC-Unique: IEyxCzdnOK6taLl1d9ptDg-1
Received: by mail-wm1-f72.google.com with SMTP id
 g3-20020a7bc4c3000000b0039409519611so300650wmk.9
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 23:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F6sSmVNkapUZjNAtd4UG8ruaejF2qFRWGG16s7L0kmU=;
 b=MzqAoYtvYR4VVVUgpmJn6P+QV6BnK9gtDCwwQ1Tb7jedPcI0Yygb55oGs1Vgs98mff
 E+W819psc9f6CvZS9e3Kn7TZPHaVqByEN0d5317T6RvxYnT3PiYPyOdmxG0XsJZXJDL5
 977pVBy5LZX6Jhr3+GnLMyuGoL5ZKkpGvHHlVw1MTsV5QLb6E8FyP68woClkErUZBZAW
 BGRHtN80zNvwJnOp5iO67a1emDncUaxH3E/LQg7PxeIePKjtME52nXHhIrkmL6USWKZz
 +ha4tmMMukE8lXqLFUIEdLueOOurM3l8y3U7ivdBpUsvU57Y+9/sQvP4OAt9cMJOLT+d
 nOfg==
X-Gm-Message-State: AOAM531RxVDcdqPZTs4gi87936KiLIW97Ll0ogTl0Ch9KhskWHcIPSF0
 DD/qUAvID6uV7R43d1LFVgscA7L4V0Ny1gTxgN/XhUB95S2ahxi9le8mfMuy/6Ij/Qr1cP4RyUc
 TYmOTTm6wK5zfBsA=
X-Received: by 2002:a5d:58e3:0:b0:20c:d508:43d4 with SMTP id
 f3-20020a5d58e3000000b0020cd50843d4mr6335120wrd.51.1652249976046; 
 Tue, 10 May 2022 23:19:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHgE1RqJicMt84ZuPFIrbL6wGeliJQMsJQom5qenZTZtAA7XGws33B3JYXziPO2mcv/o2xgg==
X-Received: by 2002:a5d:58e3:0:b0:20c:d508:43d4 with SMTP id
 f3-20020a5d58e3000000b0020cd50843d4mr6335103wrd.51.1652249975824; 
 Tue, 10 May 2022 23:19:35 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a7bc20e000000b003942a244f2esm4337794wmi.7.2022.05.10.23.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 23:19:35 -0700 (PDT)
Message-ID: <132b5f23-3279-65da-b169-f677dcdac535@redhat.com>
Date: Wed, 11 May 2022 08:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3] mos6522: fix linking error when CONFIG_MOS6522 is not
 set
Content-Language: en-US
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, mopsfelder@gmail.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>
References: <20220510235439.54775-1-muriloo@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220510235439.54775-1-muriloo@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 11/05/2022 01.54, Murilo Opsfelder Araujo wrote:
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
> Cc: Thomas Huth <thuth@redhat.com>
> ---
> v3:
> - Removed TARGET_M68K and TARGET_PPC checks, as per Thomas Huth suggestion.
> 
> v2:
> - https://lore.kernel.org/qemu-devel/20220506011632.183257-1-muriloo@linux.ibm.com/
> - Included devices configuration in monitor/misc.c
> 
> v1:
> - https://lore.kernel.org/qemu-devel/20220429233146.29662-1-muriloo@linux.ibm.com/
> 
>   hmp-commands-info.hx | 2 +-
>   monitor/misc.c       | 3 +++
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index adfa085a9b..834bed089e 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -880,7 +880,7 @@ SRST
>       Show intel SGX information.
>   ERST
>   
> -#if defined(TARGET_M68K) || defined(TARGET_PPC)
> +#if defined(CONFIG_MOS6522)
>       {
>           .name         = "via",
>           .args_type    = "",
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
> +
>   /* file descriptors passed via SCM_RIGHTS */
>   typedef struct mon_fd_t mon_fd_t;
>   struct mon_fd_t {

Reviewed-by: Thomas Huth <thuth@redhat.com>


