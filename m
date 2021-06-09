Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9448E3A19EA
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:37:28 +0200 (CEST)
Received: from localhost ([::1]:45394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0Gl-0001nW-MI
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lr0Bb-0002dM-OG
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:32:07 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35586
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lr0BY-0006Kl-82
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:32:07 -0400
Received: from host109-155-147-70.range109-155.btcentralplus.com
 ([109.155.147.70] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lr0BD-000786-J8; Wed, 09 Jun 2021 16:31:47 +0100
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 fam@euphon.net, laurent@vivier.eu, hpoussin@reactos.org
References: <20210519100803.10293-1-mark.cave-ayland@ilande.co.uk>
 <20210519100803.10293-5-mark.cave-ayland@ilande.co.uk>
 <09e11569-b61e-db90-efe8-7f2f3c3d4cad@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <3a4aa5ea-2e71-0f32-5d25-f34a90167019@ilande.co.uk>
Date: Wed, 9 Jun 2021 16:31:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <09e11569-b61e-db90-efe8-7f2f3c3d4cad@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.155.147.70
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 4/5] esp: revert 75ef849696 "esp: correctly fill bus id
 with requested lun"
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
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

On 09/06/2021 13:13, Paolo Bonzini wrote:

> On 19/05/21 12:08, Mark Cave-Ayland wrote:
>> This commit from nearly 10 years ago no longer appears to be required and in its
>> current form prevents the MacOS CDROM driver from detecting the CDROM drive. The
>> error is caused by the MacOS CDROM driver sending this CDB without DMA:
>>
>>      0x12 0x00 0x00 0x00 0x05 0x00 (INQUIRY)
>>
>> This is a valid INQUIRY command, however with this logic present the 3rd byte
>> (0x0) is copied over the 1st byte (0x12) which silently converts the INQUIRY
>> command to a TEST UNIT READY command before passing it to the QEMU SCSI layer.
>> Since the TEST UNIT READY command has a zero length response the MacOS CDROM
>> driver never receives a response and assumes the CDROM is not present.
>>
>> Resolve the issue by reverting the original commit which I'm fairly sure is now
>> obsolete so that the original MacOS CDB is passed unaltered to the QEMU SCSI
>> layer.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/scsi/esp.c | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
>> index afb4a7f9f1..a6f7c6c1bf 100644
>> --- a/hw/scsi/esp.c
>> +++ b/hw/scsi/esp.c
>> @@ -260,9 +260,6 @@ static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
>>               return 0;
>>           }
>>           n = esp_fifo_pop_buf(&s->fifo, buf, dmalen);
>> -        if (n >= 3) {
>> -            buf[0] = buf[2] >> 5;
>> -        }
>>           n = MIN(fifo8_num_free(&s->cmdfifo), n);
>>           fifo8_push_all(&s->cmdfifo, buf, n);
>>       }
>>
> 
> This is probably related to S vs SATN, and the bug is that it's doing it even in the 
> S case where cmdfifo_cdb_offset is zero.  You can see that the flow is
> 
> bus[0] = bus[2] >> 5;
>     -> busid = esp_fifo_pop(&s->cmdfifo);    [do_cmd]
>          -> lun = busid & 7;                 [do_busid_cmd]
> 
> However it does seem bogus.
> 
> Perhaps the "S without ATN" cases (handle_s_without_atn, s_without_satn_pdma_cb) 
> should do something like
> 
>     busid = (busid & ~7) | (buf[2] >> 5);
> 
> before calling do_busid_cmd?

That is entirely possible. For reference here is the sequence for the INQUIRY command 
with -trace 'esp*' -trace 'scsi*' without this patch applied:

