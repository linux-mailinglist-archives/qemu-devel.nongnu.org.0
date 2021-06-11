Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 229373A417D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 13:53:13 +0200 (CEST)
Received: from localhost ([::1]:55982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrfiq-0003Xk-73
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 07:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lrfi1-0002Am-Qz
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:52:21 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38244
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lrfhz-0005yI-4c
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:52:21 -0400
Received: from host86-132-109-72.range86-132.btcentralplus.com
 ([86.132.109.72] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lrfhi-0000Lb-V2; Fri, 11 Jun 2021 12:52:03 +0100
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 fam@euphon.net, laurent@vivier.eu, hpoussin@reactos.org
References: <20210519100803.10293-1-mark.cave-ayland@ilande.co.uk>
 <20210519100803.10293-5-mark.cave-ayland@ilande.co.uk>
 <09e11569-b61e-db90-efe8-7f2f3c3d4cad@redhat.com>
 <3a4aa5ea-2e71-0f32-5d25-f34a90167019@ilande.co.uk>
 <792a6be1-0738-dab1-564e-939567f0d38b@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <7ac9b89f-6c7b-84fe-ef71-d435f89bf6ff@ilande.co.uk>
Date: Fri, 11 Jun 2021 12:52:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <792a6be1-0738-dab1-564e-939567f0d38b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.132.109.72
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

On 11/06/2021 12:38, Paolo Bonzini wrote:

> On 09/06/21 17:31, Mark Cave-Ayland wrote:
>> Due to the absence of the IDENTIFY byte in the S case I'm guessing from the patch 
>> that the LUN is in encoded in buf[1] (the top bits being "Reserved" according to my 
>> copy of the specification).
> 
> They used to be the LUN many years ago.

Got it :)

>>   static void s_without_satn_pdma_cb(ESPState *s)
>>   {
>> +    uint8_t busid;
>> +
>>       if (!esp_get_tc(s) && !fifo8_is_empty(&s->cmdfifo)) {
>>           s->cmdfifo_cdb_offset = 0;
>>           s->do_cmd = 0;
>> -        do_busid_cmd(s, 0);
>> +        busid = s->cmdfifo.data[1] >> 5;
>> +        do_busid_cmd(s, busid);
>>       }
>>   }
> 
> Considering how obsolete the LUN-in-CDB case is (and now that I actually understand 
> that the first byte is a message-phase byte), it is probably be more correct to keep 
> the previous busid: with no message phase, the previously-selected LUN would be 
> addressed.  I can send a patch for this, but it's orthogonal to this one so I queued 
> it as well.

That was going to be my next question - how do you determine the LUN if there is no 
message phase byte? But that makes sense to me. I don't think that I have a 
LUN-in-CDB example in my set of ESP test images, but I'm happy to run them against 
your patch and make sure there are no regressions.


ATB,

Mark.

