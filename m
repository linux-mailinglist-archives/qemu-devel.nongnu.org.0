Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79989543C83
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 21:10:37 +0200 (CEST)
Received: from localhost ([::1]:46036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz14e-0003HJ-CL
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 15:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nz10O-0007uQ-1W
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 15:06:13 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:55276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nz10F-00045M-4D
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 15:06:07 -0400
Received: by mail-pj1-x102a.google.com with SMTP id j7so19436427pjn.4
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 12:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=QVIZ0FndJV/7ObXDf7PFnuv7IOpwJmAkLNju7hQdi5w=;
 b=mzbxPe4nNB7XROGME5dVxYLt90F4Odlj4T05m8zJDy0pFQwuSq67w4hG5svFYcnGvP
 UYv0aRwgCz707ZxQmSQLPaDGKhIiDe99WoQv7sovgqZ0uCEFEvmStLBOMfIEyB6TupJU
 /VSC4+d98BY0p4KIAILiqmAs6o74cIjL5EgDsndla9ZptmmUG6cRyqvAQQMlT8T9xU2S
 tFtChSy+so9b6FMJOU5OUbhEXcdpYZEsk8IqCq9SZ2qjOgQwBlwdMAgfOeQP1mfMKM8k
 U4x3SQntsUvmsFyGec30VQWYw8COLBX5ji+fhhblnNi2j+/2GHyJY9hKSxpezRq0Y1ri
 3r0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QVIZ0FndJV/7ObXDf7PFnuv7IOpwJmAkLNju7hQdi5w=;
 b=Lled3Cv1z2UriJ1YDKU7Dr894OSXSPkhwa+Qx9vhItm5vO1Vr/drEXK2+YOa+PRycS
 u5RxUkIF2kM4wSG/XBVS+pSZdjgkGSiqX7kd5kcTljbS7ypFeTg2seoIs23tYVClizqq
 LpfDP05c+9ErdHwVbDq4cRaXLlSzeGg9YmV9aF5iwXyOYUZsfXCihd483aYRBMZuk41o
 ig1wyrjn0h1BgHtQhRs0FW17fd4GhnoTHqqaXypoU+nHGO0l1G2P5M0i3GJGHs8fExLJ
 VwMScnSsXnQke7jqF89snJN/9YkNbFLGVL+0jRdBU91sHAuJdyaNmWhjI84DH+ZRpYw7
 XHbQ==
X-Gm-Message-State: AOAM531aibpgaL4Xo3ayqbiA9Weh0A8H3FXk9S+06+c3eptmIfB+5A2H
 BJKhxVcDgRzYVuZyIF0sl5BWUA==
X-Google-Smtp-Source: ABdhPJxchP4nNBx1Q9csdcB7Y/jG5DIaIXAqzNHOAmClqT/tHHuO2Z9HjvbnfBYnF2VCocvEmGrqiA==
X-Received: by 2002:a17:902:d504:b0:167:756a:f992 with SMTP id
 b4-20020a170902d50400b00167756af992mr19672816plg.160.1654715160755; 
 Wed, 08 Jun 2022 12:06:00 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:6812:d08e:b22c:43d7?
 ([2602:ae:1547:e101:6812:d08e:b22c:43d7])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170902c10400b001677fa34a07sm6545212pli.43.2022.06.08.12.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 12:06:00 -0700 (PDT)
Message-ID: <9c42516d-a238-a1d6-3f01-aaa8fc018eda@linaro.org>
Date: Wed, 8 Jun 2022 12:05:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 0/3] target/m68k: semihosting cleanup
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220607222616.717435-1-richard.henderson@linaro.org>
 <56b31126-41c5-e7b6-5b32-2b64ba1cce67@vivier.eu>
 <8f833280-b1bb-d4f4-6603-5be44ee8e9b7@linaro.org>
 <09f9a931-6873-bd98-74ed-e1d17318d76e@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <09f9a931-6873-bd98-74ed-e1d17318d76e@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

On 6/8/22 11:08, Laurent Vivier wrote:
> Le 08/06/2022 à 16:53, Richard Henderson a écrit :
>> On 6/8/22 02:36, Laurent Vivier wrote:
>>> Le 08/06/2022 à 00:26, Richard Henderson a écrit :
>>>> Based-on: <20220607204557.658541-1-richard.henderson@linaro.org>
>>>> ("[PATCH v4 00/53] semihosting cleanup")
>>>>
>>>> Changes for v4:
>>>>    * Split out of v2.
>>>>    * Convert host errno to gdb errno, which for m68k is guest errno.
>>>>
>>>
>>> How do you test semihosting on m68k?
>>
>> I have only compiled this.  I had been working on adding something to tests/tcg/m68k/, 
>> which is where those halt patches came from, but haven't finished.
>>
> 
> But what is the use case of semihosting on m68k?
> Is there a kernel implementation available for that?

Not that I'm aware of.  Do you want to remove it entirely instead?
Leaving it as-is should not be an option...


r~