esp_mem_writeb reg[3]: 0x41 -> 0x01
esp_mem_writeb_cmd_flush Flush FIFO (0x01)
esp_mem_writeb reg[7]: 0x00 -> 0x00
esp_mem_readb reg[12]: 0x04
esp_mem_writeb reg[12]: 0x04 -> 0x04
esp_mem_writeb reg[3]: 0x01 -> 0x44
esp_mem_writeb_cmd_ensel Enable selection (0x44)
esp_mem_readb reg[4]: 0x00
esp_mem_writeb reg[4]: 0x04 -> 0x03
esp_mem_readb reg[4]: 0x00
esp_mem_writeb reg[2]: 0x00 -> 0x12
esp_mem_readb reg[4]: 0x00
esp_mem_writeb reg[2]: 0x12 -> 0x00
esp_mem_readb reg[4]: 0x00
esp_mem_writeb reg[2]: 0x00 -> 0x00
esp_mem_readb reg[4]: 0x00
esp_mem_writeb reg[2]: 0x00 -> 0x00
esp_mem_readb reg[4]: 0x00
esp_mem_writeb reg[2]: 0x00 -> 0x05
esp_mem_readb reg[4]: 0x00
esp_mem_writeb reg[2]: 0x05 -> 0x00
esp_mem_readb reg[4]: 0x00
esp_mem_writeb reg[3]: 0x44 -> 0x41
esp_mem_writeb_cmd_sel Select without ATN (0x41)
esp_get_cmd len 6 target 3
esp_do_busid_cmd busid 0x0
scsi_req_parsed target 3 lun 0 tag 0 command 0 dir 0 length 0
scsi_req_parsed_lba target 3 lun 0 tag 0 command 0 lba 0
scsi_req_alloc target 3 lun 0 tag 0
scsi_disk_new_request Command: lun=0 tag=0x0 data= 0x00 0x00 0x00 0x00 0x05 0x00
scsi_test_unit_ready target 3 lun 0 tag 0
scsi_req_dequeue target 3 lun 0 tag 0
esp_command_complete SCSI Command complete

According to the datasheet the differences between S and SATN are:

S: sends 6, 10, or 12 byte CDB

SATN: sends 1 message phase byte followed by a 6, 10 or 12 byte CDB giving a transfer 
total of 7, 11 or 13 bytes

Due to the absence of the IDENTIFY byte in the S case I'm guessing from the patch 
that the LUN is in encoded in buf[1] (the top bits being "Reserved" according to my 
copy of the specification). The patch below passes a trivial test with MacOS - does 
it look right to you? If so, I'll run it around all my test images and submit a new 
patch if it doesn't cause any regressions.


diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index bfdb94292b..2163becb52 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -260,6 +260,9 @@ static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
              return 0;
          }
          n = esp_fifo_pop_buf(&s->fifo, buf, dmalen);
+        //if (n >= 3) {
+        //    buf[0] = buf[2] >> 5;
+        //}
          n = MIN(fifo8_num_free(&s->cmdfifo), n);
          fifo8_push_all(&s->cmdfifo, buf, n);
      }
@@ -366,16 +369,20 @@ static void handle_satn(ESPState *s)

  static void s_without_satn_pdma_cb(ESPState *s)
  {
+    uint8_t busid;
+
      if (!esp_get_tc(s) && !fifo8_is_empty(&s->cmdfifo)) {
          s->cmdfifo_cdb_offset = 0;
          s->do_cmd = 0;
-        do_busid_cmd(s, 0);
+        busid = s->cmdfifo.data[1] >> 5;
+        do_busid_cmd(s, busid);
      }
  }

  static void handle_s_without_atn(ESPState *s)
  {
      int32_t cmdlen;
+    uint8_t busid;

      if (s->dma && !s->dma_enabled) {
          s->dma_cb = handle_s_without_atn;
@@ -386,7 +393,8 @@ static void handle_s_without_atn(ESPState *s)
      if (cmdlen > 0) {
          s->cmdfifo_cdb_offset = 0;
          s->do_cmd = 0;
-        do_busid_cmd(s, 0);
+        busid = s->cmdfifo.data[1] >> 5;
+        do_busid_cmd(s, busid);
      } else if (cmdlen == 0) {
          s->do_cmd = 1;
          /* Target present, but no cmd yet - switch to command phase */


ATB,

Mark.

