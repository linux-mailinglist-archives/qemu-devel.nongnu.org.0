Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E120141FA19
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 08:36:29 +0200 (CEST)
Received: from localhost ([::1]:47668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWYdI-0002vf-91
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 02:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mWYb7-0001V2-OF
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 02:34:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mWYb2-0002Kl-PB
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 02:34:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633156446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l/YrRsdmTJRpp8LSBcZNo3o3kF+zUVH8Z0R0TY4glHk=;
 b=MAnVJyYg8I4J1c9NAnkpHVeBcXvlSexvPsG8SYlC/r99BgCTnkjfUTCrx+t7u8i56nZcnV
 gsvqaKNbNZVgaWnR7kb5J4S9MmgRxtwVmOBt2OvxRkZFkdUHR6a/spq4S2kYmrIKw/B9yC
 8rR11xY/5rzufiij8KbqwiAYezWv3y8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-iml4DWvsP5u-GULsDF39FQ-1; Sat, 02 Oct 2021 02:34:05 -0400
X-MC-Unique: iml4DWvsP5u-GULsDF39FQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 y15-20020a50ce0f000000b003dab997cf7dso8889619edi.9
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 23:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l/YrRsdmTJRpp8LSBcZNo3o3kF+zUVH8Z0R0TY4glHk=;
 b=dfG715ddh15uFuPgCoRjSDKATjhjEdkwePXznbMMa5yNH7esDvSjqYHlCxEGeazbGK
 p8egv3gQraDBaALxoBcuDrVWBFrXE4Xu3ic6hGC0MMT3d/QbxvhQlkzN5WUFIoulhAQW
 IK34Q0W/wYBll5krHSBLx2MD20chpj1Fpmk8wgAnUj5M4QNJRvSB2mLR8X5gwkD4t1fY
 3F2Af8wnmScJU3c0/0FY0I73Qw8dCktyuqHj7uDlTwB4RoYZh3a4V4AlA+U9x9Eo95rJ
 qSeyGG08XLR50RPCwkHyldLgN0znyQ0VT1UMf/FQSVgBW7i5kb++bRi869qbIyKAL7ax
 mOZQ==
X-Gm-Message-State: AOAM533vtV7D0dMW02VjwOPpas4riuLGdxpg69avgc/rto84hothy9rg
 Z9C9No7QFhqrsVn/9prK+l5LksQWp5SoqNK+SlY5ap2VvCWRQjcwEWWNQSP4SNH0ZjQAzNC0kIW
 Z2Ke7mKnPXLWHqv0=
X-Received: by 2002:a05:6402:518d:: with SMTP id
 q13mr2236368edd.143.1633156443955; 
 Fri, 01 Oct 2021 23:34:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtnDk8qC/Z+xuGHarPor/cWv7fWAOGwNIRMbYmTvfCyZnA3MSXPDKrOI81Jld6ffn1Zd9w4Q==
X-Received: by 2002:a05:6402:518d:: with SMTP id
 q13mr2236351edd.143.1633156443760; 
 Fri, 01 Oct 2021 23:34:03 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:48f9:bea:a04c:3dfe?
 ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.gmail.com with ESMTPSA id bm26sm3845537ejb.16.2021.10.01.23.34.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 23:34:03 -0700 (PDT)
Message-ID: <98c4c657-bb7f-70c8-cedb-7eca318b1345@redhat.com>
Date: Sat, 2 Oct 2021 08:34:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] configure: Loosen GCC requirement from 7.5.0 to 7.4.0
To: Richard Henderson <richard.henderson@linaro.org>, nia <nia@NetBSD.org>,
 qemu-devel@nongnu.org
References: <YVcpe79I0rly1HJh@homeworld.netbsd.org>
 <1ad2a2e3-89ec-f0d9-ac41-a24391dde01e@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <1ad2a2e3-89ec-f0d9-ac41-a24391dde01e@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.127, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/10/21 18:15, Richard Henderson wrote:
> On 10/1/21 11:30 AM, nia wrote:
>> As discussed in issue 614, we're shipping GCC 7.4.0 as the
>> system compiler in NetBSD 9, the most recent stable branch,
>> and are still actively interested in QEMU on this platform.
>>
>> The differences between GCC 7.5.0 and 7.4.0 are trivial.
>>
>> Signed-off-by: Nia Alarie<nia@NetBSD.org>
>> ---
>>   configure | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> r~
> 

Queued, thanks.

Paolo


