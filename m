Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E944D5524A7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 21:40:49 +0200 (CEST)
Received: from localhost ([::1]:50442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3NGN-0001XQ-9i
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 15:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LzX-000441-An
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 14:19:15 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:41580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LzV-0005nB-LA
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 14:19:15 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 g10-20020a17090a708a00b001ea8aadd42bso11077342pjk.0
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 11:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=e+hSe+jLxazpdn/cTPQ2gf79EKVMrBC33dYqgbV9e2o=;
 b=B/2t2LE+kUDSPx3FAxROPeCCJ3nYfOdTZvYJv1EHwDNOr5OfvFxodrrfef/wFYbzc7
 TgA460gYz2Zj27zK0pXBZy0g+2cy+kWtseHtCryRJu3MIOhK/A2YR5c3m620L1P3krV0
 3baNhRgPF/9+aH7qEDGsyILt4UD+0ktGeeLZ52UO/L2cf/VamSsLQVVZXwHSxYqwdpr7
 7br6D+6nZCnYkgTmoqQxbhXRdE2rL51rHMtpyLRz1/k4+3m+hTo6XZ5cn1PsATjkwFd9
 YAeNMaz8EiRjnBnhMgJspY/MWk4k8qjhMFAqx12BOMsWGgGimIYSElZwZo/42nHVW+OI
 JQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e+hSe+jLxazpdn/cTPQ2gf79EKVMrBC33dYqgbV9e2o=;
 b=4NVHCAPV0z7Ej4zQbYhgDZFaAVcl2H9ufj1QPGQ/s7ldJ1A24068MTGua2se8OQ6lk
 MbGekbIuyIqcvct7oNIfVY4/R+O0USObK6Ap2de1dwtt1RRNx4LoEHBTLoMlkJSy+XRH
 u4ijM3exPjoHAuvVmA8SwPrwsOnXVbMGWMb5FCN0mGLqu0U8FmBEKVZNQi6VdErISVdc
 rpOpO+yqbF3WlC484Pv7zB6R9cJkvcgWpQu5JNrfDwlwVnhBUs8zbQ4xh2x58POgM8LA
 iASV6ZwRqjlKYWbRS6jZLoOULdk89e9HgskZYf3LVLQQPfQyGTVNh7ueBJjzpSDT/3oF
 mp3w==
X-Gm-Message-State: AJIora9nKtT0eP8+HuRUmazIuIzrPoB27ztvFmk7btyWfE/Os/hf2ta/
 qwHuu/MIvY6TV2YPMOEgshCRKQ==
X-Google-Smtp-Source: AGRyM1ucoHoOnyRgk5VKt8Tg4H3mhd4PIByHZWIS8pUY62RVZ8cPzhYeoqnkyWEWtdAqgjbMoS32Bw==
X-Received: by 2002:a17:902:8b85:b0:168:d854:be84 with SMTP id
 ay5-20020a1709028b8500b00168d854be84mr25124166plb.94.1655749152047; 
 Mon, 20 Jun 2022 11:19:12 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170902650800b00167942e0ee9sm9066876plk.61.2022.06.20.11.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 11:19:11 -0700 (PDT)
Message-ID: <4eeee2f9-3289-4f2c-fb9d-2b78caccc68d@linaro.org>
Date: Mon, 20 Jun 2022 11:19:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 01/10] bsd-user: Implement mount, umount and nmount
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Jung-uk Kim <jkim@FreeBSD.org>
References: <20220620174220.22179-1-imp@bsdimp.com>
 <20220620174220.22179-2-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220620174220.22179-2-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/20/22 10:42, Warner Losh wrote:
> +    /*
> +     * XXX arg4 should be locked, but it isn't clear how to do that
> +     * since it's it may be not be a NULL-terminated string.

it's it.

Unless you meant https://www.itsiticecream.com/  ;-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

