Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F8531A610
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 21:31:23 +0100 (CET)
Received: from localhost ([::1]:52966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAf62-0004d7-6Y
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 15:31:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lAf3V-00036L-8R; Fri, 12 Feb 2021 15:28:45 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:27938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lAf3Q-0000gW-Nm; Fri, 12 Feb 2021 15:28:44 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2DAAD7462D3;
 Fri, 12 Feb 2021 21:28:36 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0212374581E; Fri, 12 Feb 2021 21:28:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 00F517456B4;
 Fri, 12 Feb 2021 21:28:35 +0100 (CET)
Date: Fri, 12 Feb 2021 21:28:35 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/3] hw/display/sm501: Tidy up template header
In-Reply-To: <20210212180653.27588-1-peter.maydell@linaro.org>
Message-ID: <8642ea4f-e75a-e12-211b-6495546aaee3@eik.bme.hu>
References: <20210212180653.27588-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Feb 2021, Peter Maydell wrote:
> For a long time now the UI layer has guaranteed that the console
> surface is always 32 bits per pixel RGB, but some older display device
> models still have the code to handle other formats. This patchset
> cleans up that dead code for the sm501 device, which allows us
> to remove the multiply-included sm501_template.h header entirely.
>
> There have been a few attempts at doing this cleanup on this
> device in the past by various people; rather than trying to
> resurrect those old patchsets and get them to apply to the current
> code in master, I just started from scratch.
>
> Tested with AROS ISO image on sam460ex.
>
> thanks
> -- PMM
>
> Peter Maydell (3):
>  hw/display/sm501: Remove dead code for non-32-bit RGB surfaces
>  hw/display/sm501: Expand out macros in template header
>  hw/display/sm501: Inline template header into C file

I've tried with AmigaOS and MorphOS and those also work. Unfortunately the 
drivers for sm501 on those are restricted to 16bit modes (maybe because 
real hardware is too slow otherwise or does not have enough memory) so 
every screen update in QEMU needs conversion which makes it quite slow. 
But this was like that before and unless we want to allow other than 32bit 
surfaces again we can't use the code removed here but that was the reason 
I've kept it and not removed so far in case we want to do this 
optimisation again.

Otherwise,

Acked-by: BALATON Zoltan <balaton@eik.bme.hu>

The sm501 is also used on the SH4 r2d machine I think. Aurelien probably 
knows more about that. I've found some images for it here:

https://people.debian.org/~aurel32/qemu/sh4/
https://lists.nongnu.org/archive/html/qemu-devel/2008-08/msg01308.html

in case you want to test that too.

Regards,
BALATON Zoltan

> hw/display/sm501_template.h | 131 ----------------------------
> hw/display/sm501.c          | 166 ++++++++++++++++++------------------
> 2 files changed, 83 insertions(+), 214 deletions(-)
> delete mode 100644 hw/display/sm501_template.h
>
>

