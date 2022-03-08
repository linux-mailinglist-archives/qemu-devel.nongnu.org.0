Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B534D220F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 20:54:43 +0100 (CET)
Received: from localhost ([::1]:53922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRfus-0003h7-8x
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 14:54:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRftZ-0002pq-WB
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:53:22 -0500
Received: from [2607:f8b0:4864:20::536] (port=45688
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRftY-00018A-DT
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:53:21 -0500
Received: by mail-pg1-x536.google.com with SMTP id z4so33371pgh.12
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 11:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sIBwEsI1xFP7jjHipDHqE2J5mnOyEJJBpn6PBvx9C9s=;
 b=fonDwRQ9hYVDM34EjfKsrvfOM1Ope4siCwdpjxCW8VqZ3mnVP1vaabt51suF6RVpQo
 0EeS+p/ZUg0pSjNSaJB67idhrV6+duFqo2ksSmzJwsZ2rmonIuny39urF+Pb9Ps49BNU
 Lf35R7tCH77xKCgBq9vD6G3aUz43Urn3tdnmw1afYz5qLXJkHlRNVatEdagB29bQzxOK
 aNtO6Tx6SuZUPp55rJT1RTzqZVIIPfR07KewUO57NKL0Rkjbu+xQz0pxGpeyZfDNnRVA
 djFzLh4qH08fkYug0sJruxvy9SdEgEJFJLvNoQrSFCi6J6GrysVn1y8DZ8Il7ZGD0/pq
 H53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sIBwEsI1xFP7jjHipDHqE2J5mnOyEJJBpn6PBvx9C9s=;
 b=s64LyfS8+Kcr1Kb/X4sw8fUoO8v2b+LtQxwfbav5cHZpMmRg/v0TT5IfjUsA7CeOE/
 +c5QXFGEUarhPWNljjbzDvRLhKZfC8A0vovt50RFI90uMSkb7EHs/QX3yCOR5H9q/GH9
 rIr3HxLh2L88lZFDrkFK/EArTG8x89Y60UxLbnLKa+pfqLGMvz96iDmQ1I++CROwWj9Z
 MWt7z/7469arIWp3ULKI6w0wZILa3rDgtvi4TUiGsRvbXcXu70hg5cIKUifY+QdGDxWc
 db3yoTSsadg/yThWVpv3CKhPF/tWSjzq7qqAkzAHy45t7bKFqrkvM3ZbiAIwnMtvZfh8
 0mpQ==
X-Gm-Message-State: AOAM533KBAMCJ11p8zPcHiNUau0DTNpeus6XV0bL5EUsS+TW/06MccLq
 h5EExNzqNyUwjPcIrDY28HJ8cAqoQAcjcg==
X-Google-Smtp-Source: ABdhPJwQXtoMN5ymdAaxAilnFd5XjyHU1HKqnYO5FvF46kQNLZGHGkypRl25zSJR/Q3XKxfc/BHFiQ==
X-Received: by 2002:a63:2155:0:b0:374:a199:c381 with SMTP id
 s21-20020a632155000000b00374a199c381mr15792188pgm.319.1646769198925; 
 Tue, 08 Mar 2022 11:53:18 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 u15-20020a056a00124f00b004f67314db4dsm20728928pfi.104.2022.03.08.11.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 11:53:18 -0800 (PST)
Message-ID: <58bdf0d9-0feb-818c-036f-e4d6273bc8d3@linaro.org>
Date: Tue, 8 Mar 2022 09:53:15 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 30/33] hw/intc: Vectored Interrupt Controller (VIC)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-31-richard.henderson@linaro.org>
 <CAFEAcA_isAdx2LtDJ8WjoXazjOcqPgVUbwQMXEL+gyiQV53JCg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_isAdx2LtDJ8WjoXazjOcqPgVUbwQMXEL+gyiQV53JCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/22 01:27, Peter Maydell wrote:
> On Tue, 8 Mar 2022 at 07:20, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> From: Amir Gonnen <amir.gonnen@neuroblade.ai>
>>
>> Implement nios2 Vectored Interrupt Controller (VIC).
>> VIC is connected to EIC. It needs to update rha, ril, rrs and rnmi
>> fields on Nios2CPU before raising an IRQ.
>> For that purpose, VIC has a "cpu" property which should refer to the
>> nios2 cpu and set by the board that connects VIC.
>>
>> Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
>> Message-Id: <20220303153906.2024748-5-amir.gonnen@neuroblade.ai>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
> I reviewed the version of this patch that was in Amir's v3 -- has
> it changed, and if so how, or did you just drop the R-by by accident?

I don't believe that anything changed in this patch. I used tooling to grab the patches + 
tags, so I'm not sure what went wrong.


r~

