Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA4A21D847
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 16:21:35 +0200 (CEST)
Received: from localhost ([::1]:34200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1juzKo-0005xO-2s
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 10:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1juzJE-0004Dh-KF
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 10:19:56 -0400
Received: from 1.mo173.mail-out.ovh.net ([178.33.111.180]:52394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1juzJC-0007na-Ed
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 10:19:56 -0400
Received: from player778.ha.ovh.net (unknown [10.110.115.91])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 095D5146E61
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 16:19:50 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player778.ha.ovh.net (Postfix) with ESMTPSA id 4C0AF1455718C;
 Mon, 13 Jul 2020 14:19:43 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002f4ce4a81-69c6-402d-9314-f1e4916fb6b6,29C60B8BFD44B6CD822E82BF6A6060F4508BB267)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH] hw/net/ftgmac100: Fix integer overflow in
 ftgmac100_do_tx()
To: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>
References: <20200710085417.638904-1-mcascell@redhat.com>
 <CAFEAcA-pRXOz5JVcwHa8=oaeogwaOK0YVXYQiJUpdM_rFZ+QTA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d7affe2b-0a2c-4e06-a874-daccf16bd136@kaod.org>
Date: Mon, 13 Jul 2020 16:19:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-pRXOz5JVcwHa8=oaeogwaOK0YVXYQiJUpdM_rFZ+QTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 7891995398697618332
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrvdekgdejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephfffgeelfeejudevuedvvdeigeduteetveffhfffudeggfegleeljeeuieefuedvnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.33.111.180; envelope-from=clg@kaod.org;
 helo=1.mo173.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 10:19:51
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, ziming zhang <ezrakiez@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/10/20 1:33 PM, Peter Maydell wrote:
> On Fri, 10 Jul 2020 at 09:56, Mauro Matteo Cascella <mcascell@redhat.com> wrote:
>>
>> An integer overflow issue was reported by Mr. Ziming Zhang, CC'd here. It
>> occurs while inserting the VLAN tag in packets whose length is less than
>> 12 bytes, as (len-12) is passed to memmove() without proper checking.
>> This patch is intended to fix this issue by checking the minimum
>> Ethernet frame size during packet transmission.
>>
>> Reported-by: Ziming Zhang <ezrakiez@gmail.com>
>> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
>> ---
>>  hw/net/ftgmac100.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
>> index 043ba61b86..bcf4d84aea 100644
>> --- a/hw/net/ftgmac100.c
>> +++ b/hw/net/ftgmac100.c
>> @@ -238,6 +238,11 @@ typedef struct {
>>   */
>>  #define FTGMAC100_MAX_FRAME_SIZE    9220
>>
>> +/*
>> + * Min frame size
>> + */
>> +#define FTGMAC100_MIN_FRAME_SIZE    64
>> +
>>  /* Limits depending on the type of the frame
>>   *
>>   *   9216 for Jumbo frames (+ 4 for VLAN)
>> @@ -507,6 +512,15 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
>>          }
>>
>>          len = FTGMAC100_TXDES0_TXBUF_SIZE(bd.des0);
>> +
>> +        /* drop small packets */
>> +        if (bd.des0 & FTGMAC100_TXDES0_FTS &&
>> +            len < FTGMAC100_MIN_FRAME_SIZE) {
>> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: frame too small: %d bytes\n",
>> +                          __func__, len);
>> +            break;
>> +        }
>> +
> 
> Andrew, Cedric: do you have the datasheet for this devic? Do you
> know if we should also be flagging the error back to the
> guest somehow?

zero is the only invalid size of a transmit buffer and the specs does
not have any special information on which bit to raise in that case.

I think FTGMAC100_INT_NO_NPTXBUF (transmit buffer unavailable) is our 
best option and we should add an extra 'len == 0' test in front of 
the dma_memory_read() call to raise it. A zero length is not considered 
bogus by dma_memory_read() it seems. Is address zero considered bogus ? 
If not, we need to check that also. 

The code doing the memmove() should be protected by a check on the 
length, 'sizeof(struct eth_header)' or ETH_HLEN. That will fix the 
integer overflow. 

For clarity, we could replace 12 and 16 by a L2 header size: 
'sizeof(struct eth_header)' and 
'sizeof(struct eth_header) + sizeof(struct vlan_header)'. It can be
done later.

Thanks,

C. 


> I think a 'break' here means we'll never update the
> descriptor flags to hand it back to the guest, which
> is probably not what the hardware does.
> 
> thanks
> -- PMM
> 


