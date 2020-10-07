Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AFD285B57
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 10:55:19 +0200 (CEST)
Received: from localhost ([::1]:40274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQ5EE-0003Gg-NR
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 04:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kQ5B2-00007i-BS
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 04:52:00 -0400
Received: from mail.ispras.ru ([83.149.199.84]:33138)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kQ5B0-0003oC-1B
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 04:52:00 -0400
Received: from [192.168.0.183] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 6F21340A1DA4;
 Wed,  7 Oct 2020 08:51:54 +0000 (UTC)
Subject: Re: acceptance-system-fedora failures
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <f9e09f0b-3915-382c-d670-8d33d164ad7b@redhat.com>
 <4e191372-c332-8f69-85e2-1ff6ead0f40d@redhat.com>
 <59d2a787-bcd4-7283-693b-09ea04c16dc6@redhat.com>
 <6068346f-b034-9321-0eea-29233c23a300@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <78ce9ac1-d2a1-9dc0-bf38-f9ac34b2f203@ispras.ru>
Date: Wed, 7 Oct 2020 11:51:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6068346f-b034-9321-0eea-29233c23a300@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 04:51:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.10.2020 11:23, Thomas Huth wrote:
> On 07/10/2020 09.13, Philippe Mathieu-Daudé wrote:
>> On 10/7/20 7:20 AM, Philippe Mathieu-Daudé wrote:
>>> On 10/7/20 1:07 AM, John Snow wrote:
>>>> I'm seeing this gitlab test fail quite often in my Python work; I don't
>>>> *think* this has anything to do with my patches, but maybe I need to try
>>>> and bisect this more aggressively.
> [...]
>>> w.r.t. the error in your build, I told Thomas about the
>>> test_ppc_mac99/day15/invaders.elf timeouting but he said this is
>>> not his area. Richard has been looking yesterday to see if it is
>>> a TCG regression, and said the test either finished/crashed raising
>>> SIGCHLD, but Avocado parent is still waiting for a timeout, so the
>>> children become zombie and the test hang.
>>
>> Expected output:
>>
>> Quiescing Open Firmware ...
>> Booting Linux via __start() @ 0x01000000 ...
>>
>> But QEMU exits in replay_char_write_event_load():
>>
>> Quiescing Open Firmware ...
>> qemu-system-ppc: Missing character write event in the replay log
>> $ echo $?
>> 1
>>
>> Latest events are CHECKPOINT CHECKPOINT INTERRUPT INTERRUPT INTERRUPT.
>>
>> Replay file is ~22MiB. End of record using "system_powerdown + quit"
>> in HMP.
>>
>> I guess we have 2 bugs:
>> - replay log
>> - avocado doesn't catch children exit(1)
>>
>> Quick reproducer:
>>
>> $ make qemu-system-ppc check-venv
>> $ tests/venv/bin/python -m \
>>    avocado --show=app,console,replay \
>>    run --job-timeout 300 -t machine:mac99 \
>>    tests/acceptance/replay_kernel.py
> 
> Thanks, that was helpful. ... and the winner is:
> 
>      commit   55adb3c45620c31f29978f209e2a44a08d34e2da
>      Author:  John Snow <jsnow@redhat.com>
>      Date:    Fri Jul 24 01:23:00 2020 -0400
>      Subject: ide: cancel pending callbacks on SRST
> 
> ... starting with this commit, the tests starts failing. John, any idea what
> might be causing this?

This patch includes the following lines:

+        aio_bh_schedule_oneshot(qemu_get_aio_context(),
+                                ide_bus_perform_srst, bus);

replay_bh_schedule_oneshot_event should be used instead of this 
function, because it synchronizes non-deterministic BHs.


> 
>   Thomas
> 


