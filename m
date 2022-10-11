Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F355FB392
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:40:57 +0200 (CEST)
Received: from localhost ([::1]:43796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiFV9-0000uc-SD
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oiFFQ-0000ht-Ik
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 09:24:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oiFFO-0005WM-2B
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 09:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665494676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IeSjbbk/wBrMRFzBzku1w+F3wQsphL1qkorNWmDzuuk=;
 b=JE5csMKQMU9MrN2X5/Jmtn8AxTdj1oEqFuz+8i2PPqxPjNpi31RHgwZdgF0jOc8I47m1Sb
 Gk3r/V9FcfQMINW6gZZtlNvHy6r8lhH+IyKxf+HP9EHXVru3GyHG/OIxKyEVw9VepDVW75
 byQB3y/h6uesCPBtJdwujh27YyZK8Cg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-449-HjShQb6UOh2M9y22H4m2oQ-1; Tue, 11 Oct 2022 09:24:33 -0400
X-MC-Unique: HjShQb6UOh2M9y22H4m2oQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 c3-20020a7bc843000000b003b486fc6a40so3720236wml.7
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 06:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IeSjbbk/wBrMRFzBzku1w+F3wQsphL1qkorNWmDzuuk=;
 b=Jk2yRCrejyjYZ/FQl1+N38DNgRegfFMM+nbJsuvYetTUsShOD5xE/EciWFo1STQLV1
 Rin/YPspdfcxTgwZjJW6CD3MGxQ+p9fS4lfj+/YV/8pvNpqJiFkw6AVrzfICl94CLOVU
 6SGbOjkoq1yxkdjaJRqN2PtNpnuelBCyHlV45Nl02T9/DPGcNgDmZpgFFW53KssV4dOL
 ORQb/5gBLZJtoVdGJoALjdyI2FdAAkELmLvyGXe65Esh81Dqao82shxuHq8A4XWaawhQ
 hZlIBI1ulgViJYNcNq3+KCZcX6b7xkqJsa5ybu4FlwQmnKO6vrbGmg610AuhYcPGmx/R
 EGTw==
X-Gm-Message-State: ACrzQf1/5k/5bAW6CnAUZ/4i0D4+rw4AdRS+ECFxmCRRLc2huxjPuTrd
 /hwZKbP+Lv36mjEsU7GeaF7wKaG8QQf06ixSDNbb4QHVDlk9EusXUIpLMxUqxuj2VIIRzxIBRnh
 Z2MTSRuQMs/ZTOlY=
X-Received: by 2002:a5d:4ec5:0:b0:22c:dca3:e84d with SMTP id
 s5-20020a5d4ec5000000b0022cdca3e84dmr14752373wrv.14.1665494672426; 
 Tue, 11 Oct 2022 06:24:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4FXHgHHrCDSHAWBqggeM7lxA3Or9CtepSVGzgk6rHqaFmoCgw53GG0l/xZkXZ2n2RpAwC04w==
X-Received: by 2002:a5d:4ec5:0:b0:22c:dca3:e84d with SMTP id
 s5-20020a5d4ec5000000b0022cdca3e84dmr14752363wrv.14.1665494672170; 
 Tue, 11 Oct 2022 06:24:32 -0700 (PDT)
Received: from ?IPV6:2003:cb:c709:6900:f110:6527:aa46:a922?
 (p200300cbc7096900f1106527aa46a922.dip0.t-ipconnect.de.
 [2003:cb:c709:6900:f110:6527:aa46:a922])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c350700b003b4868eb71bsm19235882wmq.25.2022.10.11.06.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 06:24:31 -0700 (PDT)
Message-ID: <ba70d3ff-cf74-2da4-62bc-fcc05fd990f9@redhat.com>
Date: Tue, 11 Oct 2022 15:24:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] target/s390x: Fix emulation of the VISTR instruction
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20221011101401.81849-1-thuth@redhat.com>
 <d7873010-8d15-360a-39c5-d94acad5d4bc@redhat.com>
 <c357577e-f8e8-0b1c-7c12-80c0528ed50d@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <c357577e-f8e8-0b1c-7c12-80c0528ed50d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.10.22 14:45, Thomas Huth wrote:
> On 11/10/2022 14.30, David Hildenbrand wrote:
>> On 11.10.22 12:14, Thomas Huth wrote:
>>> The element size is encoded in the M3 field, not in the M4
>>> field. Let's also add a TCG test that shows the failing
>>> behavior without this fix.
>>>
>>
>> I'd suggest moving the test to a separate patch and adding a Fixes: tag to
>> the fix.
>>
>> Should be
>>
>> Fixes: be6324c6b734 ("s390x/tcg: Implement VECTOR ISOLATE STRING")
> 
> Ok, can do!
> 
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1248
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>    tests/tcg/s390x/vf.c                | 50 +++++++++++++++++++++++++++++
>>>    target/s390x/tcg/translate_vx.c.inc |  2 +-
>>>    tests/tcg/s390x/Makefile.target     |  6 ++++
>>>    3 files changed, 57 insertions(+), 1 deletion(-)
>>>    create mode 100644 tests/tcg/s390x/vf.c
>>>
>>> diff --git a/tests/tcg/s390x/vf.c b/tests/tcg/s390x/vf.c
>>> new file mode 100644
>>> index 0000000000..fdc424ce7c
>>> --- /dev/null
>>> +++ b/tests/tcg/s390x/vf.c
>>
>> In general, we use "vx" when talking about vector extension. Maybe name this
>> vx.c
> 
> Ok... or maybe "vecstring.c" in case we only want to test the vector string
> functions here? (they are in a separate chapter in the PoP)

Also works for me. Or "vx_str.c" or sth like that.

-- 
Thanks,

David / dhildenb


