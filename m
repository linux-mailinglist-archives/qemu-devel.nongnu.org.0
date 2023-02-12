Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A6269357B
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 02:15:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pR0vm-0002jg-JH; Sat, 11 Feb 2023 20:13:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pR0vd-0002jV-MH
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 20:13:17 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pR0vb-0002Hx-W7
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 20:13:17 -0500
Received: by mail-pl1-x62a.google.com with SMTP id h4so2473559pll.9
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 17:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z2zAdtYO4yqAAcHlmTInRWp1yn2M6RpXlhdk26oOdH4=;
 b=bME+FamSbYUSftLlVuUXFr/+k9cgbnzEFpsLxH38b4jtSh5zDc4vx8fk8Ib1mPxpI8
 i0OQtDzeUAzW9Dsh/5Ds0TvVEqtqekgKUoZMJ57C1B4ljcwLnf2PhTqf5UAAq5XmLrZ7
 mdRHlzOCobOO4QcmaXfZQjUroTqk3adsZeNiKb4nsBZBfxx7PWa+svvh0Ss/JmBxCzzw
 2LrQ4JFv3yODe9hy2AEy2ME0ZL3VtorESeJ0wa6oK8reyEwqtxl9quSa2T4gLAEZUoYh
 bas11YyG+LK8KR60mQ+P+rvD0ceIEntRwzcYdoKDC96+OdEf5G+gd5FPy6vaz8b31+rX
 cgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z2zAdtYO4yqAAcHlmTInRWp1yn2M6RpXlhdk26oOdH4=;
 b=hvCH9/EnVVIvcfMm521JwXCXCw1O94vLHNnquAVO6bMwvv7btK0WDFT1VY96Hxt67E
 ymNmMsLq50S2avxaJ/Vc9vUuKjLgcWemRKmCZPZcXCp/xNyxEMREheOOQdkU5d7/JHLW
 JYwbs/gJIK3wIEmgG5mO/ewXE+sOZg+emowwM92svGdyfRwbc3yDlKEIriKoTiRksxiT
 pCc0vra+pNroFJyrBaiJkumgTRc6imDR4tfQFnBoouqMwM8jinNRkA/4paN7vagorrB0
 tnjaXSMwQQY/hBjnWjIqcpP1qJk8N0+7vVnPU5Lz1GL/5BfhLqyCepiKgMgTk5eDxGjr
 9dKg==
X-Gm-Message-State: AO0yUKUOeIXgjGHOfV4IbaeECsrr9tD4fb2HEq5S/A6OrbVtfykFpz1G
 bR4UrAhCuRaZA3tsI1TxjOdAuw==
X-Google-Smtp-Source: AK7set/Y0WIieaxCU6U0DgitG5AF1nOeLG/OQiZi9THTLBpNe5PBBQKeQgCQSk18FLBKdbE8PkJiTA==
X-Received: by 2002:a17:902:db01:b0:196:1678:3060 with SMTP id
 m1-20020a170902db0100b0019616783060mr12205267plx.0.1676164394264; 
 Sat, 11 Feb 2023 17:13:14 -0800 (PST)
Received: from [172.20.101.111] (rrcs-74-87-59-235.west.biz.rr.com.
 [74.87.59.235]) by smtp.gmail.com with ESMTPSA id
 t23-20020a170902b21700b00196047fc25dsm5559159plr.42.2023.02.11.17.13.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 17:13:13 -0800 (PST)
Message-ID: <e4eeb2fc-d777-e7a8-17e8-38bd0104bf70@linaro.org>
Date: Sat, 11 Feb 2023 15:13:10 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 6/9] bsd-user: common routine do_freebsd_sysctl_oid for
 all sysctl variants
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, f4bug@amsat.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Stacey Son <sson@freebsd.org>
References: <20230210231829.39476-1-imp@bsdimp.com>
 <20230210231829.39476-7-imp@bsdimp.com>
 <b56a7205-0c22-16aa-f73b-267576b9950e@linaro.org>
 <CANCZdfp394rACvjVDdEao626pSdin1yPvYHW9sf0mNbVwoyeVg@mail.gmail.com>
 <30289ed3-7cf4-d50e-59a6-603ee15cf5e9@linaro.org>
 <CANCZdfr=fFU8w6wEPWR77qTCAXe+a+HMj-Ubnsv=04Y3+qDX+Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CANCZdfr=fFU8w6wEPWR77qTCAXe+a+HMj-Ubnsv=04Y3+qDX+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/11/23 14:40, Warner Losh wrote:
> I was going to do something like:
> 
> +    if (host_page_size != TARGET_PAGE_SIZE) {
> +        if (host_page_size > TARGET_PAGE_SIZE) {
> +            /* Scale up */
> +            pages *= host_page_size / TARGET_PAGE_SIZE;
> +        } else {
> +            /* Scale down with truncation */
> +            pages /= TARGET_PAGE_SIZE / host_page_size;
> +        }
> +    }
> in a helper function. Does multdiv64 replace that?

Yes, it uses a 128-bit intermediate result, so no overflow.
Obviously the above works as well, but perhaps premature optimization.


r~

