Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728DD6A5AE9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 15:35:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX148-0004An-6i; Tue, 28 Feb 2023 09:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pX142-00048F-Fc
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:34:47 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pX13x-00063V-Cu
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:34:43 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so9772508pja.5
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 06:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qfe83rccIX7NIrdV/2Jcg2N5rwe3+jC6RVaHdPTw37M=;
 b=qpoQ8odG1rFxp7D5YKzDsPI4BtyHfNPiOVr1QAp3n4EanrnGPNAtzWiDrxEz25d21S
 gzn0bSQb1c+gegUeDiOida46YiyDa9E5x8Opi45lgaR6Vjw5fPjV2g9xWPxRiCzxVnsl
 FsHRgnrn2DuFZvlohd2Bbx4MEjd3rhQrZVOI50yEpPiMCNqPIv/fk5LTk88sYJkrpLk0
 DPWKq61wBbNbN5S39tXf8qcNcKcvMF0aH5glI4DH9tk824J8HITx3MmImPFu2ID/QUvc
 jA/T96jCE/PKjZfF2ZP24Gt90r9Nup4WK6vTx5opJBIWVCGgtRLDzTb5NhMfBE5XnC18
 roeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qfe83rccIX7NIrdV/2Jcg2N5rwe3+jC6RVaHdPTw37M=;
 b=Fj3Jvus8C04sWIHQL1nLBIyMyWvydPrQW/YqZSvds+ywM2aY4idWmVG1lom0a4xDQJ
 XO8q5Howw59B1nrUFa2d1Mu/5AbVnXRIq7L4n1YHR6zePi3ifYHdTzEXb5DXKVLAeLGI
 ZzR4rxolQ8pEy53hcZxIKTLRjNMHrMBAogmOgGDl4LQo2x0nQPj0JPRu/WyKWJy25waF
 9K+VfhtnvvXMRBd3BCJNeC9J+Bti3JUGQ8JpNKM4Pt3hsZjEdhKS5vAv6a2IIXqdm9Wq
 GHPPSt81QNMIAav1CPGWt9buTpAt/cn9ai+aPq+KLpCuDtuqI91ZuV4du41KMOPoXKYe
 QgKQ==
X-Gm-Message-State: AO0yUKWG1k03FMgOZK7vs2XHYYjq85tE353Cifb98dDVkWRyeQtqqaie
 4VrGs5nTl7X6n/8ds46g5Xs=
X-Google-Smtp-Source: AK7set8xOXUT6mkmzdGoJ/oSQsJplSnjrri3O2rqhTwA8e1nyTsW3oUyovVUSFP0r7oKnYSuuRsoEA==
X-Received: by 2002:a17:903:32cb:b0:19b:441c:3913 with SMTP id
 i11-20020a17090332cb00b0019b441c3913mr3635077plr.44.1677594879316; 
 Tue, 28 Feb 2023 06:34:39 -0800 (PST)
Received: from [192.168.0.115] ([113.173.97.170])
 by smtp.gmail.com with ESMTPSA id
 jj2-20020a170903048200b0019aaab3f9d7sm6662479plb.113.2023.02.28.06.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 06:34:38 -0800 (PST)
Message-ID: <f24683be-f3a7-34fe-279a-11d01e696bbc@gmail.com>
Date: Tue, 28 Feb 2023 21:34:33 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] apic: add support for x2APIC mode
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S . Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230221160500.30336-1-minhquangbui99@gmail.com>
 <20230221160500.30336-2-minhquangbui99@gmail.com>
 <20230224152932.1de436cb@imammedo.users.ipa.redhat.com>
 <ee3d42c1-9e52-57f9-eba8-a5dc3a45d14f@gmail.com>
 <20230227170759.12297901@imammedo.users.ipa.redhat.com>
Content-Language: en-US
From: Bui Quang Minh <minhquangbui99@gmail.com>
In-Reply-To: <20230227170759.12297901@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/27/23 23:07, Igor Mammedov wrote:
> On Sat, 25 Feb 2023 17:15:17 +0700
> Bui Quang Minh <minhquangbui99@gmail.com> wrote:
> 
>> On 2/24/23 21:29, Igor Mammedov wrote:
>>> On Tue, 21 Feb 2023 23:04:57 +0700
>>> Bui Quang Minh <minhquangbui99@gmail.com> wrote:
>>>    
>>>> This commit refactors APIC registers read/write function to support both
>>>> MMIO read/write in xAPIC mode and MSR read/write in x2APIC mode. Also,
>>>> support larger APIC ID, self IPI, new IPI destination determination in
>>>> x2APIC mode.
>>>>
>>>> Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
>>>> ---
>>>>    hw/intc/apic.c                  | 211 +++++++++++++++++++++++++-------
>>>>    hw/intc/apic_common.c           |   2 +-
>>>>    include/hw/i386/apic.h          |   5 +-
>>>>    include/hw/i386/apic_internal.h |   2 +-
>>>>    4 files changed, 172 insertions(+), 48 deletions(-)
>>>>
>>>> diff --git a/hw/intc/apic.c b/hw/intc/apic.c
>>>> index 2d3e55f4e2..205d5923ec 100644
>>>> --- a/hw/intc/apic.c
>>>> +++ b/hw/intc/apic.c
>>>> @@ -30,6 +30,7 @@
>>>>    #include "hw/i386/apic-msidef.h"
>>>>    #include "qapi/error.h"
>>>>    #include "qom/object.h"
>>>> +#include "tcg/helper-tcg.h"
>>>>    
>>>>    #define MAX_APICS 255
>>>
>>> I'm curious how does it work without increasing ^^^?
>>
>> Hmm, my commit message is not entirely correct. In this series, some
>> operations (send IPI, IPI destination determination) have been updated
>> to support x2APIC mode. However, the emulated APIC still doesn't support
>> APIC ID larger than 255 because currently, we use a fixed length (255 +
>> 1) array to manage local APICs. So to support larger APIC ID, I think we
>> need to find any way to manage those, as the possible allocated APIC ID
>> range is large and maybe the allocated APIC ID is sparse which makes
>> fixed length array so wasteful.
> how much sparse it is?

As far as I know, QEMU allows to set CPU's APIC ID, so user can pass a 
very sparse APIC ID array.

> benefits of simple static array is simplicity in management and O(1) access time.
> QEMU does know in advance max apic id so we can size array by dynamically
> allocating it when 1st apic is created. Or if IDs are too sparse
> switch to another structure to keep mapping.

I totally agree with this.

I admit that my main focus on this series is to make x2APIC mode 
function correctly with TCG accelerator, so I skip the part of extending 
the support for higher APIC ID.

Thanks,
Quang Minh.

