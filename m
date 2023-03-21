Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F2A6C32C2
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 14:23:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pebxO-0005vc-7b; Tue, 21 Mar 2023 09:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pebxI-0005kG-N6
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:23:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pebxG-0008Qy-Sv
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:23:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679404990;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fadMJGg/aM6de+s+5IKvugmInuaa86crxGsVLbONVkA=;
 b=bkcfPztxHNnxr75YLtU93m2JUaIXpnE+0o4PHq6ydtTlwOnrcIuBP+aWIzHUk+gAKz+ma/
 I51NGddQisztj2OQMK2sGnLInS9wrlDER67f0EpFTlPJMnuLb5StDWlgNtMtyHdNru94Q3
 ncPYO03dRY7yy4iWTCJdBdxnmn/eLac=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-zv4pHP-0MMWMtkUIYi14SA-1; Tue, 21 Mar 2023 09:23:08 -0400
X-MC-Unique: zv4pHP-0MMWMtkUIYi14SA-1
Received: by mail-qt1-f200.google.com with SMTP id
 c11-20020ac85a8b000000b003bfdd43ac76so8705802qtc.5
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 06:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679404988;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fadMJGg/aM6de+s+5IKvugmInuaa86crxGsVLbONVkA=;
 b=PKc6IIK4FRgWVUdJy9w9igNBo72bP4eV5xmbfmmT6CiBGxFDDdpP4LbbLVCku1+ktQ
 4N0in9o3P4QnIuzsRsxkQsYM2wwd1p78JrcVXP6fORuI+6H9NHbZTpQujlQuL08voEiI
 /JGqm+X4Hbjkt3CSPv7Y21hyanXiH18TZHU7yXjU5F1t74xfpP8ROi5k7v4U4MQRwd2b
 lLZ4GhU9V0vgUmVvEFxy4s5VmgzLOAMARTOLrRL6ERoH/7aU5vuPNhvz6gITnnYbr0Va
 dSJQk3e99aGgXalpooVE6vRpbvsw/WNeaEWcHZqMfcHl3aSZT+cyK/C4sbgQHHYMBPeG
 gAew==
X-Gm-Message-State: AO0yUKVseTFbqvIYXs63RPdDgPsyxg/Mic26oYYs/FXNXFoS7igcEsNo
 iMS46QkOipo03CZZjPFqFnjgLQLHsjKLw3M6841kVhHJul4JN8Rv3oEGqeB4KwsgLLr1ybhsbTJ
 4zFOJtJ52/JUSctQ=
X-Received: by 2002:a05:622a:1446:b0:3c0:3db8:387 with SMTP id
 v6-20020a05622a144600b003c03db80387mr4445346qtx.11.1679404988452; 
 Tue, 21 Mar 2023 06:23:08 -0700 (PDT)
X-Google-Smtp-Source: AK7set9yXv/xJF6P9W3j1la4Z8D27Jhb01ZYtpVQ5W0CHybpnnSDvzPiklRWyQQZnLjl8pXyLiBRYg==
X-Received: by 2002:a05:622a:1446:b0:3c0:3db8:387 with SMTP id
 v6-20020a05622a144600b003c03db80387mr4445148qtx.11.1679404986351; 
 Tue, 21 Mar 2023 06:23:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 l6-20020ac848c6000000b003bfb0ea8094sm1712039qtr.83.2023.03.21.06.23.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 06:23:05 -0700 (PDT)
Message-ID: <d2e9d8d5-1cf6-67fe-e780-41038fcaa376@redhat.com>
Date: Tue, 21 Mar 2023 14:23:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v2 10/11] hw/arm/smmuv3: Populate OAS based on CPU
 PARANGE
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-11-smostafa@google.com>
 <6e6810c3-c01a-5a2f-4fed-64c9391e22ba@redhat.com>
 <ZBmruj7OME3Pfbh1@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ZBmruj7OME3Pfbh1@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Mostafa,

On 3/21/23 14:06, Mostafa Saleh wrote:
> Hi Eric,
>
>>> +     * According to 6.3.6 SMMU_IDR5, OAS must match the system physical address
>>> +     * size.
>>> +     */
>>> +    ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
>>> +    uint8_t oas = FIELD_EX64(armcpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
>> is this working in accelerated mode?
> I didn't try with accel, I will give it a try, but from what I see, that
> ARM_CPU() is used to get the CPU in traget/arm/kvm.c which is used from
> accel/kvm-all.c, so it seems this would work for accelerated mode.

yeah I ma not familiar enough with that code but it is worth to be checked.
>
>>> +
>>>      /**
>>>       * IDR0: stage1 only, AArch64 only, coherent access, 16b ASID,
>>>       *       multi-level stream table
>>> @@ -265,7 +272,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
>>>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
>>>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, 1);
>>>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
>>> -    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
>>> +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, oas);
>> I am not sure you can change that easily. In case of migration this is
>> going to change the behavior of the device, no?
> I see IDR registers are not migrated. I guess we can add them in a
> subsection and if they were not passed (old instances) we set OAS to
> 44.
> Maybe this should be another change outside of this series.
Indeed tehy are not migrated so it can lead to inconsistent behavior in
both source and dest. This deserves more analysis to me. In case you
would decide to migrate IDR regs this would need to be done in that
series I think. Migration must not be broken by this series.

Thanks

Eric
>
> Thanks,
> Mostafa
>


