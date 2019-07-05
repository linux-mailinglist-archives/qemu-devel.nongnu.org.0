Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 290D56071F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 16:03:12 +0200 (CEST)
Received: from localhost ([::1]:53470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjOnu-00050i-39
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 10:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44173)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hjOkK-0003SY-NI
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 09:59:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hjOkI-00035F-NM
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 09:59:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55890)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hjOkG-0002k8-Nb
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 09:59:26 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F3780307D840;
 Fri,  5 Jul 2019 13:59:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-90.ams2.redhat.com
 [10.36.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B60B7900CC;
 Fri,  5 Jul 2019 13:59:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F0F6B16E2D; Fri,  5 Jul 2019 15:59:19 +0200 (CEST)
Date: Fri, 5 Jul 2019 15:59:19 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Message-ID: <20190705135919.vcm3n64qdyr3yrs4@sirius.home.kraxel.org>
References: <99bb800cba3596e47d2681642116756330dc6f63.1562320946.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99bb800cba3596e47d2681642116756330dc6f63.1562320946.git.balaton@eik.bme.hu>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 05 Jul 2019 13:59:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] ati-vga: Add registers for getting
 apertures
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 05, 2019 at 12:02:26PM +0200, BALATON Zoltan wrote:
> Some drivers (e.g. Linux radeon drm and MacOS) access these to find
> apertures to access card. Try to implement these but not sure these
> are correct yet.

> +    case CONFIG_APER_SIZE:
> +        val = s->vga.vram_size;
> +        break;

Given the math linux is doing I don't think this is correct:

static u32 r100_get_accessible_vram(struct radeon_device *rdev)
{
	u32 aper_size;
	u8 byte;

	aper_size = RREG32(RADEON_CONFIG_APER_SIZE);

	[ ... ]

	/* Single function older card. We read HDP_APER_CNTL to see how the BIOS
	 * have set it up. We don't write this as it's broken on some ASICs but
	 * we expect the BIOS to have done the right thing (might be too optimistic...)
	 */
	if (RREG32(RADEON_HOST_PATH_CNTL) & RADEON_HDP_APER_CNTL)
		return aper_size * 2;
	return aper_size;
}

IIRC old ati cards had a pci bar twice the size of the vram, where the lower
half of the pci bar was straight access to the video memory and the upper
half byteswapped access.

I think that is the background of the "aper_size * 2" logic above, and
RADEON_HDP_APER_CNTL is probably a config bit for the behavior.

cheers,
  Gerd


