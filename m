Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6EC58AEBE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 19:17:55 +0200 (CEST)
Received: from localhost ([::1]:43544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK0xM-0003uk-Qi
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 13:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK0tg-0000iC-I9
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:14:08 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:45603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK0tf-0001ci-2C
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:14:04 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 p14-20020a17090a74ce00b001f4d04492faso3434343pjl.4
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 10:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=c25NtfiMfapjqrCHe8cykKb5bKDMypITxuRE1Xv8kPI=;
 b=CJOUxczoE/KbJQu57Wv2XGMSmerEO1j0B8puMZqLWqokTu1GXsW+T6lE3cKr9b5uX/
 93dbCDPg7b2JPqDk67qmZhov7gZ652dkJsb7CKq6twV75cCgv/mwyu573pSDK4OT5qW6
 1NCWTugI0X2LJKrlUMebbjH39bvkk2eY+FpWiIJllqt0WR6L96tfHXLnrph4xfJ1IZDx
 ZR5VEYhpRYjA8UH7ot0+WVrStyWmQppQvDFMIItE9ciFBEOAQKz8jm40ium71Cg1P6ZE
 oruj3LQc4ieIVcpI+R0DEAlBzQeL72Ec2k/sW3NYsO6QTYLy9ucY+swh1yeowf3wMTzj
 AfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c25NtfiMfapjqrCHe8cykKb5bKDMypITxuRE1Xv8kPI=;
 b=oHmEKh0WuofvJ2ptJx9v4bsKilZmSxZDq+B8iH54vUztSebXUZaOjVfPxV70479ttj
 lj9m9rVJoyBSG1AHdpvWfdA6f2flnlFWL5pKXmXumfFBwuXgk9XreMIl0cwJusEDqMdQ
 5hipTvPS+uz1s+Oy+CfjUgE7kRpD8e/cPDpp6b+ffweBa16WV6gW7lVOX6+JaDcAPhZC
 37sqCWFjnkdpThLEB5luF2kpmYJclaxXSRL6vtQABolz3TBJi8YSwodihiJg5n2JXLni
 TU12Rd70g6zQrSbGjLJZvZ5PFutJLWbxSVDkzBwQnOvmU7nSH5yh9qDR0wiJ+kD3s69a
 CQWw==
X-Gm-Message-State: ACgBeo3SiJQ4meX/JfuoaQ0TB9HL4iRiAZz6jQn+CGgDeXhekFXfim7S
 nzy1o/B9YzvWHETopRO6MpHqWA==
X-Google-Smtp-Source: AA6agR7KWKTKvNE8EEH3bbugM4lize/kBi9JtJ9ZhLmP/rqr/aH5YFkr2JCegG8289hrY0wzzQWhqg==
X-Received: by 2002:a17:902:da8f:b0:16f:6b6:eed7 with SMTP id
 j15-20020a170902da8f00b0016f06b6eed7mr7595222plx.85.1659719641713; 
 Fri, 05 Aug 2022 10:14:01 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:abf8:e436:f4c:9089?
 ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a170902e19400b0016edd557412sm3191899pla.201.2022.08.05.10.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 10:14:01 -0700 (PDT)
Message-ID: <2f197863-1060-ada4-ba1c-1dfb4a2e0fed@linaro.org>
Date: Fri, 5 Aug 2022 10:13:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] fpu: Add rebias bool, value and operation
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Cc: danielhb413@gmail.com, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220805141522.412864-1-lucas.araujo@eldorado.org.br>
 <20220805141522.412864-2-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220805141522.412864-2-lucas.araujo@eldorado.org.br>
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

On 8/5/22 07:15, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> 
> Added the possibility of recalculating a result if it overflows or
> underflows, if the result overflow and the rebias bool is true then the
> intermediate result should have 3/4 of the total range subtracted from
> the exponent. The same for underflow but it should be added to the
> exponent of the intermediate number instead.
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   fpu/softfloat-parts.c.inc     | 21 +++++++++++++++++++--
>   fpu/softfloat.c               |  2 ++
>   include/fpu/softfloat-types.h |  4 ++++
>   3 files changed, 25 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

