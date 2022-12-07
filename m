Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 191ED6454D3
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 08:47:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2p7s-0001Zb-TV; Wed, 07 Dec 2022 02:45:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p2p7m-0001Wb-3k
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 02:45:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p2p7k-0003XZ-DR
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 02:45:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670399146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6NzNH0g1Ar8mg2NRfzYDoPaVOs4RoWP9mq4j+zBAE28=;
 b=YExLqs1UjUoJy4sDRUDnrhkpiRYW6AA/MPDZWSw4Um/YOE+0kcMM+7hEPRPOzs2xhzXjKM
 F1m15gr4gHXddKw+8w+Tw0TNVPaHrqlERIuXbLuRfZ8wxP8QqHGGaAhhPaj+paNs1CX6oT
 ltZCzqt+UXAk9pBxUegwTpWxPGk3bhM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-1X3AX7qLMJ2j_a9tdTUOfQ-1; Wed, 07 Dec 2022 02:45:44 -0500
X-MC-Unique: 1X3AX7qLMJ2j_a9tdTUOfQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 h81-20020a1c2154000000b003d1c8e519fbso432095wmh.2
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 23:45:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6NzNH0g1Ar8mg2NRfzYDoPaVOs4RoWP9mq4j+zBAE28=;
 b=c8pVPRe+7A90HJFPsZ2Ihim9hxmur8E07Vq33N+urWwASJDWJcmEap+HKnZEpkHM4h
 UxU0zM29GLMmWs7dC8Bs3GW+VvroWnWWOTEauQFmszexgymBGBauh1xWTjD27YAAApXg
 9kWDUaTSjK1/OmtWQRTxj6UmnuP8CCJVA0D82OC8niRJncF2P8j5zA+ku91YrFZ4SnQo
 +Kb5tN/ac1B43tnye7LUudMF7jhS90gYZKUCP68FwTSn1Sm8YiHiW8jQv2cZflC2odR/
 9Jx/kaLCGpiAfW/Y9FHZevfkAW3ILhxaV/BvLvMM2iWqmv3yA/w42D+hRgcxq2Rfhfid
 fLLg==
X-Gm-Message-State: ANoB5pnPyEuBM7DXeICSwJ+Il6wNkE+ToLSLTfjUbV4rqIZe6M2hH+7a
 XnHh2zbU3xX5POTzQEcu/tB0XW/ZSGT3YoU3Y4tHTFYHHoZBwxRqcCl9uqa26vVt17LUQraYu7b
 B6HC175/madjfV9I=
X-Received: by 2002:a05:600c:4e45:b0:3d1:221d:51e6 with SMTP id
 e5-20020a05600c4e4500b003d1221d51e6mr10968260wmq.4.1670399143491; 
 Tue, 06 Dec 2022 23:45:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7/0XzI/BzWVtp5vZq026dPzT7ZPTTVPd0YfuursBkQoJ7wP5AxC9n1I3uA/QCJBRpeHQfoow==
X-Received: by 2002:a05:600c:4e45:b0:3d1:221d:51e6 with SMTP id
 e5-20020a05600c4e4500b003d1221d51e6mr10968246wmq.4.1670399143234; 
 Tue, 06 Dec 2022 23:45:43 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-155.web.vodafone.de.
 [109.43.178.155]) by smtp.gmail.com with ESMTPSA id
 c2-20020a05600c0a4200b003cfd4cf0761sm870330wmq.1.2022.12.06.23.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 23:45:42 -0800 (PST)
Message-ID: <f035fe38-44ed-6045-b948-d5fcd0dfafd7@redhat.com>
Date: Wed, 7 Dec 2022 08:45:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 02/13] tcg/s390x: Remove TCG_REG_TB
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
References: <20221202065200.224537-1-richard.henderson@linaro.org>
 <20221202065200.224537-3-richard.henderson@linaro.org>
 <20221206192947.fi6c3ftrueuiqmch@heavy>
 <8a3965f7-f830-6343-be15-4e16b20655fd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <8a3965f7-f830-6343-be15-4e16b20655fd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.27, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 06/12/2022 23.22, Richard Henderson wrote:
> On 12/6/22 13:29, Ilya Leoshkevich wrote:
>> On Thu, Dec 01, 2022 at 10:51:49PM -0800, Richard Henderson wrote:
>>> This reverts 829e1376d940 ("tcg/s390: Introduce TCG_REG_TB"), and
>>> several follow-up patches.  The primary motivation is to reduce the
>>> less-tested code paths, pre-z10.  Secondarily, this allows the
>>> unconditional use of TCG_TARGET_HAS_direct_jump, which might be more
>>> important for performance than any slight increase in code size.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   tcg/s390x/tcg-target.h     |   2 +-
>>>   tcg/s390x/tcg-target.c.inc | 176 +++++--------------------------------
>>>   2 files changed, 23 insertions(+), 155 deletions(-)
>>
>> Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
>>
>> I have a few questions/ideas for the future below.
>>> diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
>>> index 22d70d431b..645f522058 100644
>>> --- a/tcg/s390x/tcg-target.h
>>> +++ b/tcg/s390x/tcg-target.h
>>> @@ -103,7 +103,7 @@ extern uint64_t s390_facilities[3];
>>>   #define TCG_TARGET_HAS_mulsh_i32      0
>>>   #define TCG_TARGET_HAS_extrl_i64_i32  0
>>>   #define TCG_TARGET_HAS_extrh_i64_i32  0
>>> -#define TCG_TARGET_HAS_direct_jump    HAVE_FACILITY(GEN_INST_EXT)
>>> +#define TCG_TARGET_HAS_direct_jump    1
>>
>> This change doesn't seem to affect that, but what is the minimum
>> supported s390x qemu host? z900?
> 
> Possibly z990, if I'm reading the gcc processor_flags_table[] correctly; 
> long-displacement-facility is definitely a minimum.
> 
> We probably should revisit what the minimum for TCG should be, assert those 
> features at startup, and drop the corresponding runtime tests.

If we consider the official IBM support statement:

https://www.ibm.com/support/pages/system/files/inline-files/IBM%20Mainframe%20Life%20Cycle%20History%20V2.10%20-%20Sept%2013%202022_1.pdf

... that would mean that the z10 and all older machines are not supported 
anymore.

  Thomas


