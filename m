Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FBE2485EA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 15:18:10 +0200 (CEST)
Received: from localhost ([::1]:49378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k81VB-0005Yz-9s
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 09:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1k81UT-00052u-TT
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 09:17:25 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:54339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1k81UR-0000YB-OD
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 09:17:25 -0400
Received: from [192.168.100.1] ([82.252.135.186]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mq2Sa-1kTLwr1Ogk-00nDXH; Tue, 18 Aug 2020 15:17:19 +0200
Subject: Re: [PATCH v2] linux-user: Fix 'semop()' and 'semtimedop()'
 implementation
To: Filip Bozuta <Filip.Bozuta@syrmia.com>, qemu-devel@nongnu.org
References: <20200817152346.32092-1-Filip.Bozuta@syrmia.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <5eedf51a-2226-fcdf-448b-7b71e55b2281@vivier.eu>
Date: Tue, 18 Aug 2020 15:17:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817152346.32092-1-Filip.Bozuta@syrmia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZnoGGVco/2LnKNbN/uf5AHY4qmruUypEJoD3qGXM7doT4bbyo1x
 KJoGRxjjiT0MIjMQhImkDFrygJc8Vp6H12fxmeFROg/9Q54Fi9Vynr3+OV7aJMvn99gOJd9
 ocYIZkeoqUL+NEi4gxfz+dbWnW0QoX7hJsGo0IoYE2NrACrvUrPrqkkO8lMa1zgXiPrXJZX
 S1uqZKJu0Ar55y7FpUcxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ikMzJBZVCQ4=:f9PdKEAgFBiwabyiGCmR7n
 S80n9URMb4bcwcvumwxHAkQlA404nK7UiFxzf//JIFFfWNe85iOtxhbaXwZi7hkd8pOQH16TH
 5LHJHIqJDWILUFXWDq92ENLY0tB0VxSGxMw7g4POt3RBTbWSUy1SjbAwQJUYopdT6i/e/ta6s
 DBosRUrjoQz4I+lrvCFkKRiX06uF00AWQtF+IjvrucJfXjrl8HszNxDue48V+YpL9B8pOIiRb
 knD3lc7iL8UI+1Q9N6k9AnkJPdND5KfSfzVjPdFgnlgSbMV0pnqalUlhRCSrGE25hgEQNKpHV
 YlK8K7Sh/pxSzTKEUUZXNn/b+QxPa7LfpbviDnl9vI/Uelh8MaPLMBCOCLgpu3xs8hDDg1z9D
 m3z2+Qhsz3W6OGQasEILGdjXWpywhzAMyUrkY3L1dwSB8Gwn7n4sERtgim7oQ8eAFfzI5kIDa
 CB3YwYNJGj08E/oWlJQJvq5sAqeP8E+pPx8rBNFhtV5gaoyVq6tfsd2K8b+9AVrZsp9U6cv31
 c8704Qyb5HXIiDQbqyXXEfs5jayGT2k8L05cd1NmA7ZM0mFtxq/Q+kdbB7s6DiK8Gqj6OQC1H
 7X49qK6yHE235xF7jYDYTY7FtTwPs5Ri34xO0acOR4t3KwqPX6cZc2XfkP+uZ36M1s81Fx2bo
 VcE9x10J0hqjrgplh4p8W6C8B1BeIQKSIxFd+9Qs2E1a7wPCWzPUwsDqZ7ydA3QTmyk6j6Vxz
 /psyjroF6m0M/qsej/2qRg8wDd2WmhbzoDhz61aW72cVfniAWej4rtcUNr2Xy6iPB8HpBpUr2
 x74EEDQ28t/7oMWVXSvxsng2CkUPRef7tLev7U3kDUMXMYh9IxMHO378L/pJKUjEltdCyd9
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 08:11:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/08/2020 à 17:23, Filip Bozuta a écrit :
> The implementations of syscalls 'semop()' and 'semtimedop()' in
> file 'syscall.c' use function 'target_to_host_sembuf()' to convert
> values of 'struct sembuf' from host to target. However, before this
> conversion it should be check whether the number of semaphore operations
> 'nsops' is not bigger than maximum allowed semaphor operations per
> syscall: 'SEMOPM'. In these cases, errno 'E2BIG' ("Arg list too long")
> should be set. But the implementation will set errno 'EFAULT' ("Bad address")
> in this case since the conversion from target to host in this case fails.
> 
> This was confirmed with the LTP test for 'semop()' ('ipc/semop/semop02') in
> test case where 'nsops' is greater than SEMOPM with unaproppriate errno EFAULT:
> 
> semop02.c:130: FAIL: semop failed unexpectedly; expected: E2BIG: EFAULT (14)
> 
> This patch changes this by adding a check whether 'nsops' is bigger than
> 'SEMOPM' before the conversion function 'target_to_host_sembuf()' is called.
> After the changes from this patch, the test works fine along with the other
> LTP testcases for 'semop()'):
> 
> semop02.c:126: PASS: semop failed as expected: E2BIG (7)
> 
> Implementation notes:
> 
>     A target value ('TARGET_SEMOPM') was added for 'SEMOPM' as to be sure
>     in case the value is not available for some targets.
> 
> Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
> ---
>  linux-user/syscall.c      | 12 ++++++++++--
>  linux-user/syscall_defs.h |  2 ++
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 1211e759c2..70b172740c 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -3904,7 +3904,7 @@ static inline abi_long do_semtimedop(int semid,
>                                       unsigned nsops,
>                                       abi_long timeout)
>  {
> -    struct sembuf sops[nsops];
> +    struct sembuf *sops = NULL;

No need to set it to NULL.

>      struct timespec ts, *pts = NULL;
>      abi_long ret;
>  
> @@ -3915,8 +3915,15 @@ static inline abi_long do_semtimedop(int semid,
>          }
>      }
>  
> -    if (target_to_host_sembuf(sops, ptr, nsops))
> +    if (nsops > TARGET_SEMOPM) {
> +        return -TARGET_E2BIG;
> +    }
> +
> +    sops = g_new(struct sembuf, nsops);
> +
> +    if (target_to_host_sembuf(sops, ptr, nsops)) {

Add:

g_free(sops);

>          return -TARGET_EFAULT;
> +    }
>  
>      ret = -TARGET_ENOSYS;
>  #ifdef __NR_semtimedop

Thanks,
Laurent

