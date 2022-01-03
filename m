Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37D3483669
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 18:52:28 +0100 (CET)
Received: from localhost ([::1]:39276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4RVR-0002Vz-N4
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 12:52:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4RTb-0000fV-7A
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 12:50:31 -0500
Received: from [2607:f8b0:4864:20::42e] (port=41787
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4RTZ-00087f-IG
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 12:50:30 -0500
Received: by mail-pf1-x42e.google.com with SMTP id m1so30061496pfk.8
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 09:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UyTvfClgrGe0qc479n4iES4P7e0Cia4O7tUYZUfRt3s=;
 b=uZw8m4h+M9iVX1Yld7LV9MBSJUOGDL+GDXR7p5b8QGXmyr32/3Te410UuzP5Bf0Nam
 AK1a4sSEWQDMvgMWBzdnY+FvDxwLD3mnzD+YNxeU5veIe9fkKt3IczuVcGvX6MXgf3kA
 Bb61+K3M7mHiHeTy7YwF1nbB2FaTTNVz2zNe4rh1/3fCqBKOBPUI6ybEBW/uM5AMCH8+
 xlEnJD3zkCFhpBtMWEA/iLTlO9CKdNPn3pTo4VWcp5mOjixfuKBE085UOevTxHkkdUaM
 Tv7j1gMAq8bUOPsoUWoYX4nlsMHYD5N2MJYpZkb0xkdJU4dNfB+EdG663ToVeqyIlK9b
 093g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UyTvfClgrGe0qc479n4iES4P7e0Cia4O7tUYZUfRt3s=;
 b=KRE9dDS8H3xOjkXL9Ij2WHP8yMkxfm4+dd13JVj/CeoyhUeo61hmgPC6zoKBzgKBDu
 XDQvUXLEqesRRpRKWOGpaGfgcZUPvJ7GeM83jCUwMDxWGLKAQZPZIQT/h99UeKXcpjko
 E+LeRAaKDT8AdrAH5oaCWS8/wXc+c1v+8JDvQw001TLzppM6HbAbgxiYiE7YtcfKBoAd
 bjduXjmepf+1hDsWU2ZIhKmRGwNmuCRmV1xpzct9GIOafYJY5pvGm0hXy1rlsgzyZize
 4dXssjsC7Uxki8pb1lsccicf1yMIviN0UsYfoqytmGRTunuQkXxe737H+9SLcgd/hp24
 C1gg==
X-Gm-Message-State: AOAM532o5UUXuMDqPmDXQf1WXPBkiPK3hhC4Y9jm9EQDo/sbJ1EzmY3K
 Ra9a0NxxsBKf1SvvWkKn9GhjQA==
X-Google-Smtp-Source: ABdhPJyV1Yb5LGxbv0k6UJxFkHQO3YAo7H0JCNnjyTlqmAcqtMWPRtR+w0lQj9/IVolnE9GuFiANcA==
X-Received: by 2002:a63:751b:: with SMTP id q27mr41250667pgc.184.1641232227755; 
 Mon, 03 Jan 2022 09:50:27 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id ng7sm39053206pjb.41.2022.01.03.09.50.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 09:50:27 -0800 (PST)
Subject: Re: [PATCH 1/2] linux-user/ppc: deliver SIGTRAP on POWERPC_EXCP_TRAP
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220103165625.307309-1-matheus.ferst@eldorado.org.br>
 <20220103165625.307309-2-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8c606234-2939-e64e-d2d6-ae351e13fede@linaro.org>
Date: Mon, 3 Jan 2022 09:50:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220103165625.307309-2-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: laurent@vivier.eu, groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/3/22 8:56 AM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Handle POWERPC_EXCP_TRAP in cpu_loop to deliver SIGTRAP on tw[i]/td[i].
> The si_code comes from do_program_check in the kernel source file
> arch/powerpc/kernel/traps.c
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   linux-user/ppc/cpu_loop.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
> index 30c82f2354..8fbaa772dc 100644
> --- a/linux-user/ppc/cpu_loop.c
> +++ b/linux-user/ppc/cpu_loop.c
> @@ -242,7 +242,9 @@ void cpu_loop(CPUPPCState *env)
>                   }
>                   break;
>               case POWERPC_EXCP_TRAP:
> -                cpu_abort(cs, "Tried to call a TRAP\n");
> +                info.si_signo = TARGET_SIGTRAP;
> +                info.si_errno = 0;
> +                info.si_code = TARGET_TRAP_BRKPT;

You're missing the address, which should be nip.

https://github.com/torvalds/linux/blob/master/arch/powerpc/kernel/traps.c#L1503

Please use force_sig_fault.  (I have a pending patch set to convert all other instances; 
hopefully that can be merged soon...)


r~

