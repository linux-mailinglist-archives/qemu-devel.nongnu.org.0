Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE61565505D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 13:29:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8h9T-0001Bb-UO; Fri, 23 Dec 2022 07:27:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p8h98-0001BC-Ht
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 07:27:30 -0500
Received: from mout.gmx.net ([212.227.17.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p8h95-0008CL-Rm
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 07:27:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1671798443; bh=oBtPk+Pird0k2mhHShwCKFkwOY7e9SfPv2iJ+E5273E=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=YMlPmQB6fwxQXnAf/AbbaqcRhVPFKFWYDEBg62WDvMT34zHytdV5igMpJDdv9O4ip
 AdlS26GNHe9eQrsHxZKsE0osw+WuiLUEDU4iBbf70+KkZUb/z3ZRJindzziFeZ86ca
 TNOpLKa3yCPJ3nERwgFZ3f5ygOk7jMzf/YIcz5aijhfd9SSXJLeB0Z6x8wALsGeXn4
 RrraPgOVfRHVOxxOrTjKQMRoSLNk/WNuihTCffF73WoCsCJ8zWb0E0K/mDhlYr9JJd
 83FAyutSuX79chxzfLkkigf5nybaqTrdTr9aZ9VmTZx8M/qwWiIBMwTh3Ot5BizBdA
 gTvsdlYT/7FJw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.152.212]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7sDq-1pDcpU3p1W-0054pH; Fri, 23
 Dec 2022 13:27:22 +0100
Message-ID: <f66e5330-99fe-db9f-13eb-d3501c65cf17@gmx.de>
Date: Fri, 23 Dec 2022 13:27:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] linux-user: Improve strace output of personality() and
 sysinfo()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20221223100107.17303-1-deller@gmx.de>
 <5780556e-ef12-408d-7f8b-9104314cf9f4@linaro.org>
 <69357647-288c-a032-27f9-2912c6483418@gmx.de>
 <5a06e9f8-f7ea-1dbf-d44b-b9d134d3c400@linaro.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <5a06e9f8-f7ea-1dbf-d44b-b9d134d3c400@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LW2K6U9G08jfnr4vukmANFyJT5Lo3G7baKd2aUuBuC0B5Jn4xj1
 V2VPpkJ4XbG7L6rPokTvQqwGhOaX1uWUvkm4SsyB/J17yI4I0DcOnRj6A2YS6TRFpkG3Ms8
 hV6adVDMNNOuf1abolASDkWXj8AT7aQpn+8JdI+CFrDCczcBgAi6spWxq0esSY8tiryslS7
 U/a3eKaWuS4l2lumIQ2Pg==
UI-OutboundReport: notjunk:1;M01:P0:gy75e0gHdgo=;LB/jPbtk0gpfjAXTiWBkyttIqT1
 890BttrLJ3eD6Gf0V1/Ies1Wb5Xw3gBjt4H4jbb1LnioFUrw+yd4WgU3lZrZHdvx0hHs3PG+a
 Dnyfw7w4JOdgabeA5GhONd0qfY3C9YvJxVxQRtFhW5dnzNNRhIWKJj7E1H0ZHG/eW3FxOq2wj
 vsAzwkXJ8w5BKReyPMOAs/+w7zpvO1oSdHDPylIcuODj0arIDGlK7QAilj6IVtHIln6aRYIvH
 Q2oCpZZ1kpMWNY7ZIRi1Ly/z5Ab1TMjOG57qllBZ8kBVWrFm1t5x++PEM0YilzKNkhyFxUP3a
 N8Ttefz4HxG2qUfR/iFpXvD+2dUORuD5k1B217nTyaSlj0GS1yKukj1N1HFMrWv2GwehJWTgB
 swKE3G+V3YZjkil1lt1Gc+Dc2dDlUm8udZO5JrbiEeQSUA5OL2yT3k0/jqMlu5Qf7r6XnSMYU
 QlDODzqneadrPFLjLAJFurUvaf8OXoAh7o/SwjA1yoqb6wU5QNaSTzP/cgDSG/v3lMHdGjjpM
 cWbJ5+aa79b/c01mz1B0vmRFEI7bCoSEgi0CWjpO5DQLMX8dLcYopD9rzr1X0sKeLk88T5luU
 vKeKGY23kgd77Bq4dZKShQqXGolgMNP7IFfwreNv5lWj+x/xMS9K2TJdqNqEi1JwvDQz1KPl5
 MPjMUP8VucrIojStwp/RU6bNOcNPfduOKKxqRxDq8MrGYz0A+wjntBSb2lFDMprUd2Xi/lkMU
 0c5hKNP+ivFYFdNufEhlv54uIii3YubfHuKh32cSJl66sQCufHdlRZgxXOwXO+ARBWWX0LlQ0
 wPyj7ut7RrA6VZaFDyPotQDhXbtm+SkHoy6yFQRz1QzY4SCGgQMplXsMSh6Xr/Lx40pUzGKqz
 oFYolczsNVr4exoQl2eHpoavIMw0Xow/lulNvUzHd6/OflBUkYfZvR+9bw5LkH3itAB2363t2
 v0Jk8hz5Uho4UjfTd/Sf6n1VwyFWLyO/pACNySItHEwvXR3dmS/ZbnFMQ4HQgOefpVb1Dg==
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/23/22 12:01, Philippe Mathieu-Daud=C3=A9 wrote:
> On 23/12/22 11:53, Helge Deller wrote:
>> On 12/23/22 11:50, Philippe Mathieu-Daud=C3=A9 wrote:
>>> On 23/12/22 11:01, Helge Deller wrote:
>>>> Make the strace look nicer for those two syscalls.
>>>>
>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>> ---
>>>> =C2=A0 linux-user/strace.list | 4 ++--
>>>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/linux-user/strace.list b/linux-user/strace.list
>>>> index f9254725a1..909298099e 100644
>>>> --- a/linux-user/strace.list
>>>> +++ b/linux-user/strace.list
>>>> @@ -1043,7 +1043,7 @@
>>>> =C2=A0 { TARGET_NR_perfctr, "perfctr" , NULL, NULL, NULL },
>>>> =C2=A0 #endif
>>>> =C2=A0 #ifdef TARGET_NR_personality
>>>> -{ TARGET_NR_personality, "personality" , NULL, NULL, NULL },
>>>> +{ TARGET_NR_personality, "personality" , "%s(%p)", NULL, print_sysca=
ll_ret_addr },
>>>
>>> Shouldn't this be:
>>>
>>> =C2=A0=C2=A0=C2=A0 { TARGET_NR_personality, "personality" , "%s(%u)", =
NULL, NULL },
>>
>> Basically yes, but...
>> it's a bitmap, so printing it as hex value (similiar to a pointer)
>> is easier to read/analyze.
>
> Oh, good point. Then "%s(0x"TARGET_ABI_FMT_lx")" is self-explicit.

Hmm ... I don't see that as any benefit for the user and the output is the=
 same.

> Also for clarity:
>
> #define print_syscall_ret_persona print_syscall_ret_addr
>
> So what do you think of:
>
> { TARGET_NR_personality, "personality" , "%s(0x"TARGET_ABI_FMT_lx")",
>  =C2=A0=C2=A0 NULL, print_syscall_ret_persona },

This change does make sense if someone fully implements the
strace of personality() including showing the flags as string.
Until then it's IMHO just one more function which uses space
and gains nothing.

Helge

