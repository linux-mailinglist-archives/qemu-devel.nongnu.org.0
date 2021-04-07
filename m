Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CF3356FE4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 17:12:55 +0200 (CEST)
Received: from localhost ([::1]:54440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU9rS-0000B9-5t
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 11:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lU9q6-00081r-20
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 11:11:30 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:36184
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lU9q3-0003Hm-GR
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 11:11:29 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lU9qB-0004Xp-L4; Wed, 07 Apr 2021 16:11:36 +0100
To: Alexander Bulekov <alxndr@bu.edu>
References: <bb30a76c-c758-6829-d3fe-3e2d01cf55b6@ilande.co.uk>
 <20210402162052.264952-1-alxndr@bu.edu>
 <0c024eae-533b-f3fa-8878-9f90d283eef9@ilande.co.uk>
 <20210407144930.3332oqbwzidrou6z@mozz.bu.edu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <30d2b8d8-2861-509b-16be-34767b4cbe4d@ilande.co.uk>
Date: Wed, 7 Apr 2021 16:11:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210407144930.3332oqbwzidrou6z@mozz.bu.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.148.103.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] tests/qtest: add one more test for the am53c974
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/04/2021 15:49, Alexander Bulekov wrote:

> Hi Mark,
> I guess there must have been something timing-sensitive in the
> reproducer... Too bad it didn't work.

Yeah, it would have been nice to have something that could be triggered directly by a 
test but never mind.

>> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
>> index 0037197bdb..b668acef82 100644
>> --- a/hw/scsi/esp.c
>> +++ b/hw/scsi/esp.c
>> @@ -357,6 +357,7 @@ static void handle_satn(ESPState *s)
>>       cmdlen = get_cmd(s, ESP_CMDFIFO_SZ);
>>       if (cmdlen > 0) {
>>           s->cmdfifo_cdb_offset = 1;
>> +        s->do_cmd = 0;
>>           do_cmd(s);
>>       } else if (cmdlen == 0) {
>>           s->do_cmd = 1;
>> @@ -390,6 +391,7 @@ static void handle_s_without_atn(ESPState *s)
>>       cmdlen = get_cmd(s, ESP_CMDFIFO_SZ);
>>       if (cmdlen > 0) {
>>           s->cmdfifo_cdb_offset = 0;
>> +        s->do_cmd = 0;
>>           do_busid_cmd(s, 0);
>>       } else if (cmdlen == 0) {
>>           s->do_cmd = 1;
>>
> 
> With this applied, I don't see either of those asserts anymore.
> Thank you!
> -Alex

Awesome! I'll include this in v4. BTW does this now mean that the am53c974 survives a 
run through your fuzzer corpus?


ATB,

Mark.

