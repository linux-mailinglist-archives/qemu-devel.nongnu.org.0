Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EA1487F35
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 00:09:48 +0100 (CET)
Received: from localhost ([::1]:45550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5yMl-0005m7-0k
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 18:09:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n5yLH-00051f-Fv
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 18:08:15 -0500
Received: from [2001:41c9:1:41f::167] (port=39508
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n5yLF-00047h-IM
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 18:08:15 -0500
Received: from [2a00:23c4:8ba0:4900:614:7796:ec2b:4f88]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n5yKp-0005ga-1r; Fri, 07 Jan 2022 23:07:50 +0000
Message-ID: <6c3a7e16-0485-f99d-f901-86a8f1192f05@ilande.co.uk>
Date: Fri, 7 Jan 2022 23:08:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220107105049.961489-1-laurent@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220107105049.961489-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:4900:614:7796:ec2b:4f88
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2] q800: fix segfault with invalid MacROM
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

On 07/01/2022 10:50, Laurent Vivier wrote:

> "qemu-system-m68k -M q800 -bios /dev/null" crashes with a segfault
> in q800_init().
> This happens because the code doesn't check that rom_ptr() returned
> a non-NULL pointer .
> 
> To avoid NULL pointer, don't allow 0 sized file and use bios_size with
> rom_ptr().
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/756
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   hw/m68k/q800.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index e4c7c9b88ad0..55dfe5036f40 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -672,12 +672,13 @@ static void q800_init(MachineState *machine)
>   
>           /* Remove qtest_enabled() check once firmware files are in the tree */
>           if (!qtest_enabled()) {
> -            if (bios_size < 0 || bios_size > MACROM_SIZE) {
> +            if (bios_size <= 0 || bios_size > MACROM_SIZE) {
>                   error_report("could not load MacROM '%s'", bios_name);
>                   exit(1);
>               }
>   
> -            ptr = rom_ptr(MACROM_ADDR, MACROM_SIZE);
> +            ptr = rom_ptr(MACROM_ADDR, bios_size);
> +            assert(ptr != NULL);
>               stl_phys(cs->as, 0, ldl_p(ptr));    /* reset initial SP */
>               stl_phys(cs->as, 4,
>                        MACROM_ADDR + ldl_p(ptr + 4)); /* reset initial PC */

I think technically the second parameter of rom_ptr() is supposed to be the absolute 
upper bound of the accessible region so the existing MACROM_SIZE feels better being a 
constant rather than a variable such as bios_size. But then again bios_size should 
never be greater than MACROM_SIZE because of the check beforehand so it shouldn't 
matter in practice. Anyhow regardless of what you decide:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

