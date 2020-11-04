Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E28692A6CA9
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 19:28:50 +0100 (CET)
Received: from localhost ([::1]:37624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaNWb-0004p4-Fd
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 13:28:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kaNVg-0004NT-2d
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 13:27:52 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:36457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kaNVe-0008PN-HU
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 13:27:51 -0500
Received: by mail-pg1-x543.google.com with SMTP id z24so17301198pgk.3
 for <qemu-devel@nongnu.org>; Wed, 04 Nov 2020 10:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mgFta/fqVLnKzSMnCM5ALE9qpfYYPGJlshjxx+9H5xw=;
 b=nqKfK8VMU/Q46daA0yJvUq7eNcHGxXx6yeWE8w474xIKWD3PneMd/gYPX4dMG8pwSK
 01IocSwQtAkplRu80b8eI9znS3ESYHbldLL5eqVZT9WPA+rQttZn40UVLpx2OpVRHwSH
 YGgMFKIZA/jVp6r/Q8Vnlde4gqVS+mrxP+2vPQ7RsloQBp4//3VYSe/kk+i6QgZUE7A3
 mlLXQti4D7Z8hPrH4BATaruSP1gM++NmYoYbKpERVAlIlTzsghVAEgLw6gyiOQvxfqGd
 KQJrFBsimEeW1wX4uwSBjnw1EqsT1+KOhmEg3BbplA7ZOH+3uaxndMf0ZbzVJzSVCpx2
 e2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mgFta/fqVLnKzSMnCM5ALE9qpfYYPGJlshjxx+9H5xw=;
 b=JxlrJKW6lF2Sjx+btGufhFliNiR3LikoB6eOZPyBTOdZjsXWVHk3mAnihLc1m+lWYU
 JK11YrFyT9ZywSv748qwriyatcOOjpyKG7cJRHVlIEnShzgGYpm4YJCeCtbQHbLK7zmH
 7wSNuwxMAsYwqlBzXN28+5rnRn+YM+xUDZ+hqkpKGy5dcas2hAO/vY/umPey2BuSXglA
 At/gOoA9nD2k1r7+rqXZLpp+kobaGoiZbVRusafk2gaGxlVUYcnmJ0DZf0CEmQ/DkqZc
 uhOvZmvR2A6NRF6WIjdF8W7QEEmqX+UBTs2PZnk97RZT/7AGovRQPXU6qdKrQ3R7DFls
 7fVA==
X-Gm-Message-State: AOAM532RLlJT0//vEzTd98zxGhhETIn1tgHL9zdRSzYx/eVz3AZWOTV+
 4RJkdOpVZZwhd+IaOLyNYGFh/Q==
X-Google-Smtp-Source: ABdhPJw0bd1v9GUBm/8LAcnyUfZnUkU6jIpT/bYZLWyCnWNkVPfFVXTwMtDVIu6o77p7axCVVgjlXQ==
X-Received: by 2002:a63:cc08:: with SMTP id x8mr22338204pgf.229.1604514468412; 
 Wed, 04 Nov 2020 10:27:48 -0800 (PST)
Received: from [172.16.1.221] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id e128sm2997199pfe.154.2020.11.04.10.27.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 10:27:47 -0800 (PST)
Subject: Re: [PATCH] tcg: Revert "tcg/optimize: Flush data at labels not
 TCG_OPF_BB_END"
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201103213852.253793-1-richard.henderson@linaro.org>
 <CAFEAcA82mtadB8r1kX1TG5Ft3qj0YPLXKebWUkXRG=dWew1SVg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2f7460e0-e113-57ff-7816-3103feb40a8a@linaro.org>
Date: Wed, 4 Nov 2020 10:27:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA82mtadB8r1kX1TG5Ft3qj0YPLXKebWUkXRG=dWew1SVg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu@igor2.repo.hu, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/20 10:12 AM, Peter Maydell wrote:
> On Tue, 3 Nov 2020 at 21:38, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This reverts commit cd0372c515c4732d8bd3777cdd995c139c7ed7ea.
>>
>> The patch is incorrect in that it retains copies between globals and
>> non-local temps, and non-local temps still die at the end of the BB.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> I assume you're going to put this in a pullreq at some point
> before rc1?

Yep.  I have one other bug fix as well.


r~

