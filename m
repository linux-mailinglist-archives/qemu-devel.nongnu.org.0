Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 400943526F9
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 09:37:02 +0200 (CEST)
Received: from localhost ([::1]:59822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSEMX-0004NK-8K
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 03:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lSEL8-0003ss-E8
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 03:35:34 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:58892
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lSEL5-00031q-Ao
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 03:35:34 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lSEL8-0005cj-FL; Fri, 02 Apr 2021 08:35:39 +0100
To: Alexander Bulekov <alxndr@bu.edu>
References: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
 <20210401170021.x5ek7cusc62m7m6f@mozz.bu.edu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <bb30a76c-c758-6829-d3fe-3e2d01cf55b6@ilande.co.uk>
Date: Fri, 2 Apr 2021 08:35:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210401170021.x5ek7cusc62m7m6f@mozz.bu.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.148.103.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 00/11] esp: fix asserts/segfaults discovered by fuzzer
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/04/2021 18:00, Alexander Bulekov wrote:

> On 210401 0849, Mark Cave-Ayland wrote:
>> Recently there have been a number of issues raised on Launchpad as a result of
>> fuzzing the am53c974 (ESP) device. I spent some time over the past couple of
>> days checking to see if anything had improved since my last patchset: from
>> what I can tell the issues are still present, but the cmdfifo related failures
>> now assert rather than corrupting memory.
>>
>> This patchset applied to master passes my local tests using the qtest fuzz test
>> cases added by Alexander for the following Launchpad bugs:
>>
>>    https://bugs.launchpad.net/qemu/+bug/1919035
>>    https://bugs.launchpad.net/qemu/+bug/1919036
>>    https://bugs.launchpad.net/qemu/+bug/1910723
>>    https://bugs.launchpad.net/qemu/+bug/1909247
>>    
>> I'm posting this now just before soft freeze since I see that some of the issues
>> have recently been allocated CVEs and so it could be argued that even though
>> they have existed for some time, it is worth fixing them for 6.0.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>
>> v3:
>> - Rebase onto master
>> - Rearrange patch ordering (move patch 5 to the front) to help reduce cross-talk
>>    between the regression tests
>> - Introduce patch 2 to remove unnecessary FIFO usage
>> - Introduce patches 3-4 to consolidate esp_fifo_pop()/esp_fifo_push() wrapper
>>    functions to avoid having to introduce 2 variants of esp_fifo_pop_buf()
>> - Introduce esp_fifo_pop_buf() in patch 5 to prevent callers from overflowing
>>    the array used to model the FIFO
>> - Introduce patch 10 to clarify cancellation logic should all occur in the .cancel
>>    SCSI callback rather than at the site of the caller
>> - Add extra qtests in patch 11 to cover addition test cases provided on LP
>>
> 
> Hi Mark,
> I applied this and ran through the whole fuzzer corpus, and all I'm
> seeing are just a few assertion failures:
> handle_satn_stop -> get_cmd -> util/fifo8.c:43:5 and
> hw/scsi/esp.c:790:5
> 
> Tested-by: Alexander Bulekov <alxndr@bu.edu>
> 
> Thank you
> -Alex

Thanks for the testing! I've just realised that there is an error in the get_cmd() 
MIN() check (it should be cmdfifo, not fifo) and also the limit is missing from the 
non-DMA path.

Does the following patch on v3 fix the outstanding get_cmd() asserts?

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index ca062a0400..3b9037e4f4 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -243,7 +243,7 @@ static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
          }
          if (s->dma_memory_read) {
              s->dma_memory_read(s->dma_opaque, buf, dmalen);
-            dmalen = MIN(fifo8_num_free(&s->fifo), dmalen);
+            dmalen = MIN(fifo8_num_free(&s->cmdfifo), dmalen);
              fifo8_push_all(&s->cmdfifo, buf, dmalen);
          } else {
              if (esp_select(s) < 0) {
@@ -263,6 +263,7 @@ static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
          if (n >= 3) {
              buf[0] = buf[2] >> 5;
          }
+        n = MIN(fifo8_num_free(&s->cmdfifo), n);
          fifo8_push_all(&s->cmdfifo, buf, n);
      }
      trace_esp_get_cmd(dmalen, target);

Given that there is going to be a v4 now, if you are able to provide a handful of 
test cases for hw/scsi/esp.c:790:5 as a diff on v3 like you did before then I can 
take a quick look.


ATB,

Mark.

