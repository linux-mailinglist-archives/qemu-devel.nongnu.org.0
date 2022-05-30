Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383A353887E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 23:05:50 +0200 (CEST)
Received: from localhost ([::1]:45460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvmaD-0007E4-BM
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 17:05:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvmYD-0006CS-PW; Mon, 30 May 2022 17:03:45 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvmYC-0003lo-32; Mon, 30 May 2022 17:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kNZNQC/9NNc43UbcSkBwRnmXwTjYDzT5BNvWpnX2AY8=; b=vUZZCUY1MBtFnDUu19u3jUPQ0i
 0rWZT7b9aKJQ9dQ7zqfUVmq8iYZ6ZsWRTdKZN16797/nRScCG6MfBNQ4hdu3iLSsYwF7uOhbYsqsd
 CxLDKtU8X5uhTmHXMnaa46c9tBkwV6ri1XY/26dI+IVQwEdN5GP2VUZdjHbl5qNdjQ2VyyyySxWHa
 jLdLawv1Q9WY/ZfjuodK38sJvSHB4zvNMXaonrIDZdEf69U79b3QlylhGDW+hrQzlCq2eX6q/3FQS
 6wA9mcmlZKav+UAidBEZbTTprHT/Vtyi67oMs3lR0gbvsXDmcDcuWwhJ7ez9qJ+u/a+qvXg8/Pl8y
 UHI2wO1TCNlehl33LDDFQqTwnJXoTk0DMSrVXCM/zBcwfIjdtYo4JCO+Ktxnz1IsA3XJTZkHMK930
 hLbNiZJDeyT86MOQip9gCuABSfYxktJknpt3UJnKEUBiHU8AinQhYiYX5xQk/teffxK9ON/J/Ttzn
 /fQvYmW2layNPlCK56nYWdNMgHnPuBzzOOYjs+ruVI6X2uavV12I+ajqnwIHdvCo8nswojyyx2EET
 imWje0JX62IDQ12l2Kpf930LUjmjTWKju92F0aXy1fhWgsQA7MknybefteEegXfEc4d2iqOXmDqpG
 PQyAF6+UKpzYp2FoCPn+3fvbpLdqgG4Ce1rnqRSZA=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvmX3-0009jf-Bm; Mon, 30 May 2022 22:02:37 +0100
Message-ID: <7c3c203c-c83c-a270-b193-6ae587078faf@ilande.co.uk>
Date: Mon, 30 May 2022 22:03:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
 <20220424164935.7339-10-mark.cave-ayland@ilande.co.uk>
 <873eddc7-a18f-2728-14dd-681d951eebbb@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <873eddc7-a18f-2728-14dd-681d951eebbb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 09/11] scsi-disk: allow MODE SELECT block descriptor to
 set the ROM device block size
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/05/2022 13:08, Paolo Bonzini wrote:

> On 4/24/22 18:49, Mark Cave-Ayland wrote:
>> Whilst CDROM drives usually have a 2048 byte sector size, older drives have the
>> ability to switch between 2048 byte and 512 byte sector sizes by specifying a
>> block descriptor in the MODE SELECT command.
>>
>> If a MODE SELECT block descriptor is provided, update the scsi-cd device block
>> size with the provided value accordingly.
>>
>> This allows CDROMs to be used with A/UX whose driver only works with a 512 byte
>> sector size.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> Why do this only for MMC?

No good reason other than I only have an guest OS that does this for CDROMs :)  I can 
easily drop the TYPE_ROM check if you don't think it will cause any unexpected issues 
with other SCSI devices?

> Paolo
> 
>> ---
>>   hw/scsi/scsi-disk.c  | 7 +++++++
>>   hw/scsi/trace-events | 1 +
>>   2 files changed, 8 insertions(+)
>>
>> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
>> index 6991493cf4..41ebbe3045 100644
>> --- a/hw/scsi/scsi-disk.c
>> +++ b/hw/scsi/scsi-disk.c
>> @@ -1583,6 +1583,13 @@ static void scsi_disk_emulate_mode_select(SCSIDiskReq *r, 
>> uint8_t *inbuf)
>>           goto invalid_param;
>>       }
>> +    /* Allow changing the block size of ROM devices */
>> +    if (s->qdev.type == TYPE_ROM && bd_len &&
>> +        p[6] != (s->qdev.blocksize >> 8)) {
>> +            s->qdev.blocksize = p[6] << 8;
>> +            trace_scsi_disk_mode_select_rom_set_blocksize(s->qdev.blocksize);
>> +    }
>> +
>>       len -= bd_len;
>>       p += bd_len;
>> diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
>> index 25eae9f307..1a021ddae9 100644
>> --- a/hw/scsi/trace-events
>> +++ b/hw/scsi/trace-events
>> @@ -340,6 +340,7 @@ scsi_disk_dma_command_WRITE(const char *cmd, uint64_t lba, int 
>> len) "Write %s(se
>>   scsi_disk_new_request(uint32_t lun, uint32_t tag, const char *line) "Command: 
>> lun=%d tag=0x%x data=%s"
>>   scsi_disk_aio_sgio_command(uint32_t tag, uint8_t cmd, uint64_t lba, int len, 
>> uint32_t timeout) "disk aio sgio: tag=0x%x cmd=0x%x (sector %" PRId64 ", count %d) 
>> timeout=%u"
>>   scsi_disk_mode_select_page_truncated(int page, int len, int page_len) "page %d 
>> expected length %d but received length %d"
>> +scsi_disk_mode_select_rom_set_blocksize(int blocksize) "set ROM block size to %d"
>>   # scsi-generic.c
>>   scsi_generic_command_complete_noio(void *req, uint32_t tag, int statuc) "Command 
>> complete %p tag=0x%x status=%d"


ATB,

Mark.

