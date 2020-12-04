Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C134F2CE838
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 07:41:31 +0100 (CET)
Received: from localhost ([::1]:60126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl4mY-0007iR-Sn
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 01:41:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kl4jU-0006LE-HA
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 01:38:20 -0500
Received: from mail.ispras.ru ([83.149.199.84]:52152)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kl4jR-00010l-FS
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 01:38:20 -0500
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 757C040A1DBD;
 Fri,  4 Dec 2020 06:38:13 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: fix timeout for vm.wait
To: Cleber Rosa <crosa@redhat.com>
References: <160552129733.22861.2033930860605615947.stgit@pasha-ThinkPad-X280>
 <CAP+75-W2ed_73xszEA08hqdnVRL9bGXshnGYqJGZvSjt4_D8bw@mail.gmail.com>
 <ce6360ce-d640-8a4a-96e8-294dd5f04f0b@redhat.com>
 <f9fe07b1-78e1-76ca-3c02-d6bf77d827d8@ispras.ru>
 <a2587552-4881-9495-e7c1-6a1934da760c@redhat.com>
 <32d30a1d-51a5-b04e-19cb-e33e90b2d659@ispras.ru>
 <20201203165629.GC2787993@localhost.localdomain>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <17eced0a-8d3e-8ac6-5f3b-58c559ea4cb3@ispras.ru>
Date: Fri, 4 Dec 2020 09:38:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201203165629.GC2787993@localhost.localdomain>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.12.2020 19:56, Cleber Rosa wrote:
> On Thu, Dec 03, 2020 at 09:29:10AM +0300, Pavel Dovgalyuk wrote:
>> On 02.12.2020 18:22, John Snow wrote:
>>> On 12/2/20 1:31 AM, Pavel Dovgalyuk wrote:
>>>>>>>
>>>>>>> This patch adds timeout parameter to vm.wait() calls,
>>>>>>> because the default
>>>>>>> value is just 30 seconds, and tests may last for more time.
>>>>>>>
>>>>>
>>>>> This doesn't sound right -- the timeout isn't meant to be for
>>>>> the entire duration of the test, the timeout is from the time of
>>>>> issuing a shutdown command until the time the VM actually shuts
>>>>> down. Ideally, that should not take a particularly long time in
>>>>> a well-behaved test.
>>>>>
>>>>> Why is it lasting longer than 30 seconds?
>>>>
>>>> These are complex Linux boot&execution tests.
>>>> Such loading process could take more than 30 seconds.
>>>> E.g., BootLinux tests have timeout of 900 seconds.
>>>
>>> This timeout should only count towards the time spent *shutting down*,
>>> not the time to run the entire test. 30 seconds used to be enough time
>>> for this to happen on gitlab, if it's taking longer than that I am
>>> worried that something has gone wrong.
>>>
>>> Where were the failures observed, and on what tests? Are there logs I
>>> can review?
>>
>> I've got your point. You were right.
>> The problem was with new long-lasting record/replay tests:
>>
> 
> Hi Pavel,
> 
> You mean a new test you're writing based on "boot_linux.py"?

Right.

> 
>> if record:
>>      cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port),
>>                                    self.name)
>>      vm.shutdown()
>>      logger.info('finished the recording with log size %s bytes'
>>                  % os.path.getsize(replay_path))
>> else:
>>      vm.wait(None)
>>      logger.info('successfully fihished the replay')
>>
>>
>> Replay phase here waits for shutdown for the whole period of Linux boot and
>> execution. We don't check any VM output and just wait for finishing
>> the replay.
>>
> 
> I'm missing why a replay be different when it comes to waiting for a
> successfull "I'm finished booting" from the guest?  Wouldn't the guest
> during the replay act just the same?

Yes, it will act the same.
There is no need in checking the output (because record does not check 
console patterns too), because replay shutdowns automatically after the 
execution ends.

Pavel Dovgalyuk

