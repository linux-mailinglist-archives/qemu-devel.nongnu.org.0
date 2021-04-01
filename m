Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77CF3513F2
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:55:23 +0200 (CEST)
Received: from localhost ([::1]:41148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRuyw-0008Et-Sv
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRuxT-0007mf-NH
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:53:51 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57534
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRuvW-0005I5-PE
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:53:50 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRuvd-0005OZ-Tk; Thu, 01 Apr 2021 11:51:58 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, alxndr@bu.edu, laurent@vivier.eu, pbonzini@redhat.com
References: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
 <20210401074933.9923-6-mark.cave-ayland@ilande.co.uk>
 <0c3900c2-fa72-47ea-d48c-625dd1b40734@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <854e3d13-4610-8780-e27c-a7cb72b54dd1@ilande.co.uk>
Date: Thu, 1 Apr 2021 11:51:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <0c3900c2-fa72-47ea-d48c-625dd1b40734@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 05/11] esp: introduce esp_fifo_pop_buf() and use it
 instead of fifo8_pop_buf()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
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

On 01/04/2021 10:34, Philippe Mathieu-Daudé wrote:

> On 4/1/21 9:49 AM, Mark Cave-Ayland wrote:
>> The const pointer returned by fifo8_pop_buf() lies directly within the array used
>> to model the FIFO. Building with address sanitisers enabled shows that if the
> 
> Typo "sanitizers"

Ha. It's definitely "sanitiser" here in the UK (UK English) as opposed to "sanitizer" 
(US English). I don't really mind either way, but I can fix this if it needs a v4 
following Paolo's comments.

>> caller expects a minimum number of bytes present then if the FIFO is nearly full,
>> the caller may unexpectedly access past the end of the array.
> 
> Why isn't it a problem with the other models? Because the pointed
> buffer is consumed directly?

Yes that's correct, which is why Fifo8 currently doesn't support wraparound. I 
haven't analysed how other devices have used it but I would imagine there would be an 
ASan hit if it were being misused this way.

>> Introduce esp_fifo_pop_buf() which takes a destination buffer and performs a
>> memcpy() in it to guarantee that the caller cannot overwrite the FIFO array and
>> update all callers to use it. Similarly add underflow protection similar to
>> esp_fifo_push() and esp_fifo_pop() so that instead of triggering an assert()
>> the operation becomes a no-op.
> 
> This is OK for your ESP model.
> 
> Now thinking loudly about the Fifo8 API, shouldn't this be part of it?
> 
> Something prototype like:
> 
>    /**
>     * fifo8_pop_buf:
>     * @do_copy: If %true, also copy data to @bufptr.
>     */
>    size_t fifo8_pop_buf(Fifo8 *fifo,
>                         void **bufptr,
>                         size_t buflen,
>                         bool do_copy);

That could work, and may even allow support for wraparound in future. I suspect 
things would become clearer after looking at the other Fifo8 users to see if this is 
worth an API change/alternative API.


ATB,

Mark.

