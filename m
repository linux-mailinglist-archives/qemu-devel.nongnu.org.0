Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6F14D280D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 06:02:28 +0100 (CET)
Received: from localhost ([::1]:57682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRoSw-00007v-IS
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 00:02:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nRoQo-0007Y2-Ek; Wed, 09 Mar 2022 00:00:14 -0500
Received: from mail.ispras.ru ([83.149.199.84]:46354)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nRoQm-0004KC-0u; Wed, 09 Mar 2022 00:00:13 -0500
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 6904940D403D;
 Wed,  9 Mar 2022 05:00:03 +0000 (UTC)
Message-ID: <63454050-add5-a22d-432f-be492a77ff72@ispras.ru>
Date: Wed, 9 Mar 2022 07:59:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/5] avocado/replay_kernel.py: make tcg-icount check in
 run_vm()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220303153517.168943-1-danielhb413@gmail.com>
 <20220303153517.168943-6-danielhb413@gmail.com>
 <04d9a7d9-13c7-ee86-96c1-90bf8cf9173f@kaod.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <04d9a7d9-13c7-ee86-96c1-90bf8cf9173f@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, crosa@redhat.com, qemu-ppc@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.03.2022 11:47, Cédric Le Goater wrote:
> On 3/3/22 16:35, Daniel Henrique Barboza wrote:
>> The icount framework relies on TCG availability. If QEMU is built with
>> --disable-tcg we won't have icount either, and then this test will fail
>> with the following message in an IBM POWER9 host:
>>
>> tests/avocado/replay_kernel.py:ReplayKernelNormal.test_ppc64_pseries:
>> ERROR: ConnectError: Failed to establish session:
>> (...)
>> /11-tests_avocado_replay_kernel.py_ReplayKernelNormal.test_ppc64_pseries/replay.bin: 
>>
>> cannot configure icount, TCG support not available
>>
>> Although this was revealed in a specific ppc64 scenario, the TCG check
>> is being done in the common code inside run_vm() because all archs need
>> TCG to have access to icount.
>>
>> Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> 
> Pavel,
> 
> Should I take this patch through the ppc tree ?

Nobody has queued it yet, so I think it is ok.

> 
> Thanks,
> 
> C.
> 
> 
>> ---
>>   tests/avocado/replay_kernel.py | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/tests/avocado/replay_kernel.py 
>> b/tests/avocado/replay_kernel.py
>> index c68a953730..0b2b0dc692 100644
>> --- a/tests/avocado/replay_kernel.py
>> +++ b/tests/avocado/replay_kernel.py
>> @@ -36,6 +36,9 @@ class ReplayKernelBase(LinuxKernelTest):
>>       def run_vm(self, kernel_path, kernel_command_line, console_pattern,
>>                  record, shift, args, replay_path):
>> +        # icount requires TCG to be available
>> +        self.require_accelerator('tcg')
>> +
>>           logger = logging.getLogger('replay')
>>           start_time = time.time()
>>           vm = self.get_vm()
>> @@ -243,6 +246,7 @@ def test_ppc64_pseries(self):
>>           """
>>           :avocado: tags=arch:ppc64
>>           :avocado: tags=machine:pseries
>> +        :avocado: tags=accel:tcg
>>           """
>>           kernel_url = ('https://archives.fedoraproject.org/pub/archive'
>>                         
>> '/fedora-secondary/releases/29/Everything/ppc64le/os'
> 


