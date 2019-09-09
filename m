Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3898CAD9A8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Sep 2019 15:06:20 +0200 (CEST)
Received: from localhost ([::1]:56426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7JN5-0007o2-1y
	for lists+qemu-devel@lfdr.de; Mon, 09 Sep 2019 09:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55634)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <johannes@sipsolutions.net>) id 1i7JM2-0007G9-H7
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 09:05:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <johannes@sipsolutions.net>) id 1i7JM1-0006U2-Fy
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 09:05:14 -0400
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]:46792
 helo=sipsolutions.net)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <johannes@sipsolutions.net>)
 id 1i7JM1-0006Qw-9L
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 09:05:13 -0400
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <johannes@sipsolutions.net>)
 id 1i7JLy-0004Ug-3z; Mon, 09 Sep 2019 15:05:10 +0200
Message-ID: <89f25546ffa71c799c533e50658a3a58e066f436.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
To: "Michael S. Tsirkin" <mst@redhat.com>
Date: Mon, 09 Sep 2019 15:05:08 +0200
In-Reply-To: <20190909083902-mutt-send-email-mst@kernel.org>
References: <20190902121233.13382-1-johannes@sipsolutions.net>
 <20190906121350.29202-1-johannes@sipsolutions.net>
 <20190906102217-mutt-send-email-mst@kernel.org>
 <be405c3ba658cdac7f68c91213c3b714ac24c1e3.camel@sipsolutions.net>
 <20190906110340-mutt-send-email-mst@kernel.org>
 <fe0f3f7bfa730088454790dc2d863285c4461134.camel@sipsolutions.net>
 <20190908091207-mutt-send-email-mst@kernel.org>
 <8a9cf8a1726afce7fed8992a4f19fc808004ef88.camel@sipsolutions.net>
 <20190909083902-mutt-send-email-mst@kernel.org>
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

On Mon, 2019-09-09 at 08:41 -0400, Michael S. Tsirkin wrote:

> > The only thing we could do is crash if it wants to use this feature
> > without the others, but would that really be helpful?
> 
> We can return failure from SET_PROTOCOL_FEATURES.
> We can also fail all following messages.

Only if we have F_REPLY_ACK, I think?

I suppose we could fail a later command that already needs a reply
without REPLY_ACK, but that seems difficult to debug?

Anyway, if you feel that we should have this as some sort of safeguard I
can try to do that; to me it feels rather pointless as libvhost-user is
more of a sample implementation than anything else.

Unless you also wanted to write into the spec that F_KICK_CALL_MSGS
absolutely *requires* F_REPLY_ACK, and add some text that tells a device
how to behave when F_KICK_CALL_MSGS is negotiated without F_REPLY_ACK?

johannes


