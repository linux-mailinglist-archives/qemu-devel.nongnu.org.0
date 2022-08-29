Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446975A5149
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 18:16:10 +0200 (CEST)
Received: from localhost ([::1]:48808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oShQl-0005Hs-Fe
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 12:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oShLX-0008Kh-Gt
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:10:50 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oShLO-0000y5-9C
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:10:39 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so4742007pjq.3
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 09:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=jNxS+KLtIPbA9o30+lSX/iJyjoKjUHvpP6c0XWwmCJc=;
 b=Imrvh8H3fP0gKrx7HTTqwGLsZskLXDT4Hrwy56T7mqdSx4ZCDyixvcKR3mdyWeTBry
 XLYzAOmpzdCNuQOle39sV3UzYqk005Et3kJuDI0Fezvcbe4BfeVf8i/FqFkW371l5W85
 9lJE3m8vlMf1EkGq6o6MnAqYgiCTuAt1Lu+dXysjwwnMUw6+vzCEJ4v4SnGTM4egu0Qy
 Al97clodmmgNq6KG0yTLI9SSn6B6eQll+v7Z+3vBmjnFQGlybRGRqp5jDM/zwbLfOe98
 2RuISmgY/9A4cdWMJ4DY5K3RigNr8Ww5QReLAH4kGWE+ZoRtahobXHD8gZPVRBjM9hKP
 SS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=jNxS+KLtIPbA9o30+lSX/iJyjoKjUHvpP6c0XWwmCJc=;
 b=a66JBGavvpKZrAMoV/ZnZ+jS0yfmRbGSpQrn7gyfXfg+3T0HYOHyKnNhaMofiL3MO4
 yIvQCcEJBWeu2gQcGTU8vwk+cl1wqxwf138d7ZDUTiGfFatYSZm1svQwcVHBX/oKGY9I
 f2oXiuiCqz51g2TNOGDikIjfFHLvTPTrkBay9c2bqVtsOjHmnl1MOWH9g6PuCjYEMbxR
 WeaqdSchNbRAIZlyJEpHhes/lkkSmamG4kRVqUm1M4liSgvTUcxs60DaH3p0TnS83aDi
 UYBzSATlTalF9+c9EYg/0e1u/eFatRAiY2hmDcGfDGNPm/2GvVHWQdhtUG1z1v4vftoM
 PMLA==
X-Gm-Message-State: ACgBeo3KCzfaf2hsV68OQpOrbD6KMTLhdk2r9YKoLRyBv+B3I0TF0gbY
 P9k9I7z+ub6yAS1+opxiKRIkEw==
X-Google-Smtp-Source: AA6agR49wMkKF5r0R7CIJl7OAuu6y8E8YJIFJ/qIF1jYzmm6n1eRDt/d6jVGZbVoIMA7V5K9CFRENA==
X-Received: by 2002:a17:902:6b42:b0:172:ed37:bc55 with SMTP id
 g2-20020a1709026b4200b00172ed37bc55mr16799683plt.33.1661789432667; 
 Mon, 29 Aug 2022 09:10:32 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:be85:d5a:94bd:75bd?
 ([2602:47:d49d:ec01:be85:d5a:94bd:75bd])
 by smtp.gmail.com with ESMTPSA id
 i63-20020a626d42000000b00537b8aa0a46sm7580418pfc.96.2022.08.29.09.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 09:10:32 -0700 (PDT)
Message-ID: <ecaee2a6-c2be-388e-425d-3cbe3dda2a4a@linaro.org>
Date: Mon, 29 Aug 2022 09:10:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/sh4: Fix TB_FLAG_UNALIGN
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, ysato@users.sourceforge.jp,
 alex.bennee@linaro.org, qemu-stable@nongnu.org
References: <20220829021325.154978-1-richard.henderson@linaro.org>
 <c2c0edec-c93b-f6fa-b148-9452e4e7b7@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c2c0edec-c93b-f6fa-b148-9452e4e7b7@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 8/29/22 02:05, BALATON Zoltan wrote:
> On Sun, 28 Aug 2022, Richard Henderson wrote:
>> The value previously chosen overlaps GUSA_MASK.
>>
>> Cc: qemu-stable@nongnu.org
>> Fixes: 4da06fb3062 ("target/sh4: Implement prctl_unalign_sigbus")
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/856
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> target/sh4/cpu.h | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
>> index 9f15ef913c..e79cbc59e2 100644
>> --- a/target/sh4/cpu.h
>> +++ b/target/sh4/cpu.h
>> @@ -84,7 +84,7 @@
>> #define DELAY_SLOT_RTE         (1 << 2)
>>
>> #define TB_FLAG_PENDING_MOVCA  (1 << 3)
>> -#define TB_FLAG_UNALIGN        (1 << 4)
>> +#define TB_FLAG_UNALIGN        (1 << 13)
> 
> Is it worth a comment to note why that value to avoid the same problem if another flag is 
> added in the future?

Hmm, or perhaps move it down below, so that we see bit 3 used, then bits 4-12, then bit 13.


r~

