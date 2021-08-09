Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF9F3E4E06
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 22:40:51 +0200 (CEST)
Received: from localhost ([::1]:52612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDC4n-0005qh-7U
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 16:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDC3K-0005Bi-Bc
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 16:39:18 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:42741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDC3F-00050d-3n
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 16:39:18 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 mq2-20020a17090b3802b0290178911d298bso1882300pjb.1
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 13:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HDRmkbQzDe5aP4KAEXCyPe+svGPeDuGua5HeXnZm+TI=;
 b=gxLs3Dv6P89v/i1rFxCIrmT+wOa9Y2dAVlRG4HUoMXl1Dy0RbIfjkdyugQCFd4Il1v
 q9gA7kTYv83h11s40529iaKzDItZnS5aag9Khtb4PeModFjAHQumdkO5YbkznHm5Qy4J
 Ip4H+Fsvri2w3XbIDxr/tQENRhbgzhfPXFonkmxbQEN5kRp36Y2tBikp8KuljaxRxQCh
 eDI/Gvd8rlelHF34cK82RjI/oOwYBHhdW/pswEppE05XiBPbSKqqaI4bCcVKuQyWSSfA
 87jXUScYEb4i7RTsuRCWepxRwMue323mlSnqKDbMS4eG6YBihlr1qrkqKnWTIVz1qlZh
 pCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HDRmkbQzDe5aP4KAEXCyPe+svGPeDuGua5HeXnZm+TI=;
 b=XHY+D9dGK5aSs7aD3h62j+TCWy5dvL4dBnSuRxGF+Q3MCFVnp79mkj2NWS9sRH8yXm
 h0FpKEs3yz95QhdKgH5Dms2l/AnK7++M7n+Sdpp/Zj9r89NEAebqmdWnNUcmC9yk1tbC
 j5cKKbIlEAXkxFRBLzYNS9yn0IulH/e/gR+jWKmBNJyOj5BNOGjto36ABbQAIlsMViiU
 qvgJgPJuM8apcC0DCUoYVV8SgheahYA7LD7SCwKbT+mUtCgVGsNbFi6RhCakkfSblxZ+
 g7X/EmfvJojzP9YlHi8DT+OgLnGTU/4VJpDPH8VzEHxDb79VAnogSZuIOHpnivnhw7+7
 PHKw==
X-Gm-Message-State: AOAM530G1LDXvLIu3muCRDR+QccowwaRnS60UJ5kDCJDMw9zjH3SYGlV
 fPcf/04Rr8p/SLRckkWm6O1NAQ==
X-Google-Smtp-Source: ABdhPJzIoGGb/vB2XHWAK43sgniSxQ1eSX/oeTasx3CKP3XQP22kBLyX9Efb3UJezddyXQ2u7t1J+w==
X-Received: by 2002:a63:5c1b:: with SMTP id q27mr483349pgb.284.1628541551401; 
 Mon, 09 Aug 2021 13:39:11 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id 37sm23620929pgt.28.2021.08.09.13.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 13:39:11 -0700 (PDT)
Subject: Re: [PATCH for 6.2 26/49] bsd-user: Create target specific vmparam.h
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-27-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <59d15760-3c49-e9d4-c6e3-f21a7b84e7ae@linaro.org>
Date: Mon, 9 Aug 2021 10:39:08 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-27-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> +#define TARGET_MAXTSIZ  (128UL*1024*1024)   /* max text size */
> +#define TARGET_DFLDSIZ  (128UL*1024*1024)   /* initial data size limit */
> +#define TARGET_MAXDSIZ  (512UL*1024*1024)   /* max data size */
> +#define TARGET_DFLSSIZ  (8UL*1024*1024)     /* initial stack size limit */
> +#define TARGET_MAXSSIZ  (64UL*1024*1024)    /* max stack size */
> +#define TARGET_SGROWSIZ (128UL*1024)        /* amount to grow stack */

To-do list: KiB and MiB from units.h.

> +++ b/bsd-user/qemu.h
> @@ -44,7 +44,7 @@ extern enum BSDType bsd_type;
>   #include "target_arch.h"
>   #include "syscall_defs.h"
>   #include "target_syscall.h"
> -//#include "target_os_vmparam.h"
> +#include "target_os_vmparam.h"
>   //#include "target_os_signal.h"
>   //#include "hostdep.h"

Ah, I see.  Well, perhaps just squash the addition of the include to the patch that 
introduces the include?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

