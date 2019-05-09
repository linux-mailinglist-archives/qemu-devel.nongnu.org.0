Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF1118ABF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 15:31:46 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54632 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOj9F-0006vd-Jg
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 09:31:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hOj7F-0005oI-7d
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:29:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hOj7E-0005II-8l
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:29:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58496)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hOj7E-0005HY-3d
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:29:40 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6DC823B718;
	Thu,  9 May 2019 13:29:39 +0000 (UTC)
Received: from redhat.com (ovpn-112-55.ams2.redhat.com [10.36.112.55])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B38D4600D4;
	Thu,  9 May 2019 13:29:34 +0000 (UTC)
Date: Thu, 9 May 2019 14:29:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20190509132931.GY31299@redhat.com>
References: <20190509132234.22103-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190509132234.22103-1-lvivier@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 09 May 2019 13:29:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC] rng-random: allow to use getrandom()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Amit Shah <amit@kernel.org>, Kashyap Chamarthy <kchamart@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	"Richard W . M . Jones" <rjones@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 09, 2019 at 03:22:34PM +0200, Laurent Vivier wrote:
> Add a parameter to select the rng-random backend mode,
> from a file or from qemu_guest_getrandom():
> 
>   -object rng-random,id=rng0,mode=file or
>   -object rng-random,id=rng0,mode=getrandom
> 
> by default mode is file

I don't really see any benefit in overloading the existing rng-random
object with a completely different impl. There are already two distinct
backends, so we should just add a third "rng-builtin" which uses the
QEMU built-in APIs for collecting rand data.

This makes it trivial to detect support for this feature by simply
looking for existance of the new object class.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

