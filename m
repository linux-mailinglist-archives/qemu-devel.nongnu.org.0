Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CF56D2F5B
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 11:21:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piXP5-00070E-Iy; Sat, 01 Apr 2023 05:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1piXP3-0006zr-6N; Sat, 01 Apr 2023 05:20:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1piXP1-0006cJ-7n; Sat, 01 Apr 2023 05:20:04 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 692204000E;
 Sat,  1 Apr 2023 12:19:57 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id C55E092;
 Sat,  1 Apr 2023 12:19:56 +0300 (MSK)
Message-ID: <f0c02e05-2472-6336-7d82-3159d4302fd9@msgid.tls.msk.ru>
Date: Sat, 1 Apr 2023 12:19:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 0/4] Missing endianness conversions in user mode
Content-Language: en-US
To: Mathis Marion <Mathis.Marion@silabs.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jerome.pouiller@silabs.com>, qemu-stable <qemu-stable@nongnu.org>
References: <20230220085822.626798-1-Mathis.Marion@silabs.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230220085822.626798-1-Mathis.Marion@silabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

20.02.2023 11:58, Mathis Marion пишет:
> From: Mathis Marion <mathis.marion@silabs.com>
> 
> For a bit of context, I was trying to test a network border router [1]
> daemon using the MIPS architecture (see [2]). I didn't have access to
> real MIPS hardware so I figured I would emulate it using QEMU user mode.
> I ran into a couple of problems all related to endianness conversion for
> syscalls between host and target as MIPS is big endian and my x86 host
> is little.
> 
> [1]: https://github.com/SiliconLabs/wisun-br-linux
> [2]: https://github.com/SiliconLabs/wisun-br-linux/issues/5
> 
> v2:
> - remove context from target_to_host_for_each_nlattr()
> 
> Mathis Marion (4):
>    linux-user: fix timerfd read endianness conversion
>    linux-user: fix sockaddr_in6 endianness
>    linux-user: add target to host netlink conversions
>    linux-user: handle netlink flag NLA_F_NESTED

It looks like timefd and netlink conversions are good candidates
for -stable too. I've seen reports of these not working under
qemu linux-user emulation..

Thanks,

/mjt


