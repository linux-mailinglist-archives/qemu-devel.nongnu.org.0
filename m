Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C316658B33
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:46:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pApU7-0006KX-03; Thu, 29 Dec 2022 04:45:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pApU3-0006Jx-T4
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:45:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pApU2-00043B-7m
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:45:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672307153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cO0A6tz2C7R1dNmqQH2x0u73f5f9PyOy7D1FCkkpVOA=;
 b=cuPurhlfQnKRXsKJNpsu/5uT0eVlftl1Ob0Pqj6MPKNPL+2n2VeAY9twFeCqEYIFwjFDVJ
 PD27LtOwr28z7UWS0xWBhHEdv+J4XpdkMvdvr7SchpONTOmVJqF418TM8UvWWIy73PPwaO
 FbaWI7WHwB5C9ITv+gtA4Q3uY/3xKfM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-212-ZdgO8gxQOWSTzNY-qsV7iQ-1; Thu, 29 Dec 2022 04:45:52 -0500
X-MC-Unique: ZdgO8gxQOWSTzNY-qsV7iQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 c66-20020a1c3545000000b003d355c13229so12421978wma.0
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 01:45:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cO0A6tz2C7R1dNmqQH2x0u73f5f9PyOy7D1FCkkpVOA=;
 b=ei5iDUZDmhz8t35CK8k1wc/OTUNvh+cSF+IBoxhJseW3Wosv+gGTYikXL7LHjkEfkE
 mU0t4TV93Kmwx8ymrHmV/GavOUasxwGTibKtZYxFS5FO2Qhrf4QSyasA33WgSlgnsKtA
 TX0mV+jMODKKm+eYcSkVsh0yg88MUFj+EPiZv26zuV7VmRaZJJMVms6pUhwRs7d9sfBm
 Q5A9rDnDSC7WnzcG949CDkMBuU0Q2LmTwNfq17gIYeRbNM1Rzq28ZYfCWir+8DXwnwwe
 9ZPRWOKIAvbS9YePJbDmWlGNq+0pv8j2KNJjv71/+k4rPOmFegcfsFEOn95ji/n2Gers
 2XpQ==
X-Gm-Message-State: AFqh2krjy1t6tQamUprj6WlMXI90OVdFNtIWGtjirJg8qtQCGtp7HhkE
 ayXmR4dx83u0v3rbMPhcaDtSTQL4zylf9NLLPCwNzAh0KitOZfPQoo7JbbGaWDswC5I4U6VUvUn
 GNXm77oeYTjgbVPE=
X-Received: by 2002:a7b:c003:0:b0:3d2:bca5:10a2 with SMTP id
 c3-20020a7bc003000000b003d2bca510a2mr19585108wmb.22.1672307151064; 
 Thu, 29 Dec 2022 01:45:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsjPDP8KxcSNpgP9wFq1gLUOjvlbozBsW22QdSfqhMuKEt2P4OxThjtktVbs1mwA2xIwEfhIw==
X-Received: by 2002:a7b:c003:0:b0:3d2:bca5:10a2 with SMTP id
 c3-20020a7bc003000000b003d2bca510a2mr19585092wmb.22.1672307150870; 
 Thu, 29 Dec 2022 01:45:50 -0800 (PST)
Received: from [192.168.0.5] (ip-109-42-113-203.web.vodafone.de.
 [109.42.113.203]) by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003d997e5e679sm4084503wmn.14.2022.12.29.01.45.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 01:45:50 -0800 (PST)
Message-ID: <a9c9232e-5912-b4da-face-d9d2ee376b36@redhat.com>
Date: Thu, 29 Dec 2022 10:45:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 4/5] target/s390x: Restrict sysemu/reset.h to system
 emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221220145625.26392-1-philmd@linaro.org>
 <20221220145625.26392-5-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221220145625.26392-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/12/2022 15.56, Philippe Mathieu-Daudé wrote:
> In user emulation, threads -- implemented as CPU -- are
> created/destroyed, but never reset. There is no point in
> allowing the user emulation access the sysemu/reset API.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/s390x/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index 96562c516d..b10a8541ff 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -26,7 +26,6 @@
>   #include "s390x-internal.h"
>   #include "kvm/kvm_s390x.h"
>   #include "sysemu/kvm.h"
> -#include "sysemu/reset.h"
>   #include "qemu/module.h"
>   #include "trace.h"
>   #include "qapi/qapi-types-machine.h"
> @@ -35,6 +34,9 @@
>   #include "fpu/softfloat-helpers.h"
>   #include "disas/capstone.h"
>   #include "sysemu/tcg.h"
> +#ifndef CONFIG_USER_ONLY
> +#include "sysemu/reset.h"
> +#endif
>   
>   #define CR0_RESET       0xE0UL
>   #define CR14_RESET      0xC2000000UL;

Reviewed-by: Thomas Huth <thuth@redhat.com>


