Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0517E43162A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 12:32:34 +0200 (CEST)
Received: from localhost ([::1]:33110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcPwW-0007CD-TB
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 06:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <benh@kernel.crashing.org>)
 id 1mcPv7-0006AF-OT; Mon, 18 Oct 2021 06:31:05 -0400
Received: from gate.crashing.org ([63.228.1.57]:47645)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <benh@kernel.crashing.org>)
 id 1mcPv3-0006Ry-SW; Mon, 18 Oct 2021 06:31:05 -0400
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 19IARoht018201;
 Mon, 18 Oct 2021 05:27:51 -0500
Message-ID: <a55f82099075eeaaa544f6f7fc7575b90d051caa.camel@kernel.crashing.org>
Subject: Re: [PATCH 1/2] hw/misc/bcm2835_property: Fix framebuffer with
 recent RPi kernels
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>
Date: Mon, 18 Oct 2021 21:27:50 +1100
In-Reply-To: <353c1b30-7621-54c5-5294-ebf1d8b3f8b8@amsat.org>
References: <5283e2811498034cc2de77f10eb16b9cd67a0698.camel@kernel.crashing.org>
 <0615f4a3-fba0-bb59-2405-4e1a080f8166@amsat.org>
 <4bab811367b2c1e813061d6f1048bbf9b4a2a606.camel@kernel.crashing.org>
 <353c1b30-7621-54c5-5294-ebf1d8b3f8b8@amsat.org>
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

On Mon, 2021-10-18 at 11:47 +0200, Philippe Mathieu-Daudé wrote:
> 
> > I've just checked the rpi-5.15.y branch and it's the same.
> 
> Indeed. I stopped testing recent kernels because they use too many
> features QEMU don't implement.
> 
> Our model should generate the DTB blob of devices implemented, instead
> of giving false expectations to the guest by passing an unmodified dtb.
> 
> This is on my TODO, I might give it a try next WE.

Indeed. That said, we do implement the fb, so we probably want that
fix. The fix for the virtual gpios is probably unnecessary however if
we do what you want.

That being said, with those two fixes, I can boot the latest 5.10 I get
from raspbian.

Cheers,
Ben.



