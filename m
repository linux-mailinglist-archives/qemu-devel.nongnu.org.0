Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577362CCDD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 19:02:54 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39752 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVfUz-00007q-Ia
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 13:02:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hVfT0-0007RS-6r
	for qemu-devel@nongnu.org; Tue, 28 May 2019 13:00:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hVfSw-0008Is-Bb
	for qemu-devel@nongnu.org; Tue, 28 May 2019 13:00:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59204)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hVfSn-0007ve-Sn; Tue, 28 May 2019 13:00:40 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50EB76147C;
	Tue, 28 May 2019 17:00:26 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B873F8082;
	Tue, 28 May 2019 17:00:03 +0000 (UTC)
Date: Tue, 28 May 2019 19:00:01 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Message-ID: <20190528190001.17d7cdf0.cohuck@redhat.com>
In-Reply-To: <20190528164020.32250-5-philmd@redhat.com>
References: <20190528164020.32250-1-philmd@redhat.com>
	<20190528164020.32250-5-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 28 May 2019 17:00:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 04/10] hw/s390x/event-facility: Use the
 QOM BUS() macro to access BusState.qbus
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, Michael Walle <michael@walle.cc>,
	Gerd Hoffmann <kraxel@redhat.com>, qemu-s390x@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 28 May 2019 18:40:14 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Rather than looking inside the definition of a BusState with "s->bus.qbus=
",
> use the QOM prefered style: "BUS(&s->bus)".
>=20
> This patch was generated using the following Coccinelle script:
>=20
>     // Use BUS() macros to access BusState.qbus
>     @use_bus_macro_to_access_qbus@
>     expression obj;
>     identifier bus;
>     @@
>     -&obj->bus.qbus
>     +BUS(&obj->bus)
>=20
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/s390x/event-facility.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

(I assume this will go through the trivial tree?)

