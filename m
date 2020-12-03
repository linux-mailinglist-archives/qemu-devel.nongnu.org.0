Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9952CDAE5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 17:13:06 +0100 (CET)
Received: from localhost ([::1]:44568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkrE9-0001TR-O4
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 11:13:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kkrBT-0007MN-5m; Thu, 03 Dec 2020 11:10:19 -0500
Received: from mail.ispras.ru ([83.149.199.84]:52064)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kkrBO-0001GX-Hz; Thu, 03 Dec 2020 11:10:18 -0500
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 70DDC40AAD8F;
 Thu,  3 Dec 2020 16:10:08 +0000 (UTC)
Subject: Re: [PATCH for-6.0 00/11] target/arm: enforce alignment
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
 <CAFEAcA9XFGbyYfcpoOVhtV_wySi9=DyMGe84C4uwYG14Z6bD6Q@mail.gmail.com>
 <56701347-e0a0-ae47-8bba-f5cdff253475@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <3d6d46d8-04bc-7ad8-d71e-4ce15a6e7e47@ispras.ru>
Date: Thu, 3 Dec 2020 19:10:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <56701347-e0a0-ae47-8bba-f5cdff253475@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.12.2020 15:30, Philippe Mathieu-Daudé wrote:
> Cc'ing Pavel
> 
> On 12/1/20 4:55 PM, Peter Maydell wrote:
>> On Wed, 25 Nov 2020 at 04:06, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> As reported in https://bugs.launchpad.net/bugs/1905356
>>>
>>> Not implementing SCTLR.A, but all of the other required
>>> alignment for SCTLR.A=0 in Table A3-1.
>>
>> Something in this series breaks the 'make check-acceptance'
>> record-and-replay test:
>>
>>   (30/40) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt:
>> PASS (9.14 s)
>>   (31/40) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_virt:
>> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
>> Timeout reached\nOriginal status: ERROR\n{'name':
>> '31-tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_virt',
>> 'logdir': '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/result...
>> (90.19 s)
>>
>> The log shows the "recording execution" apparently hanging,
>> with the last output from the guest
>> [    3.183662] Registering SWP/SWPB emulation handler

I looked through the patches and it does not seem that they can break 
anything.
Could it be the same avocado/chardev socket glitch as in some previous 
failures?
What happens when re-running this test?

Pavel Dovgalyuk

