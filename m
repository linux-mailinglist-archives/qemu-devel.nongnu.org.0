Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA2BE4B6A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 14:44:08 +0200 (CEST)
Received: from localhost ([::1]:59462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNywp-0006wE-4o
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 08:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53736)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iNyv6-00053C-Qp
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 08:42:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iNyv5-0007WE-Pf
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 08:42:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29307
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iNyv5-0007Vj-K5
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 08:42:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572007338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gbuQoyeGZT6y8hhFEbHwrpBiPeFK+muxoncrTY4eeU0=;
 b=da4LtO+YXHtI7oSXWhtzMT/svFkrkSkY/hnVYFijoWA5ZA2yIdaY6iqvw+j/J6LH5mh4tX
 UZ3wjZIhi+UQuaHed6wTRZhw14AU5u5daXO2GWHDkHWRtjQta+XbPm/YQsQl4/ngpOLU/O
 ArZnIiJy2ZLj5fGWJSyl4m1gWs7uXvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-ecVM1dMVPbKOV69_gibRAg-1; Fri, 25 Oct 2019 08:42:14 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E482480183D;
 Fri, 25 Oct 2019 12:42:12 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-223.ams2.redhat.com
 [10.36.117.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5CA85DD61;
 Fri, 25 Oct 2019 12:42:10 +0000 (UTC)
Date: Fri, 25 Oct 2019 14:42:09 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Michael Weiser <michael@weiser.dinsnail.net>
Subject: Re: [PATCH 2/3] qcow2: Assert that qcow2_cache_get() callers hold
 s->lock
Message-ID: <20191025124209.GD7275@localhost.localdomain>
References: <20191023152620.13166-1-kwolf@redhat.com>
 <20191023152620.13166-3-kwolf@redhat.com>
 <20191023153749.GB6177@localhost.localdomain>
 <20191025103510.GA2272@weiser.dinsnail.net>
MIME-Version: 1.0
In-Reply-To: <20191025103510.GA2272@weiser.dinsnail.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: ecVM1dMVPbKOV69_gibRAg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: psyhomb@gmail.com, vsementsov@virtuozzo.com, den@virtuozzo.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 dgilbert@redhat.com, mreitz@redhat.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.10.2019 um 12:35 hat Michael Weiser geschrieben:
> I was going to test with master as well but got overtaken by v2. Will
> move on to test v2 now. :)
>=20
> Series:
> Tested-by: Michael Weiser <michael.weiser@gmx.de>

Thanks for testing!

The fix itself is unchanged in v2, so I assume the result will be the
same, but testing it explicitly can't hurt. I'm going to send a pull
request today, but if you're quick, I can wait for your results.

> No biggie but if there's a chance could you switch my address to the
> above?

No problem, I've updated the address in the Reported-by tag.

Kevin


