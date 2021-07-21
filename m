Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3813B3D18D1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 23:13:25 +0200 (CEST)
Received: from localhost ([::1]:41220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6JWu-0000be-AB
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 17:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1m6JVo-0008Lz-A3
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 17:12:16 -0400
Received: from mailout02.t-online.de ([194.25.134.17]:36220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1m6JVm-0004VU-Aj
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 17:12:16 -0400
Received: from fwd13.aul.t-online.de (fwd13.aul.t-online.de [172.20.27.62])
 by mailout02.t-online.de (Postfix) with SMTP id 9BB1545211;
 Wed, 21 Jul 2021 23:12:10 +0200 (CEST)
Received: from [192.168.211.200]
 (bHPy6YZlgh6Hmvu3DzKEENuCwcJNA5rG5G+0RBW5rYBMW7RFYVMdLaWidFwqZ0ZwyJ@[79.208.26.7])
 by fwd13.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1m6JVV-4Y4KPY0; Wed, 21 Jul 2021 23:11:57 +0200
Subject: Re: [PATCH for 6.1 1/2] ui/gtk: add a keyboard fifo to the VTE
 consoles
To: Gerd Hoffmann <kraxel@redhat.com>
References: <9e436e5c-ed11-69ec-3cb9-a19cbf96cb08@t-online.de>
 <20210718074757.22489-1-vr_qemu@t-online.de>
 <20210721123942.q7omeebgo4o2feyo@sirius.home.kraxel.org>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Message-ID: <6e726972-1bfe-1979-ad4a-86c93116d99a@t-online.de>
Date: Wed, 21 Jul 2021 23:11:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210721123942.q7omeebgo4o2feyo@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ID: bHPy6YZlgh6Hmvu3DzKEENuCwcJNA5rG5G+0RBW5rYBMW7RFYVMdLaWidFwqZ0ZwyJ
X-TOI-EXPURGATEID: 150726::1626901917-00014A6A-0BA17C8A/0/0 CLEAN NORMAL
X-TOI-MSGID: 06e14cd5-acfb-4624-8456-5c475e2beacf
Received-SPF: none client-ip=194.25.134.17; envelope-from=vr_qemu@t-online.de;
 helo=mailout02.t-online.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Zack Marvel <zpmarvel@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> +static void gd_vc_send_chars(VirtualConsole *vc)
>> +{
>> +    uint32_t len, avail;
>> +    const uint8_t *buf;
>> +
>> +    len = qemu_chr_be_can_write(vc->vte.chr);
>> +    avail = fifo8_num_used(&vc->vte.out_fifo);
>> +    if (len > avail) {
>> +        len = avail;
>> +    }
>> +    while (len > 0) {
>> +        uint32_t size;
>> +
>> +        buf = fifo8_pop_buf(&vc->vte.out_fifo, len, &size);
>> +        qemu_chr_be_write(vc->vte.chr, (uint8_t *)buf, size);
>> +        len -= size;
>> +        avail -= size;
>> +    }
>> +    /*
>> +     * characters are pending: we send them a bit later (XXX:
>> +     * horrible, should change char device API)
>> +     */
>> +    if (avail > 0) {
>> +        timer_mod(vc->vte.kbd_timer,
>> +                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 1);
>> +    }
> There is ChardevClass->chr_accept_input() which gets called when you can
> send more data, so there is no need to use a timer for that.

Oh, I didn't notice this callback function. With this, the retry timer 
and my attempt to quickly slow down the write retries are really not 
necessary.

>
> Typical workflow is to only read data when it can be pushed forward to
> the guest, so when the guest stops reading data qemu stops doing so too,
> effectively forwarding the stalls.  Which works fine for things like tcp
> sockets.  Not so much for user input though.
>
> So, yes, just throw away data is the only option we have here.  Adding a
> reasonable-sized fifo makes sense too to cover bulky input, so you can
> cut+paste a longish URL even if the guest accepts only a few chars at a
> time (16550 fifo is 16 chars IIRC ...).
>
> I would suggest to keep things simple, just throw away what you can't
> store in the fifo, I don't see the point taking different actions
> depending on how long the stalls are lasting (patch 2/2).

I will send a version 2 patch.

With best regards,
Volker

