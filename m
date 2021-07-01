Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA49F3B8E5B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 09:46:57 +0200 (CEST)
Received: from localhost ([::1]:44024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyrPU-0002lw-W8
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 03:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lyrNz-0001P4-Vu
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 03:45:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lyrNy-00025z-7a
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 03:45:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625125520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t4xddDlyjC7T700sMXrf/DbqiiukoERNLdQ6FzLSmpA=;
 b=gGk1pBZtPgnJN1nbzRaZ6vfDJOpR2JFdfiB2wwGX6X+wMKkRJEpteE3GD2PZinA7GxYpYV
 krOvlnc7k9iF3rk9dWUTdfb7I/pMZkeUXBWFWCEeKBNZhA4RgkOTT6V9nNECXRQ1nZHniK
 pI97dUxSlXf4z9AAw4z15mqGw6NDJoo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-XhwBMxi9O52FzoxwfI7cMA-1; Thu, 01 Jul 2021 03:45:19 -0400
X-MC-Unique: XhwBMxi9O52FzoxwfI7cMA-1
Received: by mail-wm1-f70.google.com with SMTP id
 j6-20020a05600c1906b029019e9c982271so4195351wmq.0
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 00:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=t4xddDlyjC7T700sMXrf/DbqiiukoERNLdQ6FzLSmpA=;
 b=Nl0j4s6aktKYmFIM7Pjpmh0qMRyg9YBWk+yD77jVqiWAV1rY5zESAnr555ykq/yU46
 DdtYgf2evCIqsm3XamhkmLFPtUhAULkjnTbT1ycXkfwq1wANZn7LVHnMjLANQBz1rOL0
 qPBzSQxmFYTe4TnsLAWZgfVHh+JCVTCTXY6EnodMZ4EQxaR+eB9NluSU5j6r0dTfkIVg
 3JkfXuFzLsvV+np3skYDeUes+dlojG88ITb3p6XIbwZVgXwlB1y8Qd5VBhmYGRPyhomg
 gXJtiI7PWk1xXVaNyH8dA6AITBQ77lDV13VMSU6xmW/Eo2H6IVhzYjRXC8MeV5XI7H7P
 t3ww==
X-Gm-Message-State: AOAM533MFJ5RNbewC+3c8ER/7ZWkS1xasfIXDGrPXTIVQlGh+001xdNt
 pf1S6p3mo5ScmMIU+RLOPwwdXXzgyVRaYNjaxUt1moWOZJDm/YqfumyklqANSlyu7ze9ywMsl8D
 kb78RW+zCRrCTFTU=
X-Received: by 2002:a05:600c:4f56:: with SMTP id
 m22mr9303635wmq.16.1625125517949; 
 Thu, 01 Jul 2021 00:45:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZFbQ7Wk2AMhRifkDPZMb0iaJjjmvq0lpMBDADLujW5h3aWwT3iUxmwh0ozVVAIt1H6d/VVg==
X-Received: by 2002:a05:600c:4f56:: with SMTP id
 m22mr9303612wmq.16.1625125517734; 
 Thu, 01 Jul 2021 00:45:17 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23bca.dip0.t-ipconnect.de. [79.242.59.202])
 by smtp.gmail.com with ESMTPSA id n7sm8121129wmq.37.2021.07.01.00.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 00:45:17 -0700 (PDT)
Subject: Re: [PATCH 1/1] s390x/cpumodel: add 3931 and 3932
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20210622201923.150205-1-borntraeger@de.ibm.com>
 <20210622201923.150205-2-borntraeger@de.ibm.com>
 <b584eb80-ceac-9188-11a2-c4a86388ac1e@redhat.com>
 <7cd6fb75-521b-e970-4f25-b23722765bf9@de.ibm.com> <8735szl66j.fsf@redhat.com>
 <e448f4ee-76cf-c380-2a23-7e746a728a9d@de.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <1b3e7bc9-4bf1-a3fb-086a-f30780e020b4@redhat.com>
