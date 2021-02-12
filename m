Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6EA319AC9
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 08:47:24 +0100 (CET)
Received: from localhost ([::1]:46908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lATAh-0008Gh-7o
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 02:47:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lAT9E-0007kO-5t
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 02:45:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lAT99-000499-Kw
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 02:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613115944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Lc220DFDF86fyb3ekQl56ffqDgLqDhHmNuqeNVOOPI=;
 b=Pzr0AQYeIzAmPTiFAGKMAk65RWd7jlDBZb2oM0x+cfniiw+liptsnbM5JHMSaej1DKmBYZ
 fvJF/dgoE1nppmkEjiu94Ow2HudWEEZHXOll0vsBOSvK3vIPbokeiw+yP3w72FhZtak7Ko
 DcovQ6Phz6c5mTT7lOruWS2KRpDKaoI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-0oUmmCvMNeKWdnzrQYIIzw-1; Fri, 12 Feb 2021 02:45:42 -0500
X-MC-Unique: 0oUmmCvMNeKWdnzrQYIIzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B9A3196632C;
 Fri, 12 Feb 2021 07:45:41 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-27.ams2.redhat.com [10.36.112.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91DC51F455;
 Fri, 12 Feb 2021 07:45:40 +0000 (UTC)
Subject: Re: [PATCH] linux-user/syscall: Silence warning from the undefined
 behavior sanitizer
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210211132959.574168-1-thuth@redhat.com>
 <2baf117e-2af0-5bb7-944c-219bcb9282ba@vivier.eu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <da4a4cfe-f39b-edb0-5da8-cb3a3137dbf3@redhat.com>
Date: Fri, 12 Feb 2021 08:45:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <2baf117e-2af0-5bb7-944c-219bcb9282ba@vivier.eu>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/02/2021 22.28, Laurent Vivier wrote:
> Le 11/02/2021 à 14:29, Thomas Huth a écrit :
>> When compiling QEMU with -fsanitize=undefined, there is a warning when
>> running "make check-tcg":
>>
>>    TEST    linux-test on m68k
>> ../linux-user/syscall.c:10499:34: runtime error: member access within
>>   misaligned address 0x00008006df3c for type 'struct linux_dirent64',
>>   which requires 8 byte alignment
>> 0x00008006df3c: note: pointer points here
>>    00 00 00 00 68 03 28 00  00 00 00 00 5b 96 3e e4  61 4b 05 26 18 00 04 2e  00 00 00 00 da 3f 18 00
>>                ^
>>
>> It's likely not an issue in reality, since I assume that on hosts where
>> the alignment really matters (like sparc64), the Linux kernel likely
>> adds the right padding. Anyway, let's use the stw_p() / stq_p() accessor
>> helpers here to silence the warning and thus to allow to compile the code
>> with -fsanitize=undefined, too.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   linux-user/syscall.c | 16 +++++++++-------
>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index 34760779c8..50de535ade 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -10491,20 +10491,22 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>>                   return -TARGET_EFAULT;
>>               ret = get_errno(sys_getdents64(arg1, dirp, count));
>>               if (!is_error(ret)) {
>> -                struct linux_dirent64 *de;
>> +                char *de;
>>                   int len = ret;
>>                   int reclen;
>> -                de = dirp;
>> +                de = (char *)dirp;
>> +                #define de64(x) offsetof(struct linux_dirent64, x)
> 
> Do we really need the cast to the "(char *)"?
> 
> can't we use "&de->XXX" with the accessors?
> We don't access the memory, only read the address, the compiler should be happy.

That's what I thought and tried first, too. Unfortunately, it did not help 
to fix the issue, I had to take the detour via the char*

I guess the compiler also checks the alignment of the pointer when it gets 
assigned to the next record below ("de = ...").

  Thomas


> 
>>                   while (len > 0) {
>> -                    reclen = de->d_reclen;
>> +                    reclen = lduw_he_p(de + de64(d_reclen));
> 
> to avoid human error, it would be better to let the compiler take the good accessor:
> 
>   ldn_he_p(&de->d_reclen, sizeof(de->d_reclen))
> 
>>                       if (reclen > len)
>>                           break;
>> -                    de->d_reclen = tswap16(reclen);
>> -                    tswap64s((uint64_t *)&de->d_ino);
>> -                    tswap64s((uint64_t *)&de->d_off);
>> -                    de = (struct linux_dirent64 *)((char *)de + reclen);
>> +                    stw_p(de + de64(d_reclen), reclen);
>> +                    stq_p(de + de64(d_ino), ldq_he_p(de + de64(d_ino)));
>> +                    stq_p(de + de64(d_off), ldq_he_p(de + de64(d_off)));
> 
> and stwn_he_p() here too.
> 
>> +                    de += reclen;
>>                       len -= reclen;
>>                   }
>> +                #undef de64
>>               }
>>               unlock_user(dirp, arg2, ret);
>>           }
>>
> 
> Thank you Thomas for your help.
> 
> Laurent
> 


