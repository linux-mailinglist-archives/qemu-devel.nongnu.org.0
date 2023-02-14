Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C211B696D0E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 19:37:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS0AX-00012G-HN; Tue, 14 Feb 2023 13:36:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pS0AU-0000wZ-4L
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:36:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pS0AS-0004VY-FK
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:36:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676399799;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gBgLUGcPfnFXu97/glbl0dWUsFAyQv/dLxT+7R0QfV8=;
 b=CchvTZu4gBoL2hIEhATWxrOuHLY1mw0dmIoXXYCUkJdLU6jcM6C6wIJMadE0Kz9pw2RvPn
 JiYMNEVLzmuBkxgiqdXMY9V3eVAJHICJ+tOPr29W4u3n6cMncofo453zx2Os7N3Lfm0Hse
 dgWOqwth2jZYmov3HKS/FsAOketWgnU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-173-oyC-b54tNu6ZYoiELC9KMQ-1; Tue, 14 Feb 2023 13:36:38 -0500
X-MC-Unique: oyC-b54tNu6ZYoiELC9KMQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 c9-20020a05620a11a900b0072a014ecc4aso9987568qkk.18
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 10:36:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gBgLUGcPfnFXu97/glbl0dWUsFAyQv/dLxT+7R0QfV8=;
 b=7h4N30fvbrbZmD/GAwiFI9ukSH030mjkZ/nDmlMHwB6x6oDMV9NhnuBKrCgnRJ51Bn
 M4uM2b3Atn9/vFYLHnn2DzD5bSOPYQP6YhhpJtVut64zDuN4viAw3hjv9l0qNhsInX/z
 IcMlwOajZMEn7eIgiXHt55kQr7Qec1GcSiOLe2YrTX6BkSSRteH7EiFS2iR5J/9sDuPK
 kD5b0KoExzr6y6mSFFecVpbev8nhbKA9PvixTJKfZzq1QgZZW0I7rCsTTe+Jm/NTzwqH
 4Zs1K7b8x1styJOjqiRuaFNWohkhySTbpbPlycHTAtd9Fuz4kuUOioAmel5PIbWkwHgq
 vsjg==
X-Gm-Message-State: AO0yUKX1o86vLNsHLhUxplA0akOBrkJsRGjrzTxmNuMcdC3ymMcJt+VV
 XELsD6aqqhpq0MEbccrumwx/tfCR3jwnZB0+JcfJqQ1vedmmQmEf9D0E7H/ezf3oIYJI/jrSzJY
 n4/Vl3mMrKHatHSA=
X-Received: by 2002:a05:6214:2a83:b0:53c:5e57:cd02 with SMTP id
 jr3-20020a0562142a8300b0053c5e57cd02mr7268139qvb.38.1676399797265; 
 Tue, 14 Feb 2023 10:36:37 -0800 (PST)
X-Google-Smtp-Source: AK7set+1U+tW4jV89VThMnCSqAL+kSnHvdJg+NBoQ3EushMwuFNMzRu1x9q921WTkzhIdAK91FJsyA==
X-Received: by 2002:a05:6214:2a83:b0:53c:5e57:cd02 with SMTP id
 jr3-20020a0562142a8300b0053c5e57cd02mr7268096qvb.38.1676399796912; 
 Tue, 14 Feb 2023 10:36:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a379403000000b006bb29d932e1sm12365822qkd.105.2023.02.14.10.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 10:36:36 -0800 (PST)
Message-ID: <b0a296a9-1ca8-fe6c-56e9-27807a1d0f5e@redhat.com>
Date: Tue, 14 Feb 2023 19:36:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/2] hw/arm/smmu-common: Fix TTB1 handling
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 ola.hugosson@arm.com
References: <20230210163731.970130-1-jean-philippe@linaro.org>
 <20230210163731.970130-3-jean-philippe@linaro.org>
 <1964d20f-e18b-5875-914b-16f2f3acee37@redhat.com> <Y+u7A/QubSdEe11M@myrica>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y+u7A/QubSdEe11M@myrica>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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



On 2/14/23 17:46, Jean-Philippe Brucker wrote:
> On Mon, Feb 13, 2023 at 05:30:03PM +0100, Eric Auger wrote:
>> Hi Jean,
>>
>> On 2/10/23 17:37, Jean-Philippe Brucker wrote:
>>> Addresses targeting the second translation table (TTB1) in the SMMU have
>>> all upper bits set (except for the top byte when TBI is enabled). Fix
>>> the TTB1 check.
>>>
>>> Reported-by: Ola Hugosson <ola.hugosson@arm.com>
>>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>> ---
>>>  hw/arm/smmu-common.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>>> index 2b8c67b9a1..0a5a60ca1e 100644
>>> --- a/hw/arm/smmu-common.c
>>> +++ b/hw/arm/smmu-common.c
>>> @@ -249,7 +249,7 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
>>>          /* there is a ttbr0 region and we are in it (high bits all zero) */
>>>          return &cfg->tt[0];
>>>      } else if (cfg->tt[1].tsz &&
>>> -           !extract64(iova, 64 - cfg->tt[1].tsz, cfg->tt[1].tsz - tbi_byte)) {
>>> +        sextract64(iova, 64 - cfg->tt[1].tsz, cfg->tt[1].tsz - tbi_byte) == -1) {
>>>          /* there is a ttbr1 region and we are in it (high bits all one) */
>>>          return &cfg->tt[1];
>>>      } else if (!cfg->tt[0].tsz) {
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>>
>> While reading the spec again, I noticed we do not support VAX. Is it
>> something that we would need to support?
> I guess it would be needed to support sharing page tables with the CPU, if
> the CPU supports and the OS uses FEAT_LVA. But in order to share the
> stage-1, Linux would need more complex features as well (ATS+PRI/Stall,
> PASID).
>
> For a private DMA address space, I think 48 bits of VA is already plenty.

OK thanks!

Eric
>
> Thanks,
> Jean
>


