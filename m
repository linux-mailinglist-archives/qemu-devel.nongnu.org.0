Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F6E310B8
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 16:58:30 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44873 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWizF-0003rH-Ib
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 10:58:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hWixK-0002h4-OT
	for qemu-devel@nongnu.org; Fri, 31 May 2019 10:56:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hWixJ-0004Xs-QJ
	for qemu-devel@nongnu.org; Fri, 31 May 2019 10:56:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50666)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1hWixH-0004R5-Oa; Fri, 31 May 2019 10:56:28 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A1E3A3B7C;
	Fri, 31 May 2019 14:56:14 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-233.ams2.redhat.com [10.36.116.233])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D4D717480;
	Fri, 31 May 2019 14:56:09 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 31 May 2019 16:56:06 +0200
Message-Id: <20190531145608.28183-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 31 May 2019 14:56:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v1 0/2] s390x/tcg: STFLE fixes
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While testing vector instructions, I ran into various issues with
user space binaries compiled with more recent compiler versions like

# gunzip /usr/share/man/man1/hexdump.1.gz
<dhildenb> *** stack smashing detected ***: <unknown> terminated

Turns out:
a) the STFLE instruction in semi-broken on the first invocation
b) the code expects a different STFLE behavior than documented in the PoP

Fix a) and make sure the code works by adjusting b).

David Hildenbrand (2):
  s390x/tcg: Fix max_byte detection for stfle
  s390x/tcg: Store only the necessary amount of doublewords for STFLE

 target/s390x/misc_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--=20
2.20.1


