Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E931AD7FF
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Sep 2019 13:36:20 +0200 (CEST)
Received: from localhost ([::1]:55286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7Hxz-0003CK-7U
	for lists+qemu-devel@lfdr.de; Mon, 09 Sep 2019 07:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40186)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <johannes@sipsolutions.net>) id 1i7Hx9-0002kQ-5b
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 07:35:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <johannes@sipsolutions.net>) id 1i7Hx8-0005EJ-01
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 07:35:26 -0400
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]:45268
 helo=sipsolutions.net)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <johannes@sipsolutions.net>)
 id 1i7Hx7-000520-Pd
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 07:35:25 -0400
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <johannes@sipsolutions.net>)
 id 1i7Hx3-0002Oj-VH; Mon, 09 Sep 2019 13:35:22 +0200
Message-ID: <8a9cf8a1726afce7fed8992a4f19fc808004ef88.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
To: "Michael S. Tsirkin" <mst@redhat.com>
Date: Mon, 09 Sep 2019 13:35:19 +0200
In-Reply-To: <20190908091207-mutt-send-email-mst@kernel.org>
References: <20190902121233.13382-1-johannes@sipsolutions.net>
 <20190906121350.29202-1-johannes@sipsolutions.net>
 <20190906102217-mutt-send-email-mst@kernel.org>
 <be405c3ba658cdac7f68c91213c3b714ac24c1e3.camel@sipsolutions.net>
 <20190906110340-mutt-send-email-mst@kernel.org>
 <fe0f3f7bfa730088454790dc2d863285c4461134.camel@sipsolutions.net>
 <20190908091207-mutt-send-email-mst@kernel.org>
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

On Sun, 2019-09-08 at 09:13 -0400, Michael S. Tsirkin wrote:

> > I think the only use for this extension would be for simulation
> > purposes, and even then only combined with the REPLY_ACK and SLAVE_REQ
> > extensions, i.e. you explicitly *want* your virtual machine to lock up /
> > wait for a response to the KICK command (and respectively, the device to
> > wait for a response to the CALL command).
> 
> OK so when combined with these, it's OK I think.

OK.

> Do we want to force this restriction in code maybe then?

Unlike in this patch, I was planning to not actually advertise
VHOST_USER_PROTOCOL_F_KICK_CALL_MSGS, and do that only if the user of
the library wants to advertise it, since devices used for simulation
also have to be careful about how they use this.

However, if I understand correctly we cannot enforce that all of them
are used at the same time - we're the device side, so we only advertise
our features and the master actually sets the ones it wants to use, no?

The only thing we could do is crash if it wants to use this feature
without the others, but would that really be helpful?

I'm starting to actually get this working, so I'll post new patches in a
few days or so.

johannes


