Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D7E326231
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 12:54:28 +0100 (CET)
Received: from localhost ([::1]:34238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFbhT-0006rc-R5
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 06:54:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lFbf2-0005pZ-Nf
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 06:51:56 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38832
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lFbew-0001sR-4T
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 06:51:56 -0500
Received: from host31-48-197-98.range31-48.btcentralplus.com ([31.48.197.98]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lFben-0007bo-OZ; Fri, 26 Feb 2021 11:51:45 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1614333786-74258-1-git-send-email-bmeng.cn@gmail.com>
 <1614333786-74258-2-git-send-email-bmeng.cn@gmail.com>
 <b9c3f883-7365-f30c-0b22-15b5e089268a@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <2c75b5d7-bafc-8606-4dba-a32cede17a14@ilande.co.uk>
Date: Fri, 26 Feb 2021 11:51:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b9c3f883-7365-f30c-0b22-15b5e089268a@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 31.48.197.98
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH 1/3] net: Pad short frames to minimum size (60 bytes)
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.349,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/02/2021 10:29, Philippe Mathieu-Daudé wrote:

> On 2/26/21 11:03 AM, Bin Meng wrote:
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> The minimum Ethernet frame length is 60 bytes, and we should pad
>> frames whose length is smaller to the minimum size.
>>
>> This commit fixes the issue as seen with various ethernet models,
>> that ARP requests get dropped, preventing the guest from becoming
>> visible on the network.
> 
> Is it also used in commit 18995b9808d ("Send a RARP packet after
> migration.")?
> 
>> The following 2 commits that attempted to workaround this issue
>> in e1000 and vmxenet3 before, should be reverted.
>>
>>    commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
>>    commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")
>>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> ---
>>
>>   net/net.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/net/net.c b/net/net.c
>> index b038370..34004da 100644
>> --- a/net/net.c
>> +++ b/net/net.c
>> @@ -638,6 +638,7 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
>>                                                    NetPacketSent *sent_cb)
>>   {
>>       NetQueue *queue;
>> +    uint8_t min_buf[60];
> 
> Can you add a definition instead of a magic value?
> Maybe ETH_FRAME_MIN_LEN in "net/eth.h"?
> 
>>       int ret;
>>   
>>   #ifdef DEBUG_NET
>> @@ -649,6 +650,14 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
>>           return size;
>>       }
>>   
>> +    /* Pad to minimum Ethernet frame length */
>> +    if (size < sizeof(min_buf)) {
>> +        memcpy(min_buf, buf, size);
>> +        memset(&min_buf[size], 0, sizeof(min_buf) - size);
>> +        buf = min_buf;
>> +        size = sizeof(min_buf);
>> +    }
>> +
>>       /* Let filters handle the packet first */
>>       ret = filter_receive(sender, NET_FILTER_DIRECTION_TX,
>>                            sender, flags, buf, size, sent_cb);
>>

Looks like this pattern is also used in a few other cards. From the SPARC/PPC world:

https://gitlab.com/qemu-project/qemu/-/blob/master/hw/net/pcnet.c#L1003
https://gitlab.com/qemu-project/qemu/-/blob/master/hw/net/sungem.c#L587
https://gitlab.com/qemu-project/qemu/-/blob/master/hw/net/sunhme.c#L778

I can easily review/test patches that remove the same code from the cards.


ATB,

Mark.

