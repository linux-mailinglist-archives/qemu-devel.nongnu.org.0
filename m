Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A037215FD9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 10:55:43 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42553 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNvt0-00039V-Rw
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 04:55:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNvr9-0002Aw-Ly
	for qemu-devel@nongnu.org; Tue, 07 May 2019 04:53:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNvr8-0004CB-4R
	for qemu-devel@nongnu.org; Tue, 07 May 2019 04:53:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44510)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hNvr7-0004BD-QD
	for qemu-devel@nongnu.org; Tue, 07 May 2019 04:53:46 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C33A83004425;
	Tue,  7 May 2019 08:53:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E6ED171C5;
	Tue,  7 May 2019 08:53:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 464B411AA3; Tue,  7 May 2019 10:53:38 +0200 (CEST)
Date: Tue, 7 May 2019 10:53:38 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <20190507085338.xjxlajkethhcvmff@sirius.home.kraxel.org>
References: <20190412121626.19829-1-berrange@redhat.com>
	<20190412121626.19829-6-berrange@redhat.com>
	<20190507075415.fsngpdrgnh2e5vch@sirius.home.kraxel.org>
	<0516fc8f-5bf1-66cc-4865-f75c4f5309b8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <0516fc8f-5bf1-66cc-4865-f75c4f5309b8@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 07 May 2019 08:53:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 5/5] qxl: avoid unaligned pointer
 reads/writes
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 07, 2019 at 10:11:02AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Hi Gerd,
>=20
> On 5/7/19 9:54 AM, Gerd Hoffmann wrote:
> > On Fri, Apr 12, 2019 at 01:16:26PM +0100, Daniel P. Berrang=E9 wrote:
> >> The SPICE_RING_PROD_ITEM() macro is initializing a local
> >> 'uint64_t *' variable to point to the 'el' field inside
> >> the QXLReleaseRing struct. This uint64_t field is not
> >> guaranteed aligned as the struct is packed.
> >>
> >> Code should not take the address of fields within a
> >> packed struct. Changing the SPICE_RING_PROD_ITEM()
> >> macro to avoid taking the address of the field is
> >> impractical. It is clearer to just remove the macro
> >> and inline its functionality in the three call sites
> >> that need it.
> >=20
> > Added patch to vga queue.
>=20
> What about the other patch Marc-Andr=E9 sent?
> https://lists.gnu.org/archive/html/qemu-devel/2019-04/msg01318.html

Other patch version for the same issue, we need only one of the two.

cheers,
  Gerd

