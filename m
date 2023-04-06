Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCA16DA3E3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 22:44:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkWRe-0004he-Hv; Thu, 06 Apr 2023 16:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pkWRb-0004h9-RV
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 16:42:55 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pkWRa-0000YS-2w
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 16:42:55 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 hg25-20020a05600c539900b003f05a99a841so6417212wmb.3
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 13:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813772;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4AD3Uic8gD168QJjpJzqusml8cbEibOHgzvF8XkpqJ8=;
 b=YRjxieod/ln1No5DqVkKroaUJ2lN4PJVCKLGo/jodn/a87IrBKubSNs9FGOc8OCuIk
 wrnD1+iho1LVjf+9UHQoD8Yj2NofGRumSyS39/sBrNoaA9hK5vXjYtnkI0GQERDGYCo2
 g0JZ7q03GL0ubmwaojBjlI1snjGCuojxpnm7wen9m6A6syzbEmdEdHEDgssWlv14NAX8
 zXmIz0z9BGuGaFpWAoui1+UbKGpR4tKO2PEdFFfMPax8nxtbiJcPW3o0vopGRJFUSn2S
 f4ozU097Uw+tJ90dHF7MhwgN3+B3CscyoIBqbeIgOpMogr/gKd+4nUtxaaxXnqfpN/0Z
 qtpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813772;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4AD3Uic8gD168QJjpJzqusml8cbEibOHgzvF8XkpqJ8=;
 b=tSfR+rtD2mGK5h2tsi/j7/pPoZpX6s+HHH+Vy03RxLXfNo3jB4PdOBnCFDqmN/7/4e
 pT88BvSybhz0kergDEfHERaSsdTHCy/zoEqul9ac+t4Gho2NsSwrl5QTnTv+ta+Rl7Hc
 yVGO+V7H69neN07XcwAtAjz+uUwDtdI5G6k2mzspHjWPiP8t2+St1Vn/nM7ZjmGSl6c3
 XYrzCYhpC8D5BARU+9VOXDHhbCnbFn7YNPP2CB/3IxMi+3gcGjKJrmmuuYZ/T0+U8bBa
 lmqNBmoKQkNiI4L30jLBNORjZ6xJL3KhwCpTidNoIbonLIX2F/tRnJSPL724PCa5+cmN
 qvPQ==
X-Gm-Message-State: AAQBX9f9WGbT56U7pIQhj3RiHpnGg0o66Bbj/f7rOOa+yY9h4DOoW8RH
 qNYL0dhSpAsoHsTxkbR5bp1uYg==
X-Google-Smtp-Source: AKy350ZE04YBAopxgVED6sY2dtODiNsXBIpRzVNHi8QI/oKWbY4h/R8MnONT27TJdeHRsR52toFirw==
X-Received: by 2002:a1c:6a13:0:b0:3df:e468:17dc with SMTP id
 f19-20020a1c6a13000000b003dfe46817dcmr7835537wmc.40.1680813771903; 
 Thu, 06 Apr 2023 13:42:51 -0700 (PDT)
Received: from [192.168.1.101] ([176.176.140.188])
 by smtp.gmail.com with ESMTPSA id
 r10-20020adfe68a000000b002c7b229b1basm2696271wrm.15.2023.04.06.13.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 13:42:51 -0700 (PDT)
Message-ID: <b966fe8f-5a02-7cff-2d45-40c3aa0686c4@linaro.org>
Date: Thu, 6 Apr 2023 22:42:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] target/i386: Avoid unreachable variable declaration in
 mmu_translate()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20230406155946.3362077-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230406155946.3362077-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.224,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 6/4/23 17:59, Peter Maydell wrote:
> Coverity complains (CID 1507880) that the declaration "int error_code;"
> in mmu_translate() is unreachable code. Since this is only a declaration,
> this isn't actually a bug, but:
>   * it's a bear-trap for future changes, because if it was changed to
>     include an initialization 'int error_code = foo;' then the
>     initialization wouldn't actually happen (being dead code)
>   * it's against our coding style, which wants declarations to be
>     at the start of blocks
>   * it means that anybody reading the code has to go and look up
>     exactly what the C rules are for skipping over variable declarations
>     using a goto
> 
> Move the declaration to the top of the function.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/i386/tcg/sysemu/excp_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


