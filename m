Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB3920A500
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 20:29:59 +0200 (CEST)
Received: from localhost ([::1]:37206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joWdK-0003DF-98
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 14:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1joWbX-0001f2-AS
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 14:28:07 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:51324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1joWbV-0002Jq-3q
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 14:28:06 -0400
Received: by mail-pj1-x1043.google.com with SMTP id l6so657889pjq.1
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 11:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vmgYM0RJcmg03HeMslr3Xhicdlp+QG2ppShKgkgvGos=;
 b=Jijx64STWtBdi7yfbSGuP0zn/uMt4k76HIWGYUlI1INxm08E6F4G66nmo9TbtIqYGj
 02rAmtNbkWuUWl/UxlKQkHzqcYl78ryNwv04aZtrByWUBmmO9Tl8BY9zkBDa+7dKopEG
 pq8Wg6q3V2X+kIcyHgKj6ZGF3kIWKfzgPenMQLwD7BDN4Oz1jFWBeIvgAXqnGFuK9p0L
 9hxv3myAWzcSxmnt+EMJJwCqvDtkOIX97ep4n7tUZ2dRw4ri/4GzNntudyG9EhRSEYDT
 kfSxuKEp3BrUcJ9qHO2038eeRGrAToenmAFnyROYg/IQPsDAJxoDd0yGcufpxAiqHhLn
 +8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vmgYM0RJcmg03HeMslr3Xhicdlp+QG2ppShKgkgvGos=;
 b=jTPYQiSls+DBVVoV6M/kL+x8eUxNCS9Bi5I1YU8+cagPpceXY3zDsW+bUWtXZdGl9a
 Hv5U3m/xkmcRQiWeckjTbW5rVGcA5fkzmxJzdc1edO3nAuiN0p2KfROkVbDyBElbH+MQ
 mhIUOJJ1uiyOjUR9ss7K0yz8HHmghLNYNNSoEXEtl5lE1hwWBEVyNNaPxynoVLfZu/P1
 JsZSiPzlDLMRl1MM5WS2IvfPyXhU0Ag130omueEjC5E+CMxXOL+K4QWK6qx+3zuHB89F
 dYOzTo+ygRbhn+38YLz/+TTp3+1t2DvAMPVJwzpSMu9MpQtMuBAhdiovmTxFtIGy9Xo0
 b+/A==
X-Gm-Message-State: AOAM532KclN10qxPo8YpxDhEFAz8elNBhlaJIjh27T9Ql7Jxo9lZABLD
 P7KLWMsAzrsaXpgloxUZrkJiGw==
X-Google-Smtp-Source: ABdhPJy7B9vJ92IADGeHAzKUTuXrx6z9xMFoY7CITVpFEjlC+0z9fmAjmNgWY6CC6L1qTBVU+R+nqg==
X-Received: by 2002:a17:902:326:: with SMTP id
 35mr33966991pld.301.1593109683683; 
 Thu, 25 Jun 2020 11:28:03 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id u13sm1744130pjy.40.2020.06.25.11.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2020 11:28:02 -0700 (PDT)
Subject: Re: [PATCH v3 6/8] fix the prototype of muls64/mulu64
To: Lijun Pan <ljp@linux.ibm.com>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20200625170018.64265-1-ljp@linux.ibm.com>
 <20200625170018.64265-7-ljp@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a5c3e28d-2701-f3be-2064-eed2a1625fd8@linaro.org>
Date: Thu, 25 Jun 2020 11:28:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200625170018.64265-7-ljp@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/20 10:00 AM, Lijun Pan wrote:
> The prototypes of muls64/mulu64 in host-utils.h should match the
> definitions in host-utils.c
> 
> Signed-off-by: Lijun Pan <ljp@linux.ibm.com>
> ---
>  include/qemu/host-utils.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I already gave you a Reviewed-by tag for this patch.
You should include all of those in future versions so that other developers
know what has been done.


r~

