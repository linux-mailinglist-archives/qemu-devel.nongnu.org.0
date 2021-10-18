Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3AB430D26
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 02:46:38 +0200 (CEST)
Received: from localhost ([::1]:54338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcGnU-0007Sp-SU
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 20:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <benh@kernel.crashing.org>)
 id 1mcGlQ-0006WH-Rp; Sun, 17 Oct 2021 20:44:28 -0400
Received: from gate.crashing.org ([63.228.1.57]:34859)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <benh@kernel.crashing.org>)
 id 1mcGlO-00046c-Ij; Sun, 17 Oct 2021 20:44:28 -0400
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 19I0f9q9024702;
 Sun, 17 Oct 2021 19:41:10 -0500
Message-ID: <4bab811367b2c1e813061d6f1048bbf9b4a2a606.camel@kernel.crashing.org>
Subject: Re: [PATCH 1/2] hw/misc/bcm2835_property: Fix framebuffer with
 recent RPi kernels
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>
Date: Mon, 18 Oct 2021 11:41:09 +1100
In-Reply-To: <0615f4a3-fba0-bb59-2405-4e1a080f8166@amsat.org>
References: <5283e2811498034cc2de77f10eb16b9cd67a0698.camel@kernel.crashing.org>
 <0615f4a3-fba0-bb59-2405-4e1a080f8166@amsat.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.228.1.57;
 envelope-from=benh@kernel.crashing.org; helo=gate.crashing.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 2021-10-17 at 17:08 +0200, Philippe Mathieu-Daudé wrote:
> Hi Benjamin,
> 
> On 10/17/21 09:48, Benjamin Herrenschmidt wrote:
> > The framebuffer driver fails to initialize with recent Raspberry Pi
> > kernels, such as the ones shipped in the current RaspiOS images
> > (with the out of tree bcm2708_fb.c driver)
> 
> Which particular version?

The one I dug out of 2021-05-07-raspios-buster-arm64-lite.img (note
that this then fails to boot some time after the fb is setup, even
after the fix, in the vchip driver init (before serial is up even).

That said, the same fb problem happens with 5.10.60-v8+ from raspbian.

I'm not sure your fix will work on these, see below:

> +        case 0x00040013: /* Get number of displays */
> +            stl_le_phys(&s->dma_as, value + 12, 0 /* old fw: unique display */);
> +            resplen = 4;
> +            break;
> 
This should have been equivalen to not having the property. However,
the failure path in the driver looks like this (note the mismatch
between the comment and the code.. this is rpi 5.10.73 from the rpi
repo :

	ret = rpi_firmware_property(fw,
				    RPI_FIRMWARE_FRAMEBUFFER_GET_NUM_DISPLAYS,
				    &num_displays, sizeof(u32));

	/* If we fail to get the number of displays, or it returns 0, then
	 * assume old firmware that doesn't have the mailbox call, so just
	 * set one display
	 */
	if (ret || num_displays == 0) {
		dev_err(&dev->dev,
			"Unable to determine number of FBs. Disabling driver.\n");
		return -ENOENT;
	} else {
		fbdev->firmware_supports_multifb = 1;
	}

So it appears that the intention at some stage was to set only one display but
the code as written will fail to initialize the drive if the properly is absent
*or* if it returns 0.

I've just checked the rpi-5.15.y branch and it's the same.

Cheers,
Ben.



