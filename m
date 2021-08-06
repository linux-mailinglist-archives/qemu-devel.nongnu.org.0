Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BB63E29C8
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 13:35:55 +0200 (CEST)
Received: from localhost ([::1]:60074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBy8o-0007o0-3I
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 07:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBy63-0004tW-Gc
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:33:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBy62-0002bw-15
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:33:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628249581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v+9cgZiaPEuepgnhnbeW3DfHAGVEbyNxMhkIWPhqZcA=;
 b=PPjlmH90uBxCO0nMBj1lfCBIFqpDjuf4jZ/w7y/nlwZp1uLhN8Jmct5UYfYF4rfeBHamlZ
 cOfx797LOjcu5HX3fstdXnyiYLc9OYeVM9rpJ06hRCR3stindoefIwlK2hEONIi5lyBYFB
 o0AoAbqfTENZ/q4HFUeh8KFf2Td9UCY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-crgEC7F0Ofm6_EmElI789w-1; Fri, 06 Aug 2021 07:32:59 -0400
X-MC-Unique: crgEC7F0Ofm6_EmElI789w-1
Received: by mail-wm1-f69.google.com with SMTP id
 c41-20020a05600c4a29b0290253935d0f82so3746500wmp.9
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 04:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=v+9cgZiaPEuepgnhnbeW3DfHAGVEbyNxMhkIWPhqZcA=;
 b=Z2GcRpG5UzhKRpJjOW+60gETZ17juuMupL5UdrESyMdVNvXQf+0KN7FAYbei0jxR41
 pBQFXniOmSpMyi+d2Ya+TI0mDW7HiLIJJVDmxszZeQKZ5YBXYIWDMsIVX62sRlNk2MG7
 uhQRPET01nX9HXG9YFicVuYdJyazFtHvezzs07v8us6ki91+uu7EUl947D8dPn4O4DqZ
 B3ZL5Wlh65bnA3FVSk0Pgw9T+3mTYIayKqcAIAc2Iwd8Fj+lmT8CAzmCs6nLk64iTIVm
 m+NSIu3Bb9z5qEuEtmkLqVrdbj3WXVmx8Wx1qpY12w2YAiW4hstmVX0dDzQx33Wh1IWW
 zWUw==
X-Gm-Message-State: AOAM532QVM97ycLyg2JoPtz4/8//OSQ7WRD+C2goD6LY8XN3IqKPGr3E
 fzFju3aJfZmPdFv+btUo9FtyjZak+c/xS8EHEy8Edt7slSjqDhBoyqnoyuohrTTbDyg/SwhmBOs
 bnsY6wwoAfkqcgaQ=
X-Received: by 2002:a7b:c318:: with SMTP id k24mr2827870wmj.144.1628249578633; 
 Fri, 06 Aug 2021 04:32:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxr4pO+gEffbE/H4+iF9jJIg6HWhSpNcJoFCrLw+Irj1uIgQSpgjiV1EScIRt+xvsT0Q9T/0g==
X-Received: by 2002:a7b:c318:: with SMTP id k24mr2827862wmj.144.1628249578476; 
 Fri, 06 Aug 2021 04:32:58 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6104.dip0.t-ipconnect.de. [91.12.97.4])
 by smtp.gmail.com with ESMTPSA id x15sm8951984wrs.57.2021.08.06.04.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 04:32:58 -0700 (PDT)
Subject: Re: [PATCH v1 03/12] s390x/tcg: convert real to absolute address for
 RRBE, SSKE and ISKE
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-4-david@redhat.com>
 <33c1f057-fd79-d15f-e8d5-2d261fbd1255@redhat.com>
 <c5a589ad-f3ee-b0fe-1bcd-318989e3a23a@redhat.com>
 <2806b81b-4e80-6f85-5f0a-ce78bb6ee3c0@redhat.com>
 <efd67ce2-aaff-9887-c318-f184290f2d0a@redhat.com> <8735rmzufm.fsf@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <635e1291-ef23-4397-85ca-be24417f42e5@redhat.com>
Date: Fri, 6 Aug 2021 13:32:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8735rmzufm.fsf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.619, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.08.21 13:25, Cornelia Huck wrote:
> On Fri, Aug 06 2021, David Hildenbrand <david@redhat.com> wrote:
> 
>> On 06.08.21 09:11, Thomas Huth wrote:
>>> On 06/08/2021 08.52, David Hildenbrand wrote:
>>>>>
>>>>> According to the PoP:
>>>>>
>>>>> "When the enhanced-DAT facility 1 is not installed, or
>>>>>      when the facility is installed but the multiple-block
>>>>>      control is zero, general register R 2 contains a real
>>>>>      address. When the enhanced-DAT facility 1 is
>>>>>      installed and the multiple-block control is one, gen-
>>>>>      eral register R 2 contains an absolute address."
>>>>>
>>>>> Don't we have to take that into consideration here, too?
>>>>
>>>> We don't support EDAT1 a.k.a. huge pages yet. If we ever do, we have to
>>>> further extend this code.
>>>
>>> Ok, then maybe add a comment or assert() to make sure that we don't forget?
>>
>> Well, we'll need modifications and extensions all over the place to
>> support EDAT1, so I'm not sure this will really help ... we'll have to
>> carefully scan the PoP either way.
> 
> Something like
> /* always real address, as long as we don't implement EDAT1 */
> would still be useful, I think.

I am not a friend of describing what to be done with additional CPU 
features. We have the PoP for that: just imagine you read an old version 
of the PoP, the code as is would make perfect sense even without ever 
knowing what EDAT1 is -- and you can verify that the code is correct.

For now I added to the patch description:

"
In the future, when adding EDAT1 support, we'll have to pay attention to
SSKE handling, as we'll be dealing with absolute addresses when the
multiple-block control is one.
"

-- 
Thanks,

David / dhildenb


