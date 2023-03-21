Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D926C32FE
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 14:35:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pec87-0006kR-NZ; Tue, 21 Mar 2023 09:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pec85-0006jH-St
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:34:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pec84-00067m-7g
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:34:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679405659;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tmkat1LSQSuev1D1I6w/AYW2fG9I2lhhUiUVfxIvFX8=;
 b=LlCm+lfX7SfpwqHu3eCwHRh+0J5IFBbgNYRRPblTIE2L55T91IpMgNO5Zhb7xWhUxMirgW
 UNVWJLGGBeed7li/uE8u+F3PeOOuuC9nkOifw6RjnSueA93k+34a5rhRF/Ib1wZoiBLOtk
 zbzlSTfgU0HgACuJyizu9q7jl/b2MKk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319--fzPg4DXPMy-DpnD7WMlcg-1; Tue, 21 Mar 2023 09:34:16 -0400
X-MC-Unique: -fzPg4DXPMy-DpnD7WMlcg-1
Received: by mail-qk1-f200.google.com with SMTP id
 198-20020a370bcf000000b007468cffa4e2so2384602qkl.10
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 06:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679405656;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tmkat1LSQSuev1D1I6w/AYW2fG9I2lhhUiUVfxIvFX8=;
 b=0vgI0fG4y5dri0sUyJkrXwS6bFTAs+J11K0wzs8Aevkzuy/RTrUfqW7i/5Iih26t2L
 2kx2oGR//RNWBuBE95DuyjP2krTU6KI+1pIOwlK+3TLRkWgXj4sHeLyz2lw9uNVMKa6y
 Wjdw6ZTQhpn8pEHQnL2J30xgkuJivwQQA5AL/8CBhFXGL3GjDyCeDuY69mEc2P6kEIsC
 ktpPWq7znuDQvwg0tMsBuAz1+X0PWYp81Wqaj2rPb5Po22JxPXKIR3W2/yiWfgg1xU+e
 FbLe7K4jtz08Zht9gR9IXab4maiVgXnWnP9J05sozct8NtTgiAeKzz/kEfM/KJQGFdeG
 KsFQ==
X-Gm-Message-State: AO0yUKWjecwpH/LbV6JTQbqJPA1IP68ZSEzE72zc9SEQlFxzEEJdfAPi
 r/mTArYkQAHFs30HNFWjd2T3AcuHUVqws4y+FWKb9Mr0MERoicaUXii7+FnwgQJKjgak/d3io2P
 YQBQbA6/uwgeBOHI=
X-Received: by 2002:a05:622a:1010:b0:3bf:dc57:5034 with SMTP id
 d16-20020a05622a101000b003bfdc575034mr4573226qte.29.1679405656034; 
 Tue, 21 Mar 2023 06:34:16 -0700 (PDT)
X-Google-Smtp-Source: AK7set8oDPmTIRoOyp0fryGi4sXuHCXtvIGgNQiXvQ4iu2xP8LgwQr2UXrB0Ju7CO5IS5wU9KKaTVQ==
X-Received: by 2002:a05:622a:1010:b0:3bf:dc57:5034 with SMTP id
 d16-20020a05622a101000b003bfdc575034mr4573181qte.29.1679405655726; 
 Tue, 21 Mar 2023 06:34:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a378701000000b007456b51ee13sm9289212qkd.16.2023.03.21.06.34.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 06:34:15 -0700 (PDT)
Message-ID: <a6977389-6a78-71b5-b3ea-005f41d0c6c9@redhat.com>
Date: Tue, 21 Mar 2023 14:34:12 +0100
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
 <d2e9d8d5-1cf6-67fe-e780-41038fcaa376@redhat.com>
 <ZBmxUISDGh8rRJKD@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ZBmxUISDGh8rRJKD@google.com>
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



On 3/21/23 14:29, Mostafa Saleh wrote:
> On Tue, Mar 21, 2023 at 02:23:03PM +0100, Eric Auger wrote:
>>>>>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
>>>>> -    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
>>>>> +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, oas);
>>>> I am not sure you can change that easily. In case of migration this is
>>>> going to change the behavior of the device, no?
>>> I see IDR registers are not migrated. I guess we can add them in a
>>> subsection and if they were not passed (old instances) we set OAS to
>>> 44.
>>> Maybe this should be another change outside of this series.
>> Indeed tehy are not migrated so it can lead to inconsistent behavior in
>> both source and dest. This deserves more analysis to me. In case you
>> would decide to migrate IDR regs this would need to be done in that
>> series I think. Migration must not be broken by this series
> I agree, I meant to drop this patch from the series as it is not
> really related to stage-2, and we can have another patch for this +
> migration for IDR if needed after doing proper analysis.

Ah OK. I get it now. Yes this looks sensible

Thanks

Eric
>
> Thanks,
> Mostafa
>


