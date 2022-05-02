Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54126517B1C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 02:01:44 +0200 (CEST)
Received: from localhost ([::1]:35564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlfz5-0005aG-3F
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 20:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlfxK-0004j2-R0
 for qemu-devel@nongnu.org; Mon, 02 May 2022 19:59:54 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:43592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlfxI-0004s9-Qh
 for qemu-devel@nongnu.org; Mon, 02 May 2022 19:59:53 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso694403pjj.2
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 16:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=/6N++rATlhaiduQ5L4IVlX1V3UnUUWIZkgivu1sR6+o=;
 b=TSUVEt5+y0GYQeCPB+KzUroXeA3qF7rWPajL3EVKOVVPlgWRqkDmYB0zHWjyVvTs1E
 1BcISM8QhgwY8DkZ+d3G1AV+So1oyLFlNrEgk7RfKMdzQ8c5sCe7zvWZ3jbOrk7yLedM
 J2GzpVJiZ7NK3tmnPWRS3EE0ZMqnLXukz7Na/BbLuRr86HkGjgIYdHaQdWridC8BwU2n
 2JKsjuZzlQtdWxvQqpo66T0Mpyoh0GM8ARbRdNmgtF6PvVR+aVL/iC75aeAX9RvzDO2K
 PNO8MWjqa5e3XQPQWL/t+Zck/u2lqvkfDkt/d8OGqaV+pyuXT+/PFN+16IB75XrRu3HE
 /RwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/6N++rATlhaiduQ5L4IVlX1V3UnUUWIZkgivu1sR6+o=;
 b=LV7xc0tdtdgDW45JNxcVx3YxdZH2+yPtGQy7s37VjdwaaeuenrwsZ9hR5KcmQa3op2
 Vv5YPEnc20eTvn5rrVYk/UEM6oyAuio8dbDk3MJ4W7fzLuSf65mNUtG+l5X0DdrO8dOl
 g2wHuktq8smlldxveO4J4dsAwJD5J2FCNfUB39Rk7t1pptvOUcIlmX407uWB8ESswCY1
 UgvnXrupmg0djQL2UD/n8QBC9pjQ6LNE0ZMlN1qA7tAtqZ1ZtKJ/5FYqBwq8c2rsx6Mm
 wZrVIc5i8HZq9IRUP4jsNH0f9Eajzg03oeIGecQrzeDky0JHFHtchYnCVMN0v///d0zQ
 OAQA==
X-Gm-Message-State: AOAM531I+awAkOZ1XO2BDDMthYnP+9jb9lhd1RAo/w8qB/pUNaMO/21Z
 lylUCalcCXdzXDNeNCxXauRhwXkXs7wvKA==
X-Google-Smtp-Source: ABdhPJyZNLVYBzrIbVDpJ4kAU5ca83wjlSTupbeFWXXPrsZWpfnFaJFHPigr6fQ9KtfAygkHzeh0PA==
X-Received: by 2002:a17:90b:1c86:b0:1bf:2a7e:5c75 with SMTP id
 oo6-20020a17090b1c8600b001bf2a7e5c75mr1783870pjb.145.1651535989894; 
 Mon, 02 May 2022 16:59:49 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a170902dacb00b0015e8d4eb27dsm5209548plx.199.2022.05.02.16.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 16:59:49 -0700 (PDT)
Message-ID: <c6d3a823-b9a4-411a-b4b8-5fb1f1c9c214@linaro.org>
Date: Mon, 2 May 2022 16:59:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] hw/openrisc: use right OMPIC size variable
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel@nongnu.org,
 openrisc@lists.librecores.org, shorne@gmail.com
References: <20220502232800.259036-1-Jason@zx2c4.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220502232800.259036-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

On 5/2/22 16:28, Jason A. Donenfeld wrote:
> This appears to be a copy and paste error. The UART size was used
> instead of the much smaller OMPIC size.
> 
> Signed-off-by: Jason A. Donenfeld<Jason@zx2c4.com>
> ---
>   hw/openrisc/openrisc_sim.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

