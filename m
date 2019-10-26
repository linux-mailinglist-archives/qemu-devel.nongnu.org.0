Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E373E5E53
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Oct 2019 19:59:54 +0200 (CEST)
Received: from localhost ([::1]:41154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iOQLx-00019R-Fx
	for lists+qemu-devel@lfdr.de; Sat, 26 Oct 2019 13:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39423)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <svens@stackframe.org>) id 1iOQH0-0004Vm-Ko
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 13:54:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <svens@stackframe.org>) id 1iOQGz-0002MP-I2
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 13:54:46 -0400
Received: from shroom.duncanthrax.net ([2a01:4f8:121:41fa::169]:39789
 helo=smtp.duncanthrax.net)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <svens@stackframe.org>)
 id 1iOQGy-0002LQ-W7
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 13:54:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=esQI+HF1dQYYczEt18UkoTVsrWpGGvMXhz8UbGuY0RI=; b=B/vufh5kOjh4I/dgmOnodk55ZD
 H6rRf9uvhoEwE59fq4efwb8EpEGg1uURYCOqG94i9W/6hrlgfm48qwijYNT19EFJ3S+QkSnMYvZN3
 zdfU9DsMJTmM507gltS4WEFUm4tbTC32cyEOxzrruejX3Zwv1b3GaKkg78IzV+D4rhbk=;
Received: from [2a01:4f8:121:41fa::170] (helo=stackframe.org)
 by smtp.duncanthrax.net with esmtpa (Exim 4.90_1)
 (envelope-from <svens@stackframe.org>)
 id 1iOQGu-0003u0-7T; Sat, 26 Oct 2019 19:54:40 +0200
Date: Sat, 26 Oct 2019 19:54:40 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v3 5/6] hppa: Add emulation of Artist graphics
Message-ID: <20191026175439.GA10792@stackframe.org>
References: <20191022205941.23152-1-svens@stackframe.org>
 <20191022205941.23152-6-svens@stackframe.org>
 <b91ee508-2ae4-0307-561a-f930a7709404@ilande.co.uk>
 <20191025093159.GA4261@stackframe.org>
 <1a414492-1623-5620-9e5b-097b45fc746a@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a414492-1623-5620-9e5b-097b45fc746a@ilande.co.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:121:41fa::169
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
Cc: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mark,

On Sat, Oct 26, 2019 at 10:35:20AM +0100, Mark Cave-Ayland wrote:

> > However, the VRAM in Artist is not really exposed to the Host. Instead,
> > there's the Chipset inbetween that can do byte swapping (Colormap is LE,
> > VRAM is BE) and Bit-to-Byte/Word/Dword conversion. For example you could
> > write 0x55 into that VRAM region, and the chipset would expand that to
> > VRAM Bytes: 00 01 00 01 00 01 00 01. And to make it even worse emulation
> > wise it can also do different encodings for Read or Write accesses, and
> > mask out certain bits of the data. So after trying to convert it to the
> > "dirty bitmap" API i decided to just leave it as it is. The CPU load
> > used by the display update code is usually < 1%, so it's ok for me.
> 
> Wow that sounds that some interesting hardware(!). Does it make sense to model the
> behaviour of the chipset separately using a proxy MemoryRegion similar to virtio i.e.
> introduce an intermediate IO MemoryRegion that does the swapping and then forward it
> onto the VRAM MemoryRegion?

Thanks for the pointer, i'll check whether that would work. For now i
think i'll remove the Artist patch from the series, so we can apply the
other patches, and i'll re-submit Artist when it's done. I guess the
rewrite to use a MemRegion is a bit bigger. But i would to get the other
patches in especially the LASI Stuff as both Helge and i have a lot of
stuff depending on that.

Regards
Sven

