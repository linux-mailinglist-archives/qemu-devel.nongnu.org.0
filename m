Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C717E4873E4
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 09:07:42 +0100 (CET)
Received: from localhost ([::1]:50696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5kHl-0003Pj-D9
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 03:07:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n5kFn-0002dR-LA
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 03:05:39 -0500
Received: from [2001:41c9:1:41f::167] (port=38276
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n5kFl-0004Ou-Kl
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 03:05:39 -0500
Received: from [2a00:23c4:8ba0:4900:614:7796:ec2b:4f88]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n5kFF-00014v-3R; Fri, 07 Jan 2022 08:05:09 +0000
Message-ID: <b06a06a0-5833-6341-ba21-8b34c16b4cf1@ilande.co.uk>
Date: Fri, 7 Jan 2022 08:05:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20220105111337.10366-1-hreitz@redhat.com>
 <428615ed-de30-4859-76c7-ab310c4fcf76@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <428615ed-de30-4859-76c7-ab310c4fcf76@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:4900:614:7796:ec2b:4f88
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] ide: Explicitly poll for BHs on cancel
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/01/2022 00:11, Philippe Mathieu-Daudé wrote:

> Cc'ing Mark for macio which seems to have the same issue.

Thanks. Presumably this is all done in the IDE layer so there is no need for any 
changes to the macio device itself?

Note that macio really is just a standard IDE interface but IIRC the reason that 
macio reimplements its own IDE callbacks is because the IDE code doesn't have the 
necessary hooks in place to enable the io->processing (DBDMA) and m->active (macio 
IDE) variables to be set correctly during DMA.

It would be nice one day to be able to fix this so that the existing IDE code could 
be used, which would allow most of this duplicate code to be removed.


ATB,

Mark.

> On 5/1/22 12:13, Hanna Reitz wrote:
>> When we still have an AIOCB registered for DMA operations, we try to
>> settle the respective operation by draining the BlockBackend associated
>> with the IDE device.
>>
>> However, this assumes that every DMA operation is associated with some
>> I/O operation on the BlockBackend, and so settling the latter will
>> settle the former.  That is not the case; for example, the guest is free
>> to issue a zero-length TRIM operation that will not result in any I/O
>> operation forwarded to the BlockBackend.  In such a case, blk_drain()
>> will be a no-op if no other operations are in flight.
>>
>> It is clear that if blk_drain() is a no-op, the value of
>> s->bus->dma->aiocb will not change between checking it in the `if`
>> condition and asserting that it is NULL after blk_drain().
>>
>> To settle the DMA operation, we will thus need to explicitly invoke
>> aio_poll() ourselves, which will run any outstanding BHs (like
>> ide_trim_bh_cb()), until s->bus->dma->aiocb is NULL.  To stop this from
>> being an infinite loop, assert that we made progress with every
>> aio_poll() call (i.e., invoked some BH).
>>
>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2029980
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
>> ---
>> Perhaps for a lack of being aware of all the kinds of tests we have, I
>> found it impossible to write a reproducer in any of our current test
>> frameworks: From how I understand the issue, to reproduce it, you need
>> to issue a TRIM request and immediately cancel it, before
>> ide_trim_bh_cb() (scheduled as a BH) can run.
>>
>> I wanted to do this via qtest, but that does not work, because every
>> port I/O operation is done via a qtest command, and QEMU will happily
>> poll the main context between each qtest command, which means that you
>> cannot cancel an ongoing IDE request before a BH scheduled by it is run.
>>
>> Therefore, I wrote an x86 boot sector that sets up a no-op TRIM request
>> (i.e. one where all TRIM ranges have length 0) and immediately cancels
>> it by setting SRST.  It is attached to the BZ linked above, and can be
>> tested as follows:
>>
>> $ TEST_BIN=test.bin
>> $ (sleep 1; echo 'info registers'; echo quit) \
>>      | ./qemu-system-x86_64 \
>>          -drive if=ide,file=$TEST_BIN,format=raw \
>>          -monitor stdio \
>>      | grep EIP= \
>>      | sed -e 's/ EFL.*//'
>>
>> The result should be:
>> EIP=00007c72
>>
>> Not:
>> qemu-system-x86_64: ../hw/ide/core.c:734: ide_cancel_dma_sync: Assertion
>> `s->bus->dma->aiocb == NULL' failed.
>> ---
>>   hw/ide/core.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/ide/core.c b/hw/ide/core.c
>> index e28f8aad61..c7f7a1016c 100644
>> --- a/hw/ide/core.c
>> +++ b/hw/ide/core.c
>> @@ -731,7 +731,17 @@ void ide_cancel_dma_sync(IDEState *s)
>>       if (s->bus->dma->aiocb) {
>>           trace_ide_cancel_dma_sync_remaining();
>>           blk_drain(s->blk);
>> -        assert(s->bus->dma->aiocb == NULL);
>> +
>> +        /*
>> +         * Wait for potentially still-scheduled BHs, like ide_trim_bh_cb()
>> +         * (blk_drain() will only poll if there are in-flight requests on the
>> +         * BlockBackend, which there may not necessarily be, e.g. when the
>> +         * guest has issued a zero-length TRIM request)
>> +         */
>> +        while (s->bus->dma->aiocb) {
>> +            bool progress = aio_poll(qemu_get_aio_context(), true);
>> +            assert(progress);
>> +        }
>>       }
>>   }
> 


