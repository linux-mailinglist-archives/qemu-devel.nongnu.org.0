Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC5231B067
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 13:56:23 +0100 (CET)
Received: from localhost ([::1]:42468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBGwn-0007Xs-O6
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 07:56:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lBGrd-0005FK-Ue; Sun, 14 Feb 2021 07:51:02 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:49223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lBGrb-0002zD-Oc; Sun, 14 Feb 2021 07:51:01 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MNc1T-1lVOJc2M4R-00P5AQ; Sun, 14 Feb 2021 13:50:43 +0100
Subject: Re: [PATCH] linux-user/elfload: do not assume MAP_FIXED_NOREPLACE
 kernel support
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Vincent Fazio <vfazio@xes-inc.com>
References: <20210131061930.14554-1-vfazio@xes-inc.com>
 <87o8gmc2k5.fsf@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <78c75d31-f8be-a98a-8649-87ceca224b8b@vivier.eu>
Date: Sun, 14 Feb 2021 13:50:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87o8gmc2k5.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FFUEkUyy1Tj3E0VAWW8AuAD42lqhFYCHZ/I/mV0jQVZr80595G6
 S13wab1MrCMYWHnXJhAL2UF7gHRXurX1vNJnXY2uUX/d+RzRfVbaEghnQZZ4aHvHSAWYwqG
 WgfE0IMnYbPVMYfe8y0yhPjJettPqGYlfmpikgSUPOYaIcSp1+7P4Et7mB41ZzQTd5ha3Eo
 q6UohyMFUNrPOwKoZ2guA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jYtC17Z/vdY=:CvX3OZSzuP6LrOArD06+Zi
 8i9Tgu9LUVoF9KSqu/xNglyat6+/GWDbaw2x9KV+ZpECuZfd3jpv/KYLRXQhUMgQT9iGDtRsa
 uZnaIO4CTRKJzDc5/gtATEpMoVCmwKiqLcCg1Fy1HjkjhEDJkZfFG8n1HUZcYxA6t2pnMhoKb
 OTOQGnuh7kjQtzgdrWwVh+PIT/tci7HiLneoXURf3FpVUdNjIzqvthjDYbIBKD4rXxy1ak0Oo
 ELEE0uOPa4kCfrltBGOULgqGT00UK25b2H3dJHjwsHq9gw3jKTPxW0ZVHmDSLP5cvtSXAKQCx
 60ruB+CkcRXrovaNPT6YOZCon2siLUbyC5EwdIpojIXxk78U79LGQDbIuhOtI//O23ON8wNcm
 meIs0Z+5vIC0jEtaaxhwKblVfdPYPpJJ+1jIEuDLyajlBAi3IUg0Y//2Sad4ysSYgU53upBVZ
 iOlSPJP3cQ==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Vincent Fazio <vfazio@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/02/2021 à 12:24, Alex Bennée a écrit :
> 
> Vincent Fazio <vfazio@xes-inc.com> writes:
> 
>> From: Vincent Fazio <vfazio@gmail.com>
>>
>> Previously, pgd_find_hole_fallback assumed that if the build host's libc
>> had MAP_FIXED_NOREPLACE defined that the address returned by mmap would
>> match the requested address. This is not a safe assumption for Linux
>> kernels prior to 4.17
> 
> It doesn't as we have in osdep.h:
> 
>   #ifndef MAP_FIXED_NOREPLACE
>   #define MAP_FIXED_NOREPLACE 0
>   #endif
> 
> which is to say to assume if MAP_FIXED_NOREPLACE is defined the kernel
> should have given us what we want otherwise we do the check.


But what is the purpose of the "if (MAP_FIXED_NOREPLACE != 0 ||"?
Can't we rely only on "mmap_start == (void *) align_start"?

Thanks,
Laurent

>>
>> Now, we always compare mmap's resultant address with the requested
>> address and no longer short-circuit based on MAP_FIXED_NOREPLACE.
>>
>> Fixes: 2667e069e7b5 ("linux-user: don't use MAP_FIXED in pgd_find_hole_fallback")
>> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
>> ---
>>  linux-user/elfload.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
>> index 5f5f23d2e5..8d425f9ed0 100644
>> --- a/linux-user/elfload.c
>> +++ b/linux-user/elfload.c
>> @@ -2217,8 +2217,7 @@ static uintptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk,
>>                                       PROT_NONE, flags, -1, 0);
>>              if (mmap_start != MAP_FAILED) {
>>                  munmap(mmap_start, guest_size);
>> -                if (MAP_FIXED_NOREPLACE != 0 ||
>> -                    mmap_start == (void *) align_start) {
>> +                if (mmap_start == (void *) align_start) {
>>                      return (uintptr_t) mmap_start + offset;
>>                  }
>>              }
> 
> 


