Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001A0DC769
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 16:33:02 +0200 (CEST)
Received: from localhost ([::1]:40990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLTJN-0000Nw-Uc
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 10:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33103)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iLTGP-0006qy-5L
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 10:29:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iLTGO-0001yp-6J
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 10:29:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48794)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iLTGO-0001yf-0x
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 10:29:56 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 35F6E18C4288;
 Fri, 18 Oct 2019 14:29:55 +0000 (UTC)
Received: from localhost (ovpn-116-20.phx2.redhat.com [10.3.116.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 452D2196B2;
 Fri, 18 Oct 2019 14:29:42 +0000 (UTC)
Date: Fri, 18 Oct 2019 11:29:40 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: Python 2 and test/vm/netbsd
Message-ID: <20191018142940.GN4084@habkost.net>
References: <20191016030021.GD4084@habkost.net>
 <a83d518a-6e39-0017-203d-2ee3d61935ca@redhat.com>
 <20191016224124.GF4084@habkost.net>
 <20191017220541.GJ4084@habkost.net>
 <20191017225548.GL4084@habkost.net>
 <20191018104439.c2tojlvi2c5zzesi@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018104439.c2tojlvi2c5zzesi@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Fri, 18 Oct 2019 14:29:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Kevin Wolf <kwolf@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 18, 2019 at 12:44:39PM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > > Running with V=1, I see packages being downloaded at reasonable speeds, but
> > > there's a huge interval (of various minutes) between each package download.
> > 
> > I've found the cause for the slowness I'm seeing: for each file
> > being downloaded, the guest spents at least 75 seconds trying to
> > connect to the IPv6 address of ftp.NetBSD.org, before trying
> > IPv4.
> 
> Ah, that nicely explains why it worked just fine for me.  First, I have
> a local proxy configured so the installer isn't going to connect to
> ftp.NetBSD.org directly.  Second I have IPv6 connectivity.
> 
> > I don't know if this is a NetBSD bug, or a slirp bug.
> 
> Both I'd say ...
> 
> First, by default slirp should not send IPv6 router announcements
> to the user network if the host has no IPv6 connectivity.
> 
> Second, the recommended way to connect is to try ipv4 and ipv6 in
> parallel, then use whatever connects first.  Web browsers typically
> do it that way.  wget and curl don't do that though, they try one
> address after the other, and I guess this is where the delay comes
> from ...

In addition to that, the connect() error should be generating a
ICMP6_UNREACH message, and I'd expect the NetBSD guest to notice
it instead of waiting for timeout.

-- 
Eduardo

