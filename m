Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A538A4FC6BC
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 23:27:04 +0200 (CEST)
Received: from localhost ([::1]:43246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne1Yt-0007oW-5r
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 17:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne1Xq-0006v6-QY
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 17:25:58 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne1Xp-0007h6-2F
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 17:25:58 -0400
Received: by mail-pg1-x52c.google.com with SMTP id t13so15278497pgn.8
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 14:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sRby2bOaPDKAxFkQPioOKnuwq3Xk8NfKxaMchTyO4eI=;
 b=JUwVThg10oorycix0bk0c7pr48HQSA7+1kgE8y3BXBiUj1h8SlKF5GZIBfMhqawgvB
 rJZ+cxHG3Nm73lWPRpKuZ1OMBN2SpqsdmRZ+yjbtVeaqU1aDH6XIIRyZpAW5LyHjpjte
 xZy1TwTODnU/69XUz2fk9gRCiK9ojwwtMhB2VGhAUgRychzTJulLjwB4wGEqhG6hRCbb
 OAsdRXS0XEwFpxVo5vTseSKJV2CXaPcnsJD4dW2ktAweJtlkQLMGlUEUicm1zriuSXKc
 dglI23IUmfCpgAnDcXNnNhTGW3HONGYS5F2tUcVf3BAazOpGAm+0/j7wwU5Odk3Mk6A3
 t/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sRby2bOaPDKAxFkQPioOKnuwq3Xk8NfKxaMchTyO4eI=;
 b=FEwQpWi5wte85zhtAQah747ZqOIH2V7wYHxjBqJK3tt5/BBTvV1XxpQD1G+v3rDYHp
 kOmAWJSMku3FO/dQ6qDDqq4FyrB9VgKQ5canoqe9evpGCl8Td9N5Gd0JQUZ9vv/UaOcb
 Iwgp9QDWbIHa/YpzFmDX9Do8QWKey8IGmBsUTUkx0vzaUW0vF4ch7SgFmGxDIay+mAIy
 UQCAqCVw+/ErUgVvND/CLUjVO3AlD9gW8I7FwQ0f3TDndINmnRdPz1IbqVkzXwH9YguA
 Y5hSZUfXsqJCXvt7o5MscNnZWKHWvCsxyX7ulH6P17NJGJ83y8tvGyaDvokRtUTJWpQ9
 LLJQ==
X-Gm-Message-State: AOAM531cNCpnK5HQudL3pA6D3lYSGRJX6aEsWkVUJ/ZFkB5vm+MQnvN4
 ceemFwDSqPNWUDztpq8DlT2VCA==
X-Google-Smtp-Source: ABdhPJz5LQ0HUg4CCrI5hX8nCzN/jWslInU1BRcfXpCfr6Y6kaZ3DYLCqb/AnX2iVfWkM96bLOYDug==
X-Received: by 2002:a63:5c43:0:b0:39d:5e18:9d98 with SMTP id
 n3-20020a635c43000000b0039d5e189d98mr5492293pgm.145.1649712355184; 
 Mon, 11 Apr 2022 14:25:55 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 c74-20020a621c4d000000b00505be1ae39bsm4967889pfc.9.2022.04.11.14.25.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 14:25:54 -0700 (PDT)
Message-ID: <2dc12f93-9e47-f4c9-f4ed-0cc3ae8f5b51@linaro.org>
Date: Mon, 11 Apr 2022 14:25:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 11/16] target/arm: Add minimal RAS registers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-12-richard.henderson@linaro.org>
 <CAFEAcA_ASQ7Dwm5YMsXvPa6SS721HNuUkD7JPSCpuNOyDikJtw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_ASQ7Dwm5YMsXvPa6SS721HNuUkD7JPSCpuNOyDikJtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/11/22 08:49, Peter Maydell wrote:
>> +    { .name = "ERRSELR_EL1", .state = ARM_CP_STATE_BOTH,
>> +      .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 3, .opc2 = 1,
>> +      .access = PL1_RW, .accessfn = access_terr,
>> +      .fieldoffset = offsetof(CPUARMState, cp15.errselr_el1) },
> 
> By my reading of the spec we could make ERRSELR_EL1 RAZ/WI, because
> writing an over-large number has a number of behaviours including
> that the value the guest can read back is UNKNOWN. That would save
> having the CPU state struct field.

Good point, I should have read the fine print myself:

If ERRIDR_EL1 indicates that zero error records are implemented, then it is IMPLEMENTATION 
DEFINED whether ERRSELR_EL1 is UNDEFINED or RES 0.

so perhaps it's better to leave it UNDEFINED.


r~

