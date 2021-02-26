Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BD6325D80
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 07:26:11 +0100 (CET)
Received: from localhost ([::1]:52550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFWZl-00037z-N4
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 01:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lFWYU-0002ce-JE; Fri, 26 Feb 2021 01:24:50 -0500
Received: from mail.ispras.ru ([83.149.199.84]:48046)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lFWYS-0003Vz-7Z; Fri, 26 Feb 2021 01:24:50 -0500
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id A9C7640755EA;
 Fri, 26 Feb 2021 06:24:35 +0000 (UTC)
Subject: Re: QEMU Clock record and replay
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Arnabjyoti Kalita <akalita@cs.stonybrook.edu>,
 qemu-discuss <qemu-discuss@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
References: <CAJGDS+F0Mtv+XFXeR4wOP35UjmfKt+fiMAfraT7mg9J-4t+SiA@mail.gmail.com>
 <e4677d3d-b221-3bba-185c-5a43faf6aab7@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <ffdcad8a-389a-ed22-0991-940ddeb3c8ed@ispras.ru>
Date: Fri, 26 Feb 2021 09:24:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e4677d3d-b221-3bba-185c-5a43faf6aab7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.435,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.02.2021 18:43, Philippe Mathieu-Daudé wrote:
> Cc'ing Pavel/Alex.
> 
> On 2/25/21 4:09 PM, Arnabjyoti Kalita wrote:
>> Hello all,
>>
>> I am trying to understand how the clock values are recorded and replayed
>> in QEMU (when it runs in TCG mode). I have been specifically following
>> the document that has been provided here -
>> https://github.com/qemu/qemu/blob/master/docs/replay.txt
>> <https://github.com/qemu/qemu/blob/master/docs/replay.txt>
>>
>> I have the following 4 questions to ask-
>>
>> - Why are clock values being replayed off a cache and not directly off
>> the file as seen here -
>> https://github.com/qemu/qemu/blob/stable-5.0/replay/replay-time.c#L45?
>> <https://github.com/qemu/qemu/blob/stable-5.0/replay/replay-time.c#L45?>?

The cache was needed when replay does not follow the record behavior.
E.g., included additional deadline calculations or timer checks.
I'm not sure, that it is still needed, and I'll check it during future
refactoring session.

>> - I have a requirement to record and replay host clock values. Can it so
>> happen that if incorrect values of the host clock are replayed, then the
>> timers in the guest start expiring incorrectly, during replay?

This is a bug, when the host clock is replayed incorrectly.

>> - Let's say we record the clock values when the guest starts in KVM
>> mode, and we replay the clock values when the guest starts in TCG mode.
>> Does the record-replay functionality change a lot?

Only if you want to replay just the clock.
But replaying whole execution includes instruction counting and thread 
synchronization.

>> - Also, I couldn't understand the specific purpose of replaying the
>> 'virtual real time clock' ? Do I still need to record and replay the
>> 'virtual real time clock' if we record the clock values in KVM mode, and
>> replay the clock values in TCG mode?

This clock is used for icount-related timers. For now icount is required
for record replay. If you want to replay only host clock, you don't need 
this one.

Pavel Dovgalyuk

