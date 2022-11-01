Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F89A61506B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:19:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opu76-0005hj-WD; Tue, 01 Nov 2022 12:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lyan@digitalocean.com>)
 id 1opu75-0005hS-Dy
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 12:27:43 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lyan@digitalocean.com>)
 id 1opu72-0008Nl-Du
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 12:27:43 -0400
Received: by mail-il1-x12d.google.com with SMTP id h18so8039101ilq.9
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 09:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=digitalocean.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ULcvOWnASIWSpOZfj+O5veGMB/9fqxylquA+67wojKc=;
 b=LVqajFfNhU0WarNjU8P9FmDKoAPW7/YiT5V43+GfDvdWIRAVh+E/U2k2Ms5JEZ/ydB
 DNEnceI4Hq7U/RH+kb3pluFqKdUXzE0pCd6wyRlc+pfEiO/V6GXlqRporI1suspBUXBh
 AXbNVBnLtFEEaI1utzPdqMjwVeYRYgGO8wDWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ULcvOWnASIWSpOZfj+O5veGMB/9fqxylquA+67wojKc=;
 b=wXXtUvZxEfwt0jC34Cj4XUgDKm0XQpsWbsHOmQN/RLS3Ak05sCLFkUMwTAYpx7nyou
 Y5GWKT8k2078XaCMX4aJhidBExU9aWPwpoEMtB+wyrhU/HLf0t1OqawnGznkShJ+inqN
 SS7RbNZYKZd3DJKdyGePdhF14991UXZJZNSjZn34/Y3Ya+UbHX8GIDvwLJkHyBWyy5ti
 TtVwyTyd7MwN6dwVDO7kNJyhO3MF2C5DOaNFvtWT/ZBM0536CupFMKT0blc/GXRdX+Ua
 raoShj7CUxBq13HFAHvM7dncswSk7DKV2tJRqg8YQm/xPWu1vcGJCMyfrAK4uORmv+Hh
 TljA==
X-Gm-Message-State: ACrzQf0ArgzNw7JKdecHy7eoG6fITtbENDujZkmX31fI+muV+/pbvtTe
 MVNAItJCqlUebk/VeBwPA1EKMw==
X-Google-Smtp-Source: AMsMyM5VNHPLWXNRTy3doWG0A/9Cp4v5cubBm+z9wsVhAMSvyl4N4M2G505u86U2CF9VokeJP4JagA==
X-Received: by 2002:a05:6e02:180c:b0:2fc:4018:9440 with SMTP id
 a12-20020a056e02180c00b002fc40189440mr11019896ilv.225.1667320057420; 
 Tue, 01 Nov 2022 09:27:37 -0700 (PDT)
Received: from [10.10.19.99] (64-60-50-130.static-ip.telepacific.net.
 [64.60.50.130]) by smtp.gmail.com with ESMTPSA id
 g22-20020a05663810f600b00375192e7484sm3685274jae.90.2022.11.01.09.27.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 09:27:36 -0700 (PDT)
Message-ID: <bba88122-91e7-41ca-72ec-415f3916c3f2@digitalocean.com>
Date: Tue, 1 Nov 2022 09:27:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] target/i386/cpu: disable PERFCORE for AMD when cpu.pmu is
 off
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yang Zhong <yang.zhong@intel.com>, Jing Liu <jing2.liu@intel.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20221028150243.34514-1-lyan@digtalocean.com>
 <87tu3ks3w4.fsf@ovpn-194-149.brq.redhat.com>
Content-Language: en-US
From: Liang Yan <lyan@digitalocean.com>
In-Reply-To: <87tu3ks3w4.fsf@ovpn-194-149.brq.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=lyan@digitalocean.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hey Vitaly,

On 10/31/22 6:07 AM, Vitaly Kuznetsov wrote:
> Liang Yan <lyan@digitalocean.com> writes:
>
>> With cpu.pmu=off, perfctr_core could still be seen in an AMD guest cpuid.
>> By further digging, I found cpu.perfctr_core did the trick. However,
>> considering the 'enable_pmu' in KVM could work on both Intel and AMD,
>> we may add AMD PMU control under 'enabe_pmu' in QEMU too.
>>
>> This change will overide the property 'perfctr_ctr' and change the AMD PMU
>> to off by default.
>>
>> Signed-off-by: Liang Yan <lyan@digtalocean.com>
>> ---
>>   target/i386/cpu.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 22b681ca37..edf5413c90 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -5706,6 +5706,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>>                   *ecx |= 1 << 1;    /* CmpLegacy bit */
>>               }
>>           }
>> +
>> +        if (!cpu->enable_pmu) {
>> +            *ecx &= ~CPUID_EXT3_PERFCORE;
>> +        }
>>           break;
>>       case 0x80000002:
>>       case 0x80000003:
> I may be missing something but my first impression is that this will
> make CPUID_EXT3_PERFCORE bit disappear when a !enable_pmu VM is migrated
> from an old QEMU (pre-patch) to a new one. If so, then additional
> precautions should be taking against that (e.g. tying the change to
> CPU/machine model versions, for example).
>
Thanks for the reply, it is a quite good point. I was struggled with it 
a little bit earlier because cpu.pmu has such operation for Intel CPU. 
After further talk with AMD people, I noticed that AMD PMU is more than 
perfctr_core, it has some legacy counters in use. I will dig a little 
further and send a v2 with extra cpu counters and live migration 
compatibility.


Regards,

Liang





