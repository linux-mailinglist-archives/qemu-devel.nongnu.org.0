Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FB7602954
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 12:30:19 +0200 (CEST)
Received: from localhost ([::1]:57880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okjrV-0004xP-Fz
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 06:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1okjMx-0005Po-U1
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 05:58:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1okjMr-0008Re-9Z
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 05:58:43 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id E529840B11;
 Tue, 18 Oct 2022 12:58:22 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 1F4EF13A;
 Tue, 18 Oct 2022 12:58:25 +0300 (MSK)
Message-ID: <a69ae272-b0a3-cea3-b9a7-a678af274c2a@msgid.tls.msk.ru>
Date: Tue, 18 Oct 2022 12:58:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] linux-user: Implement faccessat2
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, WANG Xuerui <xen0n@gentoo.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Andreas_K_=2e_H=c3=bcttel?= <dilfridge@gentoo.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20221009060813.2289077-1-xen0n@gentoo.org>
 <f47945b7-afce-f0e3-2ca9-6c6cd119cae7@gmx.de>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <f47945b7-afce-f0e3-2ca9-6c6cd119cae7@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_NONE=0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

10.10.2022 11:53, Helge Deller wrote:
> On 10/9/22 08:08, WANG Xuerui wrote:
>> User space has been preferring this syscall for a while, due to its
>> closer match with C semantics, and newer platforms such as LoongArch
>> apparently have libc implementations that don't fallback to faccessat
>> so normal access checks are failing without the emulation in place.
>>
>> Tested by successfully emerging several packages within a Gentoo loong
>> stage3 chroot, emulated on amd64 with help of static qemu-loongarch64.
>>
>> Reported-by: Andreas K. Hüttel <dilfridge@gentoo.org>
>> Signed-off-by: WANG Xuerui <xen0n@gentoo.org>
>> ---
>>   linux-user/strace.list | 3 +++
>>   linux-user/syscall.c   | 9 +++++++++
>>   2 files changed, 12 insertions(+)
> 
> There were two similar approaches from Richard and me:
> https://lore.kernel.org/qemu-devel/20220729201414.29869-1-richard.henderson@linaro.org/#t
> and
> https://lore.kernel.org/qemu-devel/YzLdcnL6x646T61W@p100/

So can we combine the 3 and actually implement it for good? :)

For loongarch64 users this has become essential, because this is a
new enough arch so that userspace does not bother using older syscalls,
in this case it uses faccessat2() for everything, and simplest programs
fail under qemu due to no fallback whatsoever.

Thanks,

/mjt

