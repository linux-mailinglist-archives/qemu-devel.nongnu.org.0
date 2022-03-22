Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E13D04E3DA6
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 12:33:00 +0100 (CET)
Received: from localhost ([::1]:44436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWcl2-0008Lc-0a
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 07:33:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nWcjs-0007gM-Vm
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:31:49 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:46311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nWcjr-0002wG-5b
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:31:48 -0400
Received: from [192.168.100.1] ([82.142.12.150]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M6DSo-1nQ12O2BOi-006d0o; Tue, 22 Mar 2022 12:31:44 +0100
Message-ID: <731c291a-1ccd-46d0-4c40-d95ca6036b62@vivier.eu>
Date: Tue, 22 Mar 2022 12:31:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/5] linux-user/alpha: Fix sigsuspend for big-endian hosts
Content-Language: fr
From: Laurent Vivier <laurent@vivier.eu>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220315084308.433109-1-richard.henderson@linaro.org>
 <20220315084308.433109-2-richard.henderson@linaro.org>
 <831d87d4-49fb-e738-bed8-2b5af96bfa4f@vivier.eu>
In-Reply-To: <831d87d4-49fb-e738-bed8-2b5af96bfa4f@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZmskBCxluqjFocaS4xs2DID7htPhiJi59LsZY7TCoj7UEWT2vu5
 aw8h4vYh1azERnfQHbtNiS8d5pQkp2kNVy4n75GXVTdmTwJ7/yiBfrJ2Q5AK+BonxuYbxiJ
 3iOE06x8riLjEAyeirSP4W67wdr2epznfq+vkG5Pk9jdEDaDyJ1WZFVioTQnyRSpOarfKzn
 UyZFtcu9Dy9EROIlORdCg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PY634tRSvC8=:K8fpjXBJuskMVqRpv1K1Cs
 +NF1abQ/dVlCj7HexDBrEyoEXtLdj8RA+ZXhWqsLzSMjWm7IexHmcA6M4eRvUT9aTP9FtJF9C
 2ixniwsADEqISJcmgVOzOZXrVDb8ewRAZtXkbe1Hpq+img7gKUyn0qAJVLXOYbdeVFvONqr9x
 uoK2x/WqS0Jw4SFo7mw2jyIvMJUdysa4Ve98Y3r6vyE+Kind1xwgFbqqdExYrwXIDusVBfirf
 2AyJWkjAypsOQwW6akezq6A0axsZ9obg/fMRjC+q99eLtmoWBr4IqaZKBe5fKMNwHlR6hrnKl
 34STdiVIy9x1+m41ufgfXW/uxmHi/xZ9ml14ST5mx5YRLbuxkvhSJPDsHQJLRRHf+5j8cyeQu
 neu2LxeIfKTN5SDLCBtr9QLr1wZStFOzFzXYj1+TV5KN66KYVaRJmg/qHvB4xHWnEGEXMhHN6
 KgByPC7pBYgkBIJY9X9xF7lsfeAH3bUP0akrTwZy5J7AqSmXZ6DvOID6fiG4DrDsHAz/i8aAq
 KEFZkxdMivXziAprpF+N58gSi2l241sMA5NmzG8zE9NQ4n7DU82ImbIqaVIMEa+C97HUD2u1I
 pCxTE0XZRBw+6Oxb4e/kluV530I+QZUi9bvNDWzw6WKg4NzBnB2I2fXwSJxgbQv8HD1ASWqwd
 TGhC97daUBsSyinUg2GlAStL5M1KXC8dnm9dsSj3FF3Rhiz5wy5kCSvh6VeFir2280n0=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 22/03/2022 à 10:58, Laurent Vivier a écrit :
> Le 15/03/2022 à 09:43, Richard Henderson a écrit :
>> On alpha, the sigset argument for sigsuspend is in a register.
>> When we drop that into memory that happens in host-endianness,
>> but target_to_host_old_sigset will treat it as target-endianness.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/syscall.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index b9b18a7eaf..ecd00382a8 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -9559,7 +9559,8 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>>           {
>>               TaskState *ts = cpu->opaque;
>>   #if defined(TARGET_ALPHA)
>> -            abi_ulong mask = arg1;
>> +            /* target_to_host_old_sigset will bswap back */
>> +            abi_ulong mask = tswapal(arg1);
>>               target_to_host_old_sigset(&ts->sigsuspend_mask, &mask);
>>   #else
>>               if (!(p = lock_user(VERIFY_READ, arg1, sizeof(target_sigset_t), 1)))
> 
> And what about target_set in TARGET_NR_ssetmask, mask in TARGET_NR_sigprocmask and in 
> TARGET_NR_osf_sigprocmask?
> 

Anyway, the fix is correct and I will add it in my next pull request.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


