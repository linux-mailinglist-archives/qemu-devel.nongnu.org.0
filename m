Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7518067AE19
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 10:37:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKcCw-0003Vb-2z; Wed, 25 Jan 2023 04:36:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pKcCk-0003Ob-GT
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 04:36:38 -0500
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pKcCi-0007Hh-Kw
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 04:36:29 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MOm9H-1p2eds1JXT-00QDkY; Wed, 25 Jan 2023 10:36:23 +0100
Message-ID: <e9412af8-c02b-fb7b-1094-c0259e921e46@vivier.eu>
Date: Wed, 25 Jan 2023 10:36:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 4/5] linux-user/syscall: Extract do_execve() from
 do_syscall1()
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Drew DeVault <sir@cmpwn.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221104173632.1052-1-philmd@linaro.org>
 <20221104173632.1052-5-philmd@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221104173632.1052-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/6tILmsTgxrqZZYDX4kcKr7NCAGPGIHHGHr7v1XMN3XDUr19okt
 pvlEuXsN3G3o4kTNPLLWT+F0+FTSnoBkpTMe6jCunTY5de75Nb37mPyugEXEAGMYt+OVyj9
 YfNsC1qIFHJAxdfIDipRZd4Ru1pIR7Cfz1iM2hjuINc+1r9sNjxpQauufIgMDSPy4JNuw6Y
 uCePv+zRemd0H3y2sYZRw==
UI-OutboundReport: notjunk:1;M01:P0:yH1lPZ6AOS0=;zygs1N4CS3Yr+Wq4WdTqNZ2HTrV
 JKusljnojoQZ09UUP/2SoTCSUE+la2yv+nRKm2FqvxUzt3n1sEUqBI5eB59hrNUW4ZooxHzzF
 MH8UOQSBNv17lpfUh97Ij1m1LdY62O9MKyoN+nC3K0dbC9uK9fM9keR9NKlrIdXy23pudJOBc
 FuqbSVmKlWfzdw1ewca2PzsfdSBXKZUDdU+NB7DFIm31yJdQP2TRne4y+Jl2LhutN8v6/ys/6
 /ULPBbLc5QEpLhbDciIrJ8s/gBPZZZ8CwKakqPEP5PrzaagKwmDaXCGRkfk1AfnX9L4xFK/bp
 HHRXA7hvVzhKKO/LbIKQQV8ietxOQas5pvlUnJecxxjVVc2hfy6L1mzNt99SSypb5MlJy7qB2
 O/0730csg0G5nWtYT86nklmMB9rG0uGln/vxV3yms/oUgd4TEjgSUQKFauhDjnWJBTr1FP05O
 ETTxjXCk1XWRXWbph1clEGE4g3sa5tU4VkaH59G1NtNmrURhG042yQ02xtgc/mWpa9xjaHlE3
 JLL+we7n5/wte+DnI7bGaa3195RxL6/QxkxlcW/rSgmRsjy3PgB1F6fGT7kMWUW91j2cjDqGI
 cWAK7vOFCkvdHLek1PCTEvFKzY6FCg1kFcA7Dz4BsKNRU2nZjkQMnR1mHbyRBYAMJb+z9lwox
 /P5cCgAXi9JPIGVn/O2XbHjIjMmHCgkMgs26RuyBUw==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 04/11/2022 à 18:36, Philippe Mathieu-Daudé a écrit :
> From: Drew DeVault <sir@cmpwn.com>
> 
> execve() is a particular case of execveat(). In order
> to add do_execveat(), first factor do_execve() out.
> 
> Signed-off-by: Drew DeVault <sir@cmpwn.com>
> Message-Id: <20221104081015.706009-1-sir@cmpwn.com>
> [PMD: Split of bigger patch, filled description, fixed style]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   linux-user/syscall.c | 211 +++++++++++++++++++++++--------------------
>   1 file changed, 114 insertions(+), 97 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



