Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EABDFC704
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 14:10:58 +0100 (CET)
Received: from localhost ([::1]:57376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVEtl-0006aJ-1v
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 08:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57398)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <samuel.thibault@gnu.org>) id 1iVErp-00051y-Jw
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 08:08:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <samuel.thibault@gnu.org>) id 1iVErj-0000Wq-BK
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 08:08:53 -0500
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:56716)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <samuel.thibault@gnu.org>)
 id 1iVErf-0000Ot-UK
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 08:08:48 -0500
X-IronPort-AV: E=Sophos;i="5.68,304,1569276000"; d="scan'208";a="411791402"
Received: from unknown (HELO function) ([193.50.111.121])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2019 14:08:42 +0100
Received: from samy by function with local (Exim 4.92.3)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1iVErZ-000XNQ-Nl; Thu, 14 Nov 2019 14:08:41 +0100
Date: Thu, 14 Nov 2019 14:08:41 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Teemu Kuusisto <teemu.kuusisto@gmail.com>
Subject: Re: Braille device (chardev/baum.c) is unable to detect the TTY
 correctly and does not act on graphic console connect/disconnect
Message-ID: <20191114130841.kxgorkvtinyaahdm@function>
References: <20191114120915.GA31365@valhalla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191114120915.GA31365@valhalla>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.134.164.83
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

Hello,

Teemu Kuusisto, le jeu. 14 nov. 2019 14:09:15 +0200, a ecrit:
> As a blind developer I would be very happy to use QEMU's baum chardev for a braille display. Unfortunately, this device fails to detect the tty in which the spice client is running.

Ah indeed that case was never looked at.

> The current code calls qemu_console_get_window_id() to get the tty.

> The code does not currently consider the fact that the lifetime of the
> connected graphical consoles is not the same as the lifetime of the
> VM.

Indeed, with spice the situation is different.

> This function returns zero, which causes the code to skip even the
> default behavior of brlapi's brlapi__enterTtyMode() (including
> checcking some env variables such as CONTROLVT)

Mmm, indeed that should be fixed into letting brlapi try to find it, so
that CONTROLVT can work.

> window id sounds like something different than a tty number, maybe a
> number of X display?

Yes, under X you need to provide the X window id.

> Is it possible to get callbacks for connect and disconnect of a       
> graphical console (like spice and vnc)? How?
[...]
> Such events should lead to calls of brlapi__EnterTtyMode() and
> brlapi__leaveTtyMode().

That would seem to be the way to go indeed, but see below.

> Is it further possible to get any information of the connected
> client to determine the tty, and possibly sub-windows too (see
> brlapi__enterTtyModeWithPath), in which the client is running?

More precisely you would need to know the X window ID on the front-end
side. The VNC and spice protocols don't currently provide this.  Also
when the VM and the frontend are running on different machines this
would not make any sense anyway so I don't think it will get added to
spice & vnc anyway.

One ugly way to get it to work is to run the spice client and keep it
open, get its X window id through xwininfo or equivalent, and only then
start qemu with CONTROLVT set to that id. But of course you can't close
the client and reopen it later.

The way to properly fix it is to add a brlapi channel to spice: in
addition to main, display, inputs, cursor, playback, and record
channels, we would have a brlapi channel. The brlapi protocol is already
packet-based, so that would work nicely. The server in qemu would list
the brlapi channel in addition to others, and brlapi packets would flow
over. The spice client would just forward brlapi packets over without
modification, except for the enterttymode packet, in which it would just
prepend its own windowpath and window id. The forwarding implementation
could be implemented in libbrlapi so that spice clients don't have
to maintain the support. Similarly, we could modify libbrlapi to not
necessarily connect to the usual brlapi socket, but let the application
provide send/recv functions to exchange the packets.

Samuel

