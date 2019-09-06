Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41CEABB57
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 16:49:48 +0200 (CEST)
Received: from localhost ([::1]:57152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6FYZ-0001Bk-KA
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 10:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58015)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <johannes@sipsolutions.net>) id 1i6FXZ-0000jX-Ir
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 10:48:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <johannes@sipsolutions.net>) id 1i6FXY-0005S3-0G
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 10:48:45 -0400
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]:49390
 helo=sipsolutions.net)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <johannes@sipsolutions.net>)
 id 1i6FXX-0005Qi-OU
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 10:48:43 -0400
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.92.1) (envelope-from <johannes@sipsolutions.net>)
 id 1i6FXU-0001t6-Qt; Fri, 06 Sep 2019 16:48:40 +0200
Message-ID: <be405c3ba658cdac7f68c91213c3b714ac24c1e3.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
To: "Michael S. Tsirkin" <mst@redhat.com>
Date: Fri, 06 Sep 2019 16:48:39 +0200
In-Reply-To: <20190906102217-mutt-send-email-mst@kernel.org>
References: <20190902121233.13382-1-johannes@sipsolutions.net>
 <20190906121350.29202-1-johannes@sipsolutions.net>
 <20190906102217-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:191:4433::2
Subject: Re: [Qemu-devel] [RFC] libvhost-user: implement
 VHOST_USER_PROTOCOL_F_KICK_CALL_MSGS
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

Hi,

On Fri, 2019-09-06 at 10:22 -0400, Michael S. Tsirkin wrote:
> On Fri, Sep 06, 2019 at 03:13:50PM +0300, Johannes Berg wrote:
> > From: Johannes Berg <johannes.berg@intel.com>
> > 
> > Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> 
> a bit more content here about the motivation for this?

Heh, right, definitely needed.

I was just sending it out as the corresponding patch to the spec change
RFC, where I explained more, so didn't really bother here yet. However,
I evidently forgot to CC you on that:

https://lore.kernel.org/qemu-devel/20190902121233.13382-1-johannes@sipsolutions.net/

I'm still trying to implement it in User-Mode Linux (UML, ARCH=um),
we've submitted patches for virtio/vhost-user support to that, but the
simulation-bound IRQ handling is a bit complicated. I need to see how it
turns out once I actually get it to work - I've gotten this extension,
SLAVE_REQ and REPLY_ACK to work now, so need to "just" integrate with
the time-travel mode I already have.

In any case, if you think that this is a stupid extension and say you
will never accept it, I'll probably just implement a slightly more
hackish way, setting vhost-user to polling mode and using out-of-band
signalling or so. This seems a bit cleaner though, and if it's properly
spec'ed and with sample code and all then it'll possibly be far more
useful to others. (**)



I think I also forgot to CC you on these two:
https://lore.kernel.org/qemu-devel/20190828083401.2342-1-johannes@sipsolutions.net/
https://lore.kernel.org/qemu-devel/20190903192505.10686-1-johannes@sipsolutions.net/

Again, sorry about that.

Btw, at least one of these files doesn't even have an entry in the
maintainers file. Don't remember if it was the spec though or the
libvhost-user stuff.


(**) For example, there's the VMSimInt paper (***) that shows a very
similar thing with QEMU, but works only with CPU emulation. With UML's
time-travel mode made to work over virtio we can do similar things
without CPU emulation. I suspect it's also possible to emulate the HPET
or so in a KVM-based system, but seems far more tricky (to me at least).

(***) http://www.ikr.uni-stuttgart.de/Content/Publications/Archive/We_SIMUTools_2014_40209.pdf

Thanks,
johannes


