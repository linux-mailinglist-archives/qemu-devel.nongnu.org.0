Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A365279866
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Sep 2020 12:27:11 +0200 (CEST)
Received: from localhost ([::1]:34966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kM7Q6-0005vX-DF
	for lists+qemu-devel@lfdr.de; Sat, 26 Sep 2020 06:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kM7O2-00059h-PF
 for qemu-devel@nongnu.org; Sat, 26 Sep 2020 06:25:02 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:55081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kM7O0-0007XQ-6p
 for qemu-devel@nongnu.org; Sat, 26 Sep 2020 06:25:01 -0400
Received: from [192.168.100.1] ([82.252.129.222]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MNtGq-1k6mMB1feC-00OGGu; Sat, 26 Sep 2020 12:24:55 +0200
Subject: Re: [PATCH] Fix stack smashing when handling PR_GET_PDEATHSIG
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200507130302.3684-1-steplong@quicinc.com>
 <20200926015649.564-1-steplong@quicinc.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 mQINBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
 WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
 SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
 UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
 Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
 JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
 q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
 RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
 8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
 LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABtCJMYXVyZW50IFZp
 dmllciA8bGF1cmVudEB2aXZpZXIuZXU+iQI4BBMBAgAiBQJWBTDeAhsDBgsJCAcDAgYVCAIJ
 CgsEFgIDAQIeAQIXgAAKCRDzDDi9Py++PCEdD/oD8LD5UWxhQrMQCsUgLlXCSM7sxGLkwmmF
 ozqSSljEGRhffxZvO35wMFcdX9Z0QOabVoFTKrT04YmvbjsErh/dP5zeM/4EhUByeOS7s6Yl
 HubMXVQTkak9Wa9Eq6irYC6L41QNzz/oTwNEqL1weV1+XC3TNnht9B76lIaELyrJvRfgsp9M
 rE+PzGPo5h7QHWdL/Cmu8yOtPLa8Y6l/ywEJ040IoiAUfzRoaJs2csMXf0eU6gVBhCJ4bs91
 jtWTXhkzdl4tdV+NOwj3j0ukPy+RjqeL2Ej+bomnPTOW8nAZ32dapmu7Fj7VApuQO/BSIHyO
 NkowMMjB46yohEepJaJZkcgseaus0x960c4ua/SUm/Nm6vioRsxyUmWd2nG0m089pp8LPopq
 WfAk1l4GciiMepp1Cxn7cnn1kmG6fhzedXZ/8FzsKjvx/aVeZwoEmucA42uGJ3Vk9TiVdZes
 lqMITkHqDIpHjC79xzlWkXOsDbA2UY/P18AtgJEZQPXbcrRBtdSifCuXdDfHvI+3exIdTpvj
 BfbgZAar8x+lcsQBugvktlQWPfAXZu4Shobi3/mDYMEDOE92dnNRD2ChNXg2IuvAL4OW40wh
 gXlkHC1ZgToNGoYVvGcZFug1NI+vCeCFchX+L3bXyLMg3rAfWMFPAZLzn42plIDMsBs+x2yP
 +bkCDQRWBSYZARAAvFJBFuX9A6eayxUPFaEczlMbGXugs0mazbOYGlyaWsiyfyc3PStHLFPj
 rSTaeJpPCjBJErwpZUN4BbpkBpaJiMuVO6egrC8Xy8/cnJakHPR2JPEvmj7Gm/L9DphTcE15
 92rxXLesWzGBbuYxKsj8LEnrrvLyi3kNW6B5LY3Id+ZmU8YTQ2zLuGV5tLiWKKxc6s3eMXNq
 wrJTCzdVd6ThXrmUfAHbcFXOycUyf9vD+s+WKpcZzCXwKgm7x1LKsJx3UhuzT8ier1L363RW
 ZaJBZ9CTPiu8R5NCSn9V+BnrP3wlFbtLqXp6imGhazT9nJF86b5BVKpF8Vl3F0/Y+UZ4gUwL
 d9cmDKBcmQU/JaRUSWvvolNu1IewZZu3rFSVgcpdaj7F/1aC0t5vLdx9KQRyEAKvEOtCmP4m
 38kU/6r33t3JuTJnkigda4+Sfu5kYGsogeYG6dNyjX5wpK5GJIJikEhdkwcLM+BUOOTi+I9u
 tX03BGSZo7FW/J7S9y0l5a8nooDs2gBRGmUgYKqQJHCDQyYut+hmcr+BGpUn9/pp2FTWijrP
 inb/Pc96YDQLQA1q2AeAFv3Rx3XoBTGl0RCY4KZ02c0kX/dm3eKfMX40XMegzlXCrqtzUk+N
 8LeipEsnOoAQcEONAWWo1HcgUIgCjhJhBEF0AcELOQzitbJGG5UAEQEAAYkCHwQYAQIACQUC
 VgUmGQIbDAAKCRDzDDi9Py++PCD3D/9VCtydWDdOyMTJvEMRQGbx0GacqpydMEWbE3kUW0ha
 US5jz5gyJZHKR3wuf1En/3z+CEAEfP1M3xNGjZvpaKZXrgWaVWfXtGLoWAVTfE231NMQKGoB
 w2Dzx5ivIqxikXB6AanBSVpRpoaHWb06tPNxDL6SVV9lZpUn03DSR6gZEZvyPheNWkvz7bE6
 FcqszV/PNvwm0C5Ju7NlJA8PBAQjkIorGnvN/vonbVh5GsRbhYPOc/JVwNNr63P76rZL8Gk/
 hb3xtcIEi5CCzab45+URG/lzc6OV2nTj9Lg0SNcRhFZ2ILE3txrmI+aXmAu26+EkxLLfqCVT
 ohb2SffQha5KgGlOSBXustQSGH0yzzZVZb+HZPEvx6d/HjQ+t9sO1bCpEgPdZjyMuuMp9N1H
 ctbwGdQM2Qb5zgXO+8ZSzwC+6rHHIdtcB8PH2j+Nd88dVGYlWFKZ36ELeZxD7iJflsE8E8yg
 OpKgu3nD0ahBDqANU/ZmNNarBJEwvM2vfusmNnWm3QMIwxNuJghRyuFfx694Im1js0ZY3LEU
 JGSHFG4ZynA+ZFUPA6Xf0wHeJOxGKCGIyeKORsteIqgnkINW9fnKJw2pgk8qHkwVc3Vu+wGS
 ZiJK0xFusPQehjWTHn9WjMG1zvQ5TQQHxau/2FkP45+nRPco6vVFQe8JmgtRF8WFJA==
Message-ID: <46209b8e-7255-918c-b7b8-85112bd46b57@vivier.eu>
Date: Sat, 26 Sep 2020 12:24:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200926015649.564-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:edyWSAwXNR35OHQDD63wuvGqpwctDdvmipeTGV5UOHqvurFI7K6
 AbLp1A2wI4LSSaX3KO3k+rjTJ/Dle/irwwP559q/t6fsbmFNbkTzjlCFQn+JDBCOALjC4hj
 P4u36RCZCwCUn5a2M8T/bJsQ+7gC3KdjXyNZCcVErGCNHfE/wtF4isNzbBPIePhFJPW0kRO
 Jp6thEf9c7UFYnSll1ziA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0keXUzhQhWQ=:xIDfQE2tC9JJbyYiEwd0tA
 Wu8dWDQSD9wq4X0HZXPM1vHCm4d8mcMSCXqqolW+ShC0gnLbtmJ3HnbwHhVlbrPfP1U0JOuat
 xyAIfoIiYt62Ni82m98GAqItbH0bA2sNREJHZts9qnGMS3ZGausQfXG/YMIpEYvuyYIkIY7E4
 kGjUxlkfAYHhpYS5MK2K61B2gXHfzYNk/vORbVTwqKC3Le9SE8VcOhXB6TTmuYq5tkttIiUx3
 U+ExX2nbzbJxaO/AVXeSI+ujYp9vmmpRbcjs/Gc4g92PaIeJ1F6ikpqik+aaW2QY3KJuKZ/9d
 mMXsnjUg0KaLVjU4CjlHNrOJhN94QPLnXuNzYM5HXoRxvUEcfFf/4NOSNzV/He6S3DsJ4CTy4
 x68KsWSReyS7kCIHraZAXukY1Tjs059qwVL0xrAucNDUUkAzLQnVma9ncqGrLmxBq75ayzwN+
 qk3pyQ7bEbe/dqinljRW2xIkwtNKeaQimK+ilQMrfC9dX7jGlIjJBaRbjS5NzijWjwwz/5zVS
 FiAiCnoXwx4ffeN2QW4wlfF3zM+lUXg7a3EOQMtCLKGgr9+FvE1U3jR/OaprbaUvJnnxVYgIy
 8JLWExxK9dzVpj7LyUvjRZo3nl8pCe92te1aJnLp02rrkrVD4P52m5tW1KJQA1tmwH+xsa1hQ
 YesWlaxpdkIkAi8xsJf7RRxE7hH/pUi0rY0BCIyhjkunCps56skSgRjrE//d8OltJIAS8ii5l
 CPt1RUfY02G/jtPq8phmutKrrFsGnDIBhguHnNMpWwOuBMywYfS3JZUtZXFh8rOIuuSsP7x4J
 gcvh8YjZXCVbuf3t9706kz04PHVzP2AYPJFQj7Oal7tMOR4iKQw6hSyY9T0H2tRydYtbtmR
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/26 06:24:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.238,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/09/2020 à 03:56, Stephen Long a écrit :
>>>  linux-user/syscall.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>>> index 05f0391..91f9114 100644
>>> --- a/linux-user/syscall.c
>>> +++ b/linux-user/syscall.c
>>> @@ -10256,7 +10256,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>>>              int deathsig;
>>>              ret = get_errno(prctl(arg1, &deathsig, arg3, arg4, arg5));
>>>              if (!is_error(ret) && arg2
>>> -                && put_user_ual(deathsig, arg2)) {
>>> +                && put_user_s32(deathsig, arg2)) {
>>>                  return -TARGET_EFAULT;
>>>              }
>>>              return ret;
> 
> Hi Laurent, is it possible to get this patch into master?
> 


Applied to my linux-user-for-5.2 branch.

Thanks,
Laurent

