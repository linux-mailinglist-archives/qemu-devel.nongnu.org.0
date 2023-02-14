Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D89696FD1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 22:38:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS2yv-0006Y9-Aj; Tue, 14 Feb 2023 16:36:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS2yt-0006R2-Ah
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 16:36:55 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS2yr-00082C-Av
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 16:36:54 -0500
Received: by mail-pg1-x533.google.com with SMTP id u75so11166990pgc.10
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 13:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9HCf3mpo3lxwzw3aLwoaLGJINdIz/DlXpoTtm1vrHNU=;
 b=vZEqeZI5w0hgTa+zu3rZWWX+dXeTRWEOiSzZdQ5pST/imZPYrjba9jPCYOQjppFE9u
 vYJVjupmyfDD1haaf9SX40S2f85eplPMWPOBrsiiuo+Nz29BhIiwXfMXYu49isaggasX
 ny6UqUim5oKiOIv+V2I1/8g59M21rILvjfP5Sim+vaC405/SDUxO+2A6GZQE8h+qSrr9
 eW1W0D0R+DWnyUiJZ4R5URzEEI6J1dm9GjNDPdSDoh7lcFa7+SFHwOQ4Smubzl63Xhng
 Kvct/1xUD2tds5XAJ+TTZ/kwaW6g0TRiQD+4NhqGTt+g8Z6TnQ5lB7Otv2Q06hM+JdKs
 DzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9HCf3mpo3lxwzw3aLwoaLGJINdIz/DlXpoTtm1vrHNU=;
 b=ZWGC3XyekhwkPYM08NH/3fdnnWdPocjo1KLMST23yf++0GbXUigZU0UO92evDC4fQs
 CiI2X+/UN6+nGgsFIlycjKw7TYBrLqAHedVhNaofHddVupNVL1boK5dopSFyA8zjNINM
 iRbaMvem/+3r36KSEKJDM6qoFNNaVw73U8BzOSI2DkEvvce2yFYLEPeK/JaCjIl3C/b2
 +mCwmHJ8JJQztHi84ksJtfOh1DvNmoaT6A/+pbyM6wbdXUnHiFgEw3upDi0cmZDGiRif
 kl7uzux+6I0WsalO97t68+ADdz9Ty+DYQR3uVctEtLFzFqT45ju0JU0e3V6xpZvBWyoh
 aSFg==
X-Gm-Message-State: AO0yUKW5zZAjf686ZM/ALjFYR+3dZzIw//40tzxkd3M8OphKgOJOJCKE
 ElH+M/7OVCDuOCL3MRXJyydLAA==
X-Google-Smtp-Source: AK7set9gmp0nZbQusRIXNRjKAYxuIpIyb4fDfDGpwQASq/Zj++EfwbvrP3SR4bLM3oVJV5MIHuLT3A==
X-Received: by 2002:a62:14c5:0:b0:5a8:68c0:560a with SMTP id
 188-20020a6214c5000000b005a868c0560amr2972266pfu.22.1676410611609; 
 Tue, 14 Feb 2023 13:36:51 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 k7-20020aa78207000000b0058db8f8bce8sm10159235pfi.166.2023.02.14.13.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 13:36:50 -0800 (PST)
Message-ID: <9ad1f69e-f3ab-bced-1299-525c156dbcb3@linaro.org>
Date: Tue, 14 Feb 2023 11:36:44 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 09/12] bsd-user: Start translation of arch-specific
 sysctls
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org,
 Thomas Huth <thuth@redhat.com>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Stacey Son <sson@FreeBSD.org>
References: <20230214002757.99240-1-imp@bsdimp.com>
 <20230214002757.99240-10-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230214002757.99240-10-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/13/23 14:27, Warner Losh wrote:
> +        case HW_NCPU:
> +            if (oldlen) {
> +                (*(int32_t *)holdp) = tswap32(bsd_get_ncpu());
> +            }
> +            holdlen = sizeof(int32_t);
> +            ret = 0;
> +            goto out;

Anything using SYSCTL_INT should use abi_int.

> +#if defined(TARGET_ARM)
> +        case HW_FLOATINGPT:
> +            if (oldlen) {
> +                ARMCPU *cpu = env_archcpu(env);
> +                *(abi_int *)holdp = cpu_isar_feature(aa32_vfp, cpu);
> +            }
> +            holdlen = sizeof(int32_t);

abi_int for consistency.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

