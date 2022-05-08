Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD39551EB40
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 05:20:49 +0200 (CEST)
Received: from localhost ([::1]:53162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnXTT-0001zF-6h
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 23:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXRd-0008MN-Qj
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:18:54 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:36757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXRY-0008Vw-MT
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:18:50 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso14224883pjb.1
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 20:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=pXCc9S2BvAdz7Q8OWuBVmgIKLmiowGYDG8WsNkYkUbg=;
 b=LQSIOL5+InmOITjgjSr1JymyXSdRBeZtn9kzopclDbsRjoA/8+5czsDdVj8KyOLkt9
 WFEo/Wq2v5pfsIUrTXDDzUzB8Dhqwth8IInfIoYGYNw3Fa9wF+9gOvOWmXvTfd0ERyAu
 1lg2APYfK5sgkCGYCD3yKIibTOYkzg8QtuyCeWE4Pq72AnFrjCJLC0NBh8v1zXeLS8bF
 vXseud/B2GeuezvGvzWtY2wJ8Lo9i6Xt8dvwmqd33O/Vej0/jQA1dm4H1O9HTUq6jzH5
 UWxP9Pwdf3JVxWqF2JU7ruHTJMPQyfeU5vIXctF0rUfM3EKQCCGcUcw2i84wg/nWLvnQ
 5/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pXCc9S2BvAdz7Q8OWuBVmgIKLmiowGYDG8WsNkYkUbg=;
 b=4laib0c4mJ8+Z/Vm7dqhRBYPuhZqU+2X/1+ca6VctgJC4HZwxVQ7Y9wvt7jDSlnVWn
 yIDgq0wYm2fLMUuUVHpRhjeQjrVhaRUWt45zsosPuaqsvlToMcHOeol5nzEgPaQ3/+bu
 daYApihTIta7/xGrBpk5222I+s349xzdL2QQmhbIcYEubqn8jQR+uZt0QSGDt4o1cfJf
 TC4oUkdHsu8f9hcWEPAY/XiHZSllpOL3Ll71dDsQvlCuvJkLfOgfbgfN7yNFneZ2aNsM
 3560k2lxIcUk9XnkT2lfQ2i31Rr8olRtOoSI2FoKHSYjHKxCS1A9XwrfIg5o+rdMw6jS
 Q4ww==
X-Gm-Message-State: AOAM531ofYXHKOkGQuEzL3qdb1DAlOA3Jbwyb5na7X/6tdZlADanx0cl
 4MlIfJQSPevYPRnvP3Iik7ZAXg==
X-Google-Smtp-Source: ABdhPJxLuTzYJ2oa4Iux1aneM5PLQkWNHUnMv03DuzyEWCYUxiwBf3gPWSlIYCz1HlmB9mjZLcwdSw==
X-Received: by 2002:a17:90b:601:b0:1d9:5a0f:2017 with SMTP id
 gb1-20020a17090b060100b001d95a0f2017mr20189968pjb.162.1651979927264; 
 Sat, 07 May 2022 20:18:47 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 d28-20020a634f1c000000b003c260491adesm5779322pgb.82.2022.05.07.20.18.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 20:18:46 -0700 (PDT)
Message-ID: <48cc5e4a-6b88-110d-222b-9e342c3297e0@linaro.org>
Date: Sat, 7 May 2022 22:18:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 48/50] hppa: use MACHINE QOM macros for defining the
 hppa machine
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-49-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-49-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/machine.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

