Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 099CC29ADF3
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 14:51:48 +0100 (CET)
Received: from localhost ([::1]:35090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXPO4-0005gY-Rj
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 09:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kXOwc-0005V6-L3
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 09:23:22 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49898
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kXOwa-0006OS-GB
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 09:23:22 -0400
Received: from host86-148-103-79.range86-148.btcentralplus.com
 ([86.148.103.79] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kXOwh-0000x2-VW; Tue, 27 Oct 2020 13:23:28 +0000
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20201026083401.13231-1-mark.cave-ayland@ilande.co.uk>
 <20201026083401.13231-7-mark.cave-ayland@ilande.co.uk>
 <20201027080938.5q5stvmd5cza7hfh@sirius.home.kraxel.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <83864d7b-edac-6d99-b317-50c703bcf6df@ilande.co.uk>
Date: Tue, 27 Oct 2020 13:23:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201027080938.5q5stvmd5cza7hfh@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.148.103.79
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 6/9] dev-serial: add always-plugged property to ensure USB
 device is always attached
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.167,
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
Cc: samuel.thibault@ens-lyon.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/10/2020 08:09, Gerd Hoffmann wrote:

>>       case CHR_EVENT_OPENED:
>> -        if (!s->dev.attached) {
>> +        if (!s->always_plugged && !s->dev.attached) {
>>               usb_device_attach(&s->dev, &error_abort);
>>           }
> 
> Not needed (but doesn't hurt either).

Okay I'll leave this as-is for now.

>>           break;
>>       case CHR_EVENT_CLOSED:
>> -        if (s->dev.attached) {
>> +        if (!s->always_plugged && s->dev.attached) {
>>               usb_device_detach(&s->dev);
>>           }
> 
> Ok.
> 
>> -    if (qemu_chr_fe_backend_open(&s->cs) && !dev->attached) {
>> +    if (s->always_plugged || (qemu_chr_fe_backend_open(&s->cs) &&
>> +                              !dev->attached)) {
> 
> The dev->attached check should not be skipped, i.e. the logic should be
> ((always_plugged || open) && !attached).

Let me test this, and if it works I'll post a v2 shortly.


ATB,

Mark.

