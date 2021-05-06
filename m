Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 093CA375A1B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 20:20:53 +0200 (CEST)
Received: from localhost ([::1]:38770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leicG-0004pi-5D
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 14:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1leiOU-0006LN-EP
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:06:38 -0400
Received: from mailout01.t-online.de ([194.25.134.80]:59446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1leiOP-000411-ML
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:06:38 -0400
Received: from fwd40.aul.t-online.de (fwd40.aul.t-online.de [172.20.26.139])
 by mailout01.t-online.de (Postfix) with SMTP id 88139C9477;
 Thu,  6 May 2021 20:06:29 +0200 (CEST)
Received: from [192.168.211.200]
 (Gov77kZUwhB4w0bSmOHQcG23bINY+1ZmyaVga3snSn7X3B6x7JgairHv1BrrMqEwc5@[46.86.52.8])
 by fwd40.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1leiOL-0XOtJw0; Thu, 6 May 2021 20:06:29 +0200
Subject: Re: [PATCH 09/10] pckbd: correctly disable PS/2 communication
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <aed90d92-4e34-6f33-005f-10cf176e5483@t-online.de>
 <20210505192133.7480-9-vr_qemu@t-online.de>
 <5bb37b0e-6625-c356-e542-54fc29d4dfb5@redhat.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Message-ID: <1a5a9737-24b6-c132-fc10-80e03b9674cc@t-online.de>
Date: Thu, 6 May 2021 20:06:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <5bb37b0e-6625-c356-e542-54fc29d4dfb5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ID: Gov77kZUwhB4w0bSmOHQcG23bINY+1ZmyaVga3snSn7X3B6x7JgairHv1BrrMqEwc5
X-TOI-EXPURGATEID: 150726::1620324389-0000B3FF-AD9347EF/0/0 CLEAN NORMAL
X-TOI-MSGID: f806a67c-0e70-48d0-82b2-6201c89c796e
Received-SPF: none client-ip=194.25.134.80; envelope-from=vr_qemu@t-online.de;
 helo=mailout01.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Hi Volker,
>
> On 5/5/21 9:21 PM, Volker Rümelin wrote:
>> Currently the PS/2 controller command KBD_CCMD_MOUSE_DISABLE
>> doesn't disable the PS/2 mouse communication at all, and the
>> PS/2 controller commands KBD_CCMD_KBD_DISABLE and
>> KBD_CCMD_KBD_ENABLE disable and enable the keyboard interrupt,
>> which is very different from what a real PS/2 controller does.
>> A guest may notice the difference.
>>
>> Mask out pending data on disabled queues to correctly disable
>> the PS/2 controller communication.
>>
>> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
>> ---
>>   hw/input/pckbd.c | 48 +++++++++++++++++++++++++++++++++++-------------
>>   1 file changed, 35 insertions(+), 13 deletions(-)
>> +static uint8_t kbd_pending(KBDState *s)
>> +{
>> +    return s->pending & (~s->mode | ~(KBD_PENDING_KBD | KBD_PENDING_AUX));
>> +}
> Please introduce kbd_pending() in a preliminary patch.

OK, I will send a version 2 patch series with an additional patch.

With best regards,
Volker

>>   /* update irq and KBD_STAT_[MOUSE_]OBF */
>>   static void kbd_update_irq(KBDState *s)
>>   {
>> +    uint8_t pending = kbd_pending(s);
>> +
>>       s->status &= ~(KBD_STAT_OBF | KBD_STAT_MOUSE_OBF);
>>       s->outport &= ~(KBD_OUT_OBF | KBD_OUT_MOUSE_OBF);
>> -    if (s->pending) {
>> +    if (pending) {
>>           s->status |= KBD_STAT_OBF;
>>           s->outport |= KBD_OUT_OBF;
>> -        if (s->pending & KBD_PENDING_CTRL_KBD) {
>> +        if (pending & KBD_PENDING_CTRL_KBD) {
>>               s->obsrc = KBD_OBSRC_CTRL;


