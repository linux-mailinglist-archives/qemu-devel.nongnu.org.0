Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81076F41A2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:30:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptnH8-0005CZ-B4; Tue, 02 May 2023 06:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptnH6-0005CR-FL
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:30:24 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptnH4-0008Dj-VN
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:30:24 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-2f6401ce8f8so2163373f8f.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 03:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683023421; x=1685615421;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OtUOwQL26onW78F4qRDW17/A3P6PyzNniDeQgihMTxA=;
 b=xKlGuEseFkKO3JhtMa3AZZKH1NHDU2M12YMvhqD7f56xZv/c6lf/eVVkw/LYP8gfoC
 A1h8g9s4k/3LPt5tkAmtVm9Y05HTX0gqXJ0y82mqbg6y6J+zO1AOmI8Pv/H7fypJ24zj
 FzfYNu87FUD5GPGo61l73HtQK9DVsxq0d/mMQlT0wFCbKpO/ZAIJTLq3xl87WS6PxRlT
 nZDS42kBIKkotArkPO6dB9v3CgC4VGMHTvvCGGkPPwH3I/CatyueZIyDKthal/1/p+IE
 M2gzkQ30ilyCqHd4/9eYt8ZD8lsC54moNmfyrOGsXyfa/jegg04a8gwUDzRyySZ/cMuO
 XfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683023421; x=1685615421;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OtUOwQL26onW78F4qRDW17/A3P6PyzNniDeQgihMTxA=;
 b=FO4uGS5FAcO99OMk5CgIyNKE1LwIB9m59hnmmXGdCZT62SqrOOW9aaEZ6yCg60xq3T
 w+qXiSf+Q//fubCjEJSK8Z7MVGLZaBmpVqtUSOup0ETT9bWgEsMoUAdqUvutfFWyUAbz
 /uO++P1rY4f16LkWQsKk0T2/MeWg6Ae9TD35E3hR9arohieYKP6IvnZDAdQ227d/Fdpi
 eRdQzBd6xTrYMPyoQWFVcgTL+kXPZ1+mgl47unATN/mYMSMSFIkgq0H2Iozqv3iZBrOC
 yKOQYnGb/D32WXIHC/VxzM7BZR14dX70kSYI95VJ+qjhrw14eUYE3JgGazx5Jj9mCTng
 KcSw==
X-Gm-Message-State: AC+VfDxLDT/rsL09xe97P0b0oosJ23Yw0f3Lv9/074w81Jbj3FlEBMAt
 azAwIroPwZd/6s3ekwfPQMafeGjagvQpKIu+i3w2KQ==
X-Google-Smtp-Source: ACHHUZ4KdvZPw8D64yMRWPRm54Bf5pcj1Q8VdqqhssLTmpqD42iCbYuxYJ4P1BSJfb5ScXpJQ8J93A==
X-Received: by 2002:a5d:6291:0:b0:2f7:f6e:566 with SMTP id
 k17-20020a5d6291000000b002f70f6e0566mr12755414wru.31.1683023420971; 
 Tue, 02 May 2023 03:30:20 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:ad29:f02c:48a2:269c?
 ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 f11-20020adffccb000000b002f90a75b843sm30575115wrs.117.2023.05.02.03.30.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 03:30:20 -0700 (PDT)
Message-ID: <c861f41a-1342-f792-4b48-250fc68f10dc@linaro.org>
Date: Tue, 2 May 2023 11:30:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] qemu/int128: Re-shuffle Int128Alias members
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20230501204625.277361-1-richard.henderson@linaro.org>
 <87h6svt95r.fsf@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87h6svt95r.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
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

On 5/2/23 09:44, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Clang 14, with --enable-tcg-interpreter errors with
>>
>> include/qemu/int128.h:487:16: error: alignment of field 'i' (128 bits)
>>    does not match the alignment of the first field in transparent union;
>>    transparent_union attribute ignored [-Werror,-Wignored-attributes]
>>      __int128_t i;
>>                 ^
>> include/qemu/int128.h:486:12: note: alignment of first field is 64 bits
>>      Int128 s;
>>             ^
>> 1 error generated.
>>
>> By placing the __uint128_t member first, this is avoided.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 

Queued to tcg-next.

r~

