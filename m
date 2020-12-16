Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AA92DC239
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 15:32:13 +0100 (CET)
Received: from localhost ([::1]:40806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpXqe-0007r7-Ph
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 09:32:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpXnf-0006Ym-MD
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 09:29:07 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:33145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpXnc-0004NG-71
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 09:29:07 -0500
Received: by mail-oi1-x22c.google.com with SMTP id d203so6482934oia.0
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 06:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yX8oh9OFrCrOK6zBlImiBMUiq8bf5odPXVLucoTkLrE=;
 b=hpwkD2uTpI1KuaIX2273t8978r6nEkuBlAmsbMQgAkxCUJlGug9zFZBH6tywe2SIn8
 0ml8obPSLAyOSob0uqjPI+5Xexu++80BP46OTxBX6H3sz0VESvy5oyNvYc0Yy7VBLKcf
 g6pwIyOTtQfqMhCtv8O7/Lo0kqbPo6qtUb2eqetvtpQPp5gkMi3Y7t3hxVQ82LmV23Vl
 r8R+rH8W1O27ZGtN5OpkFDYUFO3fXIPb1rW+B0E34E0wMfk6qUqCeRHN1MUb58bInz2w
 iEOsqJLHabY5BehUG5sewUJBZmCxYLCLU4eBnUCHB52qZ37PlhoYPWA2yWZmWJkvIoDp
 6fiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yX8oh9OFrCrOK6zBlImiBMUiq8bf5odPXVLucoTkLrE=;
 b=FJAHIqsxo1LrsIiwaIFWl533s4MtYsTlNG6g8jk8FdlabN55Q7api602IAtOopV4/P
 b/IEwtu+SIx9baLXw+SJH0eHGCQB3GBWTNgLDcK4igFk+nOtMz1HAEycm9eLGmpgFu80
 WQj74P4538OUE5jBAaL6i6nh6+YunFcfi0eOeccJ1bLYhr9Bck8/cuUVq0cmC36jeVvu
 sruVlJbYsQj23d6goS66xjykNQYyPXWCDgazHgzxLSPIuCa+EAXJgY4vpixW0y6kG5hi
 Gol3JqscgGjxryxFmaujHHo0/xV/SfNnR3Zslxiy5IXx74z53GL3N3BTPGHn8DmJArrv
 zTqA==
X-Gm-Message-State: AOAM531qvc0YY4CMF+/rwmVpZnMamMFQ5TI+ZKjvAkOTx2FOhi7osoou
 Zc55TEtduD2Z/Rm5NnxbzOnFnw==
X-Google-Smtp-Source: ABdhPJyxwvXfG5eDAv5Prrk437OBglhrfoBja4gSgTztxAZ0Lo2mhpLakAiWkFu+QooZzqvM5HekgA==
X-Received: by 2002:a05:6808:650:: with SMTP id
 z16mr2123927oih.50.1608128942653; 
 Wed, 16 Dec 2020 06:29:02 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k23sm422432oih.52.2020.12.16.06.29.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 06:29:01 -0800 (PST)
Subject: Re: [PATCH] tcg: Use memset for large vector byte replication
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>
References: <20201215174824.76017-1-richard.henderson@linaro.org>
 <c95edce5-98fb-a1c5-116b-f1736b389fd4@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a9383ed6-c6fd-801e-a80a-b3bc5798021d@linaro.org>
Date: Wed, 16 Dec 2020 08:28:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c95edce5-98fb-a1c5-116b-f1736b389fd4@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 5:38 PM, Philippe Mathieu-Daudé wrote:
> BTW (nitpicking) I'd rewrite the epilogue as:
> 
>         if (!in_32) {
>             tcg_temp_free_i32(t_val);
>         }
>         tcg_temp_free_ptr(t_size);
> 
>         tcg_temp_free_ptr(t_ptr);
>         return;
> 
> t_val first, because the !in_32 allocs are few lines earlier,
> t_ptr last because allocated in prologue, so keep close to
> 'return'. Matter of taste ;)

Yah sure, you bettcha.  Queued with this.


r~

