Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3E351EC35
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 10:52:19 +0200 (CEST)
Received: from localhost ([::1]:57018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnceI-0005V1-A6
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 04:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnccy-0004Lq-K3
 for qemu-devel@nongnu.org; Sun, 08 May 2022 04:50:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:54778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nncct-0002T9-Ic
 for qemu-devel@nongnu.org; Sun, 08 May 2022 04:50:54 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nncbq-0009e0-3X; Sun, 08 May 2022 09:49:50 +0100
Message-ID: <3bb997e4-2138-865e-d79f-f4405a7550f2@ilande.co.uk>
Date: Sun, 8 May 2022 09:50:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-36-mark.cave-ayland@ilande.co.uk>
 <27fa6494-b5a7-d158-4cd0-2db1c40bf47f@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <27fa6494-b5a7-d158-4cd0-2db1c40bf47f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 35/50] lasi: move second serial port initialisation to
 machine.c
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 08/05/2022 03:50, Richard Henderson wrote:

> On 5/4/22 04:25, Mark Cave-Ayland wrote:
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Acked-by: Helge Deller <deller@gmx.de>
>> ---
>>   hw/hppa/lasi.c    | 8 --------
>>   hw/hppa/machine.c | 7 +++++++
>>   2 files changed, 7 insertions(+), 8 deletions(-)
>>
> 
> In that it is code movement,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> +    if (serial_hd(1)) {
>> +        /* Serial port */
>> +        serial_mm_init(addr_space, LASI_UART_HPA + 0x800, 0,
>> +                qdev_get_gpio_in(lasi_dev, LASI_IRQ_UART_HPA), 8000000 / 16,
>> +                serial_hd(1), DEVICE_BIG_ENDIAN);
>> +    }
> 
> Although I believe there's a bug: both of these serial ports are being registered at 
> LASI_UART_HPA + 0x800.  I suspect this bug was hidden by the bug fixed in patch 31, 
> in that serial_hd(0) should be at 0x800, and serial_hd(1) should be elsewhere.

FWIW I nearly the made the same error myself, but they are different: serial_hd(0) is 
mapped to DINO_UART_HPA + 0x800 = 0xfff83800 whereas serial_hd(1) is mapped to 
LASI_UART_HPA + 0x800 = 0xffd05800 so I believe this is correct.


ATB,

Mark.

