Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A1C41AD6D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 12:58:24 +0200 (CEST)
Received: from localhost ([::1]:40798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVAoZ-0006U9-4d
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 06:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mVAje-00020j-LU
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:53:18 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mVAjc-0003lC-Iw
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:53:18 -0400
Received: from [192.168.15.226] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id B840720777;
 Tue, 28 Sep 2021 10:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632826393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dMRXyYHD6XcXlGyPtAGVHFBPKB9RFpmtLXzkQ5GytKA=;
 b=2flrtbnbJMbF2N3sLTaaCpII9BNp1A/C715h1VjNi44xWaKH92MUui4uJ0w1nfYyv/4mYr
 uC91faQdE/wvIqbI/huvK0Q573Sh13FFG9a0Auclt1jRcwDZJRhQOXWKPacSCQFLmbXLmP
 rSTgVtZDlBBK75eJWcf8fHsI8hxbqQg=
Message-ID: <00f8b06a-337a-2a93-8f22-642760424905@greensocs.com>
Date: Tue, 28 Sep 2021 12:53:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/1] hw: aspeed_gpio: Fix pin I/O type declarations
Content-Language: en-US-large
To: pdel@fb.com
References: <20210928032456.3192603-1-pdel@fb.com>
 <20210928032456.3192603-2-pdel@fb.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20210928032456.3192603-2-pdel@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.562,
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
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, patrick@stwcx.xyz, clg@kaod.org,
 rashmica.g@gmail.com, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/28/21 05:24, pdel@fb.com wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> Some of the pin declarations in the Aspeed GPIO module were incorrect,
> probably because of confusion over which bits in the input and output
> uint32_t's correspond to which groups in the label array. Since the
> uint32_t literals are in big endian, it's sort of the opposite of what
> would be intuitive. The least significant bit in ast2500_set_props[6]
> corresponds to GPIOY0, not GPIOAB7.
> 
> GPIOxx indicates input and output capabilities, GPIxx indicates only
> input, GPOxx indicates only output.
> 
> AST2500:
> - Previously had GPIW0..GPIW7 and GPIX0..GPIX7, that's correct.
> - Previously had GPIOY0..GPIOY3, should have been GPIOY0..GPIOY7.
> - Previously had GPIOAB0..GPIOAB3 and GPIAB4..GPIAB7, should only have
>    been GPIOAB0..GPIOAB3.
> 
> AST2600:
> - GPIOT0..GPIOT7 should have been GPIT0..GPIT7.
> - GPIOU0..GPIOU7 should have been GPIU0..GPIU7.
> - GPIW0..GPIW7 should have been GPIOW0..GPIOW7.
> - GPIOY0..GPIOY7 and GPIOZ0...GPIOZ7 were disabled.
> 
> Fixes: 4b7f956862dc2db4c5c ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500")
> Fixes: 36d737ee82b2972167e ("hw/gpio: Add in AST2600 specific implementation")
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

> ---
>   hw/gpio/aspeed_gpio.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index dfa6d6cb40..33a40a624a 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -796,7 +796,7 @@ static const GPIOSetProperties ast2500_set_props[] = {
>       [3] = {0xffffffff,  0xffffffff,  {"M", "N", "O", "P"} },
>       [4] = {0xffffffff,  0xffffffff,  {"Q", "R", "S", "T"} },
>       [5] = {0xffffffff,  0x0000ffff,  {"U", "V", "W", "X"} },
> -    [6] = {0xffffff0f,  0x0fffff0f,  {"Y", "Z", "AA", "AB"} },
> +    [6] = {0x0fffffff,  0x0fffffff,  {"Y", "Z", "AA", "AB"} },
>       [7] = {0x000000ff,  0x000000ff,  {"AC"} },
>   };
>   
> @@ -805,9 +805,9 @@ static GPIOSetProperties ast2600_3_3v_set_props[] = {
>       [1] = {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
>       [2] = {0xffffffff,  0xffffffff,  {"I", "J", "K", "L"} },
>       [3] = {0xffffffff,  0xffffffff,  {"M", "N", "O", "P"} },
> -    [4] = {0xffffffff,  0xffffffff,  {"Q", "R", "S", "T"} },
> -    [5] = {0xffffffff,  0x0000ffff,  {"U", "V", "W", "X"} },
> -    [6] = {0xffff0000,  0x0fff0000,  {"Y", "Z", "", ""} },
> +    [4] = {0xffffffff,  0x00ffffff,  {"Q", "R", "S", "T"} },
> +    [5] = {0xffffffff,  0xffffff00,  {"U", "V", "W", "X"} },
> +    [6] = {0x0000ffff,  0x0000ffff,  {"Y", "Z"} },
>   };
>   
>   static GPIOSetProperties ast2600_1_8v_set_props[] = {
> 

