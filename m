Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EA73BC21C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 19:11:32 +0200 (CEST)
Received: from localhost ([::1]:32898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0S83-0002OM-Sc
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 13:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0S5o-0007VN-Gc
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 13:09:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0S5j-00053N-Ha
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 13:09:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625504945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CjpqM5oUkePOpH2pkRQRc+ER5RDbQa2eErQGMrZQHak=;
 b=U1vjgAk4AOoJUhuNPKUsJwwZbVnE2YODfom+yjpDUcieX4oQjlN28UJYAHXVhnAOs3CFHA
 QB44iNcJHzftDHuAq4mgWHXA8KMHUwCsktltPK709nKtG2n99fQHtFsBQkqBSu3FSHErkH
 HpkZnY67VgMByVnkaH0+ig6iiqHLf2w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-2ApppAXDNiuZwSi9Q2n-EQ-1; Mon, 05 Jul 2021 13:09:04 -0400
X-MC-Unique: 2ApppAXDNiuZwSi9Q2n-EQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 u7-20020a5d46870000b029012786ba1bc9so6401216wrq.21
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 10:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CjpqM5oUkePOpH2pkRQRc+ER5RDbQa2eErQGMrZQHak=;
 b=LDGAUrRo7Jq0Jf1NIZfS2/Wni56gy7BbqZmQXabQNzhXKwVQuppCnuEgXUUtwDTVlP
 o9VoRQh8wkwIYzu8kKbONzgqgE/shkeSK14qf8Enb709+MAaazqq7/g52zx5ADnC0p8/
 XelyOYnHI97fK1+UXfLgPxNYP7YMSrHhwbn1rhGggeo9+jMGvOzM1lDcJ1j9Cf+p02IS
 tQN87QrMh65sIyVS13SsxKrcthjDJ8rf2ho8I5AEp5js5AuB6ZBShmfgsoZ7T2T863fH
 zDQv+jDoNzKKbt0ypVPS+tjclbhGTaRo8Ow+yxPet3EcT0JSmkHdWgjYMEiWImnIM4KU
 XKdA==
X-Gm-Message-State: AOAM532oBFSlAmGv31juTLCu87IevvxruU2GGoNR7FeimoXQbvRNVzxj
 BLHnDxuNkXFXLPWFxVKHydDQGvUmE47DoeAlgzIx83e4aFi9eIILy7LFo7q+aEejB150SQ+qqjw
 ZJdfMHwQDqmynIAUfhX6esaNDf+tskLgKpgXRUQYdPJ8Qh0cUBwV/OKQ68y82BrsKkAo=
X-Received: by 2002:a5d:66c9:: with SMTP id k9mr16730401wrw.399.1625504942643; 
 Mon, 05 Jul 2021 10:09:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFvhYv9FGpwnr+Oj4dRHOo286WBcIS0/qYpDgb5UgLdevSThiPuVz7DPlPw+mYHaaMG4/AzA==
X-Received: by 2002:a5d:66c9:: with SMTP id k9mr16730365wrw.399.1625504942329; 
 Mon, 05 Jul 2021 10:09:02 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r9sm8944392wmq.25.2021.07.05.10.09.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 10:09:01 -0700 (PDT)
Subject: Re: [PATCH 1/2] coverity-scan: Remove lm32 / unicore32 targets
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210619091342.3660495-1-f4bug@amsat.org>
 <20210619091342.3660495-2-f4bug@amsat.org>
 <CAFEAcA-hnZjzZp+k7-9CT5gaqTvri049fOuk0HCHk7tvD8eJ9Q@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ee03593e-b2ce-1585-1f3c-77fa6397ca8c@redhat.com>
Date: Mon, 5 Jul 2021 19:09:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-hnZjzZp+k7-9CT5gaqTvri049fOuk0HCHk7tvD8eJ9Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/06/21 17:16, Peter Maydell wrote:
> On Sat, 19 Jun 2021 at 10:13, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> lm32 has been removed in commit 9d49bcf6992 ("Drop the deprecated
>> lm32 target"), and unicore32 in 4369223902a ("Drop the deprecated
>> unicore32 target").
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   scripts/coverity-scan/COMPONENTS.md | 6 ------
>>   1 file changed, 6 deletions(-)
>>
>> diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
>> index 02a3447dab0..183f26a32c9 100644
>> --- a/scripts/coverity-scan/COMPONENTS.md
>> +++ b/scripts/coverity-scan/COMPONENTS.md
>> @@ -21,9 +21,6 @@ hppa
>>   i386
>>     ~ (/qemu)?((/include)?/hw/i386/.*|/target/i386/.*|/hw/intc/[^/]*apic[^/]*\.c)
>>
>> -lm32
>> -  ~ (/qemu)?((/include)?/hw/lm32/.*|/target/lm32/.*|/hw/.*/(milkymist|lm32).*)
>> -
>>   m68k
>>     ~ (/qemu)?((/include)?/hw/m68k/.*|/target/m68k/.*|(/include)?/hw(/.*)?/mcf.*)
>>
>> @@ -60,9 +57,6 @@ tilegx
>>   tricore
>>     ~ (/qemu)?((/include)?/hw/tricore/.*|/target/tricore/.*)
>>
>> -unicore32
>> -  ~ (/qemu)?((/include)?/hw/unicore32/.*|/target/unicore32/.*)
>> -
>>   9pfs
>>     ~ (/qemu)?(/hw/9pfs/.*|/fsdev/.*)
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> NB that somebody will have to manually make the changes to the Coverity config
> on the website as well.
> 
> thanks
> -- PMM
> 

Queued this one (and made the manual changes).

Paolo


