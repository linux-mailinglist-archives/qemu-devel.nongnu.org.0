Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D74B427BD2
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 18:11:04 +0200 (CEST)
Received: from localhost ([::1]:49328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZEwB-00084L-Kv
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 12:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZEpw-0004Av-Jg
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 12:04:36 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZEps-0007fJ-5f
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 12:04:33 -0400
Received: by mail-pl1-x634.google.com with SMTP id x8so8153650plv.8
 for <qemu-devel@nongnu.org>; Sat, 09 Oct 2021 09:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GwTHGbu/GfGX0XYVV9TDUJfyJRo4EwoIXyMF2U5UTNw=;
 b=VDMFPnM/4FKLvTeE8jBofY+F4aUlwPhvRa2XdMzQ3B61ppi9569v4CYTzbXIOGzRwv
 JRfKEQsEr/EC6G4qCR7aLquEqWW48JuvQgENY9jTJm9gLxZALE/oaAMEzgc0Q01WgLkO
 AQWsV0S0j3Jza+0aNyxloQfl2HmD/i53n4kz/d+oWE3Bwmhc8IsUjfRMETiKK/ltwS53
 g6YQUNo+KHhnO1nn4jHgUhsR5ITyHVZQH3Aq7HSCDj+Wds0BkcM12nOKPJoPNB4mGPfv
 +BUUeeLyRXfOBr9dhT5Jipyczn+3HBt/XgN5eu54PZKQJcwQ6hfkqTa6xKoPoB0xN+Ym
 s0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GwTHGbu/GfGX0XYVV9TDUJfyJRo4EwoIXyMF2U5UTNw=;
 b=j4iIZmbLaUgYecWwSzAM7wj3VQLB2J7CWG4jThoqMZ8vPeMVbqbmOo1WGEJbgsqEYY
 xOqm0fYpi2DTuNy4Zcdy0tqKhjfGimoXRaj8q84uY0s/wcWdZ+AF9lsmxHo4TlP98Cjs
 4GoVW05f5PR1dYNkpw3Kfk/JoqNsVOk39GTGB43Iacve7H0Y5K/qAOUdyYaBazdAm5he
 aQJAjdmCD99u4eSJWVioKlrnP8EwLb37aC9KM7YSO7M3EGBEULTvQkrZ3YlqOizveuZS
 L0BujuERsOof8xhcRr+vVnsYsVGu33NwjsbuC+DFO/NlyafVUiu+9hXiqs850GkHwscM
 Gpqw==
X-Gm-Message-State: AOAM533AwML7SG3wc0JiyM3kwYWu5zaVwR5scq662uc4Nv7pHsGjcXZL
 IAJJUKbpNyrVtXo9wgK6OkQg4w==
X-Google-Smtp-Source: ABdhPJw4ayzj738FRdoNQpJ89XXWF6tSa0lPIwl/oIk34X3tQ3zwvGeELba7zmFPvNOsxxgM1s+vvA==
X-Received: by 2002:a17:90a:6a8f:: with SMTP id
 u15mr18985018pjj.212.1633795470775; 
 Sat, 09 Oct 2021 09:04:30 -0700 (PDT)
Received: from [172.16.83.58] (068-185-026-038.biz.spectrum.com.
 [68.185.26.38])
 by smtp.gmail.com with ESMTPSA id u193sm3115253pgc.34.2021.10.09.09.04.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Oct 2021 09:04:30 -0700 (PDT)
Subject: Re: [PATCH v3 8/9] bsd-user/mmap.c: Implement MAP_EXCL, required by
 jemalloc in head
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211008212344.95537-1-imp@bsdimp.com>
 <20211008212344.95537-9-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4b5d399e-b4fc-8bb4-cb61-9d322aa65e1b@linaro.org>
Date: Sat, 9 Oct 2021 09:04:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008212344.95537-9-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: kevans@freebsd.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/8/21 2:23 PM, Warner Losh wrote:
> From: Kyle Evans<kevans@FreeBSD.org>
> 
> jemalloc requires a working MAP_EXCL. Ensure that no page is double
> mapped when specified. In addition, use guest_range_valid_untagged to
> test for valid ranges of pages rather than an incomplete inlined version
> of the test that might be wrong.
> 
> Signed-off-by: Kyle Evans<kevans@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/mmap.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

