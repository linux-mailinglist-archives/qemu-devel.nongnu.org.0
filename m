Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ECD696F1B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 22:18:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS2fi-0005Tc-5e; Tue, 14 Feb 2023 16:17:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS2fc-0005TD-S0
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 16:17:00 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS2fa-0000Rg-KS
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 16:17:00 -0500
Received: by mail-pj1-x102b.google.com with SMTP id bg2so7025588pjb.4
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 13:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mTfy1CwHM+3Zrt9SbEOLvMZ2nzcWr9qeY3QcEnuxy90=;
 b=QnJ/yv2yHOZUkJhNUVIER7g5NKvPrFrA4o6DdvAOTkwwS3kPx+I9VWs1OcBsH7TsIQ
 6Xvd/NERNNzBt89f45nelNMBbGOcJ6UWLqblXdaJphlqTnHwzvjqlrtFy/JqklmJZnHO
 YuEAX9iiZ2hxcUQ30bhqUY8RiB8fsIT7rOc8wacMwjGcFYj5AqaI1tbBtKpCA0rPTdpd
 mikEyiwctcSWPxfKUtVn7ccR5Gxm3sLU4AHDLSysLiYLSgd8/Wf7GDhyxnmbny/6/wsb
 W6mkDr9G0PrYHRWtxsXfwZBc/qftFP5Wa0FJPF63mi0R/xQKT5b3zms9Rv/w8z1cds/W
 MdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mTfy1CwHM+3Zrt9SbEOLvMZ2nzcWr9qeY3QcEnuxy90=;
 b=18XhbxbWAr5gZOxtCqzL+yFrDEW2aEqk/4NUVe1Lse1t8f4YeKcimBjYoMEr4ekg4l
 hEfDuYrx1yMJvM7Xs+U/UaQ/bBf2UEvg/SYECwRUEMli8EUc9J/+VXUJnxWxztqjAC4g
 mKFb4J6xiYfrQSfVlDpuZ7dQZlcRNxcpcVJBAObLXz8E1DD6jcn/wBg+LVBuG7nH8DSe
 chkwgRcgE0BvvDOugFki8Ws28BODAFe1W4oIpLxgf8OSnpetGdYjZ91DoPsYSBLkthJD
 iJhvAPEMgkAkNgPjMmD7PDsImVynsUY6+Dtzj4fFsS1Xp5HYjsryUVxhEm3eQ7xknLV8
 fB1A==
X-Gm-Message-State: AO0yUKUu6M5/fmE+A6piT1bRR4pe7o2dnAVGi5M3t6shgTV8uoyGI1NS
 OQLRRf/z7N4PkD1chF6XqKmRUA==
X-Google-Smtp-Source: AK7set8F5rZBxsLAmkgWijxfU8jgztKtTfnx8cN916x16CkWzHnEdJ7IsiBbaYPC/ltQOr+HmR6Ofg==
X-Received: by 2002:a17:902:f54d:b0:19a:80e6:2a21 with SMTP id
 h13-20020a170902f54d00b0019a80e62a21mr82230plf.33.1676409415996; 
 Tue, 14 Feb 2023 13:16:55 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 iz17-20020a170902ef9100b00199193e5ea1sm10605703plb.61.2023.02.14.13.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 13:16:55 -0800 (PST)
Message-ID: <58c12d92-a371-deca-d320-285871ed6c03@linaro.org>
Date: Tue, 14 Feb 2023 11:16:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 06/12] bsd-user: Helper routines h2t_old_sysctl
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org,
 Thomas Huth <thuth@redhat.com>, Sean Bruno <sbruno@FreeBSD.org>,
 Juergen Lock <nox@jelal.kn-bremen.de>,
 Raphael Kubo da Costa <rakuco@FreeBSD.org>, Stacey Son <sson@FreeBSD.org>
References: <20230214002757.99240-1-imp@bsdimp.com>
 <20230214002757.99240-7-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230214002757.99240-7-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
> +/*
> + * Convert the old value from host to target.

host vs guest is clearer language; "target" gets overloaded, even though still present in 
the code base.

> + *
> + * For LONG and ULONG on ABI32, we need to 'down convert' the 8 byte quantities
> + * to 4 bytes. The caller setup a buffer in host memory to get this data from
> + * the kernel and pass it to us. We do the down conversion and adjust the length
> + * so the caller knows what to write as the returned length into the target when
> + * it copies the down converted values into the target.
> + *
> + * For normal integral types, we just need to byte swap. No size changes.
> + *
> + * For strings and node data, there's no conversion needed.
> + *
> + * For opaque data, per sysctl OID converts take care of it.
> + */
> +static void G_GNUC_UNUSED h2t_old_sysctl(void *holdp, size_t *holdlen, uint32_t kind)

h2g.

> +    /*
> +     * hlen == 0 for CTLTYPE_STRING and CTLTYPE_NODE, which need no conversion
> +     * as well as CTLTYPE_OPAQUE, which needs special converters.
> +     */
> +    if (hlen == 0) {
> +        return;
> +    }
> +
> +    while (len < *holdlen) {
> +        if (hlen == tlen) {
> +            switch (hlen) {
> +            case 1:
> +                /* Nothing needed: no byteswapping and assigning in place */
> +                break;
> +            case 2:
> +                *(uint16_t *)tp = tswap16(*(uint16_t *)hp);
> +                break;
> +            case 4:
> +                *(uint32_t *)tp = tswap32(*(uint32_t *)hp);
> +                break;
> +            case 8:
> +                *(uint64_t *)tp = tswap64(*(uint64_t *)hp);
> +                break;
> +            }

default: g_assert_not_reached().

> +        }
> +#ifdef TARGET_ABI32
> +        else {
> +            /*
> +             * Saturating assignment for the only two types that differ between
> +             * 32-bit and 64-bit machines. All other integral types have the
> +             * same, fixed size and will be converted w/o loss of precision
> +             * in the above switch.
> +             */
> +            switch (kind & CTLTYPE) {
> +            case CTLTYPE_LONG:
> +                *(abi_long *)tp = tswap32(h2t_long_sat(*(long *)hp));
> +                break;
> +            case CTLTYPE_ULONG:
> +                *(abi_ulong *)tp = tswap32(h2t_ulong_sat(*(u_long *)hp));
> +                break;
> +            }

default: g_assert_not_reached().

> +        }
> +#endif

#else
     g_assert_not_reached();


r~

