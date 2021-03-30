Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E94034E246
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 09:36:53 +0200 (CEST)
Received: from localhost ([::1]:42380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lR8vk-0001VV-Ha
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 03:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lR8u8-0000xw-NA
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 03:35:12 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:53820
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lR8u4-0000Mf-Db
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 03:35:12 -0400
Received: from host81-157-25-196.range81-157.btcentralplus.com
 ([81.157.25.196] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lR8u5-0001LL-9m; Tue, 30 Mar 2021 08:35:14 +0100
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 alxndr@bu.edu, laurent@vivier.eu
References: <20210317230223.24854-1-mark.cave-ayland@ilande.co.uk>
 <dffedca1-d7e1-206b-3260-6b9d88ac7d54@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <f5ed9741-0f2b-313f-fc66-82f939b24d63@ilande.co.uk>
Date: Tue, 30 Mar 2021 08:34:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <dffedca1-d7e1-206b-3260-6b9d88ac7d54@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.157.25.196
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 0/6] esp: fix asserts/segfaults discovered by fuzzer
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/03/2021 18:13, Paolo Bonzini wrote:

> On 18/03/21 00:02, Mark Cave-Ayland wrote:
>> Recently there have been a number of issues raised on Launchpad as a result of
>> fuzzing the am53c974 (ESP) device. I spent some time over the past couple of
>> days checking to see if anything had improved since my last patchset: from
>> what I can tell the issues are still present, but the cmdfifo related failures
>> now assert rather than corrupting memory.
>>
>> This patchset applied to master passes my local tests using the qtest fuzz test
>> cases added by Alexander for the following Launchpad bugs:
>>
>>    https://bugs.launchpad.net/qemu/+bug/1919035
>>    https://bugs.launchpad.net/qemu/+bug/1919036
>>    https://bugs.launchpad.net/qemu/+bug/1910723
>>    https://bugs.launchpad.net/qemu/+bug/1909247
>> I'm posting this now just before soft freeze since I see that some of the issues
>> have recently been allocated CVEs and so it could be argued that even though
>> they have existed for some time, it is worth fixing them for 6.0.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>
>> v2:
>> - Add Alexander's R-B tag for patch 2 and Phil's R-B for patch 3
>> - Add patch 4 for additional testcase provided in Alexander's patch 1 comment
>> - Move current_req NULL checks forward in DMA functions (fixes ASAN bug reported
>>    at https://bugs.launchpad.net/qemu/+bug/1909247/comments/6) in patch 3
>> - Add qtest for am53c974 containing a basic set of regression tests using the
>>    automatic test cases generated by the fuzzer as requested by Paolo
>>
>>
>> Mark Cave-Ayland (6):
>>    esp: don't underflow cmdfifo if no message out/command data is present
>>    esp: don't overflow cmdfifo if TC is larger than the cmdfifo size
>>    esp: ensure cmdfifo is not empty and current_dev is non-NULL
>>    esp: don't underflow fifo when writing to the device
>>    esp: always check current_req is not NULL before use in DMA callbacks
>>    tests/qtest: add tests for am53c974 device
>>
>>   hw/scsi/esp.c               |  73 +++++++++++++--------
>>   tests/qtest/am53c974-test.c | 122 ++++++++++++++++++++++++++++++++++++
>>   tests/qtest/meson.build     |   1 +
>>   3 files changed, 171 insertions(+), 25 deletions(-)
>>   create mode 100644 tests/qtest/am53c974-test.c
>>
> 
> Queued, thanks.
> 
> Paolo

Hi Paolo,

I had a quick look at Alex's updated test cases and most of them are based on an 
incorrect assumption I made around the behaviour of fifo8_pop_buf(). Can you drop 
these for now, and I will submit a v3 shortly once I've given it a full run through 
my test images?


ATB,

Mark.

