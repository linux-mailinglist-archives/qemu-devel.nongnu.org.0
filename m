Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7652EAB7B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 14:06:47 +0100 (CET)
Received: from localhost ([::1]:37938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwm2x-0008Ph-1t
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 08:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kwm1G-0007je-Qg
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 08:05:02 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56406
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kwm1D-0002C8-52
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 08:05:02 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kwm1C-0008JJ-Vm; Tue, 05 Jan 2021 13:05:04 +0000
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201212144134.29594-1-peter.maydell@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <cc2e5631-afb8-8e42-19bb-ca0ee4d937fb@ilande.co.uk>
Date: Tue, 5 Jan 2021 13:04:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201212144134.29594-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/2] sparc/leon3: Make grlib-irqmp handle its own inbound
 IRQ lines
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.249,
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
Cc: KONRAD Frederic <frederic.konrad@adacore.com>,
 Fabien Chouteau <chouteau@adacore.com>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/12/2020 14:41, Peter Maydell wrote:

> Currently the GRLIB_IRQMP device is used in one place (the leon3
> board), but instead of the device providing inbound gpio lines for
> the board to wire up, the board code itself calls
> qemu_allocate_irqs() with the handler function being a set_irq
> function defined in the code for the device.
> 
> Patch one in this series refactors this into the standard setup of a
> device having input gpio lines.  The main motivation here is that it
> squashes a trivial Coverity memory leak warning.  Patch two just
> removes a stray unused typedef that I noticed in passing.
> 
> Incidentally I suspect the irqmp_ack logic could also be done more
> neatly, but I didn't feel like getting into that at this point.
> 
> Tested by booting the 'buildroot' image downloadable from
> https://www.gaisler.com/anonftp/linux/linux-2.6/images/leon-linux-4.9/leon-linux-4.9-1.0/up/
> and runnable with
>   ./build/sparc-all/qemu-system-sparc -M leon3_generic -display none -serial stdio -kernel image.ram
> 
> 
> thanks
> -- PMM
> 
> Peter Maydell (2):
>    hw/sparc: Make grlib-irqmp device handle its own inbound IRQ lines
>    include/hw/sparc/grlib.h: Remove unused set_pil_in_fn typedef
> 
>   include/hw/sparc/grlib.h |  4 ----
>   hw/intc/grlib_irqmp.c    |  5 ++++-
>   hw/sparc/leon3.c         | 21 +++++++++------------
>   3 files changed, 13 insertions(+), 17 deletions(-)

Frederic/Fabien - any chance of a Reviewed-by or Acked-by tag from one of you? If so, 
I can send this as part of an upcoming SPARC PR.


ATB,

Mark.

