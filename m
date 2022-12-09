Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE61648375
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 15:11:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3e5g-0003rD-P1; Fri, 09 Dec 2022 09:11:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3e5d-0003nS-Bw
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 09:11:01 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3e5Y-0007bO-1n
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 09:10:58 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so5855729wma.1
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 06:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xiTMElwewJCwPZ8uDUwvPiPfpuIRqVYZpGypXQA8B0Q=;
 b=UAghkYNuBFAYXl659XqyCSomqkgzqWEmEWzEau1N3kADX61zvFlUIfu25I2mIbvan8
 ggAarwbB0m3r1KnnYJElrJDMopSJZby8A+biMNfs2Yw9M0rFMbA16Gl+JtgOvyzxQtks
 VPp+s5l8BUtPBMyWohK/gS1OQMXH/YTX49bmzSiXPGrS9QpM0qqQj+4o4A4dBzraeLwk
 /oeBWV6fJthtKqoj1SWpdzGt/s0tZMOSfkwHZ7klkhaySeJw1Z+CQtphyhRswxJ3CSIo
 DnsoR1F4L8kvcpim8WLrOwjxS3FlkHTUy6Y1P3CF/b/WMQ0QHINFHbLzXIFpEM8Pi5yN
 u2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xiTMElwewJCwPZ8uDUwvPiPfpuIRqVYZpGypXQA8B0Q=;
 b=6yLowrgFcZ/U3UuB/n5NN62ShhIgZEhQvSLJJ7d+VF4jXzdx1ySYnmme6YchoIUFo+
 10H9Prw6Z0kY+YBxRZ5aJAgyXvzowm1Q3EN69PwuOl07kF425ApxF1XmGWtvS/dINlpD
 QD4k6ve3hGmpj/OrCTPK5mMwDXNw261s5+ZJLuWWURvJfq51KMgTY2Zs7RXOW9OWtfpq
 TTtYgscFZCR0j8O3WRcHxYc0xk1UcI0ZSGky5KolvxpnKnyXner06mH897FzD7eIR92B
 mLiXF1JVlT/Dck3i5HO267KNHvhGu3ORyr82U2+BVO7VZTbtUD9FXKnSHKfafnm65A51
 x6xg==
X-Gm-Message-State: ANoB5plEDa4uC8NwPJK57wH/AU8kQHWPBV4/WVo6TN7YofUYcg049lSP
 fEZkhaqaLzqrvd+wiUdA/lrFJg==
X-Google-Smtp-Source: AA0mqf6GpQW2ZzzAf69GNDH7UQjm5g9Vd2YH3J1RXkPl0ITLKG3ELEVrCeBR1HMl1TiQ9fe8yHkuCw==
X-Received: by 2002:a05:600c:4f95:b0:3d0:1f6b:7156 with SMTP id
 n21-20020a05600c4f9500b003d01f6b7156mr5283706wmq.10.1670595054525; 
 Fri, 09 Dec 2022 06:10:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i22-20020a05600c355600b003b4868eb71bsm9401627wmq.25.2022.12.09.06.10.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 06:10:54 -0800 (PST)
Message-ID: <067655d2-f0b0-23bd-5952-27f6f1c82b08@linaro.org>
Date: Fri, 9 Dec 2022 15:10:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 v3 1/2] physmem: Remove unused
 "exec/translate-all.h"
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221209110631.59031-1-philmd@linaro.org>
 <20221209110631.59031-2-philmd@linaro.org>
 <CAFEAcA-ScTH2=2ayQTKy6+_fgj-3kAmQ2Oqxr4bPieimLBKCXw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-ScTH2=2ayQTKy6+_fgj-3kAmQ2Oqxr4bPieimLBKCXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
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

On 9/12/22 12:43, Peter Maydell wrote:
> On Fri, 9 Dec 2022 at 11:07, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   softmmu/physmem.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>> index 1b606a3002..d562c0bb93 100644
>> --- a/softmmu/physmem.c
>> +++ b/softmmu/physmem.c
>> @@ -58,7 +58,6 @@
>>
>>   #include "qemu/rcu_queue.h"
>>   #include "qemu/main-loop.h"
>> -#include "exec/translate-all.h"
>>   #include "sysemu/replay.h"
>>
>>   #include "exec/memory-internal.h"
>> --
> 
> physmem.c has a call to tb_check_watchpoint(), which is declared
> in translate-all.h -- where does it get the prototype from if
> the header isn't included any more ?

Oops indeed, sorry.


