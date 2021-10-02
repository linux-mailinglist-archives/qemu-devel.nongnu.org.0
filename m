Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB32741FC8C
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 16:38:42 +0200 (CEST)
Received: from localhost ([::1]:41500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWg9y-0001Vl-1d
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 10:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWg8v-0000is-3a
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:37:37 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:34935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWg8r-0006dJ-LX
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:37:35 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8C12E746398;
 Sat,  2 Oct 2021 16:37:29 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 68640745953; Sat,  2 Oct 2021 16:37:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 66A557457EE;
 Sat,  2 Oct 2021 16:37:29 +0200 (CEST)
Date: Sat, 2 Oct 2021 16:37:29 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 0/4] Misc OHCI patches
In-Reply-To: <cover.1633122670.git.balaton@eik.bme.hu>
Message-ID: <0abb3f2-2267-662c-b13e-3c8248f441dc@eik.bme.hu>
References: <cover.1633122670.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Oct 2021, BALATON Zoltan wrote:
> Posted as RFC because it's unfinfished and untested as there seems to
> be some regression with mac99 so it does not boot for me for some
> reason I haven't debugged yet. Hope Howard can test it and see if it
> changes any of the traces seen before.

I've now tried it with MorphOS on mac99 (needs a new patched OpenBIOS as 
the previous one stopped working with recent escc reset changes, see 
https://mail.coreboot.org/hyperkitty/list/openbios@openbios.org/thread/PE6B3HSQB6XIIELYJP6GJMR3L4RIUANR/ 
) but I don't have a usb audio device to pass through so tried with the 
emulated -device usb-audio instead. It's recognised both before and after 
this patch but does not make any sound. While info about the device shows 
up it seems to get packet NAKs when it's accessed and packet data is all 
zeros so maybe there's some problem decoding OHCI structures from the 
guest? It also has two audio endpoints and the first one is disabled, 
MorphOS seems to try to use the second one, Not sure where these are 
connected or is the first one an input for recording?

Interestingly on pegasos2 which has UHCI instead of OHCI MorphOS does not 
even correctly detect the emulated usb-audio device and trying to get info 
makes it freeze so looks like the UHCI model may also have some problems 
of its own.

On sam460ex that has EHCI it does the same as on mac99, detects usb-audio, 
does not freeze but does not make sound either. I think this would need 
someone with more understanding of the wotkings of usb-audio to debug 
this.

Regards,
BALATON Zoltan

