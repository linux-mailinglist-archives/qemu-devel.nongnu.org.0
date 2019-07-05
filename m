Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEC3604A3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 12:40:06 +0200 (CEST)
Received: from localhost ([::1]:51482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjLdN-0004sx-Bx
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 06:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56704)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hjLag-00037C-EX
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 06:37:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hjLaf-0008AW-0R
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 06:37:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55270)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1hjLaa-0007zq-NX; Fri, 05 Jul 2019 06:37:12 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E28273098558;
 Fri,  5 Jul 2019 10:37:11 +0000 (UTC)
Received: from redhat.com (ovpn-112-48.ams2.redhat.com [10.36.112.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C7401BC65;
 Fri,  5 Jul 2019 10:37:09 +0000 (UTC)
Date: Fri, 5 Jul 2019 11:37:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20190705103704.GH32473@redhat.com>
References: <20190703224707.12437-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190703224707.12437-1-eblake@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 05 Jul 2019 10:37:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 RFC] qemu-nbd: Permit TLS with Unix
 sockets
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 rjones@redhat.com, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 03, 2019 at 05:47:07PM -0500, Eric Blake wrote:

> +== check TLS works over Unix ==
> +image: nbd+unix://?socket=SOCKET
> +file format: nbd
> +virtual size: 64 MiB (67108864 bytes)
> +disk size: unavailable
> +image: nbd+unix://?socket=SOCKET
> +file format: nbd
> +virtual size: 64 MiB (67108864 bytes)
> +disk size: unavailable
> +qemu-nbd: Certificate does not match the hostname 0.0.0.0

Seeing 0.0.0.0 is very odd since we don't specify that on the CLI anywhere.

It looks like this is a side effect of reusing the "bindto" variable in
--list mode, getting the default bind address of 0.0.0.0.  We should
ensure that this variable defaults to NULL when in --list mode I think,
which will probably highlight the tlssession.c bug i mentioned.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

