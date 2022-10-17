Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0D6601C12
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 00:08:59 +0200 (CEST)
Received: from localhost ([::1]:48498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okYI6-0007XV-BO
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 18:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okYD6-0001zo-Qq
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 18:03:57 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:40939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okYCz-0002Ra-Ok
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 18:03:47 -0400
Received: by mail-pg1-x52a.google.com with SMTP id l6so11645622pgu.7
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 15:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YSDH4zi0/StRIIVDTOoiOmf50RC9g5KEf1ziWa+XPf4=;
 b=MBAJ+fym9fihkb1CJfFyQtjhxu3Hb2s7dNnDGD5oDu6oQ+uRcz/Zntava8KpR3PnXo
 ObOM02NCGqJ+Z2hsa0XcrnZw7mI+P2QcqT+AxE0Jv4B4CjooGgkGAwhpe4ttKbx0uiUi
 xolVzTQUgI+jKOCgJnT++CKTZqyMbzn8/KEPWg4wnnuk7Zo89FxrLFA4hVpPESwZNAgZ
 Qy1fDKMTzCYMTY1x3rsouTw3bjfEsvens81xZcEhzOheiH8dgWpqLYndbITf7YKdoCJU
 TOfCZNOASdzXCGxMbugTu1L7DtuKcnDqo6/ryvYnFsL8LlQhgDqwg5jLkEK++8Sd5iTa
 d50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YSDH4zi0/StRIIVDTOoiOmf50RC9g5KEf1ziWa+XPf4=;
 b=aJ1ABgu1ssuELIK0kjC3jXK0Y2fNQeOB5rZ0TW/liKTHkCYzkiTZ4exhjMa0el1kW3
 CjxLdKDZ5m19cTiJkd9MuiFQWBh1HJNcKNhSCrgaLDCybt53/sLp+4CLzGwFd0ckeTs+
 K477j8HASjrSbts/R3jHj83Vj7XFnk+V56vTsoP9kvGv9bax/56y53jhQkUlb9K7Hiv7
 LtirjpNHD4Dt9tGx5z60NndSAweK00gN+wBNILqs4vY/xCTO2+pEj5iy6iPjgMeaWzZT
 FmK8JZMFFC2ejLxyCju9uN8mL4tXH0K8X0sWZqhr/JhtBC4LnkQAxCmFTvNTWxEINglb
 GZ4A==
X-Gm-Message-State: ACrzQf0eKbSX19KiXDaSyT93KPeKNN2ZG7jmNCZBow7BKr9VlWjmXeag
 xhAfjNFjg0omIbPFMTemZP4siw==
X-Google-Smtp-Source: AMsMyM6qDw5J6B9wXeDgA3VK8UeqHIvvHMy2+8BWIxCoeU0AY6j8hFRTvpxAb1rXo4CeLtg6R1PfeQ==
X-Received: by 2002:a63:ed0e:0:b0:457:4a30:cb8c with SMTP id
 d14-20020a63ed0e000000b004574a30cb8cmr12169154pgi.161.1666044219628; 
 Mon, 17 Oct 2022 15:03:39 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 jg4-20020a17090326c400b001753654d9c5sm7093560plb.95.2022.10.17.15.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 15:03:38 -0700 (PDT)
Message-ID: <48d0c28c-30d8-56e0-7fb3-c074c2ea72e2@linaro.org>
Date: Tue, 18 Oct 2022 08:03:10 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 9/9] target/arm: Enable TARGET_TB_PCREL
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221016220932.274260-1-richard.henderson@linaro.org>
 <20221016220932.274260-10-richard.henderson@linaro.org>
 <CAFEAcA9i6gXEcQ2F6=Yq70iCx_XiRdHRu0V8pTEurXYDotmA_w@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9i6gXEcQ2F6=Yq70iCx_XiRdHRu0V8pTEurXYDotmA_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/17/22 23:48, Peter Maydell wrote:
>> -    if (use_goto_tb(s, dest)) {
>> -        tcg_gen_goto_tb(n);
>> -        gen_a64_update_pc(s, diff);
>> +    if (use_goto_tb(s, s->pc_curr + diff)) {
>> +        if (TARGET_TB_PCREL) {
>> +            gen_a64_update_pc(s, diff);
>> +            tcg_gen_goto_tb(n);
>> +        } else {
>> +            tcg_gen_goto_tb(n);
>> +            gen_a64_update_pc(s, diff);
>> +        }
> 
> Why do we need to do these things in the opposite order
> depending on TARGET_TB_PCREL ? If there's an obscure dependency
> then it would be worth commenting it, but it would be nicer
> if the semantics of the functions were such that they didn't
> need to be called the opposite way round for the two cases...

For !pcrel, we can skip the update to pc in the linked case because the destination knows 
the full virtual address and can easily store it when needed.  So we skip the update when 
we can simply to reduce the dynamic instruction count within the TB.

But for pcrel, the destination cannot easily update, i.e. with just addition, the full 
virtual address without it always being up-to-date on entry.  So that's the rule there.

A comment, then?



r~

