Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3481487405
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 09:17:35 +0100 (CET)
Received: from localhost ([::1]:54014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5kRK-00082F-Au
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 03:17:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n5kP4-0006u7-Ir
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 03:15:14 -0500
Received: from [2001:41c9:1:41f::167] (port=38284
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n5kP2-0006b9-OK
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 03:15:14 -0500
Received: from [2a00:23c4:8ba0:4900:614:7796:ec2b:4f88]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n5kOc-00017j-Fl; Fri, 07 Jan 2022 08:14:50 +0000
Message-ID: <11cea729-2dc1-6985-0c17-8dca37618002@ilande.co.uk>
Date: Fri, 7 Jan 2022 08:15:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220106122247.771454-1-laurent@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220106122247.771454-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:4900:614:7796:ec2b:4f88
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] q800: fix segfault with invalid MacROM
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/01/2022 12:22, Laurent Vivier wrote:

> "qemu-system-m68k -M q800 -bios /dev/null" crahses with a segfault
> in q800_init().
> This happens because the code doesn't check that rom_ptr() returned
> a non-NULL pointer .
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/756
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   hw/m68k/q800.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index e4c7c9b88ad0..6261716c8f7e 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -672,10 +672,16 @@ static void q800_init(MachineState *machine)
>   
>           /* Remove qtest_enabled() check once firmware files are in the tree */
>           if (!qtest_enabled()) {
> -            if (bios_size < 0 || bios_size > MACROM_SIZE) {
> +            if (bios_size == -1) {
>                   error_report("could not load MacROM '%s'", bios_name);
>                   exit(1);
>               }
> +            if (bios_size != MACROM_SIZE) {
> +                error_report("Invalid size for MacROM '%s': %d bytes,"
> +                             " expected %d bytes", bios_name, bios_size,
> +                             MACROM_SIZE);
> +                exit(1);
> +            }
>   
>               ptr = rom_ptr(MACROM_ADDR, MACROM_SIZE);
>               stl_phys(cs->as, 0, ldl_p(ptr));    /* reset initial SP */

The patch does fix the issue, but it seems a little odd that you can't use -bios 
path/to/m68k-binary to boot with an arbitrary sized binary which could be useful for 
reproducers such as https://gitlab.com/qemu-project/qemu/-/issues/360.

How easy would it be to add the extra rom_ptr() NULL check instead?


ATB,

Mark.

