Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2614D24E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 17:39:26 +0200 (CEST)
Received: from localhost ([::1]:49368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdz9p-0007ch-6D
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 11:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44927)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hdypd-0005oR-Ig
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 11:18:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hdygt-0001U8-MV
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 11:09:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32804)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hdygs-0001Pn-Gd
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 11:09:30 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CAE4A307C942;
 Thu, 20 Jun 2019 15:09:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
 [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AE9160A9D;
 Thu, 20 Jun 2019 15:09:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9A01216E08; Thu, 20 Jun 2019 17:09:23 +0200 (CEST)
Date: Thu, 20 Jun 2019 17:09:23 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Message-ID: <20190620150923.gpe4rqn3qc54gcsn@sirius.home.kraxel.org>
References: <cover.1561028123.git.balaton@eik.bme.hu>
 <046ddebb7ec8db48c4e877ee444ec1c41e385a74.1561028123.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <046ddebb7ec8db48c4e877ee444ec1c41e385a74.1561028123.git.balaton@eik.bme.hu>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 20 Jun 2019 15:09:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 2/2] ati-vga: Implement DDC and EDID
 info from monitor
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 20, 2019 at 12:55:23PM +0200, BALATON Zoltan wrote:
> This adds DDC support to ati-vga and connects i2c-ddc to it. This
> allows at least MacOS with an ATI ndrv, Linux radeonfb and MorphOS to

linux radeonfb is rv100 only, and aty128fb has no i2c support.
Do MacOS and MorphOS have working edid with both card variants?

> +    case GPIO_MONID ... GPIO_MONID + 3:
> +        /* FIXME What does Radeon have here? */
> +        if (s->dev_id == PCI_DEVICE_ID_ATI_RAGE128_PF) {
> +            /* Rage128p accesses DDC used to get EDID on these pins */
> +            ati_reg_write_offs(&s->regs.gpio_monid,
> +                               addr - GPIO_MONID, data, size);
> +            if ((s->regs.gpio_monid & BIT(25)) &&

Extra enable bit, ok.

> +                addr <= GPIO_MONID + 2 && addr + size > GPIO_MONID + 2) {

Hmm, isn't this just "addr == GPIO_MONID + 2" ?

> +                s->regs.gpio_monid = ati_i2c(s->bbi2c, s->regs.gpio_monid, 1);

So all i2c bits are shifted by one compared to rv100, correct?

cheers,
  Gerd


