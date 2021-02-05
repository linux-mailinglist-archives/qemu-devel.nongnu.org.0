Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2545331074D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 10:09:49 +0100 (CET)
Received: from localhost ([::1]:36918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7x7b-0003HT-Pl
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 04:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7x6V-0002q2-SN
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:08:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7x6R-00036Y-SM
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:08:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612516113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fKjIa7kVU0ABKsoqHVW+sSIhsgw0jJD0/qNaeVzBYvw=;
 b=LZOEfJrn2Zfd8FtLE1XqtSnQ1qGPbyVv0pw9eBnJslYyCjllx3RiZrXMEIXVf+X7joDQdN
 CnX+4NjXPXADfgdjIZPmRti4UdJRKllU4m4VJl1/HWXEibiksr+KBFCSFh/Lps6yP24w8C
 qYyf7TjbFq9v0gXvXn9xIQX8KHTYF/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-ISihq742ONeb7HeY9fMmSw-1; Fri, 05 Feb 2021 04:08:28 -0500
X-MC-Unique: ISihq742ONeb7HeY9fMmSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A77C118A08C0;
 Fri,  5 Feb 2021 09:08:27 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-46.ams2.redhat.com [10.36.112.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBD891970A;
 Fri,  5 Feb 2021 09:08:22 +0000 (UTC)
Subject: Re: [PATCH v2] target/s390x/arch_dump: Fixes for the name field in
 the PT_NOTE section
From: Thomas Huth <thuth@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>
References: <20210204164117.721110-1-thuth@redhat.com>
 <8674a570-93f7-24dc-10b8-0c3577c0841f@de.ibm.com>
 <1d54bafb-b995-0052-e9f9-2572e69dcc11@redhat.com>
 <f72a20f1-581b-b262-4546-acf167198aa4@de.ibm.com>
 <79f2abd2-fe71-006f-d9b4-a3781f292766@redhat.com>
Message-ID: <54dd2e90-b8b0-b5a7-f527-0897576d7a8f@redhat.com>
Date: Fri, 5 Feb 2021 10:08:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <79f2abd2-fe71-006f-d9b4-a3781f292766@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/02/2021 09.18, Thomas Huth wrote:
> On 05/02/2021 08.08, Christian Borntraeger wrote:
>>
>>
>> On 05.02.21 07:12, Thomas Huth wrote:
>>> On 04/02/2021 18.00, Christian Borntraeger wrote:
>>>> On 04.02.21 17:41, Thomas Huth wrote:
>>>>> According to the "ELF-64 Object File Format" specification:
>>>>>
>>>>> "The first word in the entry, namesz, identifies the length, in
>>>>>    bytes, of a name identifying the entry’s owner or originator. The 
>>>>> name field
>>>>>    contains a null-terminated string, with padding as necessary to 
>>>>> ensure 8-
>>>>>    byte alignment for the descriptor field. The length does not include 
>>>>> the
>>>>>    terminating null or the padding."
>>>>>
>>>>> So we should not include the terminating NUL in the length field here.
>>>>>
>>>>> Also there is a compiler warning with GCC 9.3 when compiling with
>>>>> the -fsanitize=thread compiler flag:
>>>>>
>>>>>    In function 'strncpy',
>>>>>       inlined from 's390x_write_elf64_notes' at 
>>>>> ../target/s390x/arch_dump.c:219:9:
>>>>>    /usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error:
>>>>>     '__builtin_strncpy' specified bound 8 equals destination size
>>>>>     [-Werror=stringop-truncation]
>>>>>
>>>>> Since the name should always be NUL-terminated, let's use g_strlcpy() to
>>>>> silence this warning. And while we're at it, also add an assert() to make
>>>>> sure that the provided names always fit the size field (which is fine for
>>>>> the current callers, the function is called once with "CORE" and once with
>>>>> "LINUX" as a name).
>>>>>
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>> ---
>>>>>    v2: Use g_strlcpy instead of strncpy
>>>>
>>>>
>>>> With this patch I do get
>>>>
>>>> WARNING: possibly corrupt Elf64_Nhdr: n_namesz: 0 n_descsz: 4 n_type: 88
>>>>
>>>> when running crash on the elf file created by dump-guest-memory. Without 
>>>> the
>>>> patch everything is fine.
>>>
>>> Drat! Looking at the crash sources:
>>>
>>>   https://github.com/crash-utility/crash/blob/master/s390x.c#L378
>>>
>>> ... it seems like crash is rather rounding up to the next 4 bytes 
>>> boundary instead of the next 8 bytes boundary. Thus things go wrong now 
>>> when QEMU writes writes the "CORE" notes section. In the old code we were 
>>> using 4 + 1 as a lengths, so crash correctly rounded this up to 8. But 
>>> now with 4 as a length, this does not work right anymore :-(
>>>
>>> Seems like I either misunderstood the "ELF-64 Object File Format" 
>>> specification, or this is a bug in the crash utility (it should either 
>>> add 1 to n_namesz for the trailing NUL or pad to 8 instead of 4)? Anyway, 
>>> it's maybe better to keep the "+ 1" in QEMU for now to avoid breaking 
>>> things, I guess?
>>
>> I guess kdump and friends are also doing the +1 otherwise we would see the 
>> error with those ELF dumps.
>> But yes, as long as crash does not work we must not apply this patch.
> 
> Looking at the other target/*/arch_dump.c files, it also seems like they 
> include the NUL in the namesz field for their 64-bit flavours ... I've got 
> the feeling that the "ELF-64 Object File Format" spec simply does not apply 
> here, or I must have missed something else.
After searching for a little bit longer, I guess this is the spec that 
applies nowadays:

  http://www.sco.com/developers/gabi/latest/ch5.pheader.html#note_section

Citing:

  "The first namesz bytes in name contain a null-terminated character 
representation of the entry's owner or originator."

So the NUL should be included in the namesz field, indeed.

  Thomas


