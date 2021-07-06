Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28623BC5C6
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:50:47 +0200 (CEST)
Received: from localhost ([::1]:49550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0d2k-0006yU-CN
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1m0cgm-0004hr-Tb
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:28:04 -0400
Received: from mail.ispras.ru ([83.149.199.84]:49290)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1m0cgk-0004UQ-BY
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:28:04 -0400
Received: from [192.168.0.92] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id 6644A40A2BB4;
 Tue,  6 Jul 2021 04:27:55 +0000 (UTC)
Subject: Re: [PATCH v2 2/6] tests/acceptance: add replay kernel test for ppc64
To: Willian Rampazzo <wrampazz@redhat.com>
References: <162459953801.387455.14911900669864582030.stgit@pasha-ThinkPad-X280>
 <162459954921.387455.17000468377504697052.stgit@pasha-ThinkPad-X280>
 <CAKJDGDb+fDxJw2ZnLPGSZ0_VLPrJdfq2wbVw=zbsvb8_tU1kOA@mail.gmail.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <00acec89-4516-60c0-b9bb-86202c6f0389@ispras.ru>
Date: Tue, 6 Jul 2021 07:27:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKJDGDb+fDxJw2ZnLPGSZ0_VLPrJdfq2wbVw=zbsvb8_tU1kOA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.07.2021 20:46, Willian Rampazzo wrote:
> Already upstream :)

Ok, thanks.

> 
> On Fri, Jun 25, 2021 at 2:39 AM Pavel Dovgalyuk
> <pavel.dovgalyuk@ispras.ru> wrote:
>>
>> This patch adds record/replay test which boots Linux
>> kernel on ppc64 platform. The test uses kernel binaries
>> taken from boot_linux_console test.
>>
>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>> ---
>>   tests/acceptance/replay_kernel.py |   13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
>> index cdc22cb6d3..7e7f4c8ccc 100644
>> --- a/tests/acceptance/replay_kernel.py
>> +++ b/tests/acceptance/replay_kernel.py
>> @@ -367,6 +367,19 @@ def test_xtensa_lx60(self):
>>           self.do_test_advcal_2018(file_path, 'santas-sleigh-ride.elf',
>>                                    args=('-cpu', 'dc233c'))
>>
>> +    def test_ppc64_e500(self):
>> +        """
>> +        :avocado: tags=arch:ppc64
>> +        :avocado: tags=machine:ppce500
>> +        :avocado: tags=cpu:e5500
>> +        """
>> +        tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
>> +        tar_url = ('https://www.qemu-advent-calendar.org'
>> +                   '/2018/download/day19.tar.xz')
>> +        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
>> +        self.do_test_advcal_2018(file_path, 'uImage', ('-cpu', 'e5500'))
>> +
>> +
>>   @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
>>   class ReplayKernelSlow(ReplayKernelBase):
>>       # Override the timeout, because this kernel includes an inner
>>
> 


