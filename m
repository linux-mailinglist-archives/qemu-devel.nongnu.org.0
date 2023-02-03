Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133D468A128
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 19:07:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO0Si-0004qR-Qg; Fri, 03 Feb 2023 13:07:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pO0Sg-0004og-2U
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:06:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pO0Sc-0007uy-Ox
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:06:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675447614;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Vl7vw0Mm7wCeLo6bAshp+vifL410x3yZW83E2i5FK4=;
 b=McXkGzHlTBcT5c1iNkPqNAsqcCkB48BTEixMDSba4801B5qLe2j4OmX9EmDrsFsKsSjamB
 b5MbWm/C9LVR64ufaLWTNdYVz89Wq+hW546bBNcEivzY4DFv3/e+cfhQmMAY/bk+bXDLAK
 KXa6pRw4byqGL0icJ2KUtSrWDFWJy1I=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-151-WmBHhSSmMy6oDbQBY4aWVQ-1; Fri, 03 Feb 2023 13:06:52 -0500
X-MC-Unique: WmBHhSSmMy6oDbQBY4aWVQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 v186-20020a37dcc3000000b0072a264a6208so3779568qki.21
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 10:06:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Vl7vw0Mm7wCeLo6bAshp+vifL410x3yZW83E2i5FK4=;
 b=GofTvp4Cl6T5aR99BDwBLZVK7ZH5YyEQZr9gRIEyGL/Eu7G0kh/HH7OgWggWryJG6c
 Y/UTd8hEspHeDW7puKyXPiSE9j4/PwaI9M4hyjiQVZEWBlDXoCF5B+bwxudrPYGyF+r5
 tb+RvSaMKcKOsd3OCbO4+eatPv5Hl2pPJgQd5toRjaGZ9bwYkyhdUBCYVlMycDHEkEgc
 ZyD8mD9PIt2ugDW/tlyHnTJ5+e9ssJniGlpYM3SAhDk5NYiOkTBI2zHEo/ynlxMeYxu0
 zD0DjdASGdIqI+hGcAjnrVpvIOlni/hW18KXGRdm+gVfXyXYOhCPvoOhqvgu8BJM9wvT
 s0gw==
X-Gm-Message-State: AO0yUKX/0bGpAePU/2YZ15M9U6ozdRPonBNnYpESaMmK3w5dOw0NE6zY
 TcFfFl9c9J4bbMQSfB2jXbi23CEIvYP5jAwIftFRumywxQfKOQNEnW7XS5wXCy5MwzHKDaIGpfR
 25AB5Mz+GU+aEA04=
X-Received: by 2002:ac8:5c43:0:b0:3b9:bd05:bde1 with SMTP id
 j3-20020ac85c43000000b003b9bd05bde1mr18569396qtj.8.1675447612292; 
 Fri, 03 Feb 2023 10:06:52 -0800 (PST)
X-Google-Smtp-Source: AK7set9qQNqgnRakHad7HCyi5fIj3CBXxi1NG0YGWBUTYQ+p0kbtchSX1DRSC3dMSuFALI0BuVQSSA==
X-Received: by 2002:ac8:5c43:0:b0:3b9:bd05:bde1 with SMTP id
 j3-20020ac85c43000000b003b9bd05bde1mr18569370qtj.8.1675447612069; 
 Fri, 03 Feb 2023 10:06:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 y17-20020ac85251000000b003b34650039bsm1975685qtn.76.2023.02.03.10.06.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 10:06:51 -0800 (PST)
Message-ID: <a1bee850-dc09-b1de-f762-970a06ad30a6@redhat.com>
Date: Fri, 3 Feb 2023 19:06:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] target/arm: Add raw_writes ops for register whose write
 induce TLB maintenance
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, richard.henderson@linaro.org,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20230203171657.2867598-1-eric.auger@redhat.com>
 <CAFEAcA8qz8qsZNsrbbnmvVUgRazsxtGVm59enyU1rf2ZHjx+ow@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA8qz8qsZNsrbbnmvVUgRazsxtGVm59enyU1rf2ZHjx+ow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Peter,

On 2/3/23 19:04, Peter Maydell wrote:
> On Fri, 3 Feb 2023 at 17:17, Eric Auger <eric.auger@redhat.com> wrote:
>> Many registers whose 'cooked' writefns induce TLB maintenance do
>> not have raw_writefn ops defined. If only the writefn ops is set
>> (ie. no raw_writefn is provided), it is assumed the cooked also
>> work as the raw one. For those registers it is not obvious the
>> tlb_flush works on KVM mode so better/safer setting the raw write.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> ---
>>
>> I'am not familiar with those callbacks. I have tested in kvm accelerated
>> mode including migration but I fail to test with TCG. It SIGSEVs for
>> me even without my additions. I am not sure whether the .raw_writefn
>> must be set only for registers only doing some TLB maintenance or
>> shall be set safely on other registers doing TLB maintenance + other
>> state settings.
>> ---
>> @@ -718,16 +718,20 @@ static const ARMCPRegInfo not_v7_cp_reginfo[] = {
>>       * the unified TLB ops but also the dside/iside/inner-shareable variants.
>>       */
>>      { .name = "TLBIALL", .cp = 15, .crn = 8, .crm = CP_ANY,
>> -      .opc1 = CP_ANY, .opc2 = 0, .access = PL1_W, .writefn = tlbiall_write,
>> +      .opc1 = CP_ANY, .opc2 = 0, .access = PL1_W,
>> +      .writefn = tlbiall_write, .raw_writefn = raw_write,
>>        .type = ARM_CP_NO_RAW },
> Anything with type ARM_CP_NO_RAW shouldn't need a .raw_writefn, because
> that type indication says that it's a bug if we ever call
> read_raw_cp_reg() or write_raw_cp_reg() on it. (Specifically,
> for KVM, we should never end up trying to do a raw read/write
> for a state sync because write_list_to_cpustate() and
> write_cpustate_to_list() skip NO_RAW cpregs.)

OK thanks for the info. I will respin accordingly.

Eric
>
> thanks
> -- PMM
>