Date: Thu, 1 Jul 2021 09:45:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e448f4ee-76cf-c380-2a23-7e746a728a9d@de.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.06.21 17:56, Christian Borntraeger wrote:
> 
> 
> On 30.06.21 17:32, Cornelia Huck wrote:
>> On Wed, Jun 30 2021, Christian Borntraeger <borntraeger@de.ibm.com> wrote:
>>
>>> On 30.06.21 15:32, David Hildenbrand wrote:
>>>> On 22.06.21 22:19, Christian Borntraeger wrote:
>>>>> This defines 5 new facilities and the new 3931 and 3932 machines.
>>>>> As before the name is not yet known and we do use gen16a and gen16b.
>>>>> The new features are part of the full model.
>>>>>
>>>>> The default model is still empty (same as z15) and will be added
>>>>> in a separate patch at a later point in time.
>>>>>
>>>>> Also add the dependencies of new facilities and as a fix for z15 add
>>>>> a dependency from S390_FEAT_VECTOR_PACKED_DECIMAL_ENH to
>>>>> S390_VECTOR_PACKED_DECIMAL.
>>>>>
>>>>> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
>>>>> ---
>>>>>     target/s390x/cpu_features_def.h.inc |  5 +++++
>>>>>     target/s390x/cpu_models.c           |  6 ++++++
>>>>>     target/s390x/gen-features.c         | 14 ++++++++++++++
>>>>>     3 files changed, 25 insertions(+)
>>>>>
>>>>> diff --git a/target/s390x/cpu_features_def.h.inc b/target/s390x/cpu_features_def.h.inc
>>>>> index 7db3449e0434..c71caee74411 100644
>>>>> --- a/target/s390x/cpu_features_def.h.inc
>>>>> +++ b/target/s390x/cpu_features_def.h.inc
>>>>> @@ -109,6 +109,11 @@ DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH, "vxpdeh", STFL, 152, "Vector-Packed-Decimal-
>>>>>     DEF_FEAT(MSA_EXT_9, "msa9-base", STFL, 155, "Message-security-assist-extension-9 facility (excluding subfunctions)")
>>>>>     DEF_FEAT(ETOKEN, "etoken", STFL, 156, "Etoken facility")
>>>>>     DEF_FEAT(UNPACK, "unpack", STFL, 161, "Unpack facility")
>>>>> +DEF_FEAT(NNPA, "nnpa", STFL, 165, "NNPA facility")
>>>>> +DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH2, "vxpdeh2", STFL, 192, "Vector-Packed-Decimal-Enhancement facility 2")
>>>>> +DEF_FEAT(BEAR, "bear", STFL, 193, "BEAR-enhancement facility")
>>>>
>>>> Usually we use "eh" for enhancement. Which would result in "beareh" or alternatively "beh". But maybe the "enhancement" part is not actually an enhancement, but instead this facility is more like the etoken or unpack facility ...
>>>
>>> There was no bear facility (I think it was part of PER3).
>>> beareh or beh would be fine with me.
>>>
>>>>
>>>>> +DEF_FEAT(RDP, "rdp", STFL, 194, "Reset-DAT-protection facility")
>>>>> +DEF_FEAT(ACTIVITY, "activity", STFL, 196, "Processor-Activity-Instrumentation facility")
>>>>
>>>> Would "pai" be a more appropriate feature name?
>>>
>>> pai would be ok for me as well.
>>>
>>> Conny, do you want to replace "activity" with "pai" and "bear" with "beareh" in your tree?
>>
>> I can certainly edit this to a naming everyone agrees with (no strong
>> opinions from my side).
> 
> Lets pick "pai" and the choose among "beareh" and "beh"
> 

I'd just go for "beareh" in case we ever have another b...enhancement 
feature. But no strong opinion.

-- 
Thanks,

David / dhildenb


