Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32245E85B8
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 00:17:53 +0200 (CEST)
Received: from localhost ([::1]:50292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obqzZ-0007Ht-48
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 18:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1obqaE-0000A8-BY
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 17:51:42 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:55375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1obqaA-0007Da-Le
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 17:51:42 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MmlfM-1p0hY32i06-00jrmj; Fri, 23 Sep 2022 23:51:25 +0200
Message-ID: <9a35e1f8-5690-3471-053e-50b73f0ee1c8@vivier.eu>
Date: Fri, 23 Sep 2022 23:51:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 2/5] linux-user: Fix madvise(MADV_DONTNEED) on alpha
Content-Language: fr
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20220906000839.1672934-1-iii@linux.ibm.com>
 <20220906000839.1672934-3-iii@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220906000839.1672934-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NeXKN0I73WhbvLZaTtHwUVSsBEP4U5r11Em+9g+kSW42+OKuunl
 DYeJmcDj1Wkt/OcMPUaqZPmvBUS7WCbxwJl+Zf2LuipZogslP8vtNaJ6NygZT1T23J+GMht
 +KcdOhwRTZDPCc5Ej9bEFYSa71aeAJVqHTD+DtKxwRwiE6Pq8YbNmWLh5sOivps4rPhGsu7
 VSKbJz02heD0t8Kp3lOzg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2lzngLJUN+Q=:SoVXZFIyG2cwX+7ltET3tF
 s/3Cg6D5QoZSq6GeJp5b+sTk2JIpiq1/DNjPy4U/Y5jNbkE83Z5V/scXnQAY3Kr3L/tA0KRg9
 6Cxes7WPTBA7V4vXxFbmvvrJw7GLOLjHhnYHeHG6zWvvZorsceNcWqNeN11OAi7bq6g+rBo7S
 gOzK67k2b4lvzVjtaTV0HlXYt0feJ8rGDPeQaS3to2eX+HTZV4VK8GgDb6pWQ6WGnrB4Jm69l
 iTrzxoAaO6RwZDmHdu9HyoBUU5pz2RAczNst1gwPe+S2R+kwPxlLFDMPrxVxot3IcyMKADo3o
 H8cIM0i//qftfrATjG5GlV2q+hhhitA8R5yJZ1z3+UfZtNiqOy18sZZXRq7BTxalALY6ow09n
 9xv5Z9ZlZcIiEjh0bHCczbSFlzW7BfN786C3E1zup27WozW2PvhAJSLELwTC6st03TjNNHu3g
 ddaianFxDTMxrNsvXSumPQRIyy/uV6yQ6jfbkqgCmIivUswrvdOego30jdSzddoicM0dXu9ty
 aGPXeBJi9SGvsN97ftCQXJKUHeQviO7xOcjA1jXinfgWlKoQ2ouxmBSs5hw9a9Z2oFKtyTMMM
 i9qj3pAUniTuEtur7EesqJgFylCt7oGNfCnrjShThHBPPbSspUzBhssioPFYhKGYVBpUt2wFC
 YJ1tdl1mu/AqSSlx7g+ZS+EoQt6N9OQdMILhnAwFMHYk+fEympcsi+5wHW33haQgJ6KxKRvq5
 ZZfObU/qviC/ZXpqijwcDOwRUu1L6fis7gslN0UWxYxHLnfBnDnpyj3QEvE66Sxl1RYw7VWbf
 3JjKNKB
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 06/09/2022 à 02:08, Ilya Leoshkevich a écrit :
> MADV_DONTNEED has a different value on alpha, compared to all the other
> architectures. Fix by using TARGET_MADV_DONTNEED instead of
> MADV_DONTNEED.
> 
> Fixes: 892a4f6a750a ("linux-user: Add partial support for MADV_DONTNEED")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   linux-user/mmap.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 048c4135af..a5f1ab129c 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -22,6 +22,7 @@
>   #include "qemu.h"
>   #include "user-internals.h"
>   #include "user-mmap.h"
> +#include "target_mman.h"
>   
>   static pthread_mutex_t mmap_mutex = PTHREAD_MUTEX_INITIALIZER;
>   static __thread int mmap_lock_count;Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent

> @@ -891,7 +892,7 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
>        * anonymous mappings. In this case passthrough is safe, so do it.
>        */
>       mmap_lock();
> -    if (advice == MADV_DONTNEED &&
> +    if (advice == TARGET_MADV_DONTNEED &&
>           can_passthrough_madv_dontneed(start, end)) {
>           ret = get_errno(madvise(g2h_untagged(start), len, MADV_DONTNEED));
>           if (ret == 0) {
Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent


