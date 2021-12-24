Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A3D47E9CC
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 01:13:39 +0100 (CET)
Received: from localhost ([::1]:34862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0YDK-0005UM-Bq
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 19:13:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0YBD-0004cN-8s
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 19:11:27 -0500
Received: from [2607:f8b0:4864:20::102b] (port=53049
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0YBB-00077w-Hq
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 19:11:26 -0500
Received: by mail-pj1-x102b.google.com with SMTP id co15so6246490pjb.2
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 16:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4gUOee2JGs+nwYdX0DTinP0UspyW2eibc3P2aX28UOw=;
 b=uOX5wqGI0r+8Ap7Gbul6ZBvrAh6Dn8nxK6iwMciaJfgLfSALWcY83csCjGvUVWsiFT
 qnrpQ4eVmrlSoILYuQv7K8qkK6X//xyfYVLMX+QcF8qk90mzfrgaS0uNbARzfdhi4N9T
 WoBP6QviXtr/clnEIdhqyn9kGIZ7W92X0kCgg8HZ/bQYolLqrD3krC+Oyn6E2iWGkb4q
 JZTFbPcGivudGm3zfMWZkO34soTICZSuqZiAPtYsiy3KA9DaH2CaN0vG0BcaQxBJ6hPJ
 ATHLemD5J2MwjMWmpqimzMiBGpV24DmYrXLOWH/NNfhbcL7xxhgn6Q9CyV1bldNHkvjN
 uUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4gUOee2JGs+nwYdX0DTinP0UspyW2eibc3P2aX28UOw=;
 b=vz5KyzKZuF4Zz131viLbxjEhSKRO78OvWjIrNUwJkFezFC1ryAssQrtHDbuQA6Fy1t
 wy9CVW0/2pm8ERuaeNKkmbAmFGaj95g0ysf8mPreJdBJEWbY3+cpZgsWDdZzSS7D/OcN
 PDV7q1C8PRA0gZn/R244ldRCjXFNU4M/+hbXZIb73h/jPz/JJGroI22YA7y/gDAI1gur
 Zb5k6+qLdihEClWuiCWRGAKg6XMsT/LDgaVjW3/QBdzpBiN25UN6sRn2gBrCxbbA6mpy
 4045MH6TKmcp2JxXCXMz5OOfH7Z0g6jftz9GrlMz1oFN69cHIPEkdbF2HbqLTUCqlfzx
 8sAg==
X-Gm-Message-State: AOAM531Zs0DOPgG2kOZ1b+efXFt4hXyGJEHIiwQUTjgOdIIQo0UU/Vxi
 QzyHCcKhGQDnTKhUdsLSj53KnQ==
X-Google-Smtp-Source: ABdhPJzMsLHvsk9vJiR48wHwryC1c7ZgyWsNRNTJXDqZ371w4X9uGZ5OyOWs893x+5ncIoRDHrflSg==
X-Received: by 2002:a17:902:e80a:b0:149:14aa:a1a5 with SMTP id
 u10-20020a170902e80a00b0014914aaa1a5mr4442363plg.29.1640304683560; 
 Thu, 23 Dec 2021 16:11:23 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id c5sm5879371pgi.89.2021.12.23.16.11.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 16:11:23 -0800 (PST)
Subject: Re: [RFC v2 02/12] target/ppc: powerpc_excp: Set vector earlier
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
 <20211220181903.3456898-3-farosas@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <302f14b9-adcb-26c2-74a9-5c74eb74a751@linaro.org>
Date: Thu, 23 Dec 2021 16:11:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211220181903.3456898-3-farosas@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 10:18 AM, Fabiano Rosas wrote:
> None of the interrupt setup code touches 'vector', so we can move it
> earlier in the function. This will allow us to later move the System
> Call Vectored setup that is on the top level into the
> POWERPC_EXCP_SYSCALL_VECTORED code block.
> 
> This patch also moves the verification for when 'excp' does not have
> an address associated with it. We now bail a little earlier when that
> is the case. This should not cause any visible effects.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>   target/ppc/excp_helper.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 8b9c6bc5a8..14fd0213a0 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -352,6 +352,14 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>       }
>   #endif
>   
> +    vector = env->excp_vectors[excp];
> +    if (vector == (target_ulong)-1ULL) {
> +        cpu_abort(cs, "Raised an exception without defined vector %d\n",
> +                  excp);
> +    }
> +
> +    vector |= env->excp_prefix;
> +
>       switch (excp) {
>       case POWERPC_EXCP_NONE:
>           /* Should never happen */

You've moved the cpu_abort above the excp check above the early return for NONE (which 
possibly shouldn't exist) and above the excp default

         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);

I would certainly expect invalid excp to not have a defined vector either.

I'll also note that the excp_vectors[] index is no longer bounds checked by the switch.


r~

