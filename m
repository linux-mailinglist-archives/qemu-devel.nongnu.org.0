Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E7632CA4D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 03:03:17 +0100 (CET)
Received: from localhost ([::1]:40724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHdKe-00023E-7Z
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 21:03:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdIq-0001Se-DN
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 21:01:24 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:33315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdIo-0002TZ-KE
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 21:01:24 -0500
Received: by mail-pf1-x433.google.com with SMTP id 192so10727190pfv.0
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 18:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YO0QtM/0DfLNQFg+ef16B4+fbBIxtq201AO9nj2bxd4=;
 b=at1SDy5of4SfGtowEbzAnZSx9K5WOI7yC4ZJK2FPQXIpS4cZ9hPoqdn97v8/taP5AL
 QrkReRIz/pdeLpHa5EsJPXFKD2NAwvh5Myd14cqMd5UAAufi/c334ZKLgJ+QB7wWNiIu
 Vw5H8dwJp023goGZjZpRoottbtyf5T74FGVOfpRagm0dCtm0JeVvJ1VquojxlGbX2+G0
 VhNj3Fv4StHci7qR+z/pfbFUtXIkd9W6/iicgXdg/+KISB+RBL0nrG5e/G/JldHKuXr+
 w6pM1/Wo1djyQB0iRKKOp4FdP7n0drIaHQ7lCIE6YuzSrqx5KF/5cGWrDbNEvlRMsdeo
 BRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YO0QtM/0DfLNQFg+ef16B4+fbBIxtq201AO9nj2bxd4=;
 b=Be/PD5aBL/nqUG4IHACILw8MAXFedIY25bnkwzu5NIHrf5483lNp2QMOE5td8MUEZT
 XnTnLCH15bnhdLHs9Z3oYoO30wnD89I4yV5rbOXbAxxMFLZFI0wbuVNE346Zx7dyliKv
 nBv8VDdleIa3GDkn/C6NHOyuO3pCCB3EsuLZLPy+LbaYXAgnkSLX+GJR5KP7jEuJxlYU
 dpOSOUPbM6P2y5nB3r4gGVticsLhc5FBCUmPXrrwzrj6rrqtgUffjBk/NZrw/cvijWuX
 Otz0e09NRNMZsO2f3H1/qg97ugS2vk7CsH9cUtJryMjyZX8j2gCwskN606GMXZGiefTl
 l6tQ==
X-Gm-Message-State: AOAM531CqsJM7V14YlyH4weGGzU9cOgzCsRI1WmAq6JJ07bOyJLtSQbT
 VTqiMRcyk1ENVa7/ls6ZOw2B7g==
X-Google-Smtp-Source: ABdhPJxYWTIOSBVYzYTYueXOAaFdbrLewZ79NJijtX3V/iASIbpcNkgTmOW1cQ1CIzda53/a6odycQ==
X-Received: by 2002:a62:5344:0:b029:1df:c7d:3c3e with SMTP id
 h65-20020a6253440000b02901df0c7d3c3emr1637408pfb.11.1614823281175; 
 Wed, 03 Mar 2021 18:01:21 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id y63sm18409404pfy.68.2021.03.03.18.01.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 18:01:20 -0800 (PST)
Subject: Re: [PATCH v2 08/24] hw/arm/mps2-tz: Condition IRQ splitting on
 number of CPUs, not board type
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <343647f5-8b2e-6e98-944c-d6cb47f668ac@linaro.org>
Date: Wed, 3 Mar 2021 18:01:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> In the mps2-tz board code, we handle devices whose interrupt lines
> must be wired to all CPUs by creating IRQ splitter devices for the
> AN521, because it has 2 CPUs, but wiring the device IRQ directly to
> the SSE/IoTKit input for the AN505, which has only 1 CPU.
> 
> We can avoid making an explicit check on the board type constant by
> instead creating and using the IRQ splitters for any board with more
> than 1 CPU.  This avoids having to add extra cases to the
> conditionals every time we add new boards.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


