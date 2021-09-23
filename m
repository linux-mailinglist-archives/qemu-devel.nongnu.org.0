Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8F74171A1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:18:53 +0200 (CEST)
Received: from localhost ([::1]:50490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTkAG-0007Hg-9Z
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsU-00070J-QH
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:30 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:40916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsR-0003O7-L4
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:30 -0400
Received: by mail-qk1-x72f.google.com with SMTP id 72so27544458qkk.7
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 05:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jKKK6jYhTy0razTQGOGJL/bCgyN5VFFuHYpjffoXNYs=;
 b=d81YE7TQvMpRPnEM/dNrfKmWjHEkInn5xLyqvv2dS6YENlwlIccN3LaIZ8GHWo2V4E
 N93C22OcuKar3h55Izbqx+wyK3jEyqZLGSiO6CmMx5kpzRe9gVj4nVt436RCu9NGlZuS
 Ve+zBByoj/WYBLtZW7zjZjCeRYBOtmWzBfchcYRkhANi/9djnNW1uOPqsEubMyUO2k1b
 eV+g7ROqja/940lTVFBOkXIZdwotff8Ia1vdP3n3MA14naSnFWliPXZvUesF8XmDAHj1
 XmJVjrtTGA6FZu3ZXLsLlBJulV6PpLaFG/K5dAgSzk5tvldhcJE6o/oefGwjoFc/KWIM
 1g4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jKKK6jYhTy0razTQGOGJL/bCgyN5VFFuHYpjffoXNYs=;
 b=NtkYpn77dOkgb4qCIrbFhRAQtxSfzebO/xPlZFdv6OfkLXUhmSeTVWzp0MdwJY0h9u
 vLQ0jAN8LnfeCviePQ+qut4NsGwdbETM3q5wwALEHJXxqxM0x4VOKfAzN18WPFkweaCT
 btkgpM8o7HWdC698H6rDsQV+Bxj2jZS/ATASFuqzjMF9sNwU0+A95kTTbjPNU8vP1Hql
 auFTZffzHWiNhMq1xpgRPgfQeQlmkfpJBusCqsHJYW3deN2dkVZYxDiIW68DxNeSZvxu
 X7MOo2nlxIDaY2h/ZbnIggKZfdB4b44ePWN+UVxAZIHkUZ01hOtQnKLDdC7FLkatenGN
 PT4Q==
X-Gm-Message-State: AOAM532ScRD0XMOJGVikO4UjhQrm9GQvSydL9dju8l9aJ0KRKD2XnzSp
 1xqfMVWoxTxEZKar0I0iAaS2yg==
X-Google-Smtp-Source: ABdhPJwcwdJzTOhLr4D46PiQnPHR5yUsoY5jcUWKvEDxGO1OL5mvLrevVrPliZfKCYf+NOR22qNBcw==
X-Received: by 2002:a37:bc85:: with SMTP id m127mr7211536qkf.119.1632484826786; 
 Fri, 24 Sep 2021 05:00:26 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id j15sm686654qth.3.2021.09.24.05.00.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 05:00:26 -0700 (PDT)
Subject: Re: [PATCH 10/14] bsd-user: Add stop_all_tasks
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-11-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f76526cf-18c8-47b1-3543-db05c0c0b695@linaro.org>
Date: Thu, 23 Sep 2021 11:04:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922061438.27645-11-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 11:14 PM, Warner Losh wrote:
> +void stop_all_tasks(void)
> +{
> +    /*
> +     * We trust when using NPTL (pthreads) start_exclusive() handles thread
> +     * stopping correctly.
> +     */
> +    start_exclusive();
> +}

Eh.  It begs the question of why this is present, as opposed to calling start_exclusive 
directly for the one (1) use.  Looks to me like we should remove it.


r~


