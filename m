Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01004658AF5
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:28:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pApAw-0006GT-HX; Thu, 29 Dec 2022 04:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pApAq-0006Ct-G8
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:26:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pApAo-0003Ni-Ld
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:26:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672305959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1NPU3j1HAezemaGS4Tm+Lh9ZGjxv9sbm3vv5GDvgvnE=;
 b=cFez8mUCQ/p+XXMCUvgpDTrsnhng9csiHFpoM1ixQVdcQU4N0pZ5WmqiKm8oBn7+6PZlwl
 SNP6pIaIvwEKVWRqDhjDnz6jHY9MXEj+STSlikroqS+jG5OcUG6OndeHldM86yT0I9TaAA
 hCKRfDXkGqKjPbOa4XPBcC3pvkmDdrg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-352-dw5g5_moM3CMwuCYLFSe2A-1; Thu, 29 Dec 2022 04:25:57 -0500
X-MC-Unique: dw5g5_moM3CMwuCYLFSe2A-1
Received: by mail-wm1-f70.google.com with SMTP id
 t24-20020a1c7718000000b003d1fd0b866fso4555228wmi.3
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 01:25:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1NPU3j1HAezemaGS4Tm+Lh9ZGjxv9sbm3vv5GDvgvnE=;
 b=xe3oGU0aU1azf9bLm2X/yDSD6q2GcvhTADuP/lVrhaQLZSnHMEbpgdsJ3QM49KzOh+
 353aulnbEPERK9Q7dYBTfdNX1E2VqZLL+V/ukypReLeR3E5IBvrpKzM24ztYty7qASN4
 Gk2WMEYbp8comGcS5S7vRzxwjnbkRm3ccVXpkpkn8hsZ737pVeXXQp+luEBp5nxxKqI8
 TONOdZJwmXtZ+erGbCSSsA9Rtz1V1uDvfl+5/R7ZGEOJsOe2IJPlK5b0p6rI5l+LRpei
 aGKyYq2vRfDHS8CQraYO9EGotkArxtHXifj1VYFKhk8ttCkVInMtSUd0W6B7oq9qxaYw
 S11Q==
X-Gm-Message-State: AFqh2kpe4KhRYJgu+cxVdBbbXwnwmUnvzO4qa/06glRYdRLis7VhpNxR
 aAwJBVblj8bZUBmz/M6/OIWBbXy0ngfhX14/w6WzovoFi4qFxUKp3+tdxADqY05imT3EaRurD6K
 L3loFozvQjn+hAEw=
X-Received: by 2002:a7b:c7d6:0:b0:3d1:ee3a:62ae with SMTP id
 z22-20020a7bc7d6000000b003d1ee3a62aemr22650679wmk.8.1672305956845; 
 Thu, 29 Dec 2022 01:25:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt9F+x+j+ltiQDjonxAss95l4q1TejFC3FM/2JoA30xj8AvGwElSHyWlOx+Q9yXTGvqHmuQFg==
X-Received: by 2002:a7b:c7d6:0:b0:3d1:ee3a:62ae with SMTP id
 z22-20020a7bc7d6000000b003d1ee3a62aemr22650665wmk.8.1672305956693; 
 Thu, 29 Dec 2022 01:25:56 -0800 (PST)
Received: from [192.168.0.5] (ip-109-42-113-203.web.vodafone.de.
 [109.42.113.203]) by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c3b1200b003a6125562e1sm26498382wms.46.2022.12.29.01.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 01:25:55 -0800 (PST)
Message-ID: <c255f750-e46a-7df3-8ffb-1a9ea3a738b5@redhat.com>
Date: Thu, 29 Dec 2022 10:25:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 5/5] target/s390x/tcg/excp_helper: Restrict system
 headers to sysemu
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20221217152454.96388-1-philmd@linaro.org>
 <20221217152454.96388-6-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221217152454.96388-6-philmd@linaro.org>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 17/12/2022 16.24, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/s390x/tcg/excp_helper.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
> index fe02d82201..bc767f0443 100644
> --- a/target/s390x/tcg/excp_helper.c
> +++ b/target/s390x/tcg/excp_helper.c
> @@ -21,15 +21,15 @@
>   #include "qemu/osdep.h"
>   #include "qemu/log.h"
>   #include "cpu.h"
> -#include "s390x-internal.h"
>   #include "exec/helper-proto.h"
> -#include "qemu/timer.h"
>   #include "exec/exec-all.h"
>   #include "exec/cpu_ldst.h"
> -#include "hw/s390x/ioinst.h"
> -#include "exec/address-spaces.h"
> +#include "s390x-internal.h"
>   #include "tcg_s390x.h"
>   #ifndef CONFIG_USER_ONLY
> +#include "qemu/timer.h"
> +#include "exec/address-spaces.h"
> +#include "hw/s390x/ioinst.h"
>   #include "hw/s390x/s390_flic.h"
>   #include "hw/boards.h"
>   #endif

Reviewed-by: Thomas Huth <thuth@redhat.com>


