Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577379F04F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 18:37:03 +0200 (CEST)
Received: from localhost ([::1]:53988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2eSs-0004sA-3P
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 12:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34916)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i2eQh-0003MT-WC
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 12:34:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i2eQg-0000CF-NW
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 12:34:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46716)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i2eQd-00005N-Lj; Tue, 27 Aug 2019 12:34:43 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 94DB08AC6FB;
 Tue, 27 Aug 2019 16:34:42 +0000 (UTC)
Received: from localhost (unknown [10.40.205.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 501805D6B0;
 Tue, 27 Aug 2019 16:34:41 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 27 Aug 2019 18:34:33 +0200
Message-Id: <20190827163439.16686-1-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Tue, 27 Aug 2019 16:34:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/6] block/curl: Fix hang and potential crash
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

As reported in https://bugzilla.redhat.com/show_bug.cgi?id=3D1740193, our
curl block driver can spontaneously hang.  This becomes visible e.g.
when reading compressed qcow2 images:

$ qemu-img convert -p -O raw -n \
  https://download.cirros-cloud.net/0.4.0/cirros-0.4.0-x86_64-disk.img \
  null-co://

(Hangs at 74.21 %, usually.)

A more direct way is:

$ qemu-img bench -f raw http://download.qemu.org/qemu-4.1.0.tar.xz \
    -d 1 -S 524288 -c 2

(Which simply performs two requests, and the second one hangs.  You can
use any HTTP resource (probably FTP, too) you=E2=80=99d like that is at l=
east
1 MB in size.)

It turns out that this is because cURL 7.59.0 has added a protective
feature against some misuse we had in our code: curl_multi_add_handle()
must not be called from within a cURL callback, but in some cases we
did.  As of 7.59.0, this fails, our new request is not registered and
the I/O request stalls.  This is fixed by patch 5.

Patch 6 makes us check for curl_multi_add_handle()=E2=80=99s return code,
because if we had done that before, debugging would have been much
simpler.


On the way to fixing it, I had a look over the whole cURL code and found
a suspicious QLIST_FOREACH_SAFE() loop that actually does not seem very
safe at all.  I think this may lead to crashes, although I have never
seen any myself.  https://bugzilla.redhat.com/show_bug.cgi?id=3D1744602#c=
5
shows one in exactly the function in question, so I think it actually is
a problem.

This is fixed by patch 4, patches 1 through 3 prepare for it.


Max Reitz (6):
  curl: Keep pointer to the CURLState in CURLSocket
  curl: Keep *socket until the end of curl_sock_cb()
  curl: Pass CURLSocket to curl_multi_{do,read}()
  curl: Report only ready sockets
  curl: Handle success in multi_check_completion
  curl: Check curl_multi_add_handle()'s return code

 block/curl.c | 129 +++++++++++++++++++++++++--------------------------
 1 file changed, 63 insertions(+), 66 deletions(-)

--=20
2.21.0


