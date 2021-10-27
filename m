Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F66A43C38E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 09:09:24 +0200 (CEST)
Received: from localhost ([::1]:36452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfd3r-0006xr-Bn
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 03:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1mfd1j-0005Dy-D3
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 03:07:11 -0400
Received: from mail.ispras.ru ([83.149.199.84]:35224)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1mfd1h-0001x0-41
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 03:07:11 -0400
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id EB5EE40A2BBF;
 Wed, 27 Oct 2021 07:07:02 +0000 (UTC)
Subject: Re: [PATCH] hw/net: store timers for e1000 in vmstate
To: Jason Wang <jasowang@redhat.com>
References: <163524428177.1917083.7115508068018047923.stgit@pasha-ThinkPad-X280>
 <CACGkMEuwW6miZ0GAqFC7WFK+1oOAYoz7x-zC-+Z-u0A_n3x0aA@mail.gmail.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <7efd0945-c885-6bda-96cd-47ce56eae85d@ispras.ru>
Date: Wed, 27 Oct 2021 10:07:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CACGkMEuwW6miZ0GAqFC7WFK+1oOAYoz7x-zC-+Z-u0A_n3x0aA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.215,
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.10.2021 07:05, Jason Wang wrote:
> On Tue, Oct 26, 2021 at 6:36 PM Pavel Dovgalyuk
> <pavel.dovgalyuk@ispras.ru> wrote:
>>
>> Setting timers randomly when vmstate is loaded breaks
>> execution determinism.
>> Therefore this patch allows saving mit and autoneg timers
>> for e1000. It makes execution deterministic and allows
>> snapshotting and reverse debugging in icount mode.
>>
>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>> ---
>>   hw/net/e1000.c |   61 ++++++++++++++++++++++++++++++++++++++++++++++----------
>>   1 file changed, 50 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
>> index a30546c5d5..2f706f7298 100644
>> --- a/hw/net/e1000.c
>> +++ b/hw/net/e1000.c
>> @@ -37,6 +37,7 @@
>>   #include "qemu/iov.h"
>>   #include "qemu/module.h"
>>   #include "qemu/range.h"
>> +#include "sysemu/replay.h"
>>
>>   #include "e1000x_common.h"
>>   #include "trace.h"
>> @@ -1407,7 +1408,7 @@ static int e1000_pre_save(void *opaque)
>>        * complete auto-negotiation immediately. This allows us to look
>>        * at MII_SR_AUTONEG_COMPLETE to infer link status on load.
>>        */
>> -    if (nc->link_down && have_autoneg(s)) {
>> +    if (replay_mode == REPLAY_MODE_NONE && nc->link_down && have_autoneg(s)) {
>>           s->phy_reg[PHY_STATUS] |= MII_SR_AUTONEG_COMPLETE;
>>       }
>>
>> @@ -1438,22 +1439,12 @@ static int e1000_post_load(void *opaque, int version_id)
>>               s->mac_reg[TADV] = 0;
>>           s->mit_irq_level = false;
>>       }
>> -    s->mit_ide = 0;
>> -    s->mit_timer_on = true;
>> -    timer_mod(s->mit_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 1);
>>
>>       /* nc.link_down can't be migrated, so infer link_down according
>>        * to link status bit in mac_reg[STATUS].
>>        * Alternatively, restart link negotiation if it was in progress. */
>>       nc->link_down = (s->mac_reg[STATUS] & E1000_STATUS_LU) == 0;
>>
>> -    if (have_autoneg(s) &&
>> -        !(s->phy_reg[PHY_STATUS] & MII_SR_AUTONEG_COMPLETE)) {
>> -        nc->link_down = false;
>> -        timer_mod(s->autoneg_timer,
>> -                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 500);
>> -    }
> 
> So we won't get those timers armed after migration unconditionally. Is
> this intended?

Not really. I think there could be several solutions:
1. Save some flag to distinguish between old and new state.
2. Use deterministic version for icount (or even record/replay) mode only.
3. Check machine type to change the behavior (as Dave proposed)

> 
> Thanks
> 
>> -
>>       s->tx.props = s->mig_props;
>>       if (!s->received_tx_tso) {
>>           /* We received only one set of offload data (tx.props)
>> @@ -1472,6 +1463,13 @@ static int e1000_tx_tso_post_load(void *opaque, int version_id)
>>       return 0;
>>   }
>>
>> +static int e1000_mit_timer_post_load(void *opaque, int version_id)
>> +{
>> +    E1000State *s = opaque;
>> +    s->mit_timer_on = true;
>> +    return 0;
>> +}
>> +
>>   static bool e1000_mit_state_needed(void *opaque)
>>   {
>>       E1000State *s = opaque;
>> @@ -1493,6 +1491,21 @@ static bool e1000_tso_state_needed(void *opaque)
>>       return chkflag(TSO);
>>   }
>>
>> +static bool e1000_mit_timer_needed(void *opaque)
>> +{
>> +    E1000State *s = opaque;
>> +
>> +    return s->mit_timer_on;
>> +}
>> +
>> +static bool e1000_autoneg_timer_needed(void *opaque)
>> +{
>> +    E1000State *s = opaque;
>> +
>> +    return have_autoneg(s)
>> +           && !(s->phy_reg[PHY_STATUS] & MII_SR_AUTONEG_COMPLETE);
>> +}
>> +
>>   static const VMStateDescription vmstate_e1000_mit_state = {
>>       .name = "e1000/mit_state",
>>       .version_id = 1,
>> @@ -1541,6 +1554,30 @@ static const VMStateDescription vmstate_e1000_tx_tso_state = {
>>       }
>>   };
>>
>> +static const VMStateDescription vmstate_e1000_mit_timer = {
>> +    .name = "e1000/mit_timer",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .needed = e1000_mit_timer_needed,
>> +    .post_load = e1000_mit_timer_post_load,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_TIMER_PTR(mit_timer, E1000State),
>> +        VMSTATE_UINT32(mit_ide, E1000State),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static const VMStateDescription vmstate_e1000_autoneg_timer = {
>> +    .name = "e1000/autoneg_timer",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .needed = e1000_autoneg_timer_needed,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_TIMER_PTR(autoneg_timer, E1000State),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>>   static const VMStateDescription vmstate_e1000 = {
>>       .name = "e1000",
>>       .version_id = 2,
>> @@ -1622,6 +1659,8 @@ static const VMStateDescription vmstate_e1000 = {
>>           &vmstate_e1000_mit_state,
>>           &vmstate_e1000_full_mac_state,
>>           &vmstate_e1000_tx_tso_state,
>> +        &vmstate_e1000_mit_timer,
>> +        &vmstate_e1000_autoneg_timer,
>>           NULL
>>       }
>>   };
>>
> 


