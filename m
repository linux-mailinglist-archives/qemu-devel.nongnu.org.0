Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6769D10E3BB
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Dec 2019 22:55:46 +0100 (CET)
Received: from localhost ([::1]:56012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibXBx-0001Xh-Gu
	for lists+qemu-devel@lfdr.de; Sun, 01 Dec 2019 16:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57108)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <davem@davemloft.net>) id 1ibXB1-000154-Li
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 16:54:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <davem@davemloft.net>) id 1ibXB0-0003hI-PU
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 16:54:47 -0500
Received: from shards.monkeyblade.net ([2620:137:e000::1:9]:54822)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <davem@davemloft.net>) id 1ibXB0-0003fc-Jj
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 16:54:46 -0500
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 98EE614FD3304;
 Sun,  1 Dec 2019 13:54:41 -0800 (PST)
Date: Sun, 01 Dec 2019 13:54:39 -0800 (PST)
Message-Id: <20191201.135439.2128495024712395126.davem@davemloft.net>
To: mst@redhat.com
Subject: Re: [RFC net-next 08/18] tun: run offloaded XDP program in Tx path
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191201163730-mutt-send-email-mst@kernel.org>
References: <f39536e4-1492-04e6-1293-302cc75e81bf@gmail.com>
 <20191201.125621.1568040486743628333.davem@davemloft.net>
 <20191201163730-mutt-send-email-mst@kernel.org>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Sun, 01 Dec 2019 13:54:42 -0800 (PST)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2620:137:e000::1:9
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
Cc: songliubraving@fb.com, jakub.kicinski@netronome.com, hawk@kernel.org,
 daniel@iogearbox.net, netdev@vger.kernel.org, jasowang@redhat.com,
 john.fastabend@gmail.com, ast@kernel.org, qemu-devel@nongnu.org,
 prashantbhole.linux@gmail.com, kvm@vger.kernel.org, dsahern@gmail.com,
 yhs@fb.com, andriin@fb.com, kafai@fb.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Michael S. Tsirkin" <mst@redhat.com>
Date: Sun, 1 Dec 2019 16:40:22 -0500

> Right. But it is helpful to expose the supported functionality
> to guest in some way, if nothing else then so that
> guests can be moved between different hosts.
> 
> Also, we need a way to report this kind of event to guest
> so it's possible to figure out what went wrong.

On the contrary, this is why it is of utmost importance that all
XDP implementations support the full suite of XDP facilities from
the very beginning.

This is why we keep giving people a hard time when they add support
only for some of the XDP return values and semantics.  Users will get
killed by this, and it makes XDP a poor technology to use because
behavior is not consistent across device types.

That's not acceptable and I'll push back on anything that continues
this trend.

If you can't HW offload it, kick it to software.

