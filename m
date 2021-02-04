Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA9B30F3B3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 14:12:09 +0100 (CET)
Received: from localhost ([::1]:49316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7eQa-0001nO-4K
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 08:12:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7eNy-0001Ac-JZ
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 08:09:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7eNw-0002Az-8g
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 08:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612444163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K5gynSwRjmnho0sxBnYutCxQDq1morUgdN/E6Th/OfQ=;
 b=WKuGBpCHlls5C+isr/MSJtFE+579B1D01xR22Ltcmpa6tD5HU+5c55Le12MMyjVRXofqr9
 JKe49a9zvo0a2OsobPXrT7bd8s1CfB4QO1tJsaIMZ9ZbzbjNgqRt1NxpX5WMoga1QTxAuK
 GEZP13t3dAbxfyMgGX226LaWHvAenQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-YyIGRnVSM22E_j9Bxw9BdA-1; Thu, 04 Feb 2021 08:09:18 -0500
X-MC-Unique: YyIGRnVSM22E_j9Bxw9BdA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E8681020C23;
 Thu,  4 Feb 2021 13:09:17 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE4381001901;
 Thu,  4 Feb 2021 13:09:12 +0000 (UTC)
Subject: Re: [PATCH] target/s390x/arch_dump: Fixes for the name field in the
 PT_NOTE section
To: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>
References: <20210203094454.260583-1-thuth@redhat.com>
 <1edf8bcd-3001-d459-3283-20e8ae2a3862@de.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <74e6c0a6-b08f-be1a-2e66-954982806576@redhat.com>
Date: Thu, 4 Feb 2021 14:09:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1edf8bcd-3001-d459-3283-20e8ae2a3862@de.ibm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/02/2021 14.01, Christian Borntraeger wrote:
> 
> 
> On 03.02.21 10:44, Thomas Huth wrote:
>> According to the "ELF-64 Object File Format" specification:
>>
>> "The first word in the entry, namesz, identifies the length, in
>>   bytes, of a name identifying the entry’s owner or originator. The name field
>>   contains a null-terminated string, with padding as necessary to ensure 8-
>>   byte alignment for the descriptor field. The length does not include the
>>   terminating null or the padding."
>>
>> So we should not include the terminating NUL in the length field here.
>>
>> Also there is a compiler warning with GCC 9.3 when compiling with
>> the -fsanitize=thread compiler flag:
>>
>>   In function 'strncpy',
>>      inlined from 's390x_write_elf64_notes' at ../target/s390x/arch_dump.c:219:9:
>>   /usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error:
>>    '__builtin_strncpy' specified bound 8 equals destination size
>>    [-Werror=stringop-truncation]
>>
>> Since the name should always be NUL-terminated, we can simply decrease
>> the size of the strncpy by one here to silence this warning. And while
>> we're at it, also add an assert() to make sure that the provided names
>> always fit the size field (which is fine for the current callers, the
>> function is called once with "CORE" and once with "LINUX" as a name).
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   The ELF-64 spec can be found here, for example:
>>   https://uclibc.org/docs/elf-64-gen.pdf
>>
>>   Here's a CI run with the compiler warning:
>>   https://gitlab.com/huth/qemu/-/jobs/1003508341#L1248
>>
>>   target/s390x/arch_dump.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
>> index 50fa0ae4b6..20c3a09707 100644
>> --- a/target/s390x/arch_dump.c
>> +++ b/target/s390x/arch_dump.c
>> @@ -212,11 +212,13 @@ static int s390x_write_elf64_notes(const char *note_name,
>>       int note_size;
>>       int ret = -1;
>>   
>> +    assert(strlen(note_name) < sizeof(note.name));
>> +
>>       for (nf = funcs; nf->note_contents_func; nf++) {
>>           memset(&note, 0, sizeof(note));
>> -        note.hdr.n_namesz = cpu_to_be32(strlen(note_name) + 1);
>> +        note.hdr.n_namesz = cpu_to_be32(strlen(note_name));
>>           note.hdr.n_descsz = cpu_to_be32(nf->contents_size);
>> -        strncpy(note.name, note_name, sizeof(note.name));
>> +        strncpy(note.name, note_name, sizeof(note.name) - 1);
> 
> This kind of feels wrong. With 8 bytes of note.name, we should be able to store "Test123" + the final \0.
> Now we tell strncpy to stop at 7. Which means that for Test123 we would NOT copy the final \0.

Yes, but there is a memset(&note, 0, sizeof(note)) at the beginning of the 
for-loop, so the 8th byte should always be set to 0 anyway. But if you 
prefer, I can also simply use g_strlcpy() instead...?

  Thomas


