Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E37941717E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:06:31 +0200 (CEST)
Received: from localhost ([::1]:52898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjyI-0005OC-BA
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjrn-00067F-MZ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:59:47 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:41674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjrm-0002Vf-Df
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:59:47 -0400
Received: by mail-qt1-x82f.google.com with SMTP id t2so2608414qtx.8
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4xE7JG30iIZW4zTRFzi0+OafnNCgzKIHt8jCjoue404=;
 b=x0mEBK5iNoVY8x+If01N1onZT3DJWqCW/VQzLO44gjpih1K0+LV1h85OoNaTdncAfL
 JnT8iAxgmqfLH93QqueCDzS0JJ3cvgVXRPehqg+8l+tMCOLjbCSI5hsCg5JDakkKrXA4
 4EeS4q5yxrTqxLux8AK1mppbNHNAkPiCyj1+tAuHWIPca5zKka3Ofyah8CQrGyQHs0k/
 SuR+/07G8je93JSByjwGIk1h0h9YJtcD1ESeo42gDuD5SMBfq8bSzSIrZbi8Gedw7+yy
 ODrRbOdLD0rjRDPVFz2oafipIwfZqKhrr3VoVPPJYysE2jmfUfezGgtf8kRp9ZOX6pLx
 4KYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4xE7JG30iIZW4zTRFzi0+OafnNCgzKIHt8jCjoue404=;
 b=hTSwHmnz5t7ZSAuMDwxutNMD8CE4+SI6acghGK9oqP42fq3TpKp84OKpZsM/Z6mcw7
 9/U51NH1kyrfVDFhg27aMCSGKCIqkjq5jQL24gBCSz/xozCoesWh3/0B1AhFjE9f1xig
 Yg8BWTSIHwIKDmqmKlifzQ7RRhiyQIqQUYHY6m2KZ4AaKL265fuK9N3WjiNNcUX0DPDE
 riDv8NnKo9iiU4R4zeQkp7UGQyln/x9URhLlGeyeKjIgn+7wN6dO9o4xKAQIs8Q1Z0Pz
 kpZ4o3XjWXTaSVRfsXgIKLG0cU9qyDjZDdb9aW1KC/dstI7PVmNI1aW12UO3TMCbOlbk
 pR7g==
X-Gm-Message-State: AOAM533fvlZGtdzcBv/3LFE28yBiwC5jUUbt9jnm4cXgpOMwU6dHzD9k
 2NBVTchSRvvQfTjDWE9zAevfEcmp51d/Cg==
X-Google-Smtp-Source: ABdhPJx/UOMKpTMkXlLTiQZZ7jlzANDIbBHT+1ZbywB9PXlUbkFyJw/S2iE8+/z3iuP+cD8XQ4M4mQ==
X-Received: by 2002:ac8:5392:: with SMTP id x18mr3645111qtp.180.1632484785505; 
 Fri, 24 Sep 2021 04:59:45 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id j21sm5034825qkl.25.2021.09.24.04.59.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 04:59:45 -0700 (PDT)
Subject: Re: [PATCH v2 1/9] bsd-user/mmap.c: Always zero MAP_ANONYMOUS memory
 in mmap_frag()
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922045636.25206-1-imp@bsdimp.com>
 <20210922045636.25206-2-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ef5ea2bd-d7c2-e83c-9ccb-139c6222613d@linaro.org>
Date: Thu, 23 Sep 2021 10:35:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922045636.25206-2-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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
Cc: kevans@freebsd.org, f4bug@amsat.org,
 =?UTF-8?Q?Mika=c3=abl_Urankar?= <mikael.urankar@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 9:56 PM, Warner Losh wrote:
> From: Mikaël Urankar<mikael.urankar@gmail.com>
> 
> Similar to the equivalent linux-user commit e6deac9cf99
> 
> When mapping MAP_ANONYMOUS memory fragments, still need notice about to
> set it zero, or it will cause issues.
> 
> Signed-off-by: Mikaël Urankar<mikael.urankar@gmail.com>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/mmap.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

