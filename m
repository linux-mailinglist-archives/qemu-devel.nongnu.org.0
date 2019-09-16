Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA05B39A2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 13:42:12 +0200 (CEST)
Received: from localhost ([::1]:33040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9pOV-0000Ry-Dn
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 07:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55567)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <johannes@sipsolutions.net>) id 1i9pN5-0008Og-RP
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 07:40:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <johannes@sipsolutions.net>) id 1i9pN4-0006NG-Qx
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 07:40:43 -0400
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]:60568
 helo=sipsolutions.net)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <johannes@sipsolutions.net>)
 id 1i9pN4-0006MF-KN
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 07:40:42 -0400
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <johannes@sipsolutions.net>)
 id 1i9pMz-0000oI-7G; Mon, 16 Sep 2019 13:40:37 +0200
Message-ID: <674086baeed5fce100d0882e668d5e36f026bd71.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
To: "Michael S. Tsirkin" <mst@redhat.com>
Date: Mon, 16 Sep 2019 13:40:35 +0200
In-Reply-To: <fedd74ed3e9cc554287b202e73b047a938515113.camel@sipsolutions.net>
References: <20190911134539.25650-1-johannes@sipsolutions.net>
 <20190911134539.25650-2-johannes@sipsolutions.net>
 <20190911095650-mutt-send-email-mst@kernel.org>
 <fedd74ed3e9cc554287b202e73b047a938515113.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:191:4433::2
Subject: Re: [Qemu-devel] [RFC v2 1/2] docs: vhost-user: add in-band
 kick/call messages
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

Hi Michael,

I had just wanted to prepare a resend, but

> > Hmm I don't like this. I propose that with VHOST_USER_PROTOCOL_F_IN_BAND_NOTIFICATIONS
> > we just don't allow VHOST_USER_SET_VRING_CALL (if you think it's
> > important to allow them, we can say that we do not require them).
> 
> You can't actually skip SET_VRING_CALL, it's necessary to start a vring,
> so libvhost-user for example calls dev->iface->queue_set_started() only
> in this case. The docs in the "Starting and stopping rings" section also
> explain this.

[...]

> See above. But I guess we could put a flag into bit 9 indicating that
> you want to use messages instead of polling or a file descriptor, if you
> prefer.

Personally, I don't think it matters since right now I can see the in-
band notification as being really necessary/useful only for simulation
work, and in that case no polling will be doable.

If you do think it's important to not make the two mutually exclusive,
how would you prefer to have this handled? With a new flag, e.g. in bit
9, indicating "use inband signalling instead of polling or eventfd"?

Thanks,
johannes


