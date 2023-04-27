Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E51D76F01E6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 09:38:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwCb-0005NE-5s; Thu, 27 Apr 2023 03:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prwCZ-0005Ms-M6
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:38:03 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prwCX-0000gE-Ao
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:38:03 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5052caa1e32so14350666a12.2
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 00:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682581079; x=1685173079;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HH1pHhUMTluKxX3gupRH3GULwCwfR7hfjuoqFKOdalo=;
 b=bvrfa1mmIabpNeLWF2JO8qrQp2JZLgFT8dOFZEpZhd7SVpp7+J3qSIds3V3MCIBaIk
 fm2dhcyft9DW0kFVqwWXg8/FK5y4cIVFUCads5kyN4xsGKwUlP9rXBcvMuf/0FUoYybh
 7HxdAmXqPRpMvmBTmX0wyR7SAFOWuW3wFDvT/Wq1IlTrvtxwI1YMBorzweLtulI4q1YN
 T8Iy7wfQKm0iSXgx/abc1Bho3IZsZ3rIMbS9vcvd6cyWH1L9ctFUBxAJJ95iKO28Vo+8
 xjOs8XlH7vqMxpp/7UQljl92E5L2DF6Q2ztYU9Y+6WqlhmshOEEwt43KwcuWf/9rr60K
 xh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682581079; x=1685173079;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HH1pHhUMTluKxX3gupRH3GULwCwfR7hfjuoqFKOdalo=;
 b=RAl/8+niM88rP/kFi0H8DVVaP+Z0pSsAJbo/Kw7sTb1j0N/hpB/sq+CKBOKTAm7hAU
 vmCaoMG3HVeDl5BQiTiDQ5T61Mqz5lZUgJNwl7L3/l3oM5C4z1hpoGq8lufAkTkjdAsI
 XeXZjSckjGs2RXumOaon00KHYCCXzCgjw7+xZFWjfnxv7Te0cxcfwOvkRRYxOh13llhk
 /HZ3RSOXy+15beILwu4E3IW50gyzvmIN6H4+BMMQ7fGWbo/APatzyZu8LioCQXX+rtqj
 y0TQxnanUl3aAFRiGzcfc7n6+IDxF6b7aSns3DLSTl/dQJv3CzUtx3CLkMPUgHkdExOX
 XZEg==
X-Gm-Message-State: AC+VfDzplD/rLBf1QbwU7siDpNWIQyqY8vtv0NxBStsQwrk3bLxJDHLI
 fmdJOAAkZKeROQDgQxcwU3xG2w==
X-Google-Smtp-Source: ACHHUZ7ukJNacHuljwjoZiVu4wSNlBP2pX7AjRmVD2nqhYZH4atTFwna7vahkJFsDkxBZaTbAej8XA==
X-Received: by 2002:a17:907:96a6:b0:94f:2c22:a7a2 with SMTP id
 hd38-20020a17090796a600b0094f2c22a7a2mr729264ejc.68.1682581079639; 
 Thu, 27 Apr 2023 00:37:59 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a17090616d900b009534603453dsm9092450ejd.131.2023.04.27.00.37.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 00:37:59 -0700 (PDT)
Message-ID: <3b87ac4d-89b5-b508-9a8b-f1ffde6942a7@linaro.org>
Date: Thu, 27 Apr 2023 08:37:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 08/21] Hexagon (target/hexagon) Clean up pred_written usage
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>,
 "anjo@rev.ng" <anjo@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>
References: <20230426004202.1319250-1-tsimpson@quicinc.com>
 <379e70f9-2d04-dddc-fe5b-d4eee3bde62f@linaro.org>
 <SN4PR0201MB8808836FFB4552CC5BB90215DE659@SN4PR0201MB8808.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <SN4PR0201MB8808836FFB4552CC5BB90215DE659@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/26/23 22:27, Taylor Simpson wrote:
>>> We remove the last use of check_for_attrib.  However, new uses will be
>>> introduced later in this series, so we change it to "static inline".
>>
>> This is insufficient -- clang will warn about unused inline functions within the
>> main C file (as opposed to #included).
>>
>> Use __attribute__((unused)) instead, and remove it when it gains new
>> unconditional uses.
> 
> Is it OK to use the attribute itself or is G_GNUC_UNUSED preferred?

I've been using the attribute itself in my patches, e.g.

https://lore.kernel.org/qemu-devel/20230424054105.1579315-1-richard.henderson@linaro.org/T/#mb07f0d1393f7f0a252f459dca6a91a2162581281

But either is fine with me.


r~

