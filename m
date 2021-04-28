Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB4036D42E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 10:44:48 +0200 (CEST)
Received: from localhost ([::1]:54162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbfoL-0005eh-HN
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 04:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lbfki-0004Sy-8U
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 04:41:00 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37234
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lbfkf-0006Ez-KO
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 04:41:00 -0400
Received: from host109-146-177-131.range109-146.btcentralplus.com
 ([109.146.177.131] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lbfl0-0005Jq-1t; Wed, 28 Apr 2021 09:41:18 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210427192658.266933-1-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <644ab2fd-42c1-8527-7231-95c11920abe2@ilande.co.uk>
Date: Wed, 28 Apr 2021 09:40:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427192658.266933-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.146.177.131
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/2] hw/sparc: Kconfig fixes to build with/without the
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

On 27/04/2021 20:26, Philippe Mathieu-Daudé wrote:

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
> Philippe Mathieu-Daudé (2):
>    hw/sparc: Allow building the leon3 machine stand-alone
>    hw/sparc: Allow building without the leon3 machine
> 
>   target/sparc/cpu.h          |  6 ----
>   hw/sparc/irq.c              | 61 +++++++++++++++++++++++++++++++++++++
>   hw/sparc/leon3.c            | 37 +++++++++++++++++++++-
>   hw/sparc/sun4m.c            | 32 -------------------
>   target/sparc/int32_helper.c | 37 ----------------------
>   hw/sparc/meson.build        |  1 +
>   hw/sparc/trace-events       |  2 ++
>   target/sparc/trace-events   |  4 ---
>   8 files changed, 100 insertions(+), 80 deletions(-)
>   create mode 100644 hw/sparc/irq.c

Just one comment from me but other than that seems fine: if Frederic and/or Fabien 
could give a R-B tag then I'm happy to queue it via qemu-sparc.


ATB,

Mark.

