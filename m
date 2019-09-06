Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3BFABBBC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 17:06:58 +0200 (CEST)
Received: from localhost ([::1]:57390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6FpB-0008F4-VY
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 11:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33951)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i6FoE-0007iw-4D
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 11:05:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i6FoD-0002up-0g
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 11:05:58 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:45750)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i6FoC-0002uH-QP
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 11:05:56 -0400
Received: by mail-io1-xd2c.google.com with SMTP id f12so13354032iog.12
 for <qemu-devel@nongnu.org>; Fri, 06 Sep 2019 08:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Fy5YmNAqcFmQl2O+s2pYG0sex/cikoUa8lQCqM6+K20=;
 b=HComk8S24CFzQePpm7SJTe9g7yAXFjAQ9cxoH2xEmmreLu5YcjLeHsHZbxRGhdvhfF
 Tb0QdTCml8D26s9Kk99f5bIYPpix7BhkTjAxoUC7/AF5B7j9EZlnTdlHWV9EUvwA6gFK
 C1gGgZM+kDVu4A2c5gQbcjc4MFiAd6wQlh37yOALvhjHxKrkf9/V2eN20OWG11lwqZpv
 GJd/a1eX1HEvhOBpa4kKWRRP1V42qglJspMjCZ9CzIVOHGmLE8ecZ3rz4XdeFIcv4VK8
 85mvBYZluNaWGz3Az/3hnXJi5fxDIJBYm+6yIeAuLnFMXY63hkOPH/MMfYGv/X8nTh/c
 nQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fy5YmNAqcFmQl2O+s2pYG0sex/cikoUa8lQCqM6+K20=;
 b=hw3P1a/cDC06NO3LvfpQeGXCBhyEpJ0WBk61NRTWSP7S4LmOlQI/vFytKKMJCZA5if
 hok8prtSORKtehYIoNHMRpuG9b6TILJRqkFNDZrH8wIqyoKvEtoWzigYHccU/BlPiDXq
 dark1ammXZaFMrukOvf3TAYDsdk74P4SBETuDSTlhbyl94jglEih/ct0k42rV9wb8glk
 yz9HnhQPmTptd2SDR+fusuXdmCwwQouYTHFkyuWxQnmBLBk9VGzu7PrsHlStXU6VkRy0
 qNSyeoqQaV08u6WlzpLaiLlivHIi4/M8e27opGv3ApVc/QkwLfUuxtX2dFT7dCQmNX/Y
 2SZA==
X-Gm-Message-State: APjAAAXcx0zDcbMSvzNXFS8K94APNgMt1O7obck2++K5ZDdhFKe9ljYj
 vthEOkif9QWD7q7bvPAJiLhCtsF9FuTS+w==
X-Google-Smtp-Source: APXvYqxdWvXJwWQPSa8+xnbj8PhDTMumPwLetBDIwL3i9msLmxKkg+TNazdO3yvgwx9GZN26mBt9jw==
X-Received: by 2002:a02:a403:: with SMTP id c3mr10091380jal.93.1567782355003; 
 Fri, 06 Sep 2019 08:05:55 -0700 (PDT)
Received: from ?IPv6:2607:fea8:a260:81:78cf:74ad:c2b2:73ef?
 ([2607:fea8:a260:81:78cf:74ad:c2b2:73ef])
 by smtp.gmail.com with ESMTPSA id z9sm4092949ior.79.2019.09.06.08.05.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Sep 2019 08:05:54 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20190906124706.19145-1-alex.bennee@linaro.org>
 <20190906124706.19145-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9a2a8938-35d4-c160-e9c4-a5baf934b881@linaro.org>
Date: Fri, 6 Sep 2019 11:05:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906124706.19145-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d2c
Subject: Re: [Qemu-devel] [PATCH v3 2/4] target/arm: handle A-profile
 semihosting at translate time
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/6/19 8:47 AM, Alex Bennée wrote:
> +    if (semihosting_enabled() &&
> +#ifndef CONFIG_USER_ONLY
> +        s->current_el != 0 &&
> +#endif

!IS_USER(s).


r~

