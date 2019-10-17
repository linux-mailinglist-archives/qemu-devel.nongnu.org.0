Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A77ADB12E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 17:35:07 +0200 (CEST)
Received: from localhost ([::1]:51136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL7nt-0000Mj-GU
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 11:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50787)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iL762-0003rn-RF
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:49:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iL75z-0000AI-G3
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:49:45 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:37405)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iL75x-00009T-3b
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:49:41 -0400
Received: by mail-pf1-x443.google.com with SMTP id y5so1811632pfo.4
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 07:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xce4Oqx+gZ9Kn35joR6fE9yq65g+ZwfdxyN404jzi88=;
 b=y8/LqW4EKWtpa9YTBrldLntc7EVudM4pfmGBHrIRa/rdrbWT0eUeogHTL9kkQD4NZ2
 sW5sLr5VlS5Y9D3BDRxcAN8zTQ8PADXUUBiJpi70ozgP/fxgUlqaJ/ySCeOA97YCKBdw
 yGBFOzEaK7cmqR5fYtQa5gOfrlZJp4iWkOG1vnAf0PmWK5h/Pzr0obbLF+bxxoAaXNiQ
 Z7G+1vaDcQGRA3xgxWDv09ow41Z9+f+bvut1HHMeSGCqXyaxydgJQJdnZKQFdJLF9bkL
 oHNNYxDHpv73nKhKl9OUSp1qHS6YFatT5rrTtFeZXPWO9FJTv44QZN4cC9fxbXSjSsEs
 +3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xce4Oqx+gZ9Kn35joR6fE9yq65g+ZwfdxyN404jzi88=;
 b=nN6IVXJSBLyuuZjJxZ1H74XHHad2sl7GlyBYOS8Sc7gpFPgQoFML21ddwK8q/VamxC
 cqCjzNP9QK/7kKEyxRZ+RSyY9FuMD6vu+ZEHxG06SUl6aiI7gEmByoVQR3Q+Djnr1MQH
 eFX4pzwrC03BcpCut0csVqb9G1NPHwGAgEapIktML42WLsvyp5rqvyI4Vv3M2EhAVoxg
 OFY17RYOP793s/Um4JWgGJpgHkYFDnZPV0XvsJU4uKBl0mDjM0Axz90GOnfrN8+DDjTn
 VxH7QGyswNvw66rsDyqxFocdMfagoqP9P/jzai+znb8dZgFck/sPgR8UFt/ARCmP1Oz9
 hxrA==
X-Gm-Message-State: APjAAAX2OfFeDMmtVfpv/inRc32zggRltN5d0RCRUgLYC+BhVMvFeJjl
 gRCqDOmGzABO7mISmZcx56tFlg==
X-Google-Smtp-Source: APXvYqxAdvawyTLYYyymzKx/kefwwv7bWZLX2LAOt3SMRb+2mP+HVnAWDAlQakgMVWdh34ja3l//IQ==
X-Received: by 2002:a65:6091:: with SMTP id t17mr4629317pgu.159.1571323779563; 
 Thu, 17 Oct 2019 07:49:39 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d69sm3622806pfd.175.2019.10.17.07.49.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Oct 2019 07:49:38 -0700 (PDT)
Subject: Re: [PATCH 2/8] hw/timer/sh_timer: Switch to transaction-based ptimer
 API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20191017132905.5604-1-peter.maydell@linaro.org>
 <20191017132905.5604-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <85648bf5-ab63-e4f5-c24c-7756fb1befae@linaro.org>
Date: Thu, 17 Oct 2019 07:49:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017132905.5604-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Walle <michael@walle.cc>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Magnus Damm <magnus.damm@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/17/19 6:28 AM, Peter Maydell wrote:
> Switch the sh_timer code away from bottom-half based ptimers to the
> new transaction-based ptimer API.  This just requires adding
> begin/commit calls around the various places that modify the ptimer
> state, and using the new ptimer_init() function to create the timer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/sh_timer.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -168,12 +173,14 @@ static void sh_timer_start_stop(void *opaque, int enable)
>      printf("sh_timer_start_stop %d (%d)\n", enable, s->enabled);
>  #endif
>  
> +    ptimer_transaction_begin(s->timer);
>      if (s->enabled && !enable) {
>          ptimer_stop(s->timer);
>      }
>      if (!s->enabled && enable) {
>          ptimer_run(s->timer, 0);
>      }
> +    ptimer_transaction_commit(s->timer);
>      s->enabled = !!enable;

Ew.  Future cleanup should perhaps be

- static void sh_timer_start_stop(void *opaque, int enable)
+ static void sh_timer_start_stop(void *opaque, bool enable)

    if (s->enabled != enable) {
        s->enabled = enable;
        ptimer_transaction_begin(s->timer);
        if (enable) {
            ptimer_run(s->timer, 0);
        } else {
            ptimer_stop(s->timer);
        }
        ptimer_transaction_commit(s->timer);
    }


r~

