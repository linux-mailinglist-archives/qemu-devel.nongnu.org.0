Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE8A67ADD3
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 10:29:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKc5c-0000bx-Lc; Wed, 25 Jan 2023 04:29:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pKc5a-0000bZ-4d
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 04:29:06 -0500
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pKc5Y-0006Cj-96
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 04:29:05 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MVaQW-1pCo3A3CYG-00Rbej; Wed, 25 Jan 2023 10:28:56 +0100
Message-ID: <4e4ad1a0-cf14-aaee-611b-392a3204b543@vivier.eu>
Date: Wed, 25 Jan 2023 10:28:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 2/5] linux-user/strace: Extract print_execve_argv()
 from print_execve()
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Drew DeVault <sir@cmpwn.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221104173632.1052-1-philmd@linaro.org>
 <20221104173632.1052-3-philmd@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221104173632.1052-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UbBRdjYYzy650hrA0iHT0gL7cCRAR+eTuogOgAyZiIsRUw9S8nw
 qQilF9HP+eufOPScSamUuOOd0HkTv9IMu/mOOA9DZJaBmgt9LkRM4KkeeYqzVz0rw+oheR0
 +X2zySUspamEh0w6dooZq4F7XuX+8tNV0IUfoKnuUrdU9N4GNIzKubRzq1rASaX8p1mW8T/
 s3tGCknBKye7E4bMx7P2Q==
UI-OutboundReport: notjunk:1;M01:P0:+I/A9U/A1/k=;JymyPLOYXWJVImZYsM3VbkCIIWE
 8cWY8d2UKXJLFVFVsG0BidS7ZBYKIz62TW/7w0wsJqX29zka32Ye8E1Z7kjMo83tJ1xQ9L5Zg
 7mAuYZrvZ6rPBFGP+34WRa3leWhY/qSq+PxCF6I9Wu4/5Ue9yl4oG2BKiTe//ee7PE1Xuqrfs
 qoQFPO5xqLEHD8aNwRe5yJAW8VKzbPO57iZSKULLPlF+AHjLUzYO8TJy9euApW8XgT5ZkOlVG
 sxJqjRpvoEIm5XZjETM+qNVK/hgWYfjU5w/E23nLNvL/DZNI6NB31WVqP0ULtZ32eblDKPsU6
 tK7wlsIyMT1uJfSDSnz7LywlcpKjbWXCTCeIz34qKyump5xXxPd6tBGs4tgRcrRMBOhBJ2nH9
 zBSqKHy1/7uOqCmvW5IE/jy2ICAmk9EzUDiADndfIJgHjq0gJy3WjxIwyz9RYCvM/TwL0A6pd
 uc3luwUX9p+mI5qtbhfpOb0PECvnoC6DBuQyYxdbKvKEirdfFXjg6+JM4Z1uYElZv5G3dzKL4
 qcJmsePILZHcfyTBa642lqvSp9ur+e9vh7L+r8ecnblLpGs2aLEIjM8iDESwkt3H/ovx2dilM
 N23A+XzlASSc/rrgHlgYYRhyw2E5eIIA7Axq88rAe9UMF5Yl1p8KWP1W66iUC7XQyFNPddzIr
 KPrScapMI6lRgH9pgpkP98ql2f23/Xm5Sqc3ETPg8A==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
> In order to add print_execveat() which re-use common code from
> print_execve(), extract print_execve_argv() from it.
> 
> Signed-off-by: Drew DeVault <sir@cmpwn.com>
> Message-Id: <20221104081015.706009-1-sir@cmpwn.com>
> [PMD: Split of bigger patch, filled description, fixed style]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   linux-user/strace.c | 71 +++++++++++++++++++++++++--------------------
>   1 file changed, 39 insertions(+), 32 deletions(-)


Reviewed-by: Laurent Vivier <laurent@vivier.eu>


