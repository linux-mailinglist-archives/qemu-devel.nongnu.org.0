Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B5669B1F3
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 18:42:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT4jW-0007dA-Dj; Fri, 17 Feb 2023 12:41:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pT4jU-0007cf-4q
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:41:16 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pT4jS-0005XW-Ly
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:41:15 -0500
Received: by mail-pl1-x634.google.com with SMTP id 19so2337813plo.7
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 09:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z3TXaPJnG5p4ZTttn7gLA6eb2p/PHMpKCU9JCw/BWx8=;
 b=CVxFp8SrYrH8+rdpvnbn6rLO43GaURaFWp5RqM+5C3BJD10PiblngMAyLM5PoB9pj8
 uHbDVgAFjE5P0vXblmyO/eENYFromR8ko1tKfW+fk8nXI22T78jksQIhdFkwMZbhU4F3
 VdvJr3EdV+wb3SGBmxWevUOJaT34Kzdn9YsKAeoyEhRXtGSylrCppvzPVKV5Nw+AmxKH
 JQupg+3oKAJtQAIBj0/HSy79oJtnJwjUC3LwuNhyLjVtxFiY4DK0qeC/Hv7D4j67Ujt0
 bsDcVTX+SsWok6SGfAXAxbmrqgDAFw2F+leDwDetdteEMw51fwoSRXwoKdhPwdb7MAzK
 5FRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z3TXaPJnG5p4ZTttn7gLA6eb2p/PHMpKCU9JCw/BWx8=;
 b=pwKZzwYeGQd4VmI9xqLECXkRbv3Ip3PKrnzHOOn/+lJhJo7+Ij77PW1/GClOl7jzKn
 IMQKDJ8yyLuxOdrqxhRX+JRwuDPEmkVv2R3Pmuae8eecI75YHDMi5PPEtwbmK1WaAzrU
 iEK3L0zsWpwB4J1LXfG8t1Cak1ELG4a9AwYUrTX2CYBlA/3qDAEI0bZDbNl5lGbpvazu
 isQLK5q+R/NI1a7HCVEEKZNugqRJBhrqXXSFlonV/zikbNVu9fg13x0mBM5Fy83H7nI9
 9yvRdeoa1u8HSZUp49UN54IrBwcDeuL4muAHPlYIUxb7C94H/9LvNlNlU/yYUpMJbnlw
 0klA==
X-Gm-Message-State: AO0yUKWIntOf9kpRdHGJivLO8wsUI5Wkw0QFZckhsLsY5Fne2WsGXJH9
 ZXtTrr2kX+L294GBbnRDas4PHnY+cPBsv3qG678=
X-Google-Smtp-Source: AK7set+2OnRkIb+nYIHT1QiHWcyRHkQLKJq9gxWLlUhVnmkujjUjq+2kKGX9+TVl3MFVuY0d+t+piA==
X-Received: by 2002:a05:6a20:2e0c:b0:bc:a2a9:1ad with SMTP id
 be12-20020a056a202e0c00b000bca2a901admr1697794pzb.2.1676655673136; 
 Fri, 17 Feb 2023 09:41:13 -0800 (PST)
Received: from [172.20.100.240] (rrcs-173-198-77-219.west.biz.rr.com.
 [173.198.77.219]) by smtp.gmail.com with ESMTPSA id
 e13-20020a62aa0d000000b005a8da934214sm838182pff.168.2023.02.17.09.41.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 09:41:12 -0800 (PST)
Message-ID: <c1b0959b-4af7-a432-4391-e57d26a81894@linaro.org>
Date: Fri, 17 Feb 2023 07:41:08 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 06/11] bsd-user: Helper routines h2g_old_sysctl
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, f4bug@amsat.org,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Sean Bruno <sbruno@FreeBSD.org>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Raphael Kubo da Costa <rakuco@FreeBSD.org>, Stacey Son <sson@FreeBSD.org>
References: <20230216233353.13944-1-imp@bsdimp.com>
 <20230216233353.13944-7-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230216233353.13944-7-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
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

On 2/16/23 13:33, Warner Losh wrote:
> h2g_old_sysctl does the byte swapping in the data to return it to the
> target for the 'well known' types. For most of the types, either the
> data is returned verbatim (strings, byte size, opaque we don't know
> about) or it's returned with byte swapping (for all the integer
> types). However, for ABI32 targets, LONG and ULONG are different sizes,
> and need to be carefully converted (along with help from the caller).
> 
> Co-Authored-by: Sean Bruno<sbruno@FreeBSD.org>
> Signed-off-by: Sean Bruno<sbruno@FreeBSD.org>
> Co-Authored-by: Juergen Lock<nox@jelal.kn-bremen.de>
> Signed-off-by: Juergen Lock<nox@jelal.kn-bremen.de>
> Co-Authored-by: Raphael Kubo da Costa<rakuco@FreeBSD.org>
> Signed-off-by: Raphael Kubo da Costa<rakuco@FreeBSD.org>
> Co-Authored-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/os-sys.c | 100 ++++++++++++++++++++++++++++++++++++--
>   1 file changed, 96 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +        }
> +        else {
> +#ifdef TARGET_ABI32

} else {


r~

