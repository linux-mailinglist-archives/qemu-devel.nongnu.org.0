Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 161913731F6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 23:33:27 +0200 (CEST)
Received: from localhost ([::1]:59972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le2fW-0004xE-6P
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 17:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1le2ec-0004Vx-Oi
 for qemu-devel@nongnu.org; Tue, 04 May 2021 17:32:30 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47582
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1le2ea-0005gy-Ga
 for qemu-devel@nongnu.org; Tue, 04 May 2021 17:32:30 -0400
Received: from host81-154-26-71.range81-154.btcentralplus.com ([81.154.26.71]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1le2ey-0005nt-2W; Tue, 04 May 2021 22:32:52 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210428141655.387430-1-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <a3da756f-eb42-8ac1-580f-c0d4a3aa6996@ilande.co.uk>
Date: Tue, 4 May 2021 22:32:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210428141655.387430-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.154.26.71
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 0/4] hw/sparc: Kconfig fixes to build with/without the
 leon3 machine
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Fabien Chouteau <chouteau@adacore.com>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/04/2021 15:16, Philippe Mathieu-Daudé wrote:

> Missing review: 2-4
> 
> Since v1:
> - move cpu_check_irqs() to target/sparc/ (rth)
> 
> This series fixes link failure when building either the leon3
> machine or the sun4m ones.
> 
> The problem is we have hardware specific code in the architectural
> translation code. Move this code to hw/sparc/.
> 
> The link failures can be reproduced doing:
> 
>    $ echo CONFIG_LEON3=y > default-configs/devices/sparc-softmmu.mak
>    $ configure --without-default-devices
>    $ ninja qemu-system-sparc
>    $ ./qemu-system-sparc -M leon3 -S
> 
> or:
> 
>    $ echo CONFIG_SUN4M=y > default-configs/devices/sparc-softmmu.mak
> 
> Philippe Mathieu-Daudé (4):
>    hw/sparc: Allow building without the leon3 machine
>    hw/sparc64: Remove unused "hw/char/serial.h" header
>    hw/sparc64: Fix code style for checkpatch.pl
>    hw/sparc*: Move cpu_check_irqs() to target/sparc/
> 
>   target/sparc/cpu.h          |  6 ----
>   hw/sparc/leon3.c            | 37 +++++++++++++++++++-
>   hw/sparc/sun4m.c            | 32 -----------------
>   hw/sparc64/sparc64.c        | 63 ---------------------------------
>   target/sparc/int32_helper.c | 70 +++++++++++++++++--------------------
>   target/sparc/int64_helper.c | 66 ++++++++++++++++++++++++++++++++++
>   hw/sparc/trace-events       |  4 +--
>   hw/sparc64/trace-events     |  4 ---
>   target/sparc/trace-events   | 12 ++++---
>   9 files changed, 145 insertions(+), 149 deletions(-)

Thanks. I've queued this to my qemu-sparc branch.


ATB,

Mark.

