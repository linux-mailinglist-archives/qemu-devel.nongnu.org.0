Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018FB69E610
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 18:34:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUWWX-00029s-HW; Tue, 21 Feb 2023 12:33:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUWWR-00024E-At
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:33:47 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUWWP-0001uZ-LX
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:33:47 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 nt5-20020a17090b248500b00237161e33f4so3583510pjb.4
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 09:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vd7ChOI1Bgg8685Hw6NtaZOVDOqN2cdUHMRSaf+rP5U=;
 b=aLFPhKPjceMWxWmGh4VKYrYK39uLxsx9YpPVGC0yI4gP42D86KKXtP/22ramGKBViJ
 bnf6GBpCSAmOZrAVR5H7WlMhNLhS2aFVY5wWDrNf/Dqt4JRD0tt2y8TUi6mI6IUp2Htn
 S3vvADTDin2669OwS52OThBaogzohl2wnwElCvj25+TX/PwXmySa13u/dbb5wJiBiEo+
 YCr6JX5jRawt+WPKrb8uv+vFyQdpbE0+xMkHQ3DFEx73Tz+JrKcn7mQ8thzfr/zOHvI1
 By4RW1D+EQeqolcRLOHhVDQlyzE/WNynlUkEpw9GyA2lzEWordd1CeoYszTpPr1XfGyU
 PZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vd7ChOI1Bgg8685Hw6NtaZOVDOqN2cdUHMRSaf+rP5U=;
 b=tAQV4E7Tje8ZCxj10Lky1qVfXXHymxmnf5kqNFTEy8hxHcR6kkKSnxipm+UQEt7Ese
 5BDZqi1uAa3o1rwTS2MZR2V5AOwmWYR6ckWV/sTwuupgQ+z4rcvcFS8XTkeG3Wh9GOkN
 7VdRvgA/F1bIbcna5IpCpaDffxlN3lYq74lWsI/NeGFMbDhjMEOWnEDs72LT4VWoaGGq
 FrNCTHraUaBKCZo/AE0rn4N5zt+pcpXl7BoM8+sb08Vrj6fx9ZXNSu9TqhP3yVwDZTgQ
 rJIslUCxPsK/U+NPjLi1FXPNb4t2JBxCxgLVVQkvhwRu68N21mOyEZpaBBO0tleZn42b
 5KIw==
X-Gm-Message-State: AO0yUKUqLaWzeN6X2oqqL9s9thWCrC2pggJNPCbIuXTHRqxW0UI6OBqf
 AsFPDdg32JuLs+9TSgconZZDwQ==
X-Google-Smtp-Source: AK7set9OsNBiczLhpeiJc7bznOtEG9960VANSqz3ssb8Z3poSsHx1flpcdQOrN0SJSF2ytdZJjx6VQ==
X-Received: by 2002:a05:6a20:3d88:b0:c7:6f26:c85 with SMTP id
 s8-20020a056a203d8800b000c76f260c85mr19490610pzi.36.1677000824026; 
 Tue, 21 Feb 2023 09:33:44 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 z192-20020a6333c9000000b004fbe67bab14sm4486696pgz.0.2023.02.21.09.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 09:33:43 -0800 (PST)
Message-ID: <c7234c83-3e53-6867-55f8-7e9ab97a5c2a@linaro.org>
Date: Tue, 21 Feb 2023 07:33:40 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 14/14] target/arm: Implement gdbstub m-profile
 systemreg and secext
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
 <20230221021951.453601-15-richard.henderson@linaro.org>
 <CAFEAcA8nexWsqRKfjR20_OhNr5d54LMHCsGwZHrZmkng2jwgOw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8nexWsqRKfjR20_OhNr5d54LMHCsGwZHrZmkng2jwgOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 2/21/23 07:25, Peter Maydell wrote:
> You also want to enforce the RES0 bits on registers like
> PSPLIM, MSPLIM, FAULTMASK, PSP, MSP, if you're going to
> implement writes. Effectively you really end up wanting to
> get helper_v7m_msr to do the work for you.

Ho hum.  I should have known it was more complicated than all that.
I should probably just drop the write portion of the patch again for now.


r~

